Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5B16011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:01:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j16so15654219pgn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=VWHdt9VM53jS54wng9JAgLajJGjlevikrYMmdVVJqjE=;
	b=TxQGGoRE2PYeGv8VDmKL/z6UbhgogSd2uqwNNIUr2JBEV5uOuadnp+S2QcdsHQhlQc
	2W1kZlyb6mI/dKBVgbBYe7ZbHhFkNF5hS2O0A/TxxEpcSn5xnxahjcN6qZFAQhhwbB0o
	4TSnPPXV0X0MIeocEJFf0fUU5gsmhjrpNxdEJz4363Mm5Q6sGIee7XBoj90qlMg6PL7b
	j2s1GKobmILzuohXvZevvjKdss698ON2mljMN/eCBTFhv7G6x5WKXDx2GvZ39FWzG7e+
	ur0ZHFqdblCgD/Coevaue3XjdtSy/HYLIteY4OFjVRVm14kXw26lAA2gU0Hj5Vyp9Rdh
	LpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=VWHdt9VM53jS54wng9JAgLajJGjlevikrYMmdVVJqjE=;
	b=I2af6X+hnvBQXr5Dpan56bMRDtFPL3qzVviw2iIX5IQdSau+EDgQYYr6hPZMUCS6Mc
	uOzwvfe3JNE11eklMPi12rm1oX/ySemNwXRVK1RdxzUe2XkKy8g4kgYiOJ5+oArajTGq
	ukOseTiJeKqa1MsSZnSSYlJINBrFZl7zlZXBgHxS4SFu4quOe5/cnCoyZu3AFExFY+4n
	4D8Pe9d+r5aCnDiWgiyRF6b1nH6G94+BOiGINiEB0LXrong0ZXMmf0QlduyXXLfgmAd6
	KhOGMO6AakS3/yhm2GoDNdydYZh+Ugt8DnMvtMi92PpCjDE/j68B6QPVbHl/jGlSiLeL
	HVtQ==
X-Gm-Message-State: AJaThX5+scMX5Vb2uS4LpPQpP301VGeQ3nDISxjdunHvdKoDiJ6aqjse
	y2LjonT0EZ1Kaxkio+wJTWE=
X-Google-Smtp-Source: AGs4zMbsQh5F6oDA/FL8n0lh1Uwntw14QZDOGT73V6tIPunWlfVcqjLdt1YlCkhZmdxuOTFQv2+Y5A==
X-Received: by 10.98.161.25 with SMTP id b25mr27964670pff.103.1511542918139;
	Fri, 24 Nov 2017 09:01:58 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	o63sm38548122pfg.101.2017.11.24.09.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 09:01:57 -0800 (PST)
To: Florin Sarbu <samentu1@gmail.com>, openembedded-core@lists.openembedded.org
References: <20171113190011.17183-1-florin@resin.io>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a919d657-440f-de1e-d1fe-1ca2c12a2abf@gmail.com>
Date: Fri, 24 Nov 2017 09:01:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171113190011.17183-1-florin@resin.io>
Cc: Florin Sarbu <florin@resin.io>
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
X-List-Received-Date: Fri, 24 Nov 2017 17:01:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in stable/pyro-next



On 11/13/2017 11:00 AM, Florin Sarbu wrote:
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
> +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
> +     { 0, 0, 0, 0, 0, 0 }				\
> +   }
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++		       "|fstack-protector-strong|fstack-protector-explicit" \
> ++		       ":-lssp_nonshared}"
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
> + 					 " -m elf32ppclinux")
> + #endif
> + 
> ++/* link libssp_nonshared.a with musl */
> ++#if DEFAULT_LIBC == LIBC_MUSL
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++		       "|fstack-protector-strong|fstack-protector-explicit" \
> ++		       ":-lssp_nonshared}"
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
> + 					   " -m elf64ppc")
> + #endif
> + 
> ++/* link libssp_nonshared.a with musl */
> ++#if DEFAULT_LIBC == LIBC_MUSL
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++		       "|fstack-protector-strong|fstack-protector-explicit" \
> ++		       ":-lssp_nonshared}"
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
> --		       "|fstack-protector-strong|fstack-protector-explicit:}"
> -+		       "|fstack-protector-strong|fstack-protector-explicit" \
> -+		       ":-lssp_nonshared}"
> - #else
> - #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> - 		       "|fstack-protector-strong|fstack-protector-explicit" \
> --- 
> -2.8.2
> -


