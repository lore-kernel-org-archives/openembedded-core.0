Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA059605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 01:38:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T1c6dE024255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 18:38:06 -0700 (PDT)
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 28 Mar 2016 18:38:05 -0700
Message-ID: <56F9DC9A.6070409@windriver.com>
Date: Tue, 29 Mar 2016 09:38:34 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1455955403.git.raj.khem@gmail.com>	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
	<CAJ86T=VoDWL_Os8yAFHKpTfWTv8Q-uTpu8TEtwQc-7+-dWKFuA@mail.gmail.com>
In-Reply-To: <CAJ86T=VoDWL_Os8yAFHKpTfWTv8Q-uTpu8TEtwQc-7+-dWKFuA@mail.gmail.com>
X-Originating-IP: [128.224.162.210]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: Upgrade to 2.23
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
X-List-Received-Date: Tue, 29 Mar 2016 01:38:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/2016 06:31 AM, Andre McCurdy wrote:
> On Sat, Feb 20, 2016 at 12:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Drop kconfig and options-group support
>> Forward port cross-localedef support
>> Assume ssp support in libc when building gcc-initial
> Breaks for me when building for x86 with -Os (building with
> -O1/-O2/-O3 are all OK):
>
> i686-rdk-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> --sysroot=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32-tcbootstrap
> ../sysdeps/unix/sysv/linux/posix_fallocate.c -c -std=gnu11
> -fgnu89-inline  -Os -Wall -Werror -Wno-error -Wundef -Wwrite-strings
> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32=
> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux=
> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux=/usr/src/glibc
> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/git=/usr/src/glibc
> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
> -g -pipe -Wstrict-prototypes -Wold-style-definition   -Wa,-mtune=i686
> -fexceptions  -ftls-model=initial-exec      -I../include
> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io
>   -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux
>   -I../sysdeps/unix/sysv/linux/i386/i686  -I../sysdeps/i386/i686/nptl
> -I../sysdeps/unix/sysv/linux/i386  -I../sysdeps/unix/sysv/linux/x86
> -I../sysdeps/i386/nptl  -I../sysdeps/unix/sysv/linux/include
> -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread
> -I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv
> -I../sysdeps/unix/i386  -I../sysdeps/unix  -I../sysdeps/posix
> -I../sysdeps/i386/i686/fpu/multiarch  -I../sysdeps/i386/i686/fpu
> -I../sysdeps/i386/i686/multiarch  -I../sysdeps/i386/i686
> -I../sysdeps/i386/fpu  -I../sysdeps/x86/fpu/include
> -I../sysdeps/x86/fpu  -I../sysdeps/i386  -I../sysdeps/x86
> -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/ldbl-96
> -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
> -I../sysdeps/ieee754  -I../sysdeps/generic  -I.. -I../libio -I.
> -nostdinc -isystem
> /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include
> -isystem /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include-fixed
> -isystem /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32/usr/include
>   -D_LIBC_REENTRANT -include
> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/libc-modules.h
> -DMODULE_NAME=libc -include ../include/libc-symbols.h       -o
> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
> -MD -MP -MF /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o.dt
> -MT /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
> ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function 'posix_fallocate':
> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
> used in asm here
>   }
>   ^
> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
> used in asm here


Hi All,

For the latest master, if 'DEBUG_BUILD' is enabled, the above error appers.

| ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function 
'posix_fallocate':
| ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be 
used in asm here
|  }
|  ^

The problem could be reproduced if we add in local.conf the following line.
DEBUG_BUILD = "1"

Do you have any idea what's going on there?

Regards,
Chen Qi

