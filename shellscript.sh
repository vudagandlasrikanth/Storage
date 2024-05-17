#!/bin/bash

# Function to get the current CPU usage
get_cpu_usage() {
    # Extract the CPU idle percentage from the top command and subtract it from 100
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}

# Infinite loop to continuously monitor the CPU usage
while true; do
    # Get the current CPU usage
    cpu_usage=$(get_cpu_usage)
    
    # Print the current CPU usage
    echo "Current CPU Usage: $cpu_usage"
    
    # Wait for 1 second before repeating
    sleep 1
done
