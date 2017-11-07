Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4A4871C1F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 04:39:06 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id a8so9438969pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 20:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ffhU9wIOmp1m5it/A+fz1UGwQULic4YObiWnudydjAs=;
	b=Pe09bKyX+4i9d+DiJUC9YNxqqkVh/rMXmG6ls6cnR4jzvYsGQiVq5G4pNHzMIyN53B
	B1ZXo6EkeBrJwgmZ3GFgxPIvextRjI+mScdMVQWNvY78PoMugqGhtV36RZYxfmlpgZPO
	vm2N3FYqF6q1oCth4dWut1WFovXb8Q6ZK8U0bxlvMedvJAWS8I3A40hFYABMFEQ2w8je
	8gmI1gta1M3kV/44gM9LFRckTRM+7+q/rnwkZBEeUbLCkcMfqKecTnl5eOL2VFFAG+MU
	lvC6Ah3wBgRKnT5mpt7bwFLkt9WPaFIL58TxoPxKizHyJxDBwoDB6b0gM7g8aWoeEMUF
	pF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ffhU9wIOmp1m5it/A+fz1UGwQULic4YObiWnudydjAs=;
	b=kCDqGmlfhlhfhcOy51MbbXyde1aHyTK5YF2EETFWu/n9bwIYMM7/tMGfYlfa62u1nr
	rus+KV9vZireuEQ2IphMpN4PQF8h38tDzQK+lUfJggfwVhBM5Ihx0juqmKsGk7MihQEu
	tBmWh9+NCFXr/TiYzlV5E8W4dGPlAYSn7s2kGsIVvB77RbD+E+EXWm4ZcArlAvASo44A
	s3sIxsunr75FcY+PV9isQdkEjCSS+arnuRXQejsddpcX2gM+7e/NVjM8n9UTBYXG5jrx
	iBO/cSMGoZHoq+OJRVF49z4n1puYUwjy2cvy2fVHBKAT9uxgjJAYTe12v7Rl8UQq65ey
	kbJA==
X-Gm-Message-State: AMCzsaWyt0rZGou9rgcZR1oKFYgPCZlLPPep9zzY3mMJy5/OQ3X7Lzkv
	W6EkJZDhYSUzyZ94XQawuHhbVbnAZLB/zTvUDdA=
X-Google-Smtp-Source: ABhQp+SCXgoARp4vmxxmGYYTkib0IXVWXLzxxqYFPdP0ev4L6MyeOuna+bWO9+96B3h1EqDYyQwVGTueGXQlYpXPKNY=
X-Received: by 10.84.151.70 with SMTP id i64mr16775922pli.114.1510029547768;
	Mon, 06 Nov 2017 20:39:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 6 Nov 2017 20:38:37 -0800 (PST)
In-Reply-To: <20171107001706.10052-1-alistair.francis@xilinx.com>
References: <20171107001706.10052-1-alistair.francis@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Nov 2017 20:38:37 -0800
Message-ID: <CAMKF1srKvykFWr7Y-TJ+HmVEnbkXGbgHcm3+DS3oMCpbff-A_Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to glib 2.53.7
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
X-List-Received-Date: Tue, 07 Nov 2017 04:39:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 6, 2017 at 4:17 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update to Glib version 2.53.7.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  ...evert-meson-Substitute-the-Python-shebang.patch | 54 ++++++++++++++++++++++
>  .../glib-2.0/glib-2.0/configure-libtool.patch      | 34 +++-----------
>  .../{glib-2.0_2.52.3.bb => glib-2.0_2.53.7.bb}     |  6 +--
>  meta/recipes-core/glib-2.0/glib.inc                |  8 ++--
>  4 files changed, 67 insertions(+), 35 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.3.bb => glib-2.0_2.53.7.bb} (76%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
> new file mode 100644
> index 0000000000..979247cbba
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
> @@ -0,0 +1,54 @@
> +From be007b2e6fbe93904e36ccddc707f96b30ad8300 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Mon, 6 Nov 2017 15:23:16 -0800
> +Subject: [PATCH] Partially Revert: meson: Substitute the Python shebang
> +
> +Partially revert this patch:
> +commit 0f18a2ebda4ec0440ec545542f9fc2f60cd54c5d
> +Author: Emmanuele Bassi <ebassi@gnome.org>
> +Date:   Fri Jul 14 20:43:19 2017 +0100
> +
> +    meson: Substitute the Python shebang
> +
> +    Just like we do with Autotools. This allows building glib-mkenums and
> +    glib-genmarshal on older platforms that only have Python 2.
> +
> +The above patch stops using the hardcoded python3 enviroment to run
> +Python scripts and instead uses the PYTHON variable used from configure.
> +
> +This patch casues QA issues when building Glib and results in the env
> +string being too long (resulting in clipping) which results in build
> +failures.
> +
> +As we always have Python 3 we don't need a workaround for Python 2.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + gobject/glib-genmarshal.in | 2 +-
> + gobject/glib-mkenums.in    | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
> +index ed6de0ae8..ec30410bd 100755
> +--- a/gobject/glib-genmarshal.in
> ++++ b/gobject/glib-genmarshal.in
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env @PYTHON@
> ++#!/usr/bin/env python3
> +
> + # pylint: disable=too-many-lines, missing-docstring, invalid-name
> +
> +diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
> +index d4bfd11c3..051fce4ca 100755
> +--- a/gobject/glib-mkenums.in
> ++++ b/gobject/glib-mkenums.in
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env @PYTHON@
> ++#!/usr/bin/env python3
> +
> + # If the code below looks horrible and unpythonic, do not panic.
> + #
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> index aa5de27d12..d759ea1d7f 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> @@ -14,28 +14,20 @@ from PATH though
>  Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
>  Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
>  Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
> +Rebased to glib-2.53.4+ by Alistair Francis <alistair.francis@xilinx.com>
>
>  Upstream-Status: Inappropriate [configuration]
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
> - configure.ac | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 1af90c5..f6b7a73 100644
> +index f322edfea..7cf86c2fa 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1378,7 +1378,7 @@ if test x"$glib_native_win32" = xyes; then
> -   G_MODULE_LDFLAGS=
> - else
> -   export SED
> --  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
> -+  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
> - fi
> - dnl G_MODULE_IMPL= don't reset, so cmd-line can override
> - G_MODULE_NEED_USCORE=0
> -@@ -1427,13 +1427,13 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
> +@@ -1428,9 +1428,9 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
>         LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
>   dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
>         echo "void glib_plugin_test(void) { }" > plugin.c
> @@ -47,20 +39,6 @@ index 1af90c5..f6b7a73 100644
>                 ${LDFLAGS} -module -o plugin.la -export-dynamic \
>                 -shrext ".o" -avoid-version plugin.lo \
>                 -rpath /dont/care >/dev/null 2>&1
> --      eval `./libtool --config | grep ^objdir`
> -+      eval `./$host_alias-libtool --config | grep ^objdir`
> -       AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
> -               glib_cv_rtldglobal_broken,[
> -               AC_TRY_RUN([
> -@@ -1506,7 +1506,7 @@ fi
> -
> - AC_MSG_CHECKING(for the suffix of module shared libraries)
> - export SED
> --shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
> -+shrext_cmds=`./$host_alias-libtool --config | grep '^shrext_cmds='`
> - eval $shrext_cmds
> - module=yes eval std_shrext=$shrext_cmds
> - # chop the initial dot
>  --
> -1.9.1
> +2.11.0
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
> similarity index 76%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
> index b1fe600992..c3807a23ab 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
> @@ -10,14 +10,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://ptest-paths.patch \
>             file://uclibc_musl_translation.patch \
>             file://allow-run-media-sdX-drive-mount-if-username-root.patch \
> -           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
>             file://Enable-more-tests-while-cross-compiling.patch \
>             file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
>             file://0001-Do-not-ignore-return-value-of-write.patch \
>             file://0001-Test-for-pthread_getname_np-before-using-it.patch \
> +           file://0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
>
> -SRC_URI[md5sum] = "89265d0289a436e99cad54491eb21ef4"
> -SRC_URI[sha256sum] = "25ee7635a7c0fcd4ec91cbc3ae07c7f8f5ce621d8183511f414ded09e7e4e128"
> +SRC_URI[md5sum] = "fad7444e5c03c9bd174140fdd5c460f8"
> +SRC_URI[sha256sum] = "028efbf6df4d88d7725314456524b923169f4d4f8503347194b2baf2222f3e33"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 8434b7dae3..48d3dc5b43 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -5,10 +5,10 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
>  # pcre is under BSD;
>  # docs/reference/COPYING is with a 'public domai'-like license!
>  LICENSE = "LGPLv2+ & BSD & PD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> -                    file://glib/glib.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
> -                    file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> -                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> +                    file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
> +                    file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
> +                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
>                      file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
>

what changed here ?

file://glib/pcre/pcre.h;beginline=11;endline=35;md5=de27f2bf633d20a2b7af0b1983423283
\
>                      file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

