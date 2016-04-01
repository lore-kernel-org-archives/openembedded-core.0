Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8D11873695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 14:11:40 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s5so38443831qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VBPM4JalOF6ZNI+WARPxLHe38+broelIxoAZ5Gu2D44=;
	b=hR+2iArRkanm0soXF7lR3Wzk2X35WKVsxa7edABSGsZG4IEM3fgq/4EldfnpaFxLPx
	SNVhoXAazdJE2fUVkZvdMNSWHk5kB2FwGXjh9BI6R0dTPmEBoBKgcEV+svQQpdZOdY2x
	Jh6jAJRCj0hhqr51a5X7icDlZO57liEXfY1D63g7g1t8yEVq6+uqW0Siyjp/NA1FxvJh
	KomhNvi8dzTwnKUy5Q7sxp5HbJRpnMjteBeKsLvjAzqRmKbqW5yMgyJcMrR+Rxl8qYpj
	xqzSZtoEHMYA6xhdm9oDr2RFKtsgdCJQzJtZHDPzTgthHJXbxGhOkGD6c2/tFSYKzsq8
	taUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VBPM4JalOF6ZNI+WARPxLHe38+broelIxoAZ5Gu2D44=;
	b=SocevulIjOZUCYxfTVltG6Cdu5swQXPhyzo3Bl6dXegHaC2pRErtFVtW0RVWEuCDAf
	C9UWXd6V1ZtzhnZ+OghqogzYrnK2Eyk1vg79d/IhCy/CvIuRbTnk5pwGw1ZOEhhQSWnd
	FRAtS89I061PSM3Q4mImXCeaUE8Bzi7Q86GosFKlQLyS7H1SABQrd+giCq+YplF0W82S
	F1hkzs/uP9UmMKJIqAtXCcuwzpZABwOYWKpPMdxURliQrO/bdfFbB/l+gfQFz9IGfzoi
	4yPoikTbNPP1iSlS3a5m2dQ+8I4b97PAY1Bhr6MeYuyaJ9BCHOa6ocs6rlQLByHEzyMt
	vpaQ==
X-Gm-Message-State: AD7BkJL5sJpWxcA1PDi4MK7Q9KbOied1+Rf/lz9+Op+lUj5kGABgXovoCRBH8GucZKGWTNiXFlK3hNQaLSta2w==
X-Received: by 10.55.74.197 with SMTP id x188mr18928437qka.104.1459519900912; 
	Fri, 01 Apr 2016 07:11:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 1 Apr 2016 07:11:11 -0700 (PDT)
In-Reply-To: <56FE34F1.1070107@windriver.com>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
	<CAJ86T=VoDWL_Os8yAFHKpTfWTv8Q-uTpu8TEtwQc-7+-dWKFuA@mail.gmail.com>
	<56F9DC9A.6070409@windriver.com>
	<39E0EE4C-3FCD-4FAC-94F2-0B4F3BED8F2F@gmail.com>
	<56FCCB36.4040203@windriver.com> <56FE34F1.1070107@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Apr 2016 07:11:11 -0700
Message-ID: <CAMKF1sox=vPQrBtP+3_meBE1USJG-ZKeREEdZEoU7zUeX02EBw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 01 Apr 2016 14:11:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 1, 2016 at 1:44 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 03/31/2016 03:01 PM, ChenQi wrote:
>>
>> On 03/29/2016 10:16 AM, Khem Raj wrote:
>>>>
>>>> On Mar 28, 2016, at 6:38 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>>>>
>>>> On 02/23/2016 06:31 AM, Andre McCurdy wrote:
>>>>>
>>>>> On Sat, Feb 20, 2016 at 12:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>
>>>>>> Drop kconfig and options-group support
>>>>>> Forward port cross-localedef support
>>>>>> Assume ssp support in libc when building gcc-initial
>>>>>
>>>>> Breaks for me when building for x86 with -Os (building with
>>>>> -O1/-O2/-O3 are all OK):
>>>>>
>>>>> i686-rdk-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
>>>>>
>>>>> --sysroot=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32-tcbootstrap
>>>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c -c -std=gnu11
>>>>> -fgnu89-inline  -Os -Wall -Werror -Wno-error -Wundef -Wwrite-strings
>>>>>
>>>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32=
>>>>>
>>>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux=
>>>>>
>>>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux=/usr/src/glibc
>>>>>
>>>>> -fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/git=/usr/src/glibc
>>>>> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
>>>>> -g -pipe -Wstrict-prototypes -Wold-style-definition -Wa,-mtune=i686
>>>>> -fexceptions  -ftls-model=initial-exec      -I../include
>>>>>
>>>>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io
>>>>>
>>>>> -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux
>>>>>   -I../sysdeps/unix/sysv/linux/i386/i686 -I../sysdeps/i386/i686/nptl
>>>>> -I../sysdeps/unix/sysv/linux/i386 -I../sysdeps/unix/sysv/linux/x86
>>>>> -I../sysdeps/i386/nptl  -I../sysdeps/unix/sysv/linux/include
>>>>> -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl -I../sysdeps/pthread
>>>>> -I../sysdeps/gnu  -I../sysdeps/unix/inet -I../sysdeps/unix/sysv
>>>>> -I../sysdeps/unix/i386  -I../sysdeps/unix -I../sysdeps/posix
>>>>> -I../sysdeps/i386/i686/fpu/multiarch -I../sysdeps/i386/i686/fpu
>>>>> -I../sysdeps/i386/i686/multiarch  -I../sysdeps/i386/i686
>>>>> -I../sysdeps/i386/fpu  -I../sysdeps/x86/fpu/include
>>>>> -I../sysdeps/x86/fpu  -I../sysdeps/i386  -I../sysdeps/x86
>>>>> -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/ldbl-96
>>>>> -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
>>>>> -I../sysdeps/ieee754  -I../sysdeps/generic  -I.. -I../libio -I.
>>>>> -nostdinc -isystem
>>>>>
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include
>>>>> -isystem
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include-fixed
>>>>> -isystem
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32/usr/include
>>>>>   -D_LIBC_REENTRANT -include
>>>>>
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/libc-modules.h
>>>>> -DMODULE_NAME=libc -include ../include/libc-symbols.h -o
>>>>>
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
>>>>> -MD -MP -MF
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o.dt
>>>>> -MT
>>>>> /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
>>>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function
>>>>> 'posix_fallocate':
>>>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
>>>>> used in asm here
>>>>>   }
>>>>>   ^
>>>>> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
>>>>> used in asm here
>>>>
>>>>
>>>> Hi All,
>>>>
>>>> For the latest master, if 'DEBUG_BUILD' is enabled, the above error
>>>> appers.
>>>>
>>>> | ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function
>>>> 'posix_fallocate':
>>>> | ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
>>>> used in asm here
>>>> |  }
>>>> |  ^
>>>>
>>>> The problem could be reproduced if we add in local.conf the following
>>>> line.
>>>> DEBUG_BUILD = "1"
>>>>
>>>> Do you have any idea what's going on there?
>>>
>>> posix_fallocate is calling a syscall helper with 6 argument, and there
>>> has been i386 specific optimization added to glibc
>>> which checks for gcc version and if its >= 5.0 then relies upon gcc to do
>>> right thing when spilling ebp, and switched to using
>>> inline syscall handler. But this spill is working/tested with -O2 and
>>> everything else is just a bonus if it works. Can you try this
>>> patch to glibc  ?
>>>
>>>
>>> --- a/sysdeps/unix/sysv/linux/i386/sysdep.h
>>> +++ b/sysdeps/unix/sysv/linux/i386/sysdep.h
>>> @@ -46,7 +46,7 @@
>>>      to compile glibc.  Disable GCC 5 optimization when compiling for
>>>      profiling since asm ("ebp") can't be used to put the 6th argument
>>>      in %ebp for syscall.  */
>>> -#if __GNUC_PREREQ (5,0) && !defined PROF
>>> +#if __GNUC_PREREQ (5,0) && !defined PROF && !defined __OPTIMIZE_SIZE__
>>>   # define OPTIMIZE_FOR_GCC_5
>>>   #endif
>>>
>>>
>>>
>>>
>>
>> Hi Khem,
>>
>> Thanks for your reply.
>> I've tried the above patch, but the problem is still there :(
>>
>> Best Regards,
>> Chen Qi
>>
>
> And if we remove " -fno-omit-frame-pointer" from CFLAGS, things work.
> CFLAGS_remove_pn-glibc_x86 = " -fno-omit-frame-pointer"

this option did not appear in the cmdline you pasted in your mails. But this
would let gcc not need frames and ebp will be free to clobber and it would work
but check how stack traces are looking then.

>
> Regards,
> Chen Qi

