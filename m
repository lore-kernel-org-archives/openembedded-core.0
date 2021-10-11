Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4AFC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 16:08:35 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.466.1633968514757182851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 09:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lqn7gfJp;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id bi9so2981005qkb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wk/0ZzbOc3Q004V/UkoqZZFP8GUh/vOJR4ONdbYfOMo=;
        b=lqn7gfJpqNc3CL87+UjenEQs5tBHjt3O4fmR3LAkeNlyqj8M1voaIraKFtnouECJSI
         f06t1ITLRn86MtjCKKiAWxVyIn9akaSR0b0lSr5p9/Vsmjli7+W6xE1iVJ5QrTJgCoin
         KfBZHbXVt5T++u6zHy6QLhfhfUnIdKOFRhbyDFQ00WsNxi8xFQJJ6ZKJS7XkF0zR4h80
         Y+kR0/QTPOVL5DZ0XyRu4qGOi1qF9CDxmzBQGNRC2zlZo0WPPNq+0iI+LdwsA/4j4sMB
         0wrjzaNGAoUwIIVm3B3t5kVM/faINoEVsefuHgTmYvdqPH4WM0lVDOpbYESRDf24WsSP
         IUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wk/0ZzbOc3Q004V/UkoqZZFP8GUh/vOJR4ONdbYfOMo=;
        b=i6DTlYVcw89WFNfb/VdcwuUvjXN9+FBaeJNwFAhl1yGlMXJ4H+QBLZ9d8iuYnIZSJB
         zUJ1D9dQPcILQp1sAemnoAcJZd0+MJsF3PXs6q1o/NFV53/ym7dJ00MM48+0ya5pd+2t
         eXJziAUikiyb3QxaGXHenAXrPzOYmqq6DJfpEprT/jPaYfcHWU2xwm4oDiPVx/KLSEZm
         8Gs60ZBLEXmmbgX0Z8zFPYUqvoTNjFz3XZw5kAsd/iirK0AyD5RwRPQtM5besuoSy1SE
         Fl5+LF5ty5f6DDeU6PD0HTP1hIWWowZY9r7q6NHUeWhCJQ/yOtc5GE+85UJiwt96X18t
         Yxrw==
X-Gm-Message-State: AOAM532QBEAbX/IXLrml7vh0VBDwYsCgWHRyv7DgKO+cLTT+h/RM3FXq
	n5UxGRIqggm0reSLqr1nto5EcTVIKAxiz/TlIUc=
X-Google-Smtp-Source: 
 ABdhPJxe6VIHVglcEcB97U1nQKNGzHm7udJDuGalgmO46imMAWouSzqI7Nyvj34XMa9MX7q+5ih6CUXU20JI6jM3FHo=
X-Received: by 2002:ae9:dc84:: with SMTP id
 q126mr15867971qkf.128.1633968513683;
 Mon, 11 Oct 2021 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-24-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2021 09:08:07 -0700
Message-ID: 
 <CAMKF1sofwyHbPvNLwvXw9EbFM=1xfc04e53UKaweT+MWgRb+7A@mail.gmail.com>
Subject: Re: [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 16:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156841

On Mon, Oct 11, 2021 at 2:41 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-ANGLE-do-not-enable-SSE-on-x86.patch | 26 ++++++++++++++++
>  ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 10 +++---
>  .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 -------------------
>  .../webkit/webkitgtk/include_xutil.patch      |  8 ++---
>  .../webkitgtk/musl-lower-stack-usage.patch    | 14 ++++-----
>  ...ebkitgtk_2.32.3.bb => webkitgtk_2.34.0.bb} | 23 ++++++++------
>  6 files changed, 55 insertions(+), 57 deletions(-)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.32.3.bb => webkitgtk_2.34.0.bb} (90%)
>

looks good to me.

> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
> new file mode 100644
> index 00000000000..1c6ba970376
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-ANGLE-do-not-enable-SSE-on-x86.patch
> @@ -0,0 +1,26 @@
> +From c71a4e18afb4869a0fbb0efd59c4860b72f493f7 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Tue, 5 Oct 2021 13:32:28 +0200
> +Subject: [PATCH] ANGLE: do not enable SSE on x86
> +
> +The code does not actually build there.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h b/Source/ThirdParty/ANGLE/src/common/platform.h
> +index 41f3cf4f..cab85a82 100644
> +--- a/Source/ThirdParty/ANGLE/src/common/platform.h
> ++++ b/Source/ThirdParty/ANGLE/src/common/platform.h
> +@@ -89,7 +89,7 @@
> + #if defined(_MSC_VER) && !defined(_M_ARM) && !defined(_M_ARM64)
> + #    include <intrin.h>
> + #    define ANGLE_USE_SSE
> +-#elif defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
> ++#elif defined(__GNUC__) && (defined(__x86_64__))
> + #    include <x86intrin.h>
> + #    define ANGLE_USE_SSE
> + #endif
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
> index 6d7d7067e4e..a65cfc8b5a4 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
> @@ -1,4 +1,4 @@
> -From acf26a385d17a59ccd4b767d6303ec3dbf78e788 Mon Sep 17 00:00:00 2001
> +From b055bd199f9c40148334725a227796c0d7d14788 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 3 Feb 2020 17:06:27 -0800
>  Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
> @@ -20,11 +20,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+)
>
>  diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
> -index f316f49..de81ce0 100644
> +index 3cb5a495..dfba9900 100644
>  --- a/Source/cmake/OptionsGTK.cmake
>  +++ b/Source/cmake/OptionsGTK.cmake
> -@@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
> - SET_PROJECT_VERSION(2 32 3)
> +@@ -7,6 +7,7 @@ SET_PROJECT_VERSION(2 34 0)
> +
>
>   set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
>  +set(THREADS_PREFER_PTHREAD_FLAG ON)
> @@ -32,7 +32,7 @@ index f316f49..de81ce0 100644
>   find_package(Cairo 1.14.0 REQUIRED)
>   find_package(Fontconfig 2.8.0 REQUIRED)
>  diff --git a/Source/cmake/OptionsJSCOnly.cmake b/Source/cmake/OptionsJSCOnly.cmake
> -index 1066440..d9aca95 100644
> +index e892b427..73bf9e4d 100644
>  --- a/Source/cmake/OptionsJSCOnly.cmake
>  +++ b/Source/cmake/OptionsJSCOnly.cmake
>  @@ -1,3 +1,4 @@
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch b/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
> deleted file mode 100644
> index 98d2d1ded96..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From dcf9ae0dc0b4510eddbeeea09e11edfb123f95af Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 2 May 2021 13:10:49 -0700
> -Subject: [PATCH] MiniBrowser: Fix reproduciblity
> -
> -Do not emit references to source dir in generated sourcecode
> -
> -Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=225283]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Tools/MiniBrowser/gtk/CMakeLists.txt | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -index 93b62521..482d3b00 100644
> ---- a/Tools/MiniBrowser/gtk/CMakeLists.txt
> -+++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -@@ -51,8 +51,8 @@ add_custom_command(
> -     OUTPUT ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
> -            ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
> -     MAIN_DEPENDENCY ${MiniBrowser_DIR}/browser-marshal.list
> --    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --body > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
> --    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --header > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
> -+    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --body --skip-source > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.c
> -+    COMMAND glib-genmarshal --prefix=browser_marshal ${MiniBrowser_DIR}/browser-marshal.list --header --skip-source > ${MiniBrowser_DERIVED_SOURCES_DIR}/BrowserMarshal.h
> -     VERBATIM)
> -
> - if (USE_GTK4)
> ---
> -2.31.1
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
> index ffe1b74be3d..e7a4cc25ade 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
> @@ -1,4 +1,4 @@
> -From d95f46e149226f634830e76cc1f4f8e3ee04ff5a Mon Sep 17 00:00:00 2001
> +From 2cc9d445b4c8eb70c2ab6c1723dfd208218f103e Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Fri, 6 Nov 2020 04:38:13 +0100
>  Subject: [PATCH] webkitgtk: fix build with x11 enabled
> @@ -21,12 +21,12 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp b/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
> -index 2d66b9cd..424fb5a1 100644
> +index bad56eba..fc141f98 100644
>  --- a/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
>  +++ b/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
> -@@ -30,6 +30,7 @@
> -
> +@@ -31,6 +31,7 @@
>   #if PLATFORM(X11)
> + #include <X11/Xatom.h>
>   #include <X11/Xlib.h>
>  +#include <X11/Xutil.h>
>   #include <X11/extensions/Xcomposite.h>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> index f71f8452fdb..d8d36fad6b1 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> @@ -1,4 +1,4 @@
> -From 04e4999c6fa2e9810634745a07f1e380f27b8e61 Mon Sep 17 00:00:00 2001
> +From 358a8f053c367aab7fba8ab059244e0530c7ff82 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 17 Mar 2021 13:24:57 -0700
>  Subject: [PATCH] reduce thread stack and heap usage for javascriptcore on musl
> @@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 19 insertions(+), 3 deletions(-)
>
>  diff --git a/Source/JavaScriptCore/runtime/OptionsList.h b/Source/JavaScriptCore/runtime/OptionsList.h
> -index bb6d2f1d..a6209742 100644
> +index a0c2170e..9e107af7 100644
>  --- a/Source/JavaScriptCore/runtime/OptionsList.h
>  +++ b/Source/JavaScriptCore/runtime/OptionsList.h
> -@@ -71,6 +71,18 @@ JS_EXPORT_PRIVATE bool canUseJITCage();
> +@@ -77,6 +77,18 @@ bool canUseWebAssemblyFastMemory();
>   // On instantiation of the first VM instance, the Options will be write protected
>   // and cannot be modified thereafter.
>
> @@ -47,7 +47,7 @@ index bb6d2f1d..a6209742 100644
>   #define FOR_EACH_JSC_OPTION(v)                                          \
>       v(Bool, useKernTCSM, defaultTCSMValue(), Normal, "Note: this needs to go before other options since they depend on this value.") \
>       v(Bool, validateOptions, false, Normal, "crashes if mis-typed JSC options were passed to the VM") \
> -@@ -86,9 +98,9 @@ JS_EXPORT_PRIVATE bool canUseJITCage();
> +@@ -92,9 +104,9 @@ bool canUseWebAssemblyFastMemory();
>       \
>       v(Bool, reportMustSucceedExecutableAllocations, false, Normal, nullptr) \
>       \
> @@ -61,11 +61,11 @@ index bb6d2f1d..a6209742 100644
>       v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a crash if we attempt to enter the VM when disallowed") \
>       v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
>  diff --git a/Source/WTF/wtf/Threading.h b/Source/WTF/wtf/Threading.h
> -index 9495d6c1..190b3811 100644
> +index 178f9808..95ec5a85 100644
>  --- a/Source/WTF/wtf/Threading.h
>  +++ b/Source/WTF/wtf/Threading.h
> -@@ -60,6 +60,10 @@
> - #include <dispatch/dispatch.h>
> +@@ -67,6 +67,10 @@
> + #undef None
>   #endif
>
>  +#if OS(LINUX) && !defined(__GLIBC__)
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> similarity index 90%
> rename from meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> index db2357002c8..25e1d422cc7 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> @@ -18,10 +18,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://include_xutil.patch \
>             file://reduce-memory-overheads.patch \
>             file://musl-lower-stack-usage.patch \
> -           file://0001-MiniBrowser-Fix-reproduciblity.patch \
> +           file://0001-ANGLE-do-not-enable-SSE-on-x86.patch \
>             "
>
> -SRC_URI[sha256sum] = "c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc"
> +SRC_URI[sha256sum] = "880c8ee626f67019f67557ca09e59a23ecf245e60f6173215f1a8823cb09af34"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
>
> @@ -38,7 +38,7 @@ DEPENDS = " \
>            atk \
>            libwebp \
>            gtk+3 \
> -          libsoup-2.4 \
> +          libsoup \
>            libxslt \
>            libtasn1 \
>            libnotify \
> @@ -48,12 +48,13 @@ DEPENDS = " \
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2 angle', d)} \
>                     enchant \
>                     libsecret \
>                    "
>
>  PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
> +PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
>  PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
>  PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>  PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
> @@ -66,6 +67,7 @@ PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
>  PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
>  PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
>  PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
> +PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
>
>  # webkitgtk is full of /usr/bin/env python, particular for generating docs
>  do_configure[postfuncs] += "setup_python_link"
> @@ -120,7 +122,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
>  SECURITY_CFLAGS:remove:aarch64 = "-fpie"
>  SECURITY_CFLAGS:append:aarch64 = " -fPIE"
>
> -FILES:${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES:${PN} += "${libdir}/webkit2gtk-4.1/injected-bundle/libwebkit2gtkinjectedbundle.so"
>
>  RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
>
> @@ -149,10 +151,11 @@ PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
>  src_package_preprocess () {
>          # Trim build paths from comments in generated sources to ensure reproducibility
>          sed -i -e "s,${WORKDIR},,g" \
> -            ${B}/DerivedSources/webkit2gtk/webkit2/*.cpp \
> -            ${B}/DerivedSources/ForwardingHeaders/JavaScriptCore/*.h \
> -            ${B}/DerivedSources/JavaScriptCore/*.h \
> -            ${B}/DerivedSources/JavaScriptCore/yarr/*.h \
> -            ${B}/DerivedSources/MiniBrowser/*.c
> +            ${B}/JavaScriptCore/DerivedSources/*.h \
> +            ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
> +            ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
> +            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
> +            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
> +
>  }
>
> --
> 2.20.1
>

