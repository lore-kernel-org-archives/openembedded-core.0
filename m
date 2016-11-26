Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD45B71B51
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 15:39:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so8295191pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Od8xY6GGiHc7gr4XBLRaWhrxUMU8LIp6kPfxjFFuPH4=;
	b=oWu7RGQNAe7Vf3oxO5huNfZrx1rArUdRoncX2wtDq0Z+cxxpngV7m4mPPS0ac0rylI
	X4kvt7jyqPHgM92clxX/fxbFhBxRtduhjQtDt0MDWnZFrBArm8ArGf0oZ419hDANEyxB
	+3SuTi/imWjmJwxD3j7yJBK67t6Lrhq9LnC5GXNpYUbwECHlkAMaiAixcLhD4e/IdvhA
	SX4RNiB+VJeVDnR5TWEETh0Gz4U/pqJhXXKztOc+sm1DQu9mNJE3aKtsIWTQQ9Jeib1N
	AUqQDNsm2YxFHxBLRUpXDB5leaMl7QZpCAQdeGRnL8hTjw3vJb/UJ3tduxFHNf296EuJ
	n//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Od8xY6GGiHc7gr4XBLRaWhrxUMU8LIp6kPfxjFFuPH4=;
	b=jZ7MWTlRkInUKTR6Guy7NRMj7qqtWg9rR5yZ2XkJ+uVIXSQE2jKR1SLNl7EuvVSjVZ
	LnaDJ9mtliQKreQX91EDnY/ze0tpYH34V3tq3ysIYjg/GYb06arpLGH0tJFSrVta8xhT
	kkwpisqd9KfTZTTdRW7z84dU7V4JojtO5gg+j2P6xT7xB3xPscydWozD7qjKTuqsnIhI
	RlV0kOTfdzT9KlGAM5shHTd6DqRi1pqRj+9Z1L5x0+IUs3n2lNIXAUaCuy/xWgR9lpx4
	NnJmZyv0skz+oRh4hBpf7rgQmZsJmJ9mhvoxw/0rKMkjJseVmdmx1ppE2JH2XXRvzQFQ
	DyOw==
X-Gm-Message-State: AKaTC00zM34dNVjRdq/dukPM2dSVPIXKP4PsgV6JkX4pyt7UVibPdhIA0smtWP5/j+lsUQ==
X-Received: by 10.99.226.3 with SMTP id q3mr24366983pgh.37.1480174766419;
	Sat, 26 Nov 2016 07:39:26 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:bcc3:6b30:3fc9:245b?
	([2601:202:4001:9ea0:bcc3:6b30:3fc9:245b])
	by smtp.googlemail.com with ESMTPSA id
	y2sm75693409pff.82.2016.11.26.07.39.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Nov 2016 07:39:26 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1480095303-15753-1-git-send-email-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fd2535b9-5761-6024-357b-2b0442ed59ea@gmail.com>
Date: Sat, 26 Nov 2016 07:39:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480095303-15753-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH][morty] lib/oe/qa: handle binaries with segments outside the first 4kb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Nov 2016 15:39:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/25/2016 09:35 AM, Ross Burton wrote:
> The ELF parser was assuming that the segment tables are in the first 4kb of the
> binary.  Whilst this generally appears to be the case, there have been instances
> where the segment table is elsewhere (offset 2MB, in this sample I have).  Solve
> this problem by mmap()ing the file instead.
> 
> Also clean up the code a little whilst chasing the problem.

merged to staging.
Armin
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/qa.py | 82 +++++++++++++++++++++++++++----------------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index fbe719d..22d76dc 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -1,4 +1,4 @@
> -import os, struct
> +import os, struct, mmap
>  
>  class NotELFFileError(Exception):
>      pass
> @@ -23,9 +23,9 @@ class ELFFile:
>      EV_CURRENT   = 1
>  
>      # possible values for EI_DATA
> -    ELFDATANONE  = 0
> -    ELFDATA2LSB  = 1
> -    ELFDATA2MSB  = 2
> +    EI_DATA_NONE  = 0
> +    EI_DATA_LSB  = 1
> +    EI_DATA_MSB  = 2
>  
>      PT_INTERP = 3
>  
> @@ -34,51 +34,46 @@ class ELFFile:
>              #print "'%x','%x' %s" % (ord(expectation), ord(result), self.name)
>              raise NotELFFileError("%s is not an ELF" % self.name)
>  
> -    def __init__(self, name, bits = 0):
> +    def __init__(self, name):
>          self.name = name
> -        self.bits = bits
>          self.objdump_output = {}
>  
> -    def open(self):
> -        if not os.path.isfile(self.name):
> -            raise NotELFFileError("%s is not a normal file" % self.name)
> +    # Context Manager functions to close the mmap explicitly
> +    def __enter__(self):
> +        return self
> +
> +    def __exit__(self, exc_type, exc_value, traceback):
> +        self.data.close()
>  
> +    def open(self):
>          with open(self.name, "rb") as f:
> -            # Read 4k which should cover most of the headers we're after
> -            self.data = f.read(4096)
> +            try:
> +                self.data = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
> +            except ValueError:
> +                # This means the file is empty
> +                raise NotELFFileError("%s is empty" % self.name)
>  
> +        # Check the file has the minimum number of ELF table entries
>          if len(self.data) < ELFFile.EI_NIDENT + 4:
>              raise NotELFFileError("%s is not an ELF" % self.name)
>  
> +        # ELF header
>          self.my_assert(self.data[0], 0x7f)
>          self.my_assert(self.data[1], ord('E'))
>          self.my_assert(self.data[2], ord('L'))
>          self.my_assert(self.data[3], ord('F'))
> -        if self.bits == 0:
> -            if self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS32:
> -                self.bits = 32
> -            elif self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS64:
> -                self.bits = 64
> -            else:
> -                # Not 32-bit or 64.. lets assert
> -                raise NotELFFileError("ELF but not 32 or 64 bit.")
> -        elif self.bits == 32:
> -            self.my_assert(self.data[ELFFile.EI_CLASS], ELFFile.ELFCLASS32)
> -        elif self.bits == 64:
> -            self.my_assert(self.data[ELFFile.EI_CLASS], ELFFile.ELFCLASS64)
> +        if self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS32:
> +            self.bits = 32
> +        elif self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS64:
> +            self.bits = 64
>          else:
> -            raise NotELFFileError("Must specify unknown, 32 or 64 bit size.")
> +            # Not 32-bit or 64.. lets assert
> +            raise NotELFFileError("ELF but not 32 or 64 bit.")
>          self.my_assert(self.data[ELFFile.EI_VERSION], ELFFile.EV_CURRENT)
>  
> -        self.sex = self.data[ELFFile.EI_DATA]
> -        if self.sex == ELFFile.ELFDATANONE:
> -            raise NotELFFileError("self.sex == ELFDATANONE")
> -        elif self.sex == ELFFile.ELFDATA2LSB:
> -            self.sex = "<"
> -        elif self.sex == ELFFile.ELFDATA2MSB:
> -            self.sex = ">"
> -        else:
> -            raise NotELFFileError("Unknown self.sex")
> +        self.endian = self.data[ELFFile.EI_DATA]
> +        if self.endian not in (ELFFile.EI_DATA_LSB, ELFFile.EI_DATA_MSB):
> +            raise NotELFFileError("Unexpected EI_DATA %x" % self.endian)
>  
>      def osAbi(self):
>          return self.data[ELFFile.EI_OSABI]
> @@ -90,16 +85,20 @@ class ELFFile:
>          return self.bits
>  
>      def isLittleEndian(self):
> -        return self.sex == "<"
> +        return self.endian == ELFFile.EI_DATA_LSB
>  
>      def isBigEndian(self):
> -        return self.sex == ">"
> +        return self.endian == ELFFile.EI_DATA_MSB
> +
> +    def getStructEndian(self):
> +        return {ELFFile.EI_DATA_LSB: "<",
> +                ELFFile.EI_DATA_MSB: ">"}[self.endian]
>  
>      def getShort(self, offset):
> -        return struct.unpack_from(self.sex+"H", self.data, offset)[0]
> +        return struct.unpack_from(self.getStructEndian() + "H", self.data, offset)[0]
>  
>      def getWord(self, offset):
> -        return struct.unpack_from(self.sex+"i", self.data, offset)[0]
> +        return struct.unpack_from(self.getStructEndian() + "i", self.data, offset)[0]
>  
>      def isDynamic(self):
>          """
> @@ -118,7 +117,7 @@ class ELFFile:
>  
>      def machine(self):
>          """
> -        We know the sex stored in self.sex and we
> +        We know the endian stored in self.endian and we
>          know the position
>          """
>          return self.getShort(ELFFile.E_MACHINE)
> @@ -166,6 +165,7 @@ def elf_machine_to_string(machine):
>  
>  if __name__ == "__main__":
>      import sys
> -    elf = ELFFile(sys.argv[1])
> -    elf.open()
> -    print(elf.isDynamic())
> +
> +    with ELFFile(sys.argv[1]) as elf:
> +        elf.open()
> +        print(elf.isDynamic())
> 

