# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install system dependencies for python-ldap and other required packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8069 available to the world outside this container
EXPOSE 8069

# Run odoo when the container launches
CMD ["./odoo-bin", "-c", "odoo.conf"]
