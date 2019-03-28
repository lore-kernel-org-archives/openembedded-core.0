Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5377D1AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:46:12 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id s81so12513112qke.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=74K9qTSFTpvlWG2RDhWCXkPjIkb80IYQSRaFLAALY7A=;
	b=paCpWT3LBrz1raD4p64SOz39yEL5bU1ippTNaqYqAXb9355Io8i5sk/oqfC0K79MT7
	Og+3FneAyMxX2qiPQMHDGFzhL6R+9fnjF+6vnXponImSPjTNXrTm0oQQ1LEbPus0A18V
	Nfv5NMjYo+NOn0JKy5zpHFWP2FpWm/xXV68HR3mWsUaaTCBdnUoiH/KuX9VI3Eob+qJe
	SRapksBUtPoT5Erb9g4Jgo51rs+bIHhmLK3sMggEYrIO3gLsAHSTKtVaFiAfo4wkHjTV
	VYPKniLiKvUGPJ71Rt+oJCrwJaxSVPgFVDKXM7iitSe8KzrweCelz3acq6VAk9w1DTv7
	gSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=74K9qTSFTpvlWG2RDhWCXkPjIkb80IYQSRaFLAALY7A=;
	b=jGvYCKqiKmv75ArFx4PN8w5NlaDNIRhcWFewTZDaYf3dp6huJ84Rc4UMBohpvjWTvD
	KS/gsF6QMLhnnvU97kw3eyapNNoemHwV+99kPBFioit/QtOoNbrJXSSp9Txuj0U65W2Y
	YlufBCSoXQ65c22xa3fFJzjByNhMScfSgdta6NBP6c3PTa2XRQv1U1cu6Br8wa6UnQXu
	yVXsm0siGG5t4MG89U4f4/VNE3qRSEczPc/SO7wB4pE14/WfpC5BCWvGoHKuePU/Och9
	I6LjkHSSfcqGyto1EiwvHLNLq65sMiXns4/dufmfTR7+/XiQ20FbIeeYzU6olDO6grW+
	5xjw==
X-Gm-Message-State: APjAAAXlMxq+8mVG/9ZDWJMC3CqZ4YMgrEzgtWs40y9hXPVkCrk8e8Fp
	uWqh/laaLm1QWrSQQPQ04P8/XuS+r4iab+5cB1Y=
X-Google-Smtp-Source: APXvYqzaXrnU6DUId96ZchYPHxqIMdM5yKQtW29GoWV+Q+mVBR+SeG+UHsfuscVnclvAqdsMppFKjUQNRldYe+oZRcY=
X-Received: by 2002:a37:6814:: with SMTP id d20mr35989363qkc.102.1553791573749;
	Thu, 28 Mar 2019 09:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2019 09:45:47 -0700
Message-ID: <CAMKF1spdgZwUH8LaaohT1hsWBa02iYCTQVN64CrhEaAveUyZnQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ninja: upate to 1.9.0
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
X-List-Received-Date: Thu, 28 Mar 2019 16:46:13 -0000
Content-Type: text/plain; charset="UTF-8"

doxygen still fails

https://errors.yoctoproject.org/Errors/Details/234762/

On Sat, Mar 23, 2019 at 9:39 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../ninja/ninja/fix-musl.patch                | 39 +++++++++++++++++++
>  .../ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb}  |  6 ++-
>  2 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
>  rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} (87%)
>
> diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> new file mode 100644
> index 0000000000..543d4f1c48
> --- /dev/null
> +++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> @@ -0,0 +1,39 @@
> +2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
> +From: makepost <makepost@firemail.cc>
> +Date: Mon, 24 Dec 2018 03:13:16 +0200
> +Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> +
> +In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> +compatibility macro. Should help avoid hardcoding platform detection.
> +---
> + src/disk_interface.cc | 14 ++++----------
> + 1 file changed, 4 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> +index d4c2fb087..dc297c449 100644
> +--- src/disk_interface.cc
> ++++ /src/disk_interface.cc
> +@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
> +   // that it doesn't exist.
> +   if (st.st_mtime == 0)
> +     return 1;
> +-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> ++#if defined(_AIX)
> ++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> ++#elif defined(__APPLE__)
> +   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> +           st.st_mtimespec.tv_nsec);
> +-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> +-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
> +-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> +-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
> +-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> +-  // For bionic, C and POSIX API is always enabled.
> +-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> ++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> +   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
> +-#elif defined(_AIX)
> +-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> + #else
> +   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> + #endif
> diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/ninja/ninja_1.8.2.bb
> rename to meta/recipes-devtools/ninja/ninja_1.9.0.bb
> index c6fcfef3dd..1b06328961 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> @@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>
>  DEPENDS = "re2c-native ninja-native"
>
> -SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
> +SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
>
> -SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
> +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
> +           file://fix-musl.patch \
> +"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

