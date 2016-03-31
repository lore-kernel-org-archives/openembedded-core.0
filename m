Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 502E165CB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 07:00:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2V70dLu023465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 31 Mar 2016 00:00:39 -0700
Received: from [128.224.162.210] (128.224.162.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 31 Mar 2016 00:00:38 -0700
Message-ID: <56FCCB36.4040203@windriver.com>
Date: Thu, 31 Mar 2016 15:01:10 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
	<CAJ86T=VoDWL_Os8yAFHKpTfWTv8Q-uTpu8TEtwQc-7+-dWKFuA@mail.gmail.com>
	<56F9DC9A.6070409@windriver.com>
	<39E0EE4C-3FCD-4FAC-94F2-0B4F3BED8F2F@gmail.com>
In-Reply-To: <39E0EE4C-3FCD-4FAC-94F2-0B4F3BED8F2F@gmail.com>
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
X-List-Received-Date: Thu, 31 Mar 2016 07:00:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2016 10:16 AM, Khem Raj wrote:
>> On Mar 28, 2016, at 6:38 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>>
>> On 02/23/2016 06:31 AM, Andre McCurdy wrote:
>>> On Sat, Feb 20, 2016 at 12:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Drop kconfig and options-group support
>>>> Forward port cross-localedef support
>>>> Assume ssp support in libc when building gcc-initial
>>> Breaks for me when building for x86 with -Os (building with
>>> -O1/-O2/-O3 are all OK):
>>>
>>> i686-rdk-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
>>> --sysroot=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32-tcbootstrap
>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c -c -std=gnu11
>>> -fgnu89-inline  -Os -Wall -Werror -Wno-error -Wundef -Wwrite-strings
>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32=
>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux=
>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux=/usr/src/glibc
>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/git=/usr/src/glibc
>>> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
>>> -g -pipe -Wstrict-prototypes -Wold-style-definition   -Wa,-mtune=i686
>>> -fexceptions  -ftls-model=initial-exec      -I../include
>>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io
>>>   -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux
>>>   -I../sysdeps/unix/sysv/linux/i386/i686  -I../sysdeps/i386/i686/nptl
>>> -I../sysdeps/unix/sysv/linux/i386  -I../sysdeps/unix/sysv/linux/x86
>>> -I../sysdeps/i386/nptl  -I../sysdeps/unix/sysv/linux/include
>>> -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread
>>> -I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv
>>> -I../sysdeps/unix/i386  -I../sysdeps/unix  -I../sysdeps/posix
>>> -I../sysdeps/i386/i686/fpu/multiarch  -I../sysdeps/i386/i686/fpu
>>> -I../sysdeps/i386/i686/multiarch  -I../sysdeps/i386/i686
>>> -I../sysdeps/i386/fpu  -I../sysdeps/x86/fpu/include
>>> -I../sysdeps/x86/fpu  -I../sysdeps/i386  -I../sysdeps/x86
>>> -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/ldbl-96
>>> -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
>>> -I../sysdeps/ieee754  -I../sysdeps/generic  -I.. -I../libio -I.
>>> -nostdinc -isystem
>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include
>>> -isystem /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include-fixed
>>> -isystem /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32/usr/include
>>>   -D_LIBC_REENTRANT -include
>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/libc-modules.h
>>> -DMODULE_NAME=libc -include ../include/libc-symbols.h       -o
>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
>>> -MD -MP -MF /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o.dt
>>> -MT /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function 'posix_fallocate':
>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
>>> used in asm here
>>>   }
>>>   ^
>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
>>> used in asm here
>>
>> Hi All,
>>
>> For the latest master, if 'DEBUG_BUILD' is enabled, the above error appers.
>>
>> | ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function 'posix_fallocate':
>> | ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be used in asm here
>> |  }
>> |  ^
>>
>> The problem could be reproduced if we add in local.conf the following line.
>> DEBUG_BUILD = "1"
>>
>> Do you have any idea what's going on there?
> posix_fallocate is calling a syscall helper with 6 argument, and there has been i386 specific optimization added to glibc
> which checks for gcc version and if its >= 5.0 then relies upon gcc to do right thing when spilling ebp, and switched to using
> inline syscall handler. But this spill is working/tested with -O2 and everything else is just a bonus if it works. Can you try this
> patch to glibc  ?
>
>
> --- a/sysdeps/unix/sysv/linux/i386/sysdep.h
> +++ b/sysdeps/unix/sysv/linux/i386/sysdep.h
> @@ -46,7 +46,7 @@
>      to compile glibc.  Disable GCC 5 optimization when compiling for
>      profiling since asm ("ebp") can't be used to put the 6th argument
>      in %ebp for syscall.  */
> -#if __GNUC_PREREQ (5,0) && !defined PROF
> +#if __GNUC_PREREQ (5,0) && !defined PROF && !defined __OPTIMIZE_SIZE__
>   # define OPTIMIZE_FOR_GCC_5
>   #endif
>
>
>
>

Hi Khem,

Thanks for your reply.
I've tried the above patch, but the problem is still there :(

Best Regards,
Chen Qi


