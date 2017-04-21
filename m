Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 91A5F77BD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 18:11:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w50so8506430wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JuDyZAKrcivMIOVmEOdZW6iOCjhynS/AvOxFRXelR/U=;
	b=ozq/LWN0D0zudDsCyWvx1fEs4KKvBjhp2Ypxn0i/wselZegblgZ/eb9cHNGFeFsESU
	UguNmrUQBoiBMz9V6VnO3bMq1mj+bP7FPOOJ1wgDD7sQmoua/U8EiLUiEwSsRLGgU39S
	CIHymL4m71YBAPIWy39m47cbn4Ozkr3hP6lhLKgNqSibelT2UlhKgwEamHYVNCUSdH4e
	J3hONEGuqSzU4VJsNM7sS3oPELekvneDEEAKjr3kKBxjC9EGf0yDZk5HIJvQ3eDL021W
	2QJ2MuYPg2fmEfhgpYirexXzfyFgM0zcexM8DxfDtIIRspA9OkUwtLxSm0tFLHd5v9sA
	xdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JuDyZAKrcivMIOVmEOdZW6iOCjhynS/AvOxFRXelR/U=;
	b=gneha//VBYNReOLXAYSOgf+0xDKG/IVUaUefxnXDG2wLSuvHmjFsNTAtOf2fsyaKXM
	4CCBdj4weZvwzQNNLODfXqmDgZoIuxU+iGvSB34nsrltFXExY0JFUS9AiWmey5OkWCZu
	CwVJvb4iNK8Twp98ZIRt20ZJQGpT94TubeIrGBYsosHpsc35dkAkqn+3nh6dx70jQ0H5
	kcxE4CX1wVlxjcvok5jFzfG95X4zwDc2p6SjNhLkN+TwmYhYo6ys4pzN5axKPpW5O4ft
	YVCzfgJGyuYB7UetkDE2AtCOC5CaXezNMYHznJrH4RdfISJuOFl6fua8YZnegD6xOSC6
	kTcg==
X-Gm-Message-State: AN3rC/72qavTp6eAw93mGlaiZDHAw45WsiVBZwAAhzzcUKaMJpROkywM
	cj2AA6At+jMkZqdXLL3/k3sLmtFnxg==
X-Received: by 10.223.166.170 with SMTP id t39mr14764721wrc.72.1492798294308; 
	Fri, 21 Apr 2017 11:11:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Fri, 21 Apr 2017 11:11:33 -0700 (PDT)
In-Reply-To: <CAMKF1srEg8Swwvf_6kMWj9Q6e+0t1nKQcd0rkMnTg_6wrfhdxw@mail.gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
	<20170420182028.31964-2-raj.khem@gmail.com>
	<CAJ86T=WTg5=tPSbH1BjVDiP2MgyhntbfCzQwyLCtkZXETojptQ@mail.gmail.com>
	<CAMKF1sp0sq=4FVLkgvfSi=v6wVpxSPLDZYpr_OS2WRJeZ7mK6Q@mail.gmail.com>
	<CAJ86T=U1+KbW__rmQXNwDqD8dPiFWyUtXf2W48breiPHv=y9yQ@mail.gmail.com>
	<CAMKF1srEg8Swwvf_6kMWj9Q6e+0t1nKQcd0rkMnTg_6wrfhdxw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 21 Apr 2017 11:11:33 -0700
Message-ID: <CAJ86T=UO7t0sS=q+mwTi1+XmgFanHmSN5Tp7=bVy1OSxs6bBLw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] valgrind: Fix arm build with gcc7
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
X-List-Received-Date: Fri, 21 Apr 2017 18:11:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 9:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Apr 20, 2017 at 6:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, Apr 20, 2017 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, Apr 20, 2017 at 5:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> On Thu, Apr 20, 2017 at 11:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>>  ...rop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 108 +++++++++++++++++++++
>>>>>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
>>>>>  2 files changed, 110 insertions(+), 1 deletion(-)
>>>>>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
>>>>>
>>>>> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
>>>>> new file mode 100644
>>>>> index 00000000000..9f1da7bac68
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
>>>>> @@ -0,0 +1,108 @@
>>>>> +From 715cf122388f3527afa5649cebf9f1522c240693 Mon Sep 17 00:00:00 2001
>>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>>> +Date: Thu, 20 Apr 2017 10:11:16 -0700
>>>>> +Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
>>>>> + architecture
>>>>> +
>>>>> +We can not assume that all arches armv7+ are cortex-a8 only
>>>>> +it fails to build for rpi which is armv7ve based (cortex-a8) cpu
>>>>> +implementation.
>>>>> +Fixes
>>>>> +| cc1: warning: switch -mcpu=cortex-a8 conflicts with -march=armv7ve switch
>>>>
>>>> The valgrind tests are built for fixed CPU targets which are known to
>>>> support the instructions being tested (since those instructions may
>>>> not be supported by the target CPU which valgrind itself is being
>>>> built for).
>>>>
>>>> It may be safer to add -march=armv7a to the -mcpu=cortex-a8 tests (and
>>>> ensure that -march=armv7ve doesn't leak through) rather than remove
>>>> -mcpu=cortex-a8.
>>>
>>> OE always passes mcpu flags, therefore it wont be an issue unless you
>>> are saying thats not the case.
>>
>> OE won't pass an -mcpu flag for generic DEFAULTTUNE values such as "armv7athf".
>>
>>> For upstreaming it might be OK, but I
>>> think this will need a different for upstreaming since it should
>>> configure mcpu/march based on some configure input or some such
>>> instead of hardcoding it.
>>
>> For the ../tests/... Makefiles, the mcpu/march flags should absolutely
>> be hardcoded. e.g. the test for "idiv" should always be built in
>> exactly the same way, regardless of whether or not the target arch you
>> configure and build valgrind itself for is armv7ve.
>>
>
> what is the purpose of compiling such a test case for a machine
> where it will cause SIGILL ?

I don't think it will when executed via valgrind, since valgrind acts
as an interpreter for the binaries it runs.

In the past I've used valgrind to run an x86 binary which used cmov on
a VIA C3 CPU which didn't support that instruction. I guess a similar
approach would work for ARM - ie you could use valgrind to run an
armv7ve binary on an armv7a CPU.

>>>>
>>>> See the comments in:
>>>>
>>>>   http://git.openembedded.org/openembedded-core/commit/?id=3e94af90d90f6db6bab66ae87a47b31f3a0474f6
>>>>
>>>> The change to the toplevel Makefile.all.am looks OK.
>>>>
>>>>> +Upstream-Status: Pending
>>>>> +
>>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> +---
>>>>> + Makefile.all.am            |  6 +++---
>>>>> + helgrind/tests/Makefile.am |  6 +++---
>>>>> + none/tests/arm/Makefile.am | 18 +++++++++---------
>>>>> + 3 files changed, 15 insertions(+), 15 deletions(-)
>>>>> +
>>>>> +diff --git a/Makefile.all.am b/Makefile.all.am
>>>>> +index 02059a3..c7c4700 100644
>>>>> +--- a/Makefile.all.am
>>>>> ++++ b/Makefile.all.am
>>>>> +@@ -197,11 +197,11 @@ AM_CCASFLAGS_PPC64LE_LINUX  = @FLAG_M64@ -g
>>>>> +
>>>>> + AM_FLAG_M3264_ARM_LINUX   = @FLAG_M32@
>>>>> + AM_CFLAGS_ARM_LINUX       = @FLAG_M32@ \
>>>>> +-                              $(AM_CFLAGS_BASE) -marm -mcpu=cortex-a8
>>>>> ++                              $(AM_CFLAGS_BASE) -marm
>>>>> + AM_CFLAGS_PSO_ARM_LINUX   = @FLAG_M32@ $(AM_CFLAGS_BASE) \
>>>>> +-                              -marm -mcpu=cortex-a8 $(AM_CFLAGS_PSO_BASE)
>>>>> ++                              -marm $(AM_CFLAGS_PSO_BASE)
>>>>> + AM_CCASFLAGS_ARM_LINUX    = @FLAG_M32@ \
>>>>> +-                              -marm -mcpu=cortex-a8 -g
>>>>> ++                              -marm -g
>>>>> +
>>>>> + AM_FLAG_M3264_ARM64_LINUX = @FLAG_M64@
>>>>> + AM_CFLAGS_ARM64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE)
>>>>> +diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
>>>>> +index df82169..07eb66a 100644
>>>>> +--- a/helgrind/tests/Makefile.am
>>>>> ++++ b/helgrind/tests/Makefile.am
>>>>> +@@ -189,9 +189,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
>>>>> + endif
>>>>> +
>>>>> + if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
>>>>> +-annotate_hbefore_CFLAGS = $(AM_CFLAGS) -mcpu=cortex-a8
>>>>> +-tc07_hbl1_CFLAGS        = $(AM_CFLAGS) -mcpu=cortex-a8
>>>>> +-tc08_hbl2_CFLAGS        = $(AM_CFLAGS) -mcpu=cortex-a8
>>>>> ++annotate_hbefore_CFLAGS = $(AM_CFLAGS)
>>>>> ++tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
>>>>> ++tc08_hbl2_CFLAGS        = $(AM_CFLAGS)
>>>>> + else
>>>>> + annotate_hbefore_CFLAGS = $(AM_CFLAGS)
>>>>> + tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
>>>>> +diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
>>>>> +index 024eb6d..ccecb90 100644
>>>>> +--- a/none/tests/arm/Makefile.am
>>>>> ++++ b/none/tests/arm/Makefile.am
>>>>> +@@ -52,10 +52,10 @@ allexec_CFLAGS             = $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
>>>>> + # need special helping w.r.t -mfpu and -mfloat-abi, though.
>>>>> + # Also force -O0 since -O takes hundreds of MB of memory
>>>>> + # for v6intThumb.c.
>>>>> +-v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -marm
>>>>> +-v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
>>>>> ++v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -marm
>>>>> ++v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mthumb
>>>>> +
>>>>> +-v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
>>>>> ++v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mthumb
>>>>> +
>>>>> + v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm
>>>>> + v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb
>>>>> +@@ -65,23 +65,23 @@ v8memory_a_CFLAGS = $(AM_CFLAGS) -g -O0 \
>>>>> + v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
>>>>> +                       -march=armv8-a -mfpu=crypto-neon-fp-armv8 -mthumb
>>>>> +
>>>>> +-vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
>>>>> ++vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 \
>>>>> +                       -mfpu=neon \
>>>>> +                       -mthumb
>>>>> +
>>>>> +
>>>>> +-neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
>>>>> ++neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 \
>>>>> +                       -mfpu=neon \
>>>>> +                       -mthumb
>>>>> +
>>>>> +-neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
>>>>> ++neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 \
>>>>> +                       -mfpu=neon \
>>>>> +                       -mthumb
>>>>> +
>>>>> + intdiv_CFLAGS   = $(AM_CFLAGS) -g -march=armv7ve -mcpu=cortex-a15 -mthumb
>>>>> +-ldrt_CFLAGS     = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
>>>>> +-ldrt_arm_CFLAGS         = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
>>>>> ++ldrt_CFLAGS     = $(AM_CFLAGS) -g -mthumb
>>>>> ++ldrt_arm_CFLAGS         = $(AM_CFLAGS) -g -marm
>>>>> +
>>>>> +-vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
>>>>> ++vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mfpu=vfpv3
>>>>> +
>>>>> + vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
>>>>> +--
>>>>> +2.12.2
>>>>> +
>>>>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
>>>>> index 62a96354cd0..a07c8767ce3 100644
>>>>> --- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
>>>>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
>>>>> @@ -23,7 +23,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>>>>             file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
>>>>>             file://avoid-neon-for-targets-which-don-t-support-it.patch \
>>>>>             file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
>>>>> -"
>>>>> +           file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
>>>>> +           "
>>>>>  SRC_URI_append_libc-musl = "\
>>>>>             file://0001-fix-build-for-musl-targets.patch \
>>>>>  "
>>>>> --
>>>>> 2.12.2
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

