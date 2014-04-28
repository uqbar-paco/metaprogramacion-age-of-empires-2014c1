require 'rspec'

class Array

  alias :__push__ :push
  def push(obj,*smth)
    params = [obj]
    params.__push__(*smth)     #if not
    raise 'No se admiten nils' unless params.all? {|e| e!=nil}
    self.__push__(obj,*smth)
  end

end


describe 'Array' do
  it 'should accept non-nils' do
    a =[1]
    a.push(2)
    a.should == [1,2]
  end

  it 'should reject nils' do
    a = [1]
    expect {a.push(nil)}.to raise_error Exception
  end

  it 'should reject nils in varargs' do
    a = [1]
    expect {a.push(2,4,nil)}.to raise_error Exception
  end

end