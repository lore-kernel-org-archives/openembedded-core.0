Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Uc1r7-0007Nn-Jx
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 01:08:39 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:60506 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Uc1ZY-0008F0-69; Mon, 13 May 2013 18:50:24 -0400
Date: Mon, 13 May 2013 18:50:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
Message-ID: <alpine.DEB.2.02.1305131846130.14033@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 23:08:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 13 May 2013, Khem Raj wrote:

> Robert and Trevor
>
> so whats your cross-gcc version ?
> should be in tmpdir under
>
> sysroots/x86_64-linux/usr/bin/mips64-angstrom-linux/mips64-angstrom-linux-gcc -v

  my build is still going but i don't have a mips64-angstrom-linux
directory, i have a mips64-oe-linux directory, inside of which i have:

$ ./mips64-oe-linux-gcc -v
Using built-in specs.
COLLECT_GCC=./mips64-oe-linux-gcc
COLLECT_LTO_WRAPPER=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/mips64-oe-linux/gcc/mips64-oe-linux/4.7.2/lto-wrapper
Target: mips64-oe-linux
Configured with:
/home/rpjday/oe/builds/mips64/tmp-eglibc/work-shared/gcc-4.7.2-r20/gcc-4.7.2/configure
--build=x86_64-linux --host=x86_64-linux --target=mips64-oe-linux
--prefix=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr
--exec_prefix=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr
--bindir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/bin/mips64-oe-linux
--sbindir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/bin/mips64-oe-linux
--libexecdir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/mips64-oe-linux
--datadir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/share
--sysconfdir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/etc
--sharedstatedir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/com
--localstatedir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/var
--libdir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/lib/mips64-oe-linux
--includedir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/include
--oldincludedir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/include
--infodir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/share/info
--mandir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr/share/man
--disable-silent-rules --disable-dependency-tracking
--with-libtool-sysroot=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux
--with-gnu-ld --enable-shared --enable-languages=c,c++
--enable-threads=posix --disable-multilib --enable-c99
--enable-long-long --enable-symvers=gnu --enable-libstdcxx-pch
--program-prefix=mips64-oe-linux- --without-local-prefix
--enable-target-optspace --enable-lto --enable-libssp
--disable-bootstrap --disable-libmudflap --with-system-zlib
--with-linker-hash-style=sysv --enable-linker-build-id --with-ppl=no
--with-cloog=no --enable-checking=release --enable-cheaders=c_global
--with-gxx-include-dir=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/qemumips64/usr/include/c++
--with-sysroot=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/qemumips64
--with-build-sysroot=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/qemumips64
--enable-poison-system-directories --disable-libunwind-exceptions
--with-mpfr=/home/rpjday/oe/builds/mips64/tmp-eglibc/sysroots/x86_64-linux/usr
--with-system-zlib --disable-nls --enable-__cxa_atexit --with-abi=64
--with-arch-64=mips64 --with-tune-64=mips64
Thread model: posix
gcc version 4.7.2 (GCC)
$

  are you suggesting i should have pulled in the angstrom layer?
anyway, must dash off for the evening but i'll check back later.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


