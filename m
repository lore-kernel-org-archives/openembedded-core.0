Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id E585E74609
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 11:01:57 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 70-v6so3797353ity.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=evX+hNoA3ZLF7lYLAOLoVJ9UtZ59a+RNB3py9mLqENs=;
	b=InMm7E/BFgOxCj4nElSa2VUWhaBsURNOAaOmZl2iLONg8b6Ni6lLeNQGsfHfmsBzqM
	ZxfgYnnpcs50AFapYinWWR7uTcdeEY/0X1Y/1oluOpdACZNYIVtrQsVhWKstoW3f8u65
	fMvQTIEktBgkIAO67nOEWQqSvzZCa97REn35KsKjAT57Mt3Vrds6mxHi/4eUlyZESxW/
	OwLF7R7mgskq2BPnoNi5GvnCMPCkomJGX7NCuVbzgSc7Zo3QiqLyxWVsHF+UmR88QjLX
	zbf82C1C5kqFZ/q6n4kV7INDfb8h1CqWOeO/rIeCU518s/PgrN9DnlS5LvfRDW/m5Zqf
	PDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=evX+hNoA3ZLF7lYLAOLoVJ9UtZ59a+RNB3py9mLqENs=;
	b=AUtL3ybQuMTVYa4m9XZcyqjvKN00zGBzqLWF4AXbfLf3AKzxqHlRkzP/7DXRWblSJY
	GDsz6xpWGLMHA2ZxeYGz8FMZS9rAaMFuuDcqd1KiMNqdOWxdRK7P6Ogb2WnzHumeL7Il
	G+e+dgd4wqEkLZFI+EdkIz/VWReICiFXKEP/AE9p9QFbQtsQ7bb5WSEWDWOU6Yro2ytL
	tGzxkexdlvm3UN/qnCTL8lMBlVoJf/KWgUaPcutpS5ZhiCwsQtjjJMSQpVIOL44Yk87K
	tMUSHQc/82zfXII1cjqC5hPzNkxuD0kSzB5dw6L/BS40238Nyh7cN+LFLLQbWxSg8kZH
	i2PQ==
X-Gm-Message-State: ALKqPwe1ztSCdpzMKiBPGXeO9lxYbNRy0CCbhCRY0ZOoVqK36bK9YgPa
	CHCR0hJtMqNc/mzTBpLT5Kz5I7I0LDiJeMMjzjM6dQ==
X-Google-Smtp-Source: ADUXVKKYCwkOeoNCMZzCG8/mylwB32tGTt7ui9tca72j0dRkNVv6citHk5ejA5sfJRExbWzi4YjHVQ4W6PMDam5SYw0=
X-Received: by 2002:a24:3a0a:: with SMTP id
	m10-v6mr4934726itm.45.1527073318407; 
	Wed, 23 May 2018 04:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP; Wed, 23 May 2018 04:01:38
	-0700 (PDT)
In-Reply-To: <1526696034-3857-6-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-6-git-send-email-akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 May 2018 12:01:38 +0100
Message-ID: <CAJTo0LbV4mAKK1drQ-LcgsrL8JC_MmYrqhYmM1QPGhJRSx+cPw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
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
X-List-Received-Date: Wed, 23 May 2018 11:01:58 -0000
Content-Type: text/plain; charset="UTF-8"

This is breaking a number of other bits of X:

- xf86-video-intel (was DRI1 removed or disabled in 1.20?)
- xf86-input-mouse
- xf86-video-omapfb

Ross

On 19 May 2018 at 03:13, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster808@gmail.com>
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...1-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++++++----------
>  ...{xserver-xorg_1.19.6.bb => xserver-xorg_1.20.0.bb} |  4 ++--
>  2 files changed, 11 insertions(+), 12 deletions(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.6.bb => xserver-xorg_1.20.0.bb} (89%)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
> index 16ec3ed..020a1cf 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
> @@ -1,12 +1,13 @@
> -Discover monotonic clock using compile-time check
> +From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 12 Dec 2016 12:11:39 +0200
> +Subject: [PATCH] Discover monotonic clock using compile-time check
>
>  monotonic clock check does not work when cross-compiling.
>
>  Upstream-Status: Denied [Does not work on OpenBSD]
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> -
> -
>  Original patch follows:
>
>  When xorg-xserver is being cross-compiled, there is currently no way
> @@ -21,15 +22,16 @@ monotonic clock is available. This check can run just fine when we are
>  cross-compiling.
>
>  Signed-off-by: David James <davidjames at google.com>
> +
>  ---
>   configure.ac | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index f7ab48c..26e85cd 100644
> +index 2b21667..786e002 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
> +@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
>           CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
>       fi
>
> @@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
>  -       [MONOTONIC_CLOCK="cross compiling"])
>  +]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
>
> -     LIBS="$LIBS_SAVE"
> -     CPPFLAGS="$CPPFLAGS_SAVE"
> ---
> -2.1.4
> -
> +     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
> +         AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
> index c680cf9..620eb7b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.0.bb
> @@ -6,8 +6,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
>              file://0003-Remove-check-for-useSIGIO-option.patch \
>              file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>              "
> -SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
> -SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
> +SRC_URI[md5sum] = "c1ca1ea0a905ea788da03c77cc38b06e"
> +SRC_URI[sha256sum] = "9d967d185f05709274ee0c4f861a4672463986e550ca05725ce27974f550d3e6"
>
>  # These extensions are now integrated into the server, so declare the migration
>  # path for in-place upgrades.
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

