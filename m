Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2B66133B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:21:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so5284472wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G7k+KLet4ehhMBHeDW0P2Shcde00SiI0MA1cLgb5of8=;
	b=bMrZimBKa9o+myPv7x2+4oyUm4cF2yFUlH06oCR1olmjcGvqbRST71V72hLL5lt35z
	AYDZEsoJJb65plEuc9YMIKJ9sT/4/vVC2t3GwGYjImIKMHaYx/mkcL50HcESfRosEEWk
	zWz5O8i8YJsZaZS1qw4W7ss5EkBro2KSxIyEmU2Ez1bI00BHp8AlaACHYRzQ3l8vpOBs
	9Ig9qd+sxTaxu85YVf1KUabpKRonpl6U4nvBoM8cljIfr/M+nutlJIIVhvcu3dSN8t2a
	9SRAkGw0AekZlgSys9VDGpyfAw3Plf50BZu/tNzok/g0VT92QULyMWNZFMKDzPxNOOaz
	lh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G7k+KLet4ehhMBHeDW0P2Shcde00SiI0MA1cLgb5of8=;
	b=Mda7u+ckN0r87XY5Gp4BlZTTooc6ehsAuleqyXLMbX5RF1TIWtMEe/1HrgrrVJH/S7
	3apq7FIuWOtWzSJd4uPNpdkdD4yJHZGUUY7ek/FIY0zjgqQnOTNtBrepqx8fC8Wn8gxU
	4jDlUHZjR+r91Xr50A0iKGsW/VUBSbMOZbr3KH6if9E4sg7mq/iWHBxFccMEzhZ7UBKJ
	KmFePW+TtGsH2sxYWyGxvnVMhBO1IM41yu/COadK0Lmkh7ffQZvHy0+I5jZIsEfdH19v
	eVelceO9Y0QAriDoN92en6mjXIT5pYF7ByR+Y09Z4a2o/jBJ98CZIYzBP2s/23gJmSaJ
	nW3g==
X-Gm-Message-State: APjAAAUpGUyDacccE+bCLailFMlE+7rQrjWySMsY8npPTOTL8t7wYhxu
	GJ6Qt1QMqxcPaqS4pPBrsuCf1s9Vl3TL9iVXsBg=
X-Google-Smtp-Source: APXvYqwkpKBf4KXg2UwPd2/uIKoszcss45r9U1HFEpERIU+2dRBynM0FxpbkmPtd9zP7Vr68SC4ikI7W/O2pVfD56Qo=
X-Received: by 2002:a5d:6452:: with SMTP id d18mr42271834wrw.303.1582215714845;
	Thu, 20 Feb 2020 08:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-4-alex.kanavin@gmail.com>
In-Reply-To: <20200219194752.7967-4-alex.kanavin@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Feb 2020 10:21:43 -0600
Message-ID: <CAJdd5GYG+T026v5DUq1j37KBwBwSEq8Y9j56cXaYXwB1m6MFxg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] wayland: convert to meson build
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
X-List-Received-Date: Thu, 20 Feb 2020 16:21:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 1:49 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Replace an autotools-specific .pc adjustment patch with a meson-specific one.

This can (and did) break meta-mingw in the autobuilder, but I pushed
the fix to master-next of meta-mingw
(https://git.yoctoproject.org/cgit/cgit.cgi/meta-mingw/commit/?h=master-next&id=32ccf9d5089694e4a58951ca1a38452f889a27ef),
so that can be pulled in to try again

>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...hardcode-the-path-to-wayland-scanner.patch | 26 +++++++++++++++
>  ...-the-native-wayland-scanner-directly.patch | 27 ++++++++++++++++
>  .../wayland/wayland/fixpathinpcfiles.patch    | 32 -------------------
>  .../wayland/wayland_1.18.0.bb                 | 11 ++++---
>  4 files changed, 59 insertions(+), 37 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
>  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
>  delete mode 100644 meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
>
> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> new file mode 100644
> index 0000000000..2199548bdf
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> @@ -0,0 +1,26 @@
> +From cbb28635a1079d68e62dbaa1e21791a20dbbbaf4 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 17 Feb 2020 21:46:18 +0100
> +Subject: [PATCH] Do not hardcode the path to wayland-scanner
> +
> +This results in host contamination during builds.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 294aee0..7e410fa 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -49,7 +49,7 @@ pkgconfig.generate(
> +               'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> +               'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
> +               'bindir=' + join_paths('${prefix}', get_option('bindir')),
> +-              'wayland_scanner=${bindir}/wayland-scanner'
> ++              'wayland_scanner=wayland-scanner'
> +       ],
> +       filebase: 'wayland-scanner'
> + )
> diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> new file mode 100644
> index 0000000000..f98037a850
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> @@ -0,0 +1,27 @@
> +From 2582d2653ba80917d7bc47088e1a5f49530fddaa Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Sun, 16 Feb 2020 16:29:53 +0100
> +Subject: [PATCH] meson.build: find the native wayland-scanner directly in PATH
> +
> +Otherwise, meson attempts to use the target pkg-config and fails.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/meson.build | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 3e8c9bf..294aee0 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -55,8 +55,7 @@ pkgconfig.generate(
> + )
> +
> + if meson.is_cross_build()
> +-      scanner_dep = dependency('wayland-scanner', native: true, version: '>=1.14.0')
> +-      wayland_scanner_for_build = find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
> ++      wayland_scanner_for_build = find_program('wayland-scanner')
> + else
> +       wayland_scanner_for_build = wayland_scanner
> + endif
> diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> deleted file mode 100644
> index ad3526d984..0000000000
> --- a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Fix wayland-client and wayland-scanner pc files
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> -
> -Index: wayland-1.14.0/src/wayland-client.pc.in
> -===================================================================
> ---- wayland-1.14.0.orig/src/wayland-client.pc.in
> -+++ wayland-1.14.0/src/wayland-client.pc.in
> -@@ -1,7 +1,7 @@
> - prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - datarootdir=@datarootdir@
> --pkgdatadir=@datadir@/@PACKAGE@
> -+pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
> - libdir=@libdir@
> - includedir=@includedir@
> -
> -Index: wayland-1.14.0/src/wayland-scanner.pc.in
> -===================================================================
> ---- wayland-1.14.0.orig/src/wayland-scanner.pc.in
> -+++ wayland-1.14.0/src/wayland-scanner.pc.in
> -@@ -2,7 +2,7 @@ prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - datarootdir=@datarootdir@
> - pkgdatadir=@datadir@/@PACKAGE@
> --wayland_scanner=@bindir@/wayland-scanner
> -+wayland_scanner=wayland-scanner
> -
> - Name: Wayland Scanner
> - Description: Wayland scanner
> diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> index 7a3f075552..a702b3f6cc 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> @@ -13,20 +13,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
>  DEPENDS = "expat libffi wayland-native"
>
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> -           file://fixpathinpcfiles.patch \
> +           file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
> +           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
>             "
>  SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
>  SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>
> -inherit autotools pkgconfig
> +inherit meson pkgconfig
>
>  PACKAGECONFIG ??= "dtd-validation"
> -PACKAGECONFIG[dtd-validation] = "--enable-dtd-validation,--disable-dtd-validation,libxml2,,"
> +PACKAGECONFIG[dtd-validation] = "-Ddtd_validation=true,-Ddtd_validation=false,libxml2,,"
>
> -EXTRA_OECONF = "--disable-documentation --with-host-scanner"
> -EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
> +EXTRA_OEMESON = "-Ddocumentation=false"
> +EXTRA_OEMESON_class-native = "-Ddocumentation=false -Dlibraries=false"
>
>  # Wayland installs a M4 macro for other projects to use, which uses the target
>  # pkg-config to find files.  Replace pkg-config with pkg-config-native.
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

