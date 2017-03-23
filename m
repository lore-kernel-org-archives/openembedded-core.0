Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD72377B63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:23:24 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u108so32169226wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4kvaXUFTXUWVTnLLYyPSDPrYX7GN2VGfFYpJIVuXCPw=;
	b=OqI6BZ2oku2txJ5szW0bOp4BNSOvB4l+M9CLHqeQQU8BOiK91u6/Qq+Nhmty8pgfwJ
	iEhSsbzBeUb81tBlFEpATDNp3cRkGcyx0b+5SdU+veDgrpOFEe27q3AxSKTgmibij0H3
	g8jjGz0/Ec4K+SB5bQCtXyoaI3YfXwYRKyqyomUCFBR+bWCd5tNU5xqVTmYUA+Lg8iAE
	3wLiX1j7SAb0KfzsL1CvpwmEFOMLdDXk0mokwUeNpTT17z1nxB5qLKmE42VrMujukMPq
	AYiInRIHpmsgzAuHmeM7S3tr6Ewnmgo/sTErICsnenUXD1uUBClpJNdVWPFFcdCQYs1W
	tdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4kvaXUFTXUWVTnLLYyPSDPrYX7GN2VGfFYpJIVuXCPw=;
	b=ZSiHDQ0d5h2zrax/RzDGwBbIHsDg9FpOntAvI/p8IwcLdi5E7tsJUUJ4FaSkJuJRe2
	KwzflANJmoYF+pQ5SESVJyg4NN0Ps8OsQ18ateNma9cPbi1bIvW5lEq2MvNMPFhOJXc1
	RkYoSDWYmUsWMBf4lZInLQVyyR0Sl+s3VTEFt7KMuYc3wBc8n2c8sSHcMGqLBabU3TR/
	8mkQHmOlGsX39QLftZ99pnabmcyJfma7OtpgnWL18Ks5eTyXPIsAQRQemUKPLfE4OBvY
	2rum5eK4RBO29X5oRbnFKS1KjIzdY7cinynhpW5XaAArtV3eL3yT33tIjiM23CovlV+K
	hGmg==
X-Gm-Message-State: AFeK/H1ElUCFp7ododdDUD3IKHmBSoFc91XukQaXyJ94gH6XnU8nYROGSlT/Y4xDO7HQwSN8Qr5fLRvaGktxyg==
X-Received: by 10.223.139.196 with SMTP id w4mr3757379wra.172.1490289805260;
	Thu, 23 Mar 2017 10:23:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 23 Mar 2017 10:22:54 -0700 (PDT)
In-Reply-To: <20170323055412.10238-1-fathi.boudra@linaro.org>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Mar 2017 10:22:54 -0700
Message-ID: <CAMKF1sq9UMGWoCBEOp-8gmpPekA4p6MEKg3FiJvrFr85mFjxVQ@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 23 Mar 2017 17:23:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 10:54 PM, Fathi Boudra <fathi.boudra@linaro.org> wr=
ote:
> Patch submitted upstream, pending to be merged:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D21286

Patch to glibc is fine provided you resent it with proper SRC_URI change
and report on how it builds in OE with this change applied

>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ...o.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch | 69 ++++++++++++++++=
++++++
>  meta/recipes-core/glibc/glibc_2.25.bb              |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enu=
m-definition-for-TRAP_HWBKPT-is-mi.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enum-defin=
ition-for-TRAP_HWBKPT-is-mi.patch b/meta/recipes-core/glibc/glibc/0028-bits=
-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
> new file mode 100644
> index 0000000000..fe22cc3442
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-bits-siginfo.h-enum-definition-f=
or-TRAP_HWBKPT-is-mi.patch
> @@ -0,0 +1,69 @@
> +From af3054b3856379d353a779801678f330e1b58c9a Mon Sep 17 00:00:00 2001
> +Message-Id: <af3054b3856379d353a779801678f330e1b58c9a.1490183611.git.pan=
and@redhat.com>
> +From: Pratyush Anand <panand@redhat.com>
> +Date: Wed, 22 Mar 2017 17:02:38 +0530
> +Subject: [PATCH] bits/siginfo.h: enum definition for TRAP_HWBKPT is miss=
ing
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Compile following linux kernel test code with latest glibc:
> +
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
> +
> +and we get following error:
> +breakpoint_test_arm64.c: In function =E2=80=98run_test=E2=80=99:
> +breakpoint_test_arm64.c:171:25: error: =E2=80=98TRAP_HWBKPT=E2=80=99 und=
eclared (first use in this function)
> +  if (siginfo.si_code !=3D TRAP_HWBKPT) {
> +                         ^
> +I can compile test code by modifying my local
> +/usr/include/bits/siginfo.h and test works great. Therefore, this patch
> +will be needed in upstream glibc so that issue is fixed there as well.
> +
> +Signed-off-by: Pratyush Anand <panand@redhat.com>
> +
> +Upstream-Status : Submitted [https://sourceware.org/bugzilla/show_bug.cg=
i?id=3D21286]
> +---
> + bits/siginfo.h                         | 6 +++++-
> + sysdeps/unix/sysv/linux/bits/siginfo.h | 6 +++++-
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/bits/siginfo.h b/bits/siginfo.h
> +index 4919df543634..6dc714e8f30b 100644
> +--- a/bits/siginfo.h
> ++++ b/bits/siginfo.h
> +@@ -140,8 +140,12 @@ enum
> + {
> +   TRAP_BRKPT =3D 1,             /* Process breakpoint.  */
> + #  define TRAP_BRKPT  TRAP_BRKPT
> +-  TRAP_TRACE                  /* Process trace trap.  */
> ++  TRAP_TRACE,                 /* Process trace trap.  */
> + #  define TRAP_TRACE  TRAP_TRACE
> ++  TRAP_BRANCH,                        /* Process branch trap. */
> ++# define TRAP_BRANCH  TRAP_BRANCH
> ++  TRAP_HWBKPT                 /* hardware breakpoint/watchpoint  */
> ++# define TRAP_HWBKPT  TRAP_HWBKPT
> + };
> + # endif
> +
> +diff --git a/sysdeps/unix/sysv/linux/bits/siginfo.h b/sysdeps/unix/sysv/=
linux/bits/siginfo.h
> +index 7b0d4f62a331..9cdf42a42557 100644
> +--- a/sysdeps/unix/sysv/linux/bits/siginfo.h
> ++++ b/sysdeps/unix/sysv/linux/bits/siginfo.h
> +@@ -235,8 +235,12 @@ enum
> + {
> +   TRAP_BRKPT =3D 1,             /* Process breakpoint.  */
> + #  define TRAP_BRKPT  TRAP_BRKPT
> +-  TRAP_TRACE                  /* Process trace trap.  */
> ++  TRAP_TRACE,                 /* Process trace trap.  */
> + #  define TRAP_TRACE  TRAP_TRACE
> ++  TRAP_BRANCH,                        /* Process branch trap. */
> ++# define TRAP_BRANCH  TRAP_BRANCH
> ++  TRAP_HWBKPT                 /* hardware breakpoint/watchpoint  */
> ++# define TRAP_HWBKPT  TRAP_HWBKPT
> + };
> + # endif
> +
> +--
> +2.9.3
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/gl=
ibc/glibc_2.25.bb
> index cf9c4f71b8..3f3d6ae2ae 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};nam=
e=3Dglibc \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-=
fir.patch \
>             file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
> +           file://0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is=
-mi.patch
>  "
>
>  NATIVESDKFIXES ?=3D ""
> --
> 2.11.0
>

