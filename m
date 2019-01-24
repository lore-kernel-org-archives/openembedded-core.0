Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id E66427C29B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 14:33:43 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i145so5210495ita.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0SgZH8Mzt/0vLrHrHAzzm3v2qRfd3N6yk+0ZraL00wQ=;
	b=mfzTjZmAk8VlnjLD7V311e6J1ePCGZGCd3wRgeVpno4YeEum0nPfsslmSlnynRSHuv
	BZ7DLvzJMmzaTMugum2Txk7a3Yy+krQJnl0xeLLWvk9WbJ5BBZ4qwJW1pW0sbmmKg2ni
	fQqERbCnMydjf+U2Niz4+p+MheyCci3bF/pGTVUpz3V1Ls1pN0RSZKppahE8tJxZpcFL
	gZdt38213uzhstCIdl6pUUkb0U/K8m7Bs1cbNwIKHInK/MR9KKOTe3W0cxdP+yXp7Zqy
	EwEDP/B5uKSbiXgG6C3mLbvBdEOAkMQMANyJ2SF54fOu1qqIewpN/RGRZAiUrETDL5Vi
	K3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0SgZH8Mzt/0vLrHrHAzzm3v2qRfd3N6yk+0ZraL00wQ=;
	b=QypQedE4RzZ7/6UjcurJYKz/hPGPDbKJZnDReqmY3bB9YN9PzKv2imLHkc+WApxtqF
	LTRqaD0ob/6P8wZw+ZUOfEngvkcquK2FMCG0s0TvOMXxKtIdVgYzTeI+Gv1jKmRw4vfD
	F//H0f4+IoaQNKKegPtux/VdZSKkOnpKnD2NE5EsgXI2zt/QZ4qSIHBEgm5ISHH7IM8A
	a97JWo9NuQqBFrtRzlauKOGUUDu/HvfNGhDywru2nHV+EoD4aHfJlo3xms/j8m0k2qVn
	YIYAJ5H9uDR8OR2U0Jl8ThjR3xqdstzSasw3SxpY11C10GfplwZi9oy0S6BwfPLO2J/n
	PEGg==
X-Gm-Message-State: AJcUukeLWRUlN+LMM/D+yRe9VG+IuUiviYdx2OzkLxCGdA/7tHjKywZx
	bFBF02CsQt0zNJwegiX2AyR1LCSkbIr1xOqnYktBsg==
X-Google-Smtp-Source: ALg8bN7pyylt3BgvxKXpxwu6poYaByOuGFw6UicrjeSL801OoNr4YpVS3fFq/D9wgBmUaED4AKJsR5cRlVInBYl8Qlk=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr4615553jas.105.1548340424862; 
	Thu, 24 Jan 2019 06:33:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548313400.git.liezhi.yang@windriver.com>
	<a0f8078a8e439288441f29fd2d152265b7cc767f.1548313400.git.liezhi.yang@windriver.com>
In-Reply-To: <a0f8078a8e439288441f29fd2d152265b7cc767f.1548313400.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2019 14:33:33 +0000
Message-ID: <CAJTo0LbYj7GnSvosGqNMsnsTR8Ty=DfZW_oTaijvjPYG=Hp7gg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fontconfig: Fix define for HAVE_POSIX_FADVISE
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
X-List-Received-Date: Thu, 24 Jan 2019 14:33:44 -0000
Content-Type: text/plain; charset="UTF-8"

Please send this upstream.

Ross

On Thu, 24 Jan 2019 at 06:46, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Otherwise, there would be build errors in the following 2 cases:
> * define HAVE_POSIX_FADVISE
> Or:
> * undef HAVE_POSIX_FADVISE
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...cache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch | 33 ++++++++++++++++++++++
>  .../fontconfig/fontconfig_2.12.6.bb                |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch
>
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch
> new file mode 100644
> index 0000000..07b2d65
> --- /dev/null
> +++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch
> @@ -0,0 +1,33 @@
> +From ab9522177a8396a51812fdbebb6387df451a8499 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Mon, 24 Dec 2018 11:03:58 +0800
> +Subject: [PATCH] src/fccache.c: Fix define for HAVE_POSIX_FADVISE
> +
> +Otherwise, there would be build errors in the following 2 cases:
> +* define HAVE_POSIX_FADVISE
> +Or:
> +* undef HAVE_POSIX_FADVISE
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + fccache.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/fccache.c b/src/fccache.c
> +index 6f3c68a..85cc4b4 100644
> +--- a/src/fccache.c
> ++++ b/src/fccache.c
> +@@ -700,7 +700,7 @@ FcDirCacheMapFd (FcConfig *config, int fd, struct stat *fd_stat, struct stat *di
> +     {
> + #if defined(HAVE_MMAP) || defined(__CYGWIN__)
> +       cache = mmap (0, fd_stat->st_size, PROT_READ, MAP_SHARED, fd, 0);
> +-#if (HAVE_POSIX_FADVISE) && defined(POSIX_FADV_WILLNEED)
> ++#if defined(HAVE_POSIX_FADVISE) && defined(POSIX_FADV_WILLNEED)
> +       posix_fadvise (fd, 0, fd_stat->st_size, POSIX_FADV_WILLNEED);
> + #endif
> +       if (cache == MAP_FAILED)
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> index 6128d5e..beeae7f 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
> @@ -23,6 +23,7 @@ DEPENDS = "expat freetype zlib gperf-native"
>  SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>             file://revert-static-pkgconfig.patch \
>             file://0001-src-fcxml.c-avoid-double-free-of-filename.patch \
> +           file://0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch \
>             "
>
>  SRC_URI[md5sum] = "00e748c67fad11e7057a71ed385e8bdb"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

