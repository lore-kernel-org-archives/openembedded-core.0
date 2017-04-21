Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5FE60049
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 01:06:39 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z129so1886317wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=frVIVG1QJLy30vMbl1o9AvHZts9P0mE1LQ7iPCKsTRA=;
	b=IFxEtFKSTHad2guIE+IH4pQ6OSTteikEN01xhFOdPFaSscnUlv/TptobUWNFTxV6Sg
	NX2gm94KN49xLXUOYIr0f74gfox3itOgKrhYPOChJMq8jEjofif0fDp6WiFeoFZstMux
	A/fJKfZKr+J42E7f9incGx96qBG2QRFkCY/e8eEdjh8dfOr3tj78ODstTJUD//vMfbh0
	EXVfusA5LWsIVdYKpEP+wdYzkpL5NljNv5qkZtPV/tU/tBymezvM5RP8AHCAQrGYY6mJ
	Rcp9E7uvLknAji7PNyX/BDXmxuP173tpajZzbQCwfydxwY4p9VySm3DZabxiak93gyOa
	pp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=frVIVG1QJLy30vMbl1o9AvHZts9P0mE1LQ7iPCKsTRA=;
	b=MiEq/2Zfe1te6To1nTQ+Zkk/SQcCxWU3NCYMRAHSVpar1YS2DgkHV0W4YApPd+pN4s
	MbtrbV92NMf83VjxsfwLjJ5UegSQFFUYJLa7fpW0KDN21fZj/bGf5R19H1ajn0hkDXEq
	F3hw6ImwDVZNCMrh7hlUBEg4EI/EyPH0zHCVkK8q/5+HW2mLKML/EyijKS0kP2ONA8ni
	YRRozCjuOixTJklK1wUW5HV7Aj3KkjSeneU+n1BdUOZFbldu+fSRVAinYdCmGQGJ30EZ
	/5zN+zE9iWe52s4wBmW+cgDVblqtdDkfAEDe+vI+i4nWm53ItRH8T3/iqNIdYqCv5wDB
	9nJw==
X-Gm-Message-State: AN3rC/6nWRQTsto8TI+ncS95gsa7rfVNw2h+M39YeDkLL7sKH1c3vGK6
	BNoU4+VBJDQh+aKd9rOcXv/koo3Vfg==
X-Received: by 10.28.221.212 with SMTP id u203mr5481075wmg.101.1492736800834; 
	Thu, 20 Apr 2017 18:06:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Thu, 20 Apr 2017 18:06:10 -0700 (PDT)
In-Reply-To: <CAJ86T=WTg5=tPSbH1BjVDiP2MgyhntbfCzQwyLCtkZXETojptQ@mail.gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
	<20170420182028.31964-2-raj.khem@gmail.com>
	<CAJ86T=WTg5=tPSbH1BjVDiP2MgyhntbfCzQwyLCtkZXETojptQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Apr 2017 18:06:10 -0700
Message-ID: <CAMKF1sp0sq=4FVLkgvfSi=v6wVpxSPLDZYpr_OS2WRJeZ7mK6Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 01:06:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 5:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Apr 20, 2017 at 11:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...rop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 108 +++++++++++++++++++++
>>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
>>  2 files changed, 110 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
>> new file mode 100644
>> index 00000000000..9f1da7bac68
>> --- /dev/null
>> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
>> @@ -0,0 +1,108 @@
>> +From 715cf122388f3527afa5649cebf9f1522c240693 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 20 Apr 2017 10:11:16 -0700
>> +Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
>> + architecture
>> +
>> +We can not assume that all arches armv7+ are cortex-a8 only
>> +it fails to build for rpi which is armv7ve based (cortex-a8) cpu
>> +implementation.
>> +Fixes
>> +| cc1: warning: switch -mcpu=cortex-a8 conflicts with -march=armv7ve switch
>
> The valgrind tests are built for fixed CPU targets which are known to
> support the instructions being tested (since those instructions may
> not be supported by the target CPU which valgrind itself is being
> built for).
>
> It may be safer to add -march=armv7a to the -mcpu=cortex-a8 tests (and
> ensure that -march=armv7ve doesn't leak through) rather than remove
> -mcpu=cortex-a8.

OE always passes mcpu flags, therefore it wont be an issue unless you
are saying thats not the case. For upstreaming it might be OK, but I
think this will need a different for upstreaming since it should
configure mcpu/march based on some configure input or some such
instead of hardcoding it.

>
> See the comments in:
>
>   http://git.openembedded.org/openembedded-core/commit/?id=3e94af90d90f6db6bab66ae87a47b31f3a0474f6
>
> The change to the toplevel Makefile.all.am looks OK.
>
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Makefile.all.am            |  6 +++---
>> + helgrind/tests/Makefile.am |  6 +++---
>> + none/tests/arm/Makefile.am | 18 +++++++++---------
>> + 3 files changed, 15 insertions(+), 15 deletions(-)
>> +
>> +diff --git a/Makefile.all.am b/Makefile.all.am
>> +index 02059a3..c7c4700 100644
>> +--- a/Makefile.all.am
>> ++++ b/Makefile.all.am
>> +@@ -197,11 +197,11 @@ AM_CCASFLAGS_PPC64LE_LINUX  = @FLAG_M64@ -g
>> +
>> + AM_FLAG_M3264_ARM_LINUX   = @FLAG_M32@
>> + AM_CFLAGS_ARM_LINUX       = @FLAG_M32@ \
>> +-                              $(AM_CFLAGS_BASE) -marm -mcpu=cortex-a8
>> ++                              $(AM_CFLAGS_BASE) -marm
>> + AM_CFLAGS_PSO_ARM_LINUX   = @FLAG_M32@ $(AM_CFLAGS_BASE) \
>> +-                              -marm -mcpu=cortex-a8 $(AM_CFLAGS_PSO_BASE)
>> ++                              -marm $(AM_CFLAGS_PSO_BASE)
>> + AM_CCASFLAGS_ARM_LINUX    = @FLAG_M32@ \
>> +-                              -marm -mcpu=cortex-a8 -g
>> ++                              -marm -g
>> +
>> + AM_FLAG_M3264_ARM64_LINUX = @FLAG_M64@
>> + AM_CFLAGS_ARM64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE)
>> +diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
>> +index df82169..07eb66a 100644
>> +--- a/helgrind/tests/Makefile.am
>> ++++ b/helgrind/tests/Makefile.am
>> +@@ -189,9 +189,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
>> + endif
>> +
>> + if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
>> +-annotate_hbefore_CFLAGS = $(AM_CFLAGS) -mcpu=cortex-a8
>> +-tc07_hbl1_CFLAGS        = $(AM_CFLAGS) -mcpu=cortex-a8
>> +-tc08_hbl2_CFLAGS        = $(AM_CFLAGS) -mcpu=cortex-a8
>> ++annotate_hbefore_CFLAGS = $(AM_CFLAGS)
>> ++tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
>> ++tc08_hbl2_CFLAGS        = $(AM_CFLAGS)
>> + else
>> + annotate_hbefore_CFLAGS = $(AM_CFLAGS)
>> + tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
>> +diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
>> +index 024eb6d..ccecb90 100644
>> +--- a/none/tests/arm/Makefile.am
>> ++++ b/none/tests/arm/Makefile.am
>> +@@ -52,10 +52,10 @@ allexec_CFLAGS             = $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
>> + # need special helping w.r.t -mfpu and -mfloat-abi, though.
>> + # Also force -O0 since -O takes hundreds of MB of memory
>> + # for v6intThumb.c.
>> +-v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -marm
>> +-v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
>> ++v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -marm
>> ++v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mthumb
>> +
>> +-v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
>> ++v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mthumb
>> +
>> + v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm
>> + v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb
>> +@@ -65,23 +65,23 @@ v8memory_a_CFLAGS = $(AM_CFLAGS) -g -O0 \
>> + v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
>> +                       -march=armv8-a -mfpu=crypto-neon-fp-armv8 -mthumb
>> +
>> +-vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
>> ++vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 \
>> +                       -mfpu=neon \
>> +                       -mthumb
>> +
>> +
>> +-neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
>> ++neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 \
>> +                       -mfpu=neon \
>> +                       -mthumb
>> +
>> +-neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
>> ++neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 \
>> +                       -mfpu=neon \
>> +                       -mthumb
>> +
>> + intdiv_CFLAGS   = $(AM_CFLAGS) -g -march=armv7ve -mcpu=cortex-a15 -mthumb
>> +-ldrt_CFLAGS     = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
>> +-ldrt_arm_CFLAGS         = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
>> ++ldrt_CFLAGS     = $(AM_CFLAGS) -g -mthumb
>> ++ldrt_arm_CFLAGS         = $(AM_CFLAGS) -g -marm
>> +
>> +-vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
>> ++vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mfpu=vfpv3
>> +
>> + vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
>> +--
>> +2.12.2
>> +
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
>> index 62a96354cd0..a07c8767ce3 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
>> @@ -23,7 +23,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>             file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
>>             file://avoid-neon-for-targets-which-don-t-support-it.patch \
>>             file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
>> -"
>> +           file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
>> +           "
>>  SRC_URI_append_libc-musl = "\
>>             file://0001-fix-build-for-musl-targets.patch \
>>  "
>> --
>> 2.12.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

