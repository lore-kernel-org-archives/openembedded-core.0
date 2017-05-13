Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D692560269
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 17:12:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u65so19255186wmu.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wzuY6jU6DcGY2EShruLv+hd6cxPfE6rlJSchyY46jkk=;
	b=XQL7h6RvbAFRCDnxkmh2PuUm6N4APnO9n+xuX+P23DzDd4H44cjaSiJkTUfG1d4hQK
	bcfuB5c+C/Q01Cg17lwQzRQZkZAf3OEKfAkK7X71NSLWQs1B9xBt9hgWebSWyaM9CWl7
	NuvfjSGsjxVnBGdZquhh780hyt8ZaTQ/W5zxLRtDystqF8ANoo4xxdh2E4S4jXyuFrhZ
	tEfVfJ84/xAj+aUop/7uTt+DBGUtX1kRQoN35uy4cPWV2TxbqlOlg5nkhKgcCsBQmX+z
	zkLOPnofbXBAhkvcl0FSRXDMxyr0cUT5BVS5MP5Ic0a06dtoJZVL9NoWsYH/Phqwe27/
	vrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wzuY6jU6DcGY2EShruLv+hd6cxPfE6rlJSchyY46jkk=;
	b=N/D3pvetp24qJCprwYbTd1cEzQ6O4J9B+JD+efyQjNYAvC5v9mH1Ni+RNCMZirxf5F
	qb/u8PbSln6Gl3U08bYCTl3E1h9j4y7tZZ6VqkHGS9FOpTHGAqhpkUOt6/stoAgn/H6g
	UEsLZM9WvNKSOqu9zDgrowI56hnVfoqdujldFmGyWAChH89E8oeYVQUTEhiVCfE08/NQ
	2zfXiT3Yx0PtsmrYK/4+g5bBL0QVRPgVAnxd4nN+iusa4OsXcgNog2ZP5/dLqqZtK67L
	pH0MiSJ3ecIOsyKFBeGEu4ROtXafLln116ZfDqXws/uCNmwegV/gWvUarC0jl3eQUyIy
	bqCg==
X-Gm-Message-State: AODbwcC3xiSQf+wSls5z98BdcrZQ5+wyt/uH+WrECulncBHsNdNiprRZ
	/oWEV5vqYR23Prw7N1TQ6rCfcjnesw==
X-Received: by 10.80.144.118 with SMTP id z51mr7855248edz.143.1494695562587;
	Sat, 13 May 2017 10:12:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Sat, 13 May 2017 10:12:12 -0700 (PDT)
In-Reply-To: <CADkTA4P2Bdj_cqAOrSCrYVafEvbKxW-uw1GOVegEigE8pkhyaQ@mail.gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
	<20170513025932.26254-7-raj.khem@gmail.com>
	<CADkTA4NJ2-w=k6t-rux=DOoydOQwz7NM5pYG7DDB0ZNcsFRY+Q@mail.gmail.com>
	<CAMKF1srXRodzzUUx5=XOJCGPA_rUFDxYPQu0mDKXgMuePCpqPA@mail.gmail.com>
	<CADkTA4P2Bdj_cqAOrSCrYVafEvbKxW-uw1GOVegEigE8pkhyaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 May 2017 10:12:12 -0700
Message-ID: <CAMKF1spEuKRQ+9K8ACtvKM3VG+rKJj2YEN7H67+bNSc=UE9csw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] linux-yocto_4.1.bb: Fix build with gcc7
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
X-List-Received-Date: Sat, 13 May 2017 17:12:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 13, 2017 at 9:16 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Sat, May 13, 2017 at 12:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sat, May 13, 2017 at 8:45 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > I already have this queued, I'm just not sending any kernel pull
>> > requests
>> > while
>> > the release is finalizing.
>>
>> its already done yesterday :) so you are free to send
>
>
> oh! I hadn't noticed. I was heads down working on some features. I'll update
> and send my queue tonight.
>
> I attached the patch to show it exists :D

thanks. clearing ENOBELIEVE

>
> Cheers,
>
> Bruce
>
>>
>>
>> >
>> > So please, do not queue or merge this change.
>> >
>>
>> sure
>>
>> > Bruce
>> >
>> > On Fri, May 12, 2017 at 10:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>  ...ve-up-on-gcc-ilog2-constant-optimizations.patch | 134
>> >> +++++++++++++++++++++
>> >>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   2 +
>> >>  2 files changed, 136 insertions(+)
>> >>  create mode 100644
>> >>
>> >> meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
>> >>
>> >> diff --git
>> >>
>> >> a/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
>> >>
>> >> b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
>> >> new file mode 100644
>> >> index 0000000000..35c4484f20
>> >> --- /dev/null
>> >> +++
>> >>
>> >> b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
>> >> @@ -0,0 +1,134 @@
>> >> +From 273bf720b7acb5f808337fe57c5f400422a30051 Mon Sep 17 00:00:00 2001
>> >> +From: Linus Torvalds <torvalds@linux-foundation.org>
>> >> +Date: Thu, 2 Mar 2017 12:17:22 -0800
>> >> +Subject: [PATCH] give up on gcc ilog2() constant optimizations
>> >> +
>> >> +commit 474c90156c8dcc2fa815e6716cc9394d7930cb9c upstream.
>> >> +
>> >> +gcc-7 has an "optimization" pass that completely screws up, and
>> >> +generates the code expansion for the (impossible) case of calling
>> >> +ilog2() with a zero constant, even when the code gcc compiles does not
>> >> +actually have a zero constant.
>> >> +
>> >> +And we try to generate a compile-time error for anybody doing ilog2()
>> >> on
>> >> +a constant where that doesn't make sense (be it zero or negative).  So
>> >> +now gcc7 will fail the build due to our sanity checking, because it
>> >> +created that constant-zero case that didn't actually exist in the
>> >> source
>> >> +code.
>> >> +
>> >> +There's a whole long discussion on the kernel mailing about how to
>> >> work
>> >> +around this gcc bug.  The gcc people themselevs have discussed their
>> >> +"feature" in
>> >> +
>> >> +   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72785
>> >> +
>> >> +but it's all water under the bridge, because while it looked at one
>> >> +point like it would be solved by the time gcc7 was released, that was
>> >> +not to be.
>> >> +
>> >> +So now we have to deal with this compiler braindamage.
>> >> +
>> >> +And the only simple approach seems to be to just delete the code that
>> >> +tries to warn about bad uses of ilog2().
>> >> +
>> >> +So now "ilog2()" will just return 0 not just for the value 1, but for
>> >> +any non-positive value too.
>> >> +
>> >> +It's not like I can recall anybody having ever actually tried to use
>> >> +this function on any invalid value, but maybe the sanity check just
>> >> +meant that such code never made it out in public.
>> >> +
>> >> +Reported-by: Laura Abbott <labbott@redhat.com>
>> >> +Cc: John Stultz <john.stultz@linaro.org>,
>> >> +Cc: Thomas Gleixner <tglx@linutronix.de>
>> >> +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> >> +Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>> >> +Cc: Jiri Slaby <jslaby@suse.cz>
>> >> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> +---
>> >> +Upstream-Status: Backport
>> >> +
>> >> + include/linux/log2.h       | 13 ++-----------
>> >> + tools/include/linux/log2.h | 13 ++-----------
>> >> + 2 files changed, 4 insertions(+), 22 deletions(-)
>> >> +
>> >> +diff --git a/include/linux/log2.h b/include/linux/log2.h
>> >> +index fd7ff3d91e6a..f38fae23bdac 100644
>> >> +--- a/include/linux/log2.h
>> >> ++++ b/include/linux/log2.h
>> >> +@@ -16,12 +16,6 @@
>> >> + #include <linux/bitops.h>
>> >> +
>> >> + /*
>> >> +- * deal with unrepresentable constant logarithms
>> >> +- */
>> >> +-extern __attribute__((const, noreturn))
>> >> +-int ____ilog2_NaN(void);
>> >> +-
>> >> +-/*
>> >> +  * non-constant log of base 2 calculators
>> >> +  * - the arch may override these in asm/bitops.h if they can be
>> >> implemented
>> >> +  *   more efficiently than using fls() and fls64()
>> >> +@@ -85,7 +79,7 @@ unsigned long __rounddown_pow_of_two(unsigned long
>> >> n)
>> >> + #define ilog2(n)                              \
>> >> + (                                             \
>> >> +       __builtin_constant_p(n) ? (             \
>> >> +-              (n) < 1 ? ____ilog2_NaN() :     \
>> >> ++              (n) < 2 ? 0 :                   \
>> >> +               (n) & (1ULL << 63) ? 63 :       \
>> >> +               (n) & (1ULL << 62) ? 62 :       \
>> >> +               (n) & (1ULL << 61) ? 61 :       \
>> >> +@@ -148,10 +142,7 @@ unsigned long __rounddown_pow_of_two(unsigned
>> >> long
>> >> n)
>> >> +               (n) & (1ULL <<  4) ?  4 :       \
>> >> +               (n) & (1ULL <<  3) ?  3 :       \
>> >> +               (n) & (1ULL <<  2) ?  2 :       \
>> >> +-              (n) & (1ULL <<  1) ?  1 :       \
>> >> +-              (n) & (1ULL <<  0) ?  0 :       \
>> >> +-              ____ilog2_NaN()                 \
>> >> +-                                 ) :          \
>> >> ++              1 ) :                           \
>> >> +       (sizeof(n) <= 4) ?                      \
>> >> +       __ilog2_u32(n) :                        \
>> >> +       __ilog2_u64(n)                          \
>> >> +diff --git a/tools/include/linux/log2.h b/tools/include/linux/log2.h
>> >> +index 41446668ccce..d5677d39c1e4 100644
>> >> +--- a/tools/include/linux/log2.h
>> >> ++++ b/tools/include/linux/log2.h
>> >> +@@ -13,12 +13,6 @@
>> >> + #define _TOOLS_LINUX_LOG2_H
>> >> +
>> >> + /*
>> >> +- * deal with unrepresentable constant logarithms
>> >> +- */
>> >> +-extern __attribute__((const, noreturn))
>> >> +-int ____ilog2_NaN(void);
>> >> +-
>> >> +-/*
>> >> +  * non-constant log of base 2 calculators
>> >> +  * - the arch may override these in asm/bitops.h if they can be
>> >> implemented
>> >> +  *   more efficiently than using fls() and fls64()
>> >> +@@ -78,7 +72,7 @@ unsigned long __rounddown_pow_of_two(unsigned long
>> >> n)
>> >> + #define ilog2(n)                              \
>> >> + (                                             \
>> >> +       __builtin_constant_p(n) ? (             \
>> >> +-              (n) < 1 ? ____ilog2_NaN() :     \
>> >> ++              (n) < 2 ? 0 :                   \
>> >> +               (n) & (1ULL << 63) ? 63 :       \
>> >> +               (n) & (1ULL << 62) ? 62 :       \
>> >> +               (n) & (1ULL << 61) ? 61 :       \
>> >> +@@ -141,10 +135,7 @@ unsigned long __rounddown_pow_of_two(unsigned
>> >> long
>> >> n)
>> >> +               (n) & (1ULL <<  4) ?  4 :       \
>> >> +               (n) & (1ULL <<  3) ?  3 :       \
>> >> +               (n) & (1ULL <<  2) ?  2 :       \
>> >> +-              (n) & (1ULL <<  1) ?  1 :       \
>> >> +-              (n) & (1ULL <<  0) ?  0 :       \
>> >> +-              ____ilog2_NaN()                 \
>> >> +-                                 ) :          \
>> >> ++              1 ) :                           \
>> >> +       (sizeof(n) <= 4) ?                      \
>> >> +       __ilog2_u32(n) :                        \
>> >> +       __ilog2_u64(n)                          \
>> >> +--
>> >> +2.12.2
>> >> +
>> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> >> b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> >> index bf7f266ee6..f90d5159d5 100644
>> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> >> @@ -24,6 +24,8 @@ SRCREV_meta ?=
>> >> "7140ddb86e4b01529185e6d4a606001ad152b8f3"
>> >>  SRC_URI =
>> >>
>> >> "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH};
>> >> \
>> >>
>> >>
>> >> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
>> >>
>> >> +SRC_URI +=
>> >> "file://0001-give-up-on-gcc-ilog2-constant-optimizations.patch"
>> >> +
>> >>  LINUX_VERSION ?= "4.1.38"
>> >>
>> >>  PV = "${LINUX_VERSION}+git${SRCPV}"
>> >> --
>> >> 2.13.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at
>> > its end"
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

