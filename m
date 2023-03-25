Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF71C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 18:36:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.28076.1679769371389878555
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 11:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SGbCEl8x;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id br6so6264352lfb.11
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 11:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679769369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OE+FYqVOmzedNltpT5H50P+fwdCnbEbPOP6Pgq1WFCs=;
        b=SGbCEl8xZ3WEbCNG9aJ0p2zPg5Nuz7L3cHBL4zm4OV0BLJ/ekaMgEFhO0zGb+7xWku
         dngTlv5q6vpGsOHF3wmQ5+j9c0Prvm1MfERZ7yTwDGXyv+xCR7kpDIdiFANtmjecSsiB
         jeXIFaf2QJdQvzau68Einu13OxC4hZY6f25royDoyVsLJYSVgIdkSthQirUsmspRB+BH
         6ZUIQPMCJCVg02vCfmXgVcOVu6tG0CjLVnRajqyKDKZnb70tmW0UMY7aLW8UbVhgGHFD
         H1x6tGCGTJQ8aRW+WaAKQvVFSYTxnxwTEdWeDe4PdmhIzmGTpEqjM5sPjrRb5hMgLEgr
         ihxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679769369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE+FYqVOmzedNltpT5H50P+fwdCnbEbPOP6Pgq1WFCs=;
        b=QDAEQmZGc7qY1CJ+evWGB8JDO6PdxV7wJpfmlEo/l5ijUzrBD4wdhr/vXoXoskuagZ
         ZVODdrWHOL5w/SR5n5cNiduhxAWY3iBM3IRkKDzO0TgPun8wTz4s8loL+nFEl/j6dune
         al27MN0wSD9gYgmkUau7YTtoNMjz0HAwK9nXpp9kKUMaQg4EcQy0KX2v6I8Qj29cURU1
         /5mRTPNC4ujEiPbPhA8wU3POwKMtK93VpTm4KKMOWA08XVZ7QE4qszMAO/yvyON7BePx
         pshYuP5XlXoBLB7xHr8a+fIuBY/xJHTwNK+mOkL9P+XRbYkyC8oV4p/GOdP+WSu9y3CI
         OL5g==
X-Gm-Message-State: AAQBX9cnLAq7gBM6bOu/K75bMNqvLFATPvsPM170I39TbnHhI0qwQJYQ
	8R6eNRjK/1qEKTPAfZBLG5YoKovda8KaMEhPl2k=
X-Google-Smtp-Source: AKy350YUXVTyOPOBhgAj7v3eOeFBYx71/XMvf/dZSvYXehdqUcv/GKY93Lj9VrFcw/mMmsSSkdqL0yD507L3Rfwc1V4=
X-Received: by 2002:ac2:4a9d:0:b0:4e8:9988:f8ab with SMTP id
 l29-20020ac24a9d000000b004e89988f8abmr1854172lfp.11.1679769369217; Sat, 25
 Mar 2023 11:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230325004818.2784943-1-f_l_k@t-online.de> <20230325004818.2784943-7-f_l_k@t-online.de>
In-Reply-To: <20230325004818.2784943-7-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Mar 2023 19:35:57 +0100
Message-ID: <CANNYZj-RdghFdcmNa=NeA1tqxe1SkcgbsN3d2H18y54MrOzyVw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 7/7] webkitgtk: update 2.38.5 -> 2.40.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 18:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179100

Can you please name the gtk3 variant webkitgtk-3? I don't like
carrying those version suffixes when the older version is going to
have a short phaseout period.

Alex

On Sat, 25 Mar 2023 at 01:50, Markus Volk <f_l_k@t-online.de> wrote:
>
> - added PACKAGECONFIGs for av1 support, gamepad and sandboxing
> - cmake tries to find where bwrap and xdg-dbus-proxy are located on target and reads the path from
>   ${STAGING_BINDIR_NATIVE}. This breaks reproducibility and runtime. Fix by adding the needed paths manually.
> - ccache seems to be working well now. Enable by default. It significantly improves buildtime on rebuilds.
> - webkitgtk can be built with both, gtk+3 and gtk4 but it cant be built with support for both at once.
>   there are still some packages that require the gtk3 variant, nameably surf, gnome-online-accounts and wxwidgets
>   while ephiphany for example has a hard dependency on webkitgtk built with gtk4. This is why we need to provide
>   recipes for both variants. If built with gtk+3 webkitgtk provides the 4.0 api, if built with gtk4 it'll provide the
>   6.0 api. The only conflicting file between those two is the WebKitWebDriver binary. This was renamed for the gtk3
>   variant so both variants can be installed into the same image.
> - update dependencies
> - wpebackend-fdo: update
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...spection.cmake-prefix-variables-obta.patch |   0
>  .../reproducibility.patch                     |   0
>  .../recipes-sato/webkit/webkitgtk-4_2.40.0.bb | 168 ++++++++++
>  ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ------------------
>  ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 --
>  ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.0.bb} |  67 ++--
>  ...fdo_1.14.0.bb => wpebackend-fdo_1.14.1.bb} |   2 +-
>  7 files changed, 201 insertions(+), 362 deletions(-)
>  rename meta/recipes-sato/webkit/{webkitgtk => files}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch (100%)
>  rename meta/recipes-sato/webkit/{webkitgtk => files}/reproducibility.patch (100%)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk-4_2.40.0.bb
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.0.bb} (77%)
>  rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.1.bb} (90%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> rename to meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/files/reproducibility.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> rename to meta/recipes-sato/webkit/files/reproducibility.patch
> diff --git a/meta/recipes-sato/webkit/webkitgtk-4_2.40.0.bb b/meta/recipes-sato/webkit/webkitgtk-4_2.40.0.bb
> new file mode 100644
> index 0000000000..5e00cc9640
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk-4_2.40.0.bb
> @@ -0,0 +1,168 @@
> +SUMMARY = "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE = "https://www.webkitgtk.org/"
> +BUGTRACKER = "https://bugs.webkit.org/"
> +
> +LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
> +                    file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
> +                    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
> +                    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
> +                    "
> +
> +SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
> +           file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
> +           file://reproducibility.patch \
> +           "
> +SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
> +
> +S = "${WORKDIR}/webkitgtk-${PV}"
> +
> +inherit ccache cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen mime-xdg
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +
> +CVE_PRODUCT = "webkitgtk webkitgtk\+"
> +
> +DEPENDS += " \
> +          atk \
> +          cairo \
> +          gperf-native \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          gstreamer1.0-plugins-bad \
> +          ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \
> +          gtk+3 \
> +          harfbuzz \
> +          jpeg \
> +          libnotify \
> +          libsoup \
> +          libtasn1 \
> +          libwebp \
> +          libxslt \
> +          ruby-native \
> +          unifdef-native \
> +          "
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 opengl', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'webgl gles2', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \
> +                   enchant \
> +                   libsecret \
> +                  "
> +
> +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland wayland-native libwpe wpebackend-fdo"
> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_EGL=ON,-DUSE_ANGLE_EGL=OFF,virtual/egl"
> +PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,bubblewrap-native libseccomp xdg-dbus-proxy-native,bubblewrap xdg-dbus-proxy"
> +PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[libavif] = "-DUSE_AVIF=ON,-DUSE_AVIF=OFF,libavif"
> +PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
> +PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
> +PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
> +PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
> +PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
> +PACKAGECONFIG[opengl] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF,virtual/egl libepoxy"
> +PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
> +PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
> +PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
> +PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
> +PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
> +PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> +PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
> +
> +# webkitgtk is full of /usr/bin/env python, particular for generating docs
> +do_configure[postfuncs] += "setup_python_link"
> +setup_python_link() {
> +       if [ ! -e ${STAGING_BINDIR_NATIVE}/python ]; then
> +               ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
> +       fi
> +}
> +
> +EXTRA_OECMAKE = " \
> +               -DENABLE_2022_GLIB_API=OFF \
> +               -DPORT=GTK \
> +               -DUSE_GTK4=OFF \
> +               -DUSE_XDGMIME=ON \
> +               -DBWRAP_EXECUTABLE=${bindir}/bwrap \
> +               -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy \
> +               ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> +               ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> +               -DENABLE_MINIBROWSER=ON \
> +                -DPYTHON_EXECUTABLE=`which python3` \
> +               "
> +
> +# Javascript JIT is not supported on ARC
> +EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
> +# By default 25-bit "medium" calls are used on ARC
> +# which is not enough for binaries larger than 32 MiB
> +CFLAGS:append:arc = " -mlong-calls"
> +CXXFLAGS:append:arc = " -mlong-calls"
> +
> +# Needed for non-mesa graphics stacks when x11 is disabled
> +CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
> +
> +# Javascript JIT is not supported on powerpc
> +EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
> +
> +# ARM JIT code does not build on ARMv4/5/6 anymore
> +EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
> +
> +EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
> +EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
> +
> +# JIT and gold linker does not work on RISCV
> +EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
> +EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
> +
> +# JIT not supported on X32
> +# An attempt was made to upstream JIT support for x32 in
> +# https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
> +# unresolved due to limited X32 adoption.
> +EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
> +
> +SECURITY_CFLAGS:remove:aarch64 = "-fpie"
> +SECURITY_CFLAGS:append:aarch64 = " -fPIE"
> +
> +FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle"
> +
> +RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20370/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
> +# https://bugs.webkit.org/show_bug.cgi?id=159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
> +ARM_INSTRUCTION_SET:armv7a = "thumb"
> +ARM_INSTRUCTION_SET:armv7r = "thumb"
> +ARM_INSTRUCTION_SET:armv7ve = "thumb"
> +
> +# introspection inside qemu-arm hangs forever on musl/arm builds
> +# therefore disable GI_DATA
> +GI_DATA_ENABLED:libc-musl:armv7a = "False"
> +GI_DATA_ENABLED:libc-musl:armv7ve = "False"
> +
> +PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
> +src_package_preprocess () {
> +        # Trim build paths from comments in generated sources to ensure reproducibility
> +        sed -i -e "s,${WORKDIR},,g" \
> +            ${B}/JavaScriptCore/DerivedSources/*.h \
> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.h
> +}
> +
> +do_install:append() {
> +       # webkitwebdriver conflicts between webkitgtk and webkitgtk-4 ... move
> +       mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebDriver-4
> +}
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> deleted file mode 100644
> index 32f92f7ff5..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> +++ /dev/null
> @@ -1,296 +0,0 @@
> -From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Thu, 2 Jun 2022 11:19:06 +0300
> -Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
> - path seems unused https://bugs.webkit.org/show_bug.cgi?id=241182
> -
> -Reviewed by NOBODY (OOPS!).
> -
> -Move the NEON fast path for the SVG lighting filter effects into
> -FELightingSoftwareApplier, and arrange to actually use them by
> -forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> -
> -Some changes were needed to adapt platformApplyNeon() to the current
> -state of filters after r286140. This was not detected because the code
> -bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
> -not get used much these days: CPU(ARM_THUMB2) is more common. It should
> -be possible to use the NEON fast paths also in Thumb mode, but that is
> -left for a follow-up fix.
> -
> -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> -(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> -(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> -(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> -(WebCore::FELighting::getPowerCoefficients): Deleted.
> -* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> -(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> -(WebCore::FELighting::platformApplyNeon): Deleted.
> -* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> -* Source/WebCore/platform/graphics/filters/FELighting.h:
> -* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> -* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> -* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> ----
> -Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> - .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
> - .../graphics/filters/DistantLightSource.h     |  4 ++
> - .../platform/graphics/filters/FELighting.h    |  7 ---
> - .../graphics/filters/PointLightSource.h       |  4 ++
> - .../graphics/filters/SpotLightSource.h        |  4 ++
> - .../software/FELightingSoftwareApplier.h      | 16 ++++++
> - 7 files changed, 57 insertions(+), 36 deletions(-)
> -
> ---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> -@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> -     return s_FELightingConstantsForNeon;
> - }
> -
> --void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> -+void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> - {
> -     neonDrawLighting(parameters);
> - }
> -@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> -     "b .lightStrengthCalculated" NL
> - ); // NOLINT
> -
> --int FELighting::getPowerCoefficients(float exponent)
> -+int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> - {
> -     // Calling a powf function from the assembly code would require to save
> -     // and reload a lot of NEON registers. Since the base is in range [0..1]
> ---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> -@@ -24,14 +24,15 @@
> -  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -  */
> -
> --#ifndef FELightingNEON_h
> --#define FELightingNEON_h
> -+#pragma once
> -
> - #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> -
> --#include "FELighting.h"
> -+#include "FELightingSoftwareApplier.h"
> -+#include "ImageBuffer.h"
> - #include "PointLightSource.h"
> - #include "SpotLightSource.h"
> -+#include <wtf/ObjectIdentifier.h>
> - #include <wtf/ParallelJobs.h>
> -
> - namespace WebCore {
> -@@ -93,14 +94,14 @@ extern "C" {
> - void neonDrawLighting(FELightingPaintingDataForNeon*);
> - }
> -
> --inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
> -+inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
> - {
> --    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> --    FELightingPaintingDataForNeon neonData = {
> -+    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
> -+    WebCore::FELightingPaintingDataForNeon neonData = {
> -         data.pixels->data(),
> -         1,
> --        data.widthDecreasedByOne - 1,
> --        data.heightDecreasedByOne - 1,
> -+        data.width - 2,
> -+        data.height - 2,
> -         0,
> -         0,
> -         0,
> -@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
> -     // Set light source arguments.
> -     floatArguments.constOne = 1;
> -
> --    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -+    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> -
> -     floatArguments.colorRed = color.red;
> -     floatArguments.colorGreen = color.green;
> -     floatArguments.colorBlue = color.blue;
> -     floatArguments.padding4 = 0;
> -
> --    if (m_lightSource->type() == LS_POINT) {
> -+    if (data.lightSource->type() == LS_POINT) {
> -         neonData.flags |= FLAG_POINT_LIGHT;
> --        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
> -+        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
> -         floatArguments.lightX = pointLightSource.position().x();
> -         floatArguments.lightY = pointLightSource.position().y();
> -         floatArguments.lightZ = pointLightSource.position().z();
> -         floatArguments.padding2 = 0;
> --    } else if (m_lightSource->type() == LS_SPOT) {
> -+    } else if (data.lightSource->type() == LS_SPOT) {
> -         neonData.flags |= FLAG_SPOT_LIGHT;
> --        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
> -+        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
> -         floatArguments.lightX = spotLightSource.position().x();
> -         floatArguments.lightY = spotLightSource.position().y();
> -         floatArguments.lightZ = spotLightSource.position().z();
> -@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
> -         if (spotLightSource.specularExponent() == 1)
> -             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> -     } else {
> --        ASSERT(m_lightSource->type() == LS_DISTANT);
> -+        ASSERT(data.lightSource->type() == LS_DISTANT);
> -         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
> -         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
> -         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
> -@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
> -     // Set lighting arguments.
> -     floatArguments.surfaceScale = data.surfaceScale;
> -     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
> --    if (m_lightingType == FELighting::DiffuseLighting)
> --        floatArguments.diffuseConstant = m_diffuseConstant;
> -+    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> -+        floatArguments.diffuseConstant = data.diffuseConstant;
> -     else {
> -         neonData.flags |= FLAG_SPECULAR_LIGHT;
> --        floatArguments.diffuseConstant = m_specularConstant;
> --        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
> --        if (m_specularExponent == 1)
> -+        floatArguments.diffuseConstant = data.specularConstant;
> -+        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
> -+        if (data.specularExponent == 1)
> -             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> -     }
> -     if (floatArguments.diffuseConstant == 1)
> -         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> -
> --    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> -+    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
> -+    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
> -     if (optimalThreadNumber > 1) {
> -         // Initialize parallel jobs
> --        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
> -+        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
> -
> -         // Fill the parameter array
> -         int job = parallelJobs.numberOfJobs();
> -         if (job > 1) {
> -             int yStart = 1;
> --            int yStep = (data.heightDecreasedByOne - 1) / job;
> -+            int yStep = (data.height - 2) / job;
> -             for (--job; job >= 0; --job) {
> -                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
> -                 params = neonData;
> -                 params.yStart = yStart;
> --                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
> -+                params.pixels += (yStart - 1) * data.width * 4;
> -                 if (job > 0) {
> -                     params.absoluteHeight = yStep;
> -                     yStart += yStep;
> -                 } else
> --                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
> -+                    params.absoluteHeight = (data.height - 1) - yStart;
> -             }
> -             parallelJobs.execute();
> -             return;
> -@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
> - } // namespace WebCore
> -
> - #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> --
> --#endif // FELightingNEON_h
> ---- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> -@@ -25,6 +25,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class DistantLightSource : public LightSource {
> ---- a/Source/WebCore/platform/graphics/filters/FELighting.h
> -+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> -@@ -35,8 +35,6 @@
> -
> - namespace WebCore {
> -
> --struct FELightingPaintingDataForNeon;
> --
> - class FELighting : public FilterEffect {
> - public:
> -     const Color& lightingColor() const { return m_lightingColor; }
> -@@ -67,11 +65,6 @@ protected:
> -
> -     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
> -
> --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> --    static int getPowerCoefficients(float exponent);
> --    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
> --#endif
> --
> -     Color m_lightingColor;
> -     float m_surfaceScale;
> -     float m_diffuseConstant;
> ---- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class PointLightSource : public LightSource {
> ---- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -+++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> -@@ -26,6 +26,10 @@
> - #include "LightSource.h"
> - #include <wtf/Ref.h>
> -
> -+namespace WTF {
> -+class TextStream;
> -+} // namespace WTF
> -+
> - namespace WebCore {
> -
> - class SpotLightSource : public LightSource {
> ---- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -+++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> -@@ -36,6 +36,7 @@
> - namespace WebCore {
> -
> - class FELighting;
> -+struct FELightingPaintingDataForNeon;
> -
> - class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
> -     WTF_MAKE_FAST_ALLOCATED;
> -@@ -132,8 +133,23 @@ private:
> -
> -     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
> -     static void applyPlatformGenericWorker(ApplyParameters*);
> -+
> -+#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> -+    static int getPowerCoefficients(float exponent);
> -+    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> -+    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
> -+
> -+    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
> -+    {
> -+        applyPlatformNeon(data, paintingData);
> -+    }
> -+#else
> -     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
> -+#endif
> -+
> -     static void applyPlatform(const LightingData&);
> - };
> -
> - } // namespace WebCore
> -+
> -+#include "FELightingNEON.h"
> diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
> deleted file mode 100644
> index 1ff9dcea7e..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
> -From: Michael Catanzaro <mcatanzaro@redhat.com>
> -Date: Mon, 16 Jan 2023 16:55:26 -0800
> -Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include in
> - ANGLE https://bugs.webkit.org/show_bug.cgi?id=250689
> -
> -Unreviewed build fix.
> -
> -* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
> -
> -Canonical link: https://commits.webkit.org/258968@main
> -
> -Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=250689]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -index 94cb93e01fc0..ec7bda372f30 100644
> ---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
> -@@ -12,6 +12,7 @@
> -
> - #include <algorithm>
> - #include <array>
> -+#include <cstdint>
> - #include <string>
> - #include <vector>
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
> similarity index 77%
> rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
> index e52920883a..84a5981ba0 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
> @@ -12,62 +12,62 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
>  SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
>             file://reproducibility.patch \
> -           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> -           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
>             "
> -SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
> +SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
>
> -inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
> +inherit cmake ccache pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen mime-xdg
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
>
>  CVE_PRODUCT = "webkitgtk webkitgtk\+"
>
>  DEPENDS += " \
> -          ruby-native \
> -          gperf-native \
> +          atk \
>            cairo \
> +          gperf-native \
> +          gstreamer1.0 \
> +          gstreamer1.0-plugins-base \
> +          gstreamer1.0-plugins-bad \
> +          ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'gstreamer1.0-libav', '', d)} \
>            harfbuzz \
>            jpeg \
> -          atk \
> +          libnotify \
> +          libsoup \
> +          libtasn1 \
>            libwebp \
> -          gtk+3 \
>            libxslt \
> -          libtasn1 \
> -          libnotify \
> -          gstreamer1.0 \
> -          gstreamer1.0-plugins-base \
> +          ruby-native \
> +          unifdef-native \
>            "
>
> -PACKAGECONFIG_SOUP ?= "soup3"
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 opengl', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'webgl gles2', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'journald', '', d)} \
> +                   gtk4 \
>                     enchant \
>                     libsecret \
> -                   ${PACKAGECONFIG_SOUP} \
>                    "
>
> -PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
> -PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
> +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland wayland-native libwpe wpebackend-fdo"
> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_EGL=ON,-DUSE_ANGLE_EGL=OFF,virtual/egl"
> +PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,bubblewrap-native libseccomp xdg-dbus-proxy-native,bubblewrap xdg-dbus-proxy"
>  PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
> +PACKAGECONFIG[libavif] = "-DUSE_AVIF=ON,-DUSE_AVIF=OFF,libavif"
> +PACKAGECONFIG[gtk4] = "-DUSE_GTK4=ON,-DUSE_GTK4=OFF,gtk4"
> +PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
>  PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>  PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
>  PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
>  PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
> -PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
> -PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
> +PACKAGECONFIG[opengl] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF,virtual/egl libepoxy"
>  PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
>  PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
>  PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
>  PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
> -PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
>  PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
>  PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> -PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
> -PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
>  PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
>
>  # webkitgtk is full of /usr/bin/env python, particular for generating docs
> @@ -79,13 +79,15 @@ setup_python_link() {
>  }
>
>  EXTRA_OECMAKE = " \
> +               -DENABLE_2022_GLIB_API=ON \
>                 -DPORT=GTK \
> +               -DUSE_XDGMIME=ON \
> +               -DBWRAP_EXECUTABLE=${bindir}/bwrap \
> +               -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy \
>                 ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>                 ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
>                 -DENABLE_MINIBROWSER=ON \
>                  -DPYTHON_EXECUTABLE=`which python3` \
> -                -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
> -                -DENABLE_GAMEPAD=OFF \
>                 "
>
>  # Javascript JIT is not supported on ARC
> @@ -126,7 +128,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
>  SECURITY_CFLAGS:remove:aarch64 = "-fpie"
>  SECURITY_CFLAGS:append:aarch64 = " -fPIE"
>
> -FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES:${PN} += "${libdir}/webkitgtk-6.*/injected-bundle"
>
>  RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
>
> @@ -148,9 +150,6 @@ ARM_INSTRUCTION_SET:armv7ve = "thumb"
>  GI_DATA_ENABLED:libc-musl:armv7a = "False"
>  GI_DATA_ENABLED:libc-musl:armv7ve = "False"
>
> -# Can't be built with ccache
> -CCACHE_DISABLE = "1"
> -
>  PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
>  src_package_preprocess () {
>          # Trim build paths from comments in generated sources to ensure reproducibility
> @@ -158,8 +157,6 @@ src_package_preprocess () {
>              ${B}/JavaScriptCore/DerivedSources/*.h \
>              ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
>              ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
> -            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
> -
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
> +            ${B}/WebKitGTK/DerivedSources/webkit/*.h
>  }
> -
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
> similarity index 90%
> rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
> rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
> index 708201043b..9f2ea0b7de 100644
> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.1.bb
> @@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
>  SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
> +SRC_URI[sha256sum] = "01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50"
>
>  # Especially helps compiling with clang which enable this as error when
>  # using c++11
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179087): https://lists.openembedded.org/g/openembedded-core/message/179087
> Mute This Topic: https://lists.openembedded.org/mt/97836714/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

