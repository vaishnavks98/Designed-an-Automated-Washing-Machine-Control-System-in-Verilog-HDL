`include "project_washing_m.v"
module test();
reg clk, reset, door_close, start, filled, detergent_added, cycle_timeout, drained, spin_timeout;
wire door_lock, motor_on, fill_value_on, drain_value_on, done, soap_wash, water_wash;
washing_ma machine_1(clk, reset, door_close, start, filled, detergent_added, cycle_timeout, drained, spin_timeout, door_lock, motor_on, fill_value_on, drain_value_on, done, soap_wash, water_wash );
initial
begin
    clk = 0;
    reset = 1;
    start = 0;
    door_close = 0;
    filled = 0;
    drained = 0;
    detergent_added = 0;
    cycle_timeout = 0;
    spin_timeout = 0;

    #5 reset = 0;
    #5 start = 1; door_close = 1;
    #10 filled = 1;
    #10 detergent_added = 1;
    #10 cycle_timeout = 1;
    #10 drained = 1;
    #10 spin_timeout = 1;

end
always 
 begin
    #5 clk = ~ clk;
 end
 initial 
    begin
      $monitor("Time= %d, Clock=%b, Reset= %b, start= %b, door_close=%b, filled =%b,detergent_added =%b, cycle_timeout =%b, drained=%b, spin_timeout =%b, door_lock= %b,motor_on=%b, fill_value_on =%b, drain_value_on=%b,soap_wash=%b, water_wash =%b,done=%b",$time,clk,reset,door_close, start, filled, detergent_added, cycle_timeout, drained, spin_timeout, door_lock, motor_on, fill_value_on, drain_value_on,  soap_wash, water_wash,done);  
    
 end
    

endmodule

