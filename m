Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF2EB617E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:43:41 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r18so248909vso.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cIcvp8Cw66tLeY7iq9npSAYetA1B1r14tlLgwAh3sJM=;
	b=g+8/CfB98s7EnOSnxssXY3AVUtDRyqLJx5EJiQJKnI25yZ6Q7giJ+ejPlRbIt/AXnV
	xtEv1xM30o7j9nJ6QHhxEUaToBMOqxCtRboL86iH6hVt1NjwIt1B49SLngJf/veYVyUP
	Ay3HDFJxw0/5nQ97KCVB6zro0JdQjdes2RudBkZk8wQV4a3nUV4ymDdRX0cwmc2sRYvs
	/hFbcZbAtmnuBNANXyFe+MUidjogycvxOlgy/N7LGUnpxkDz187BoQpx1AhHy6X9zZWF
	V8H/HyxQZiecEXZbbMm3ZnTSon2Ann1cgrOIfHeFOZrP9SyzOhQt4s7secULa+FrI6Xu
	Samg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cIcvp8Cw66tLeY7iq9npSAYetA1B1r14tlLgwAh3sJM=;
	b=iyiHQghUbj+cCxeLTFejr+pkC6Vyoj/by7M6krC2ucF5mqmhkEf95SAjnEh74uL5P+
	hdSaynO9VyJn9pBWsYGb4jxV4TJmk9KH1ntlLryZYsogmQafN9DaYDXw97MiCobXT82y
	okkw4hoYP17vJFtmmqoQEEl2QIcS4KeukYvizs6W/SpHEGlaA72PGRyhO9E7yNWfHjhP
	34SxdKmW7cb3vsE7/lJ5AwPkI7U1SX/PtWUOTAosfToGn+Wn0hhzlSOtaihSWmGwpbaT
	/Jw7Qy1t9Ea2DD13FcAHomrLgdIhaThM0c1Pt5X+ysKIaXUQI8S+yW+GAVkBYD/vxO9E
	aCXw==
X-Gm-Message-State: APjAAAXP3MAj9baiJQr5DvESXCZHBrUiYYHmX+WJmUzFSrA9Yw8EtE1D
	uGhFGFUUIOvjqKEL2Q6TONLuLswZEgw9ma1Cl8E=
X-Google-Smtp-Source: APXvYqwM/X2rwOAZi3L+gFaDGPlM8eafsRyoutD242GisQ0a/uTXaSJDhGg4BCJk9OZXz4sgnh5+7ROjxudysOk5a3s=
X-Received: by 2002:a67:e3c3:: with SMTP id k3mr617228vsm.137.1582659822523;
	Tue, 25 Feb 2020 11:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
In-Reply-To: <20200221224537.4052134-3-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 25 Feb 2020 11:43:29 -0800
Message-ID: <CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Upgrade Helper <auh@auh.yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 19:43:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Upgrade Helper <auh@auh.yoctoproject.org>

Why does the author sometimes get set to "Upgrade Helper"? It doesn't
seem to happen very often (4 times in the past 6 years in oe-core).
What's special about those 4 cases?

I think it would be clearer if the author was set to whoever ran the tool.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../ninja/ninja/fix-musl.patch                | 46 -------------------
>  .../ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} |  6 +--
>  2 files changed, 2 insertions(+), 50 deletions(-)
>  delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
>  rename meta/recipes-devtools/ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} (87%)
>
> diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> deleted file mode 100644
> index 7fd779110d..0000000000
> --- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 2001
> -From: makepost <makepost@firemail.cc>
> -Date: Mon, 24 Dec 2018 03:13:16 +0200
> -Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> -
> -In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> -compatibility macro. Should help avoid hardcoding platform detection.
> -
> -Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> -
> -Upstream-Status: Pending
> ----
> - src/disk_interface.cc | 14 ++++----------
> - 1 file changed, 4 insertions(+), 10 deletions(-)
> -
> -diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> -index d4c2fb0..dc297c4 100644
> ---- a/src/disk_interface.cc
> -+++ b/src/disk_interface.cc
> -@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
> -   // that it doesn't exist.
> -   if (st.st_mtime == 0)
> -     return 1;
> --#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> -+#if defined(_AIX)
> -+  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> -+#elif defined(__APPLE__)
> -   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> -           st.st_mtimespec.tv_nsec);
> --#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> --       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
> --  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> --  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
> --  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> --  // For bionic, C and POSIX API is always enabled.
> --  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> -+#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> -   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
> --#elif defined(_AIX)
> --  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> - #else
> -   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> - #endif
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/ninja/ninja_1.9.0.bb
> rename to meta/recipes-devtools/ninja/ninja_1.10.0.bb
> index f1236e8ac8..bdc6365052 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
> @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>
>  DEPENDS = "re2c-native ninja-native"
>
> -SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
> +SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
>
> -SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
> -           file://fix-musl.patch \
> -"
> +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

