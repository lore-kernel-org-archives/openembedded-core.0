Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id B4F937831C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:26:42 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r62so5128703pfd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0MIH8IX6tU8bUi8mqcSwQbAI3OEpGNgYoZWZr9AuaQ0=;
	b=F/HXNqHyzRyQooNjp1dxx9Ahvcz+U6IbEAgHFCn9U5st93IM1byRfkbhBbZQyCVtaD
	2MSb2OQDNunB/5JsTDEsdjuXSad+pW6lSNmo0C2lF9J2gWOu8AjY6rbnA4l8+O1V9A+h
	6T8fIHEIYjkNRhQRLwYycC9iwtv/I+84iahMBs8t3FgGaps/kFi/IKcvSL9xD/SbbYvj
	hK0rfPHArHS66CWAgjlWKPde6etZVvVyZJnwoxBnzmGuBDZhLu2Vy8BfROWpWfemdhfH
	vJCATLnTFqlFoMCYhQWf3yjVVgZjOJty7I7FIoUByKJUNQ+j2IjA0Kyn+CH+DmDwbNHs
	wJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0MIH8IX6tU8bUi8mqcSwQbAI3OEpGNgYoZWZr9AuaQ0=;
	b=ECqC70b9MGgdFqv0lFOjnOT31hlNP+6ULCnjm5DULZzBReQ9wRaJK4+Q1zoWLorCNM
	6SJO7ZHGLNhHAoGxyWrCxEEIT5HZ9CZyHKCbveBfxEHXimJ9Ynm2q6yy8CkiPIkB3gYb
	ubsUwGlTt4ATZz414XzTJx7IfEJT2o2kJhwXaGMxTou11T3NLTaxkner+m2Yilp9R9/7
	yVuSzfhtLvRBFwTrnCnoD7fAbLKVdiDtXaW5/oSrm8i2LsBgA4MWyU6ZbjXeliD8fQut
	uP3vwdXdOWj5UxFPn3xJD9D6I5RtQmLDZxboC5k4p4R6q981b14bXboL9qQ3OzEwYomt
	F7PA==
X-Gm-Message-State: AJaThX4CIKNAAgAO525V3mIh3rGusPHDhWtSFu1CaF+NuPjCa1ZTaSyc
	ixUeVvC5NAe/isTFviypYPYTW/+198OqwYyMx/4=
X-Google-Smtp-Source: AGs4zMYljTEJdMhtR/vfR9OeRyNFkeoXACKScFgFnt+VDQ4Br5hjI/h4wy2E+Qxzk7bjLzIF9RiPu7iO2AJTPnE2wWA=
X-Received: by 10.98.129.4 with SMTP id t4mr5870895pfd.125.1510774003658; Wed,
	15 Nov 2017 11:26:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Wed, 15 Nov 2017 11:26:13 -0800 (PST)
In-Reply-To: <20171113190011.17183-1-florin@resin.io>
References: <20171113190011.17183-1-florin@resin.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2017 11:26:13 -0800
Message-ID: <CAMKF1sqF8R6nQVpzy8HNwQj3G8j3M9_Zct+Es-Ej5RMfynx_aA@mail.gmail.com>
To: Florin Sarbu <samentu1@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: Florin Sarbu <florin@resin.io>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] gcc: Use libssp_nonshared linker specs only for ppc/musl
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
X-List-Received-Date: Wed, 15 Nov 2017 19:26:42 -0000
Content-Type: text/plain; charset="UTF-8"

Armin, this patch is good for backport please queue it  for pyro-next

On Mon, Nov 13, 2017 at 11:00 AM, Florin Sarbu <samentu1@gmail.com> wrote:
> Link libssp_nonshared.a only for ppc/musl because glibc already
> provides the content for libssp_nonshared in libc_nonshared.a and
> therefore we dont need to make it universal.
>
> (From OE-Core rev: c08247e3c7c004a40281d4010186a9ace86e0e47)
>
> Signed-off-by: Florin Sarbu <florin@resin.io>
> ---
>  meta/recipes-devtools/gcc/gcc-6.3.inc              |  2 +-
>  ...shared-to-link-commandline-for-musl-targe.patch | 87 ++++++++++++++++++++++
>  .../gcc/gcc-6.3/0041-ssp_nonshared.patch           | 28 -------
>  3 files changed, 88 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
> index d74f12c466..5c81a33af0 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
> @@ -71,7 +71,7 @@ SRC_URI = "\
>             file://0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
>             file://0039-Fix-various-_FOR_BUILD-and-related-variables.patch \
>             file://0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> -           file://0041-ssp_nonshared.patch \
> +           file://0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
>             file://0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
>             file://0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
>             file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> new file mode 100644
> index 0000000000..29b7ce72d2
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> @@ -0,0 +1,87 @@
> +From 210f6b3b82084cc756e02b8bc12f909a43b14ee8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 27 Jun 2017 18:10:54 -0700
> +Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for musl targets
> +
> +when -fstack-protector options are enabled we need to
> +link with ssp_shared on musl since it does not provide
> +the __stack_chk_fail_local() so essentially it provides
> +libssp but not libssp_nonshared something like
> +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> + where-as for glibc the needed symbols
> +are already present in libc_nonshared library therefore
> +we do not need any library helper on glibc based systems
> +but musl needs the libssp_noshared from gcc
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gcc/config/linux.h          |  7 +++++++
> + gcc/config/rs6000/linux.h   | 10 ++++++++++
> + gcc/config/rs6000/linux64.h | 10 ++++++++++
> + 3 files changed, 27 insertions(+)
> +
> +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> +index 2e683d0c430..1b4df798671 100644
> +--- a/gcc/config/linux.h
> ++++ b/gcc/config/linux.h
> +@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> +     { 0, 0, 0, 0, 0, 0 }                              \
> +   }
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++                     "|fstack-protector-strong|fstack-protector-explicit" \
> ++                     ":-lssp_nonshared}"
> ++#endif
> ++
> + #endif
> +
> + #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
> +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> +index 684afd6c190..22cfa391b89 100644
> +--- a/gcc/config/rs6000/linux.h
> ++++ b/gcc/config/rs6000/linux.h
> +@@ -91,6 +91,16 @@
> +                                        " -m elf32ppclinux")
> + #endif
> +
> ++/* link libssp_nonshared.a with musl */
> ++#if DEFAULT_LIBC == LIBC_MUSL
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++                     "|fstack-protector-strong|fstack-protector-explicit" \
> ++                     ":-lssp_nonshared}"
> ++#endif
> ++#endif
> ++
> + #undef LINK_OS_LINUX_SPEC
> + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
> +   %{rdynamic:-export-dynamic} \
> +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> +index 3b00ec0fcf0..8371f8d7b6b 100644
> +--- a/gcc/config/rs6000/linux64.h
> ++++ b/gcc/config/rs6000/linux64.h
> +@@ -465,6 +465,16 @@ extern int dot_symbols;
> +                                          " -m elf64ppc")
> + #endif
> +
> ++/* link libssp_nonshared.a with musl */
> ++#if DEFAULT_LIBC == LIBC_MUSL
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++                     "|fstack-protector-strong|fstack-protector-explicit" \
> ++                     ":-lssp_nonshared}"
> ++#endif
> ++#endif
> ++
> + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!static: \
> +   %{rdynamic:-export-dynamic} \
> +   -dynamic-linker " GNU_USER_DYNAMIC_LINKER32 "}} \
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> deleted file mode 100644
> index 0744529741..0000000000
> --- a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 551a5db7acb56e085a101f1c222d51b2c1b039a4 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <nsz@port70.net>
> -Date: Sat, 7 Nov 2015 14:58:40 +0000
> -Subject: [PATCH 41/46] ssp_nonshared
> -
> ----
> -Upstream-Status: Inappropriate [OE Configuration]
> -
> - gcc/gcc.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 2812819..9de96ee 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -863,7 +863,8 @@ proper position among the other output files.  */
> - #ifndef LINK_SSP_SPEC
> - #ifdef TARGET_LIBC_PROVIDES_SSP
> - #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> --                     "|fstack-protector-strong|fstack-protector-explicit:}"
> -+                     "|fstack-protector-strong|fstack-protector-explicit" \
> -+                     ":-lssp_nonshared}"
> - #else
> - #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> -                      "|fstack-protector-strong|fstack-protector-explicit" \
> ---
> -2.8.2
> -
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

