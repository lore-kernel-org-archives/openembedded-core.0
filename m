Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id A788C7E0A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:25:58 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id 9so8167843itf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3KPowXUvgJUzy0dgUE55EN2aR3WQz1wxSHhyyNvy/CQ=;
	b=k/dSRiCXnnkUlxlzu272C25Mvn+5MaER/jiMcjH+K9FP1acpSQO8FiK3F8hk0CPqkv
	vPigmD/9hx4ubpvUHwMbt/lIqHsQdW5qJ6Wyk+YYXVBKYWKMKBkOoHw6gB/a2L39QBf0
	K15L7whANxmsLi1zb/GngDHKSt5QmglRqroPGn+0USu+YLMPsv/QeT6f4bRuC0iYfs+2
	S5oNGPH0VBIfgf38FpZfnCmNCgQisjoIHOX69weBCU7UCl/X4RQ/W7ILzFO9V1xFBcrI
	gEeLO/FdiC2A4IBzc7d+cPN6GCclZdvNjb6pzxrjuqiX65rDT6n2Jn1k8pfJM6d5Q9us
	NG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3KPowXUvgJUzy0dgUE55EN2aR3WQz1wxSHhyyNvy/CQ=;
	b=uOdaf825aWK2ELyyz+1ShdXqDb6j9KNtsjkrN5Fa4qTaC7mT1p8i+Rl7sqn99DcMqp
	DyZ1Cz23KELLUfxvXioKwxBJzyZSl8AOJ4Zb68O2YpuzRBHO7bRAldRllrROfcqmp0iv
	BAd8HUnZRkxyHPPv7jliTadGBja95brWpPD2GmKL5BrUflls67MN8SglH8HzdAWhEtDw
	jALNljmoqAItza/eEd61jxGXtA9IGWENUuHXlMxUf/kias7igqa4xskVhhETm1ykVhEP
	c6PeIJrUcLLWBxiWKkxYj7YfG2TvOJt6GA4Y73QqtYBnW9MMEtGiji0sB986Ark6WbJQ
	W6rA==
X-Gm-Message-State: APjAAAXI6mOdgMj9GeoQ7HOjmm+dznr1YMM4h+Q+/yMgMlfaP1KaGKuL
	DSFWin2t59uijE14xcvNccdQRwjpxdIb1RgUDeNS6U3k+fc=
X-Google-Smtp-Source: APXvYqztIdG4pqLrCqtgzwFR6tIzeXqIzOXtJGN9+AT65PwEps5xzKpNf5nqqR8v2HDMxMIyzzyZ9FRU2leEOx1o3js=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr13619210itb.74.1558614359796;
	Thu, 23 May 2019 05:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190522105847.6512-3-bunk@stusta.de>
In-Reply-To: <20190522105847.6512-3-bunk@stusta.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 13:25:48 +0100
Message-ID: <CAJTo0LYqnZCFL2sSNgNb0NHHX-KY42TeKQeK91Z+puU-98oh3w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] librsvg: Replace workaround for old host systems with upstream fix
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
X-List-Received-Date: Thu, 23 May 2019 12:25:58 -0000
Content-Type: text/plain; charset="UTF-8"

Just to make it clean: this flow of cleanup patches is *much
appreciated*.  Thanks!

Ross

On Wed, 22 May 2019 at 11:59, Adrian Bunk <bunk@stusta.de> wrote:
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...t-Bsymbolic-fixes-configure-on-macOS.patch | 35 +++++++++++++++++++
>  meta/recipes-gnome/librsvg/librsvg_2.40.20.bb |  8 ++---
>  2 files changed, 38 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
> new file mode 100644
> index 0000000000..954bb60880
> --- /dev/null
> +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch
> @@ -0,0 +1,35 @@
> +From b99891e31eb6ce550e7e1cb2ca592095b3050a93 Mon Sep 17 00:00:00 2001
> +From: Brion Vibber <brion@pobox.com>
> +Date: Sun, 25 Feb 2018 18:42:36 -0800
> +Subject: Auto-detect -Bsymbolic, fixes configure on macOS
> +
> +The -Bsymbolic linker option is ELF-specific, and was breaking
> +configure on macOS unless --disable-Bsymbolic was explicitly passed.
> +
> +Switching the behavior from requiring -Bsymbolic to be available
> +by default to just warning and continuing on without.
> +
> +Fixes https://gitlab.gnome.org/GNOME/librsvg/issues/211
> +
> +Upstream-Status: Backport
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 15b26b2d..9f8dce29 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -216,7 +216,7 @@ AM_CONDITIONAL([ENABLE_PIXBUF_LOADER],[test "$enable_pixbuf_loader" = "yes"])
> + AC_ARG_ENABLE([Bsymbolic],
> +   [AS_HELP_STRING([--disable-Bsymbolic],
> +                   [disable linking with -Bsymbolic])],
> +-  [],[enable_Bsymbolic=yes])
> ++  [enable_Bsymbolic=no],[enable_Bsymbolic=auto])
> +
> + BSYMBOLIC_LDFLAG=
> + if test "$enable_Bsymbolic" != "no"; then
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> index e376d52ef3..6a798e6a91 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> @@ -14,17 +14,15 @@ BBCLASSEXTEND = "native"
>
>  inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection
>
> -SRC_URI += "file://gtk-option.patch"
> +SRC_URI += "file://gtk-option.patch \
> +            file://0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch \
> +"
>
>  SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
>  SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
>
>  CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
>
> -# The older ld (2.22) on the host (Centos 6.5) doesn't have the
> -# -Bsymbolic-functions option, we can disable it for native.
> -EXTRA_OECONF_append_class-native = " --enable-Bsymbolic=auto"
> -
>  PACKAGECONFIG ??= "gdkpixbuf"
>  # The gdk-pixbuf loader
>  PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

