Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7343FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:13:20 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.24149.1647245599626815437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQ7hBrpE;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id y4so16138961vsd.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g1s5ySKziIzHr+TOoe9HYHAvOLHyUf4CHjZm/zH5RZc=;
        b=pQ7hBrpEZilYd0lCBnHIildrzd2V0WztgdKXEYURVpy+VRg4ibFnlXpuSz/EddykhW
         trDyiCkb6EJvrMTMWl56f2iXQ/do5fwadHY8LyoXbS98HA6bffb/9/bILfWGAXxlyyjx
         y3yVomvP9Fhvr5UIAkXD0DYIlNVXlewrxsi8rDuOJd1LNWyEhhXGItX6swv3H2jGsaCY
         eq3UHateFQHQkx3WUxf5+8J2CrYMxRYKO18KcEtwO1vsz26kLVZ1PaoBubtDq0n6TZxd
         yEVWhBDZsi9Gn5KclLEyZDDlJOUezzEpsGG3RP1IA71m1mpsufqqMmN/v+DHbMTrkB4i
         xX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g1s5ySKziIzHr+TOoe9HYHAvOLHyUf4CHjZm/zH5RZc=;
        b=EU10OUji8h+pI+8w8Ta0LIF3mu1fYLrgKSxxeo3V3YnYW4DWfY/7mMNzWwVS2Suyk0
         jtOo90UgtmP1b2y6tM6o3RvwM1j9YD7qzWuRP1QUFy6oLfZdtx//uWnUKE5eRMrC5RSY
         JRd5uN2Oz6FPjsSSOtjenIqEa38I9JrDDlUZv5NyPMTQWoeSS06RClyWzTkIEer61p44
         CJWXELtfBUKSFtIt5/2bP2RPgd/EjxuzlxK3fS8zCJafyN5+qeTW5VJSQjDPdw9f+DFX
         PtQu43sO7CfgPhCE24VWYwyOqmpTsuarbDmUMgyGDxRWezTc5p2qdSJ6vQF8uZDsGmrn
         PxJQ==
X-Gm-Message-State: AOAM53065IxMSyYa/wXTrxGR69tJw1JWFDnRS+fnPmGwb1kVSgKzzk9l
	0ujcQM9k0aLp+HSKVljiImlSrqgale3CI9duEnE=
X-Google-Smtp-Source: 
 ABdhPJwZhzOBbpD2Rt7OEey7FtkPVewSPbEmdcHJDCqFJWAxZI29nJ6MX0H48nK4iEiuLGTr08tBbjGbay+taWkF/Aw=
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id
 v12-20020a05610205cc00b003209bd23823mr8938473vsf.81.1647245598641; Mon, 14
 Mar 2022 01:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220314071037.3702941-1-f_l_k@t-online.de>
In-Reply-To: <20220314071037.3702941-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Mar 2022 09:13:07 +0100
Message-ID: 
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 08:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163129

1.17.4 is not a release, it is a development snapshot.

Alex

On Mon, 14 Mar 2022 at 08:10, Markus Volk <f_l_k@t-online.de> wrote:
>
> -remove CVE-2018-19876.patch that was applied upstream
> -add backported patch to remove automagic from symbol_lookup
> -switch build system to meson
>
> https://www.cairographics.org/news/cairo-1.17.4/
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...patch-to-make-symbol-lookup-optional.patch | 58 +++++++++++
>  .../cairo/cairo/CVE-2018-19876.patch          | 34 -------
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb   | 99 -------------------
>  meta/recipes-graphics/cairo/cairo_1.17.4.bb   | 88 +++++++++++++++++
>  4 files changed, 146 insertions(+), 133 deletions(-)
>  create mode 100644 meta/recipes-graphics/cairo/cairo/0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch
>  delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
>  delete mode 100644 meta/recipes-graphics/cairo/cairo_1.16.0.bb
>  create mode 100644 meta/recipes-graphics/cairo/cairo_1.17.4.bb
>
> diff --git a/meta/recipes-graphics/cairo/cairo/0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch b/meta/recipes-graphics/cairo/cairo/0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch
> new file mode 100644
> index 0000000000..e118d2c84a
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo/0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch
> @@ -0,0 +1,58 @@
> +From 623e718303202f92180fcfac47c38f1989c256b8 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sun, 13 Mar 2022 19:16:29 +0100
> +Subject: [PATCH] cairo: backport patch to make symbol-lookup optional
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson.build       | 16 ++++++++--------
> + meson_options.txt |  4 ++++
> + 2 files changed, 12 insertions(+), 8 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b159b4071..fbd9e670b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -657,14 +657,14 @@ if zlib_dep.found() and png_dep.found()
> +   }]
> + endif
> +
> +-# Untested, libiberty.h is in a libiberty subfolder for me
> +-# FIXME: automagic
> +-bfd_dep = cc.find_library('bfd', required: false)
> +-if bfd_dep.found() and cc.has_function('bfd_openr', dependencies: [bfd_dep])
> +-  if cc.has_header('libiberty.h')
> +-    conf.set('HAVE_BFD', 1)
> +-    deps += [bfd_dep]
> +-  endif
> ++bfd_dep = cc.find_library('bfd', has_headers: ['bfd.h'], required: get_option('symbol-lookup'))
> ++if bfd_dep.found() and \
> ++   cc.has_function('bfd_openr', dependencies: [bfd_dep]) and \
> ++   cc.links(files('meson-cc-tests/bfd-section-flags.c'), name: 'bfd_section_flags', dependencies: bfd_dep)
> ++  conf.set('HAVE_BFD', 1)
> ++  deps += [bfd_dep]
> ++elif get_option('symbol-lookup').enabled()
> ++  error('symbol lookup via bfd was enabled via options but is not available (bfd might be too old)')
> + endif
> +
> + # Untested, see above
> +diff --git a/meson_options.txt b/meson_options.txt
> +index ff11fe7ed..46e48b12e 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -23,6 +23,10 @@ option('zlib', type : 'feature', value : 'auto') # script, ps, pdf, xml surfaces
> + # Tests
> + option('tests', type : 'feature', value : 'auto')
> +
> ++#Symbol lookup
> ++option('symbol-lookup', type: 'feature', value : 'auto',
> ++       description: 'Symbol lookup in debug utils via binutils/bfd')
> ++
> + # Util deps
> + option('gtk2-utils', type : 'feature', value : 'disabled')
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> deleted file mode 100644
> index 4252a5663b..0000000000
> --- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -CVE: CVE-2018-19876
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
> -From: Carlos Garcia Campos <cgarcia@igalia.com>
> -Date: Mon, 19 Nov 2018 12:33:07 +0100
> -Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
> - cairo_ft_apply_variations
> -
> -Fixes a crash when using freetype >= 2.9
> ----
> - src/cairo-ft-font.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
> -index 325dd61b4..981973f78 100644
> ---- a/src/cairo-ft-font.c
> -+++ b/src/cairo-ft-font.c
> -@@ -2393,7 +2393,11 @@ skip:
> - done:
> -         free (coords);
> -         free (current_coords);
> -+#if HAVE_FT_DONE_MM_VAR
> -+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
> -+#else
> -         free (ft_mm_var);
> -+#endif
> -     }
> - }
> -
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> deleted file mode 100644
> index 0b5d1d548f..0000000000
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -SUMMARY = "The Cairo 2D vector graphics library"
> -DESCRIPTION = "Cairo is a multi-platform library providing anti-aliased \
> -vector-based rendering for multiple target backends. Paths consist \
> -of line segments and cubic splines and can be rendered at any width \
> -with various join and cap styles. All colors may be specified with \
> -optional translucence (opacity/alpha) and combined using the \
> -extended Porter/Duff compositing algebra as found in the X Render \
> -Extension."
> -HOMEPAGE = "http://cairographics.org"
> -BUGTRACKER = "http://bugs.freedesktop.org"
> -SECTION = "libs"
> -
> -LICENSE = "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
> -LICENSE:${PN} = "MPL-1.1 | LGPL-2.1-only"
> -LICENSE:${PN}-dev = "MPL-1.1 | LGPL-2.1-only"
> -LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
> -LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
> -LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
> -LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
> -
> -DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
> -
> -SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> -           file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
> -           file://CVE-2018-19876.patch \
> -           file://CVE-2019-6461.patch \
> -           file://CVE-2019-6462.patch \
> -           file://CVE-2020-35492.patch \
> -          "
> -
> -SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
> -SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
> -
> -inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
> -
> -MULTILIB_SCRIPTS = "${PN}-perf-utils:${bindir}/cairo-trace"
> -
> -X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
> -                   trace"
> -PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> -PACKAGECONFIG:class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> -
> -PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
> -PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> -PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
> -PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
> -PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
> -PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
> -PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> -PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
> -
> -EXTRA_OECONF += " \
> -    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
> -    --enable-tee \
> -"
> -
> -# We don't depend on binutils so we need to disable this
> -export ac_cv_lib_bfd_bfd_openr="no"
> -# Ensure we don't depend on LZO
> -export ac_cv_lib_lzo2_lzo2a_decompress="no"
> -
> -do_install:append () {
> -       rm -rf ${D}${bindir}/cairo-sphinx
> -       rm -rf ${D}${libdir}/cairo/cairo-fdr*
> -       rm -rf ${D}${libdir}/cairo/cairo-sphinx*
> -       rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
> -       rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
> -       [ ! -d ${D}${bindir} ] ||
> -               rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
> -       [ ! -d ${D}${libdir}/cairo ] ||
> -               rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
> -}
> -
> -PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> -
> -SUMMARY:cairo-gobject = "The Cairo library GObject wrapper library"
> -DESCRIPTION:cairo-gobject = "A GObject wrapper library for the Cairo API."
> -
> -SUMMARY:cairo-script-interpreter = "The Cairo library script interpreter"
> -DESCRIPTION:cairo-script-interpreter = "The Cairo script interpreter implements \
> -CairoScript.  CairoScript is used by tracing utilities to enable the ability \
> -to replay rendering."
> -
> -DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
> -
> -FILES:${PN} = "${libdir}/libcairo.so.*"
> -FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
> -FILES:${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
> -FILES:${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -UPSTREAM_CHECK_REGEX = "cairo-(?P<pver>\d+(\.\d+)+).tar.xz"
> diff --git a/meta/recipes-graphics/cairo/cairo_1.17.4.bb b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
> new file mode 100644
> index 0000000000..856b47213a
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
> @@ -0,0 +1,88 @@
> +SUMMARY = "The Cairo 2D vector graphics library"
> +DESCRIPTION = "Cairo is a multi-platform library providing anti-aliased \
> +vector-based rendering for multiple target backends. Paths consist \
> +of line segments and cubic splines and can be rendered at any width \
> +with various join and cap styles. All colors may be specified with \
> +optional translucence (opacity/alpha) and combined using the \
> +extended Porter/Duff compositing algebra as found in the X Render \
> +Extension."
> +HOMEPAGE = "http://cairographics.org"
> +BUGTRACKER = "http://bugs.freedesktop.org"
> +SECTION = "libs"
> +
> +LICENSE = "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
> +LICENSE:${PN} = "MPL-1.1 | LGPL-2.1-only"
> +LICENSE:${PN}-dev = "MPL-1.1 | LGPL-2.1-only"
> +LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
> +LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
> +LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
> +LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
> +
> +DEPENDS = "glib-2.0 pixman"
> +
> +SRC_URI = " \
> +       https://cairographics.org/snapshots/cairo-${PV}.tar.xz \
> +       file://0001-cairo-backport-patch-to-make-symbol-lookup-optional.patch \
> +       file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
> +       file://CVE-2019-6461.patch \
> +       file://CVE-2019-6462.patch \
> +       file://CVE-2020-35492.patch \
> +"
> +
> +SRC_URI[sha256sum] = "74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705"
> +
> +inherit meson pkgconfig upstream-version-is-even multilib_script
> +
> +PACKAGECONFIG ??= " \
> +       fontconfig \
> +       freetype \
> +       png \
> +       zlib \
> +       lzo \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'glesv3', '', d)} \
> +"
> +
> +PACKAGECONFIG[x11] = "-Dgl-backend=gl -Dxcb=enabled -Dxlib=enabled,-Dxcb=disabled -Dxlib=disabled,virtual/libx11 virtual/libgl libsm libxrender libxext libxcb"
> +PACKAGECONFIG[fontconfig] = ",,fontconfig"
> +PACKAGECONFIG[freetype] = ",,freetype"
> +PACKAGECONFIG[glesv2] = "-Dgl-backend=glesv2 -Dglesv2=enabled"
> +PACKAGECONFIG[glesv3] = "-Dgl-backend=glesv3 -Dglesv3=enabled"
> +PACKAGECONFIG[png] = ",,libpng"
> +PACKAGECONFIG[xml] = ",,libxml2"
> +PACKAGECONFIG[zlib] = ",,zlib"
> +PACKAGECONFIG[lzo] = ",,lzo"
> +PACKAGECONFIG[tee] = "-Dtee=enabled,-Dtee=disabled"
> +
> +EXTRA_OEMESON = "-Dtests=disabled -Dsymbol-lookup=disabled"
> +
> +do_install:append () {
> +       rm -rf ${D}${bindir}/cairo-sphinx
> +       rm -rf ${D}${libdir}/cairo/libcairo-fdr*
> +       rm -rf ${D}${libdir}/cairo/libcairo-sphinx*
> +       rm -rf ${D}${libdir}/cairo/.debug/libcairo-fdr*
> +       rm -rf ${D}${libdir}/cairo/.debug/libcairo-sphinx*
> +}
> +
> +PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> +
> +SUMMARY:cairo-gobject = "The Cairo library GObject wrapper library"
> +DESCRIPTION:cairo-gobject = "A GObject wrapper library for the Cairo API."
> +
> +SUMMARY:cairo-script-interpreter = "The Cairo library script interpreter"
> +DESCRIPTION:cairo-script-interpreter = "The Cairo script interpreter implements \
> +CairoScript.  CairoScript is used by tracing utilities to enable the ability \
> +to replay rendering."
> +
> +DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
> +
> +FILES:${PN} = "${libdir}/libcairo.so.*"
> +FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
> +FILES:${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
> +FILES:${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +UPSTREAM_CHECK_REGEX = "cairo-(?P<pver>\d+(\.\d+)+).tar.xz"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163127): https://lists.openembedded.org/g/openembedded-core/message/163127
> Mute This Topic: https://lists.openembedded.org/mt/89768457/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

