Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6770E6103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 15:24:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jul 2013 08:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,981,1363158000"; d="scan'208";a="364206474"
Received: from unknown (HELO [10.255.13.91]) ([10.255.13.91])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jul 2013 08:24:05 -0700
Message-ID: <51D2F094.4060106@linux.intel.com>
Date: Tue, 02 Jul 2013 08:24:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
	<51CB2164.5090102@linux.intel.com>
	<51D2E395.3000300@linux.intel.com>
	<CAP9ODKoCt6Gjd3s8wcGy8v0xy3kTQxYdKu1-gjeymN5Ruy59dQ@mail.gmail.com>
	<8E7C3DB4-FCF4-4D17-A0FF-B7ACBBD0678E@gmail.com>
In-Reply-To: <8E7C3DB4-FCF4-4D17-A0FF-B7ACBBD0678E@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 02 Jul 2013 15:24:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Looks like there is a NEW ICE on PPC in the ltp:

http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc/builds/149/steps/Building%20Images/logs/stdio

> | powerpc-poky-linux-gnuspe-gcc  -m32 -mcpu=8548 -mabi=spe -mspe -mfloat-gprs=double --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds-tcbootstrap nrand48_r.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Winline -Wwrite-strings -feliminate-unused-debug-types -fmerge-all-constants -frounding-math -g -pipe -mhard-float -Wstrict-prototypes -mlong-double-128  -fpic       -I../include -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/nptl -I../ports/sysdeps/unix/sysv/linux/powerp
c/powerpc32/e500 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/nptl -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu -I../sysdeps/powerpc/powerpc32/fpu -I../nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../nptl/sysdeps/unix/sysv/linux/powerpc -I../ports/sysdeps/unix/sysv/linux/powerpc -I../sysdeps/unix/sysv/linux/powerpc -I../sysdeps/ieee754/ldbl-128ibm -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../sysdeps/unix/powerpc -I../nptl/sysdeps/unix -I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/powerpc/powerpc32/e500 -I../ports/sysdeps/powerpc/powerpc32 -I../sysdeps/powerpc/powerpc32 -I../sysdeps/words
ize-32 -I../sysdeps/powerpc/fpu -I../nptl/sysdeps/powerpc -I../ports/sysdeps/powerpc -I../sysdeps/powerpc -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic -I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include-fixed -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds/usr/include  -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -o /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-
linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/nrand48_r.os -MD -MP -MF /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/nrand48_r.os.dt -MT /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/nrand48_r.os
> | In file included from ../sysdeps/ieee754/ldbl-128ibm/strtold_l.c:54:0:
> | ./strtod_l.c: In function '____strtold_l_internal':
> | ./strtod_l.c:1778:1: error: unrecognizable insn:
> |  }
> |  ^
> | (insn 6836 6835 6781 190 (set (mem/c:TI (plus:SI (reg:SI 8 8)
> |                 (const_int 976 [0x3d0])) [14 %sfp+976 S16 A128])
> |         (reg:TI 3 3)) ./strtod_l.c:203 -1
> |      (nil))
> | ./strtod_l.c:1778:1: internal compiler error: in extract_insn, at recog.c:2150
> | powerpc-poky-linux-gnuspe-gcc  -m32 -mcpu=8548 -mabi=spe -mspe -mfloat-gprs=double --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds-tcbootstrap mrand48_r.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Winline -Wwrite-strings -feliminate-unused-debug-types -fmerge-all-constants -frounding-math -g -pipe -mhard-float -Wstrict-prototypes -mlong-double-128  -fpic       -I../include -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/nptl -I../ports/sysdeps/unix/sysv/linux/powerp
c/powerpc32/e500 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/nptl -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu -I../sysdeps/powerpc/powerpc32/fpu -I../nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../nptl/sysdeps/unix/sysv/linux/powerpc -I../ports/sysdeps/unix/sysv/linux/powerpc -I../sysdeps/unix/sysv/linux/powerpc -I../sysdeps/ieee754/ldbl-128ibm -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../sysdeps/unix/powerpc -I../nptl/sysdeps/unix -I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/powerpc/powerpc32/e500 -I../ports/sysdeps/powerpc/powerpc32 -I../sysdeps/powerpc/powerpc32 -I../sysdeps/words
ize-32 -I../sysdeps/powerpc/fpu -I../nptl/sysdeps/powerpc -I../ports/sysdeps/powerpc -I../sysdeps/powerpc -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic -I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include-fixed -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds/usr/include  -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -o /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-
linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/mrand48_r.os -MD -MP -MF /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/mrand48_r.os.dt -MT /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/mrand48_r.os
> | powerpc-poky-linux-gnuspe-gcc  -m32 -mcpu=8548 -mabi=spe -mspe -mfloat-gprs=double --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds-tcbootstrap jrand48_r.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Winline -Wwrite-strings -feliminate-unused-debug-types -fmerge-all-constants -frounding-math -g -pipe -mhard-float -Wstrict-prototypes -mlong-double-128  -fpic       -I../include -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/nptl -I../ports/sysdeps/unix/sysv/linux/powerp
c/powerpc32/e500 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/nptl -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu -I../sysdeps/powerpc/powerpc32/fpu -I../nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../nptl/sysdeps/unix/sysv/linux/powerpc -I../ports/sysdeps/unix/sysv/linux/powerpc -I../sysdeps/unix/sysv/linux/powerpc -I../sysdeps/ieee754/ldbl-128ibm -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../sysdeps/unix/powerpc -I../nptl/sysdeps/unix -I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/powerpc/powerpc32/e500 -I../ports/sysdeps/powerpc/powerpc32 -I../sysdeps/powerpc/powerpc32 -I../sysdeps/words
ize-32 -I../sysdeps/powerpc/fpu -I../nptl/sysdeps/powerpc -I../ports/sysdeps/powerpc -I../sysdeps/powerpc -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic -I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include-fixed -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds/usr/include  -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -o /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-
linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/jrand48_r.os -MD -MP -MF /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/jrand48_r.os.dt -MT /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/jrand48_r.os
> | powerpc-poky-linux-gnuspe-gcc  -m32 -mcpu=8548 -mabi=spe -mspe -mfloat-gprs=double --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds-tcbootstrap srand48_r.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Winline -Wwrite-strings -feliminate-unused-debug-types -fmerge-all-constants -frounding-math -g -pipe -mhard-float -Wstrict-prototypes -mlong-double-128  -fpic       -I../include -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib -I/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/nptl -I../ports/sysdeps/unix/sysv/linux/powerp
c/powerpc32/e500 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/nptl -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu -I../sysdeps/powerpc/powerpc32/fpu -I../nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../nptl/sysdeps/unix/sysv/linux/powerpc -I../ports/sysdeps/unix/sysv/linux/powerpc -I../sysdeps/unix/sysv/linux/powerpc -I../sysdeps/ieee754/ldbl-128ibm -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../ports/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sysv -I../sysdeps/unix/sysv -I../sysdeps/unix/powerpc -I../nptl/sysdeps/unix -I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/powerpc/powerpc32/e500 -I../ports/sysdeps/powerpc/powerpc32 -I../sysdeps/powerpc/powerpc32 -I../sysdeps/words
ize-32 -I../sysdeps/powerpc/fpu -I../nptl/sysdeps/powerpc -I../ports/sysdeps/powerpc -I../sysdeps/powerpc -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic -I../nptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/x86_64-linux/usr/lib/ppce500v2-poky-linux-gnuspe.gcc-cross-initial/gcc/powerpc-poky-linux-gnuspe/4.8.1/include-fixed -isystem /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/sysroots/p1022ds/usr/include  -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -o /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-
linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/srand48_r.os -MD -MP -MF /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/srand48_r.os.dt -MT /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-ppc/build/build/tmp/work/ppce500v2-poky-linux-gnuspe/eglibc/2.17-r3/build-powerpc-poky-linux-gnuspe/stdlib/srand48_r.os
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.

Sau!


On 07/02/2013 07:54 AM, Khem Raj wrote:
>
> On Jul 2, 2013, at 7:47 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> On Tue, Jul 2, 2013 at 11:28 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> Any updates on this issue?
>>
>> This is outside my skills :-) Khem did you have time to look at Saul file?
>>
>
> issue is narrowed down but fix is not coming soon. disable using neon for perf recipes on that old kernel
> see http://gcc.gnu.org/bugzilla/PR57748
>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://projetos.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

