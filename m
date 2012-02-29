Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S2bzW-0000BK-Oj
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:22:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1T5Dnue018613
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 21:13:49 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 28 Feb 2012 21:13:48 -0800
Message-ID: <4F4DB40B.6000300@windriver.com>
Date: Tue, 28 Feb 2012 23:13:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
In-Reply-To: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
Subject: Re: psuedo-native strangeness on 64 bit build machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 05:22:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/12 10:35 PM, Steve Sakoman wrote:
> I did a clean build on an Ubuntu 64 bit build machine a couple of days
> ago with no issues.
>
> After a pull of today I did an image build for an OMAP3 machine and
> encountered an issue with psuedo-native.
>
> First I got this familiar message:
>
> Pseudo is not present but is required, building this first before the main build
>
> which seemed a bit strange since pseudo was built in the previous
> clean build.  The build proceeded until task 75 and then failed with
> the following error:
>
> NOTE: Running task 75 of 77 (ID: 6,
> virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
> do_compile)
> NOTE: package pseudo-native-1.2-r5: task do_compile: Started
> ERROR: Function failed: do_compile (see
> /media/data/yocto/tmp/work/x86_64-linux/pseudo-native-1.2-r5/temp/log.do_compile.32657
> for further information)
> ERROR: Logfile of failure stored in:
> /media/data/yocto/tmp/work/x86_64-linux/pseudo-native-1.2-r5/temp/log.do_compile.32657
> Log data follows:
> | ERROR: Function failed: do_compile (see
> /media/data/yocto/tmp/work/x86_64-linux/pseudo-native-1.2-r5/temp/log.do_compile.32657
> for further information)
> | SQLite header for version 3007010 found.
> | NOTE: make -j 4 -e MAKEFLAGS= libpseudo
> | ccache gcc -isystem/media/data/yocto/tmp/sysroots/x86_64-linux/usr/include
> -O2 -pipe -pipe -std=gnu99 -Wall -W -Wextra -fPIC
> -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -m32
> -DPSEUDO_PREFIX='"/media/data/yocto/tmp/sysroots/x86_64-linux/usr"'
> -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"'
> -DPSEUDO_LIBDIR='"lib/pseudo/lib"'
> -DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.2"' -O2 -g
> -L/media/data/yocto/tmp/sysroots/x86_64-linux/usr/lib
> -I/media/data/yocto/tmp/sysroots/x86_64-linux/usr/include
> -Wl,-R/media/data/yocto/tmp/sysroots/x86_64-linux/usr/lib -shared -o
> lib/pseudo/lib/libpseudo.so \
> | 		pseudo_client.o pseudo_ipc.o \
> | 		pseudo_wrappers.o pseudo_tables.o pseudo_util.o -ldl -lpthread
> | /usr/bin/ld: i386:x86-64 architecture of input file
> `pseudo_client.o' is incompatible with i386 output
> | /usr/bin/ld: i386:x86-64 architecture of input file `pseudo_ipc.o'
> is incompatible with i386 output
> | /usr/bin/ld: i386:x86-64 architecture of input file
> `pseudo_wrappers.o' is incompatible with i386 output
> | /usr/bin/ld: i386:x86-64 architecture of input file
> `pseudo_tables.o' is incompatible with i386 output
> | /usr/bin/ld: i386:x86-64 architecture of input file `pseudo_util.o'
> is incompatible with i386 output
> | /usr/bin/ld: final link failed: Invalid operation
> | collect2: ld returned 1 exit status
> | make: *** [lib/pseudo/lib/libpseudo.so] Error 1
> | ERROR: oe_runmake failed
> NOTE: package pseudo-native-1.2-r5: task do_compile: Failed
> ERROR: Task 6 (virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
> do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 75 tasks of which 74 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>    virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
> do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> Has anyone else been successful building on 64 bit machines?

I'm building pseudo on 64-bit machines right now, no problem.

The error you are seeing is pseudo attempting to build both a 64-bit and a 
32-bit wrapper.  The 32-bit wrapper is built when the recipe detects support for 
both 32-bit and 64-bit userspace.  It does this by looking first that your host 
is 64-bit, and then for /usr/include/gnu/stubs-32.h.  Assuming it finds those, 
it assumes your system has 32-bit binaries on it.

To avoid a 32-bit build of pseudo, on a 64-bit machine.  You need to set 
NO32LIBS = "1".  This instructs pseudo to avoid the 32-bit binary build.  (If 
your machine has 32-bit binaries on it, you need to fix your compiler to allow 
for 32-bit userspace builds, otherwise pseudo will be incapable of wrapping any 
32-bit binaries, resulting in a potential mismatch of user, groups and modes set 
by any 32-bit applications.

--Mark

> I see no issues on my 32 bit build machines.
>
> Forcing a clean build of pseudo (by hand, since -c cleansstate
> obviously won't work with pseudo-native!) resulted in a good build,
> both of psuedo-native and the image.
>
> Any ideas?
>
> Steve
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



