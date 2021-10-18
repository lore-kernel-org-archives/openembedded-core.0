Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC91AC4332F
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:37:51 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.37568.1634567870549382466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A6AtxYjM;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id e10so6322053uab.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbnhrf2+e7T4+DBPGfdSaeTmmaU6/TDWHOxqbXou2LA=;
        b=A6AtxYjMvMiF+5jLzD0kbX8u8uB4skIBePv26vYWkr+9BR+m1v3Smu6HjCnQZdZ0XD
         XEcSKMMbst4feaiLSGBd1ow84UDzK6iOxJmfWJuvJF1Qtrlaf89yuoy4UqikyUWCyllm
         ECfie9DGn6ZI9PjRYCfMM3ZwWIZYOYO8zub8nCzo+u842VFSIbEoYbvoVScl/WyW5WG7
         krACpumsocyXuef4Wg3yfmGjsMsZmC4G5JzlYciAP0zL2WcKtcaz+x+srh3aJoqUmz+i
         XZGCBnqBcn90AbEnZ/Neaxd1KXEUg6K/4S4Hpc1d7A7g8QHef/JW7lyiNwdmcY8BacwS
         /TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbnhrf2+e7T4+DBPGfdSaeTmmaU6/TDWHOxqbXou2LA=;
        b=UEHljnF8Ssg1CCEVS+EPv23bluyVL5DHywi9uCuHoHJi36eZCqtv3fbw39ikcOrsUd
         H5rm2E103E/WMJvsKp4eLf6jsbAYnoy0BLxw4MhbbDNQkM5EP3Qisx+kMHqGkX6Ge1gT
         7Ui13OdaczR2b+M5ZPbP7Gp/79SlSsrNBtkwL7k+13IgrYCkKmTn0gItBO4ydrrBNzTE
         MkUNKmizRuotYhuQZaY1tr8UjnDOB/XyUWCfU/e4ZnljDiFstm6Jnne45gDUPzipx9rQ
         PYUNJH+Q3bFINxoMWwdxnIbxu3kkmNnfFzrY7hmBd3/IaftrFJ74ziQ/fBwQP7X1VDb6
         ViIA==
X-Gm-Message-State: AOAM532er3a6lfWa0miXyao16m+Ru8C+3BviOk0HgicigLHaJZMm2ulX
	87biXqt6wtw4rufIqEBPyCqRZvK725OrbC67oyI=
X-Google-Smtp-Source: 
 ABdhPJw3TyLt5O4WSc2QPE9ECBDY7WQ2FcETjzHbxg8kiyBYoX0UlPtGIuuXW8CMvB5BJA8zozzoetj04yfEKAT6iPE=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr27197493vsi.18.1634567869587;
 Mon, 18 Oct 2021 07:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211018135322.246963-1-Martin.Jansa@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 16:37:38 +0200
Message-ID: 
 <CANNYZj9YndjixX64vi+kOFY+zFEYJar6Su5EcTp+iQz0JNvR_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003a62e005cea17d63"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:37:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157073

--0000000000003a62e005cea17d63
Content-Type: text/plain; charset="UTF-8"

Perhaps the easiest way out is to just change:
REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES',
'wayland', 'opengl', '', d)}"

to say 'opengl' unconditionally. If upstream doesn't test and isn't
interested in opengl-less configuration, we shouldn't try either.

Alex

On Mon, 18 Oct 2021 at 15:53, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * added in:
>
> https://github.com/WebKit/WebKit/commit/29421afdcd64250c839fc1dbf26c9089584e224c
>
> * fixes build without opengl in DISTRO_FEATURES which was failing since
> upgrade to 2.34.0 with:
>
> | CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):
> |   Either GLX or EGL is needed.
> | Call Stack (most recent call first):
> |   Source/cmake/WebKitCommon.cmake:220 (include)
> |   CMakeLists.txt:20 (include)
>
> * and add a patch to fix building this version with opengl and gles
> disabled
>   (default oe-core setup without opengl in DISTRO_FEATURES)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0001-Fix-build-without-opengl-or-es.patch | 133 ++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb  |   3 +
>  2 files changed, 136 insertions(+)
>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
>
> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
> b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
> new file mode 100644
> index 0000000000..e4c7d77ccd
> --- /dev/null
> +++
> b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
> @@ -0,0 +1,133 @@
> +From 646e347c173dbb9782492ac7cb4f54b65533ba90 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sun, 17 Oct 2021 20:49:21 +0000
> +Subject: [PATCH] Fix build without opengl-or-es
> +
> +* fix build failure when opengl-or-es is disabled:
> +  In file included from
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp:30,
> +                   from
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/build/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-36.cpp:1:
> +
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:41:10:
> fatal error: WebCore/CoordinatedGraphicsLayer.h: No such file or directory
> +     41 | #include <WebCore/CoordinatedGraphicsLayer.h>
> +        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +  compilation terminated.
> +
> +* the CoordinatedGraphicsLayer.h header installation is controled by
> +  USE_COORDINATED_GRAPHICS in
> webkitgtk-2.34.0/Source/WebCore/platform/TextureMapper.cmake
> +  but in Source/cmake/OptionsGTK.cmake USE_COORDINATED_GRAPHICS was
> enabled only inside
> +  if (USE_OPENGL_OR_ES)
> +
> +Upstream-Status: Pending
> +---
> + .../DrawingAreaProxyCoordinatedGraphics.cpp                 | 2 +-
> + .../DrawingAreaProxyCoordinatedGraphics.h                   | 2 +-
> + .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp  | 2 +-
> + .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h    | 2 +-
> + .../WebPage/CoordinatedGraphics/LayerTreeHost.cpp           | 4 ++--
> + .../WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h  | 6 +++---
> + 6 files changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git
> a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
> b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
> +index 038d9ee2..5e828a10 100644
> +---
> a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
> ++++
> b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
> +@@ -152,7 +152,7 @@ void
> DrawingAreaProxyCoordinatedGraphics::setBackingStoreIsDiscardable(bool isBa
> + #endif
> + }
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> + void DrawingAreaProxyCoordinatedGraphics::adjustTransientZoom(double
> scale, FloatPoint origin)
> + {
> +     send(Messages::DrawingArea::AdjustTransientZoom(scale, origin));
> +diff --git
> a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
> b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
> +index b23a45ff..cd263402 100644
> +---
> a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
> ++++
> b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
> +@@ -57,7 +57,7 @@ private:
> +     void waitForBackingStoreUpdateOnNextPaint() override;
> +     void setBackingStoreIsDiscardable(bool) override;
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> +     void adjustTransientZoom(double scale, WebCore::FloatPoint origin)
> override;
> +     void commitTransientZoom(double scale, WebCore::FloatPoint origin)
> override;
> + #endif
> +diff --git
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
> +index 33ac2e1d..42375784 100644
> +---
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
> ++++
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
> +@@ -486,7 +486,7 @@ void DrawingAreaCoordinatedGraphics::didUpdate()
> +     displayTimerFired();
> + }
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> + void DrawingAreaCoordinatedGraphics::adjustTransientZoom(double scale,
> FloatPoint origin)
> + {
> +     if (!m_transientZoom) {
> +diff --git
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
> +index d8dc6df7..c8322364 100644
> +---
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
> ++++
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
> +@@ -84,7 +84,7 @@ private:
> +     void updateBackingStoreState(uint64_t backingStoreStateID, bool
> respondImmediately, float deviceScaleFactor, const WebCore::IntSize&, const
> WebCore::IntSize& scrollOffset) override;
> +     void didUpdate() override;
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> +     void adjustTransientZoom(double scale, WebCore::FloatPoint origin)
> override;
> +     void commitTransientZoom(double scale, WebCore::FloatPoint origin)
> override;
> + #endif
> +diff --git
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
> +index f3304d10..ca0476ff 100644
> +---
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
> ++++
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
> +@@ -156,7 +156,7 @@ void LayerTreeHost::layerFlushTimerFired()
> +
> +     bool didSync = m_coordinator.flushPendingLayerChanges(flags);
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> +     // If we have an active transient zoom, we want the zoom to win over
> any changes
> +     // that WebCore makes to the relevant layers, so re-apply our
> changes after flushing.
> +     if (m_transientZoom)
> +@@ -453,7 +453,7 @@ void LayerTreeHost::renderNextFrame(bool forceRepaint)
> +     }
> + }
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> + FloatPoint LayerTreeHost::constrainTransientZoomOrigin(double scale,
> FloatPoint origin) const
> + {
> +     FrameView& frameView = *m_webPage.mainFrameView();
> +diff --git
> a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
> b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
> +index 4f727e41..b070266e 100644
> +--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
> ++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
> +@@ -37,7 +37,7 @@
> + #include <wtf/Forward.h>
> + #include <wtf/OptionSet.h>
> + #include <wtf/RunLoop.h>
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> + #include <WebCore/CoordinatedGraphicsLayer.h>
> + #endif
> +
> +@@ -100,7 +100,7 @@ public:
> +
> +     WebCore::PlatformDisplayID displayID() const { return m_displayID; }
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> +     void adjustTransientZoom(double, WebCore::FloatPoint);
> +     void commitTransientZoom(double, WebCore::FloatPoint);
> + #endif
> +@@ -213,7 +213,7 @@ private:
> + #endif // USE(COORDINATED_GRAPHICS)
> +     WebCore::PlatformDisplayID m_displayID;
> +
> +-#if PLATFORM(GTK)
> ++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
> +     bool m_transientZoom { false };
> +     double m_transientZoomScale { 1 };
> +     WebCore::FloatPoint m_transientZoomOrigin;
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> index 25e1d422cc..e54cbbacf9 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> @@ -19,6 +19,7 @@ SRC_URI = "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://reduce-memory-overheads.patch \
>             file://musl-lower-stack-usage.patch \
>             file://0001-ANGLE-do-not-enable-SSE-on-x86.patch \
> +           file://0001-Fix-build-without-opengl-or-es.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "880c8ee626f67019f67557ca09e59a23ecf245e60f6173215f1a8823cb09af34"
> @@ -49,6 +50,7 @@ DEPENDS = " \
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland
> x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'webgl opengl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
> 'webgl gles2 angle', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl-or-es', '', d)} \
>                     enchant \
>                     libsecret \
>                    "
> @@ -61,6 +63,7 @@ PACKAGECONFIG[enchant] =
> "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant
>  PACKAGECONFIG[gles2] =
> "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
>  PACKAGECONFIG[webgl] =
> "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
>  PACKAGECONFIG[opengl] =
> "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/libgl"
> +PACKAGECONFIG[opengl-or-es] =
> "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
>  PACKAGECONFIG[libsecret] =
> "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
>  PACKAGECONFIG[libhyphen] =
> "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
>  PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157060):
> https://lists.openembedded.org/g/openembedded-core/message/157060
> Mute This Topic: https://lists.openembedded.org/mt/86414212/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003a62e005cea17d63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps the easiest way out is to just change:</div><=
div>REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;wayland&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;</div=
><div><br></div><div>to say &#39;opengl&#39; unconditionally. If upstream d=
oesn&#39;t test and isn&#39;t interested in opengl-less configuration, we s=
houldn&#39;t try either.<br></div><div><br></div><div>Alex<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 18 Oct 2021 at 15:53, Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmai=
l.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">* added in:<br>
=C2=A0 <a href=3D"https://github.com/WebKit/WebKit/commit/29421afdcd64250c8=
39fc1dbf26c9089584e224c" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/WebKit/WebKit/commit/29421afdcd64250c839fc1dbf26c9089584e224c</a><br>
<br>
* fixes build without opengl in DISTRO_FEATURES which was failing since upg=
rade to 2.34.0 with:<br>
<br>
| CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):<br>
|=C2=A0 =C2=A0Either GLX or EGL is needed.<br>
| Call Stack (most recent call first):<br>
|=C2=A0 =C2=A0Source/cmake/WebKitCommon.cmake:220 (include)<br>
|=C2=A0 =C2=A0CMakeLists.txt:20 (include)<br>
<br>
* and add a patch to fix building this version with opengl and gles disable=
d<br>
=C2=A0 (default oe-core setup without opengl in DISTRO_FEATURES)<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-build-without-opengl-or-es.patch | 133 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a>=C2=A0 |=C2=A0 =C2=
=A03 +<br>
=C2=A02 files changed, 136 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-=
without-opengl-or-es.patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-open=
gl-or-es.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-=
opengl-or-es.patch<br>
new file mode 100644<br>
index 0000000000..e4c7d77ccd<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-e=
s.patch<br>
@@ -0,0 +1,133 @@<br>
+From 646e347c173dbb9782492ac7cb4f54b65533ba90 Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Sun, 17 Oct 2021 20:49:21 +0000<br>
+Subject: [PATCH] Fix build without opengl-or-es<br>
+<br>
+* fix build failure when opengl-or-es is disabled:<br>
+=C2=A0 In file included from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-=
linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage=
/CoordinatedGraphics/LayerTreeHost.cpp:30,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/buil=
d/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-36.cpp:1:<br=
>
+=C2=A0 /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0=
-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/L=
ayerTreeHost.h:41:10: fatal error: WebCore/CoordinatedGraphicsLayer.h: No s=
uch file or directory<br>
+=C2=A0 =C2=A0 =C2=A041 | #include &lt;WebCore/CoordinatedGraphicsLayer.h&g=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
+=C2=A0 compilation terminated.<br>
+<br>
+* the CoordinatedGraphicsLayer.h header installation is controled by<br>
+=C2=A0 USE_COORDINATED_GRAPHICS in webkitgtk-2.34.0/Source/WebCore/platfor=
m/TextureMapper.cmake<br>
+=C2=A0 but in Source/cmake/OptionsGTK.cmake USE_COORDINATED_GRAPHICS was e=
nabled only inside<br>
+=C2=A0 if (USE_OPENGL_OR_ES)<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ .../DrawingAreaProxyCoordinatedGraphics.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ .../DrawingAreaProxyCoordinatedGraphics.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp=C2=A0 | 2 +-<b=
r>
+ .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h=C2=A0 =C2=A0 | 2=
 +-<br>
+ .../WebPage/CoordinatedGraphics/LayerTreeHost.cpp=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 4 ++--<br>
+ .../WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h=C2=A0 | 6 +++-=
--<br>
+ 6 files changed, 9 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyC=
oordinatedGraphics.cpp b/Source/WebKit/UIProcess/CoordinatedGraphics/Drawin=
gAreaProxyCoordinatedGraphics.cpp<br>
+index 038d9ee2..5e828a10 100644<br>
+--- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordina=
tedGraphics.cpp<br>
++++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordina=
tedGraphics.cpp<br>
+@@ -152,7 +152,7 @@ void DrawingAreaProxyCoordinatedGraphics::setBackingSt=
oreIsDiscardable(bool isBa<br>
+ #endif<br>
+ }<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+ void DrawingAreaProxyCoordinatedGraphics::adjustTransientZoom(double scal=
e, FloatPoint origin)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0send(Messages::DrawingArea::AdjustTransientZoom(scale,=
 origin));<br>
+diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyC=
oordinatedGraphics.h b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingA=
reaProxyCoordinatedGraphics.h<br>
+index b23a45ff..cd263402 100644<br>
+--- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordina=
tedGraphics.h<br>
++++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordina=
tedGraphics.h<br>
+@@ -57,7 +57,7 @@ private:<br>
+=C2=A0 =C2=A0 =C2=A0void waitForBackingStoreUpdateOnNextPaint() override;<=
br>
+=C2=A0 =C2=A0 =C2=A0void setBackingStoreIsDiscardable(bool) override;<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+=C2=A0 =C2=A0 =C2=A0void adjustTransientZoom(double scale, WebCore::FloatP=
oint origin) override;<br>
+=C2=A0 =C2=A0 =C2=A0void commitTransientZoom(double scale, WebCore::FloatP=
oint origin) override;<br>
+ #endif<br>
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingA=
reaCoordinatedGraphics.cpp b/Source/WebKit/WebProcess/WebPage/CoordinatedGr=
aphics/DrawingAreaCoordinatedGraphics.cpp<br>
+index 33ac2e1d..42375784 100644<br>
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoor=
dinatedGraphics.cpp<br>
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoor=
dinatedGraphics.cpp<br>
+@@ -486,7 +486,7 @@ void DrawingAreaCoordinatedGraphics::didUpdate()<br>
+=C2=A0 =C2=A0 =C2=A0displayTimerFired();<br>
+ }<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+ void DrawingAreaCoordinatedGraphics::adjustTransientZoom(double scale, Fl=
oatPoint origin)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0if (!m_transientZoom) {<br>
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingA=
reaCoordinatedGraphics.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGrap=
hics/DrawingAreaCoordinatedGraphics.h<br>
+index d8dc6df7..c8322364 100644<br>
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoor=
dinatedGraphics.h<br>
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoor=
dinatedGraphics.h<br>
+@@ -84,7 +84,7 @@ private:<br>
+=C2=A0 =C2=A0 =C2=A0void updateBackingStoreState(uint64_t backingStoreStat=
eID, bool respondImmediately, float deviceScaleFactor, const WebCore::IntSi=
ze&amp;, const WebCore::IntSize&amp; scrollOffset) override;<br>
+=C2=A0 =C2=A0 =C2=A0void didUpdate() override;<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+=C2=A0 =C2=A0 =C2=A0void adjustTransientZoom(double scale, WebCore::FloatP=
oint origin) override;<br>
+=C2=A0 =C2=A0 =C2=A0void commitTransientZoom(double scale, WebCore::FloatP=
oint origin) override;<br>
+ #endif<br>
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTre=
eHost.cpp b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeH=
ost.cpp<br>
+index f3304d10..ca0476ff 100644<br>
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.c=
pp<br>
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.c=
pp<br>
+@@ -156,7 +156,7 @@ void LayerTreeHost::layerFlushTimerFired()<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0bool didSync =3D m_coordinator.flushPendingLayerChange=
s(flags);<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+=C2=A0 =C2=A0 =C2=A0// If we have an active transient zoom, we want the zo=
om to win over any changes<br>
+=C2=A0 =C2=A0 =C2=A0// that WebCore makes to the relevant layers, so re-ap=
ply our changes after flushing.<br>
+=C2=A0 =C2=A0 =C2=A0if (m_transientZoom)<br>
+@@ -453,7 +453,7 @@ void LayerTreeHost::renderNextFrame(bool forceRepaint)=
<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+ FloatPoint LayerTreeHost::constrainTransientZoomOrigin(double scale, Floa=
tPoint origin) const<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0FrameView&amp; frameView =3D *m_webPage.mainFrameView(=
);<br>
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTre=
eHost.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHos=
t.h<br>
+index 4f727e41..b070266e 100644<br>
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h=
<br>
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h=
<br>
+@@ -37,7 +37,7 @@<br>
+ #include &lt;wtf/Forward.h&gt;<br>
+ #include &lt;wtf/OptionSet.h&gt;<br>
+ #include &lt;wtf/RunLoop.h&gt;<br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+ #include &lt;WebCore/CoordinatedGraphicsLayer.h&gt;<br>
+ #endif<br>
+ <br>
+@@ -100,7 +100,7 @@ public:<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0WebCore::PlatformDisplayID displayID() const { return =
m_displayID; }<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+=C2=A0 =C2=A0 =C2=A0void adjustTransientZoom(double, WebCore::FloatPoint);=
<br>
+=C2=A0 =C2=A0 =C2=A0void commitTransientZoom(double, WebCore::FloatPoint);=
<br>
+ #endif<br>
+@@ -213,7 +213,7 @@ private:<br>
+ #endif // USE(COORDINATED_GRAPHICS)<br>
+=C2=A0 =C2=A0 =C2=A0WebCore::PlatformDisplayID m_displayID;<br>
+ <br>
+-#if PLATFORM(GTK)<br>
++#if PLATFORM(GTK) &amp;&amp; USE(COORDINATED_GRAPHICS)<br>
+=C2=A0 =C2=A0 =C2=A0bool m_transientZoom { false };<br>
+=C2=A0 =C2=A0 =C2=A0double m_transientZoomScale { 1 };<br>
+=C2=A0 =C2=A0 =C2=A0WebCore::FloatPoint m_transientZoomOrigin;<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a> b/meta/recip=
es-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">webkitgtk_2.34.0.bb</a><br>
index 25e1d422cc..e54cbbacf9 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/re=
leases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reduce-memory-overheads.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://musl-lower-stack-usage.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ANGLE-do-not-enable-S=
SE-on-x86.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-without-ope=
ngl-or-es.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;880c8ee626f67019f67557ca09e59a23ecf245e6=
0f6173215f1a8823cb09af34&quot;<br>
@@ -49,6 +50,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;systemd wayland x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;, &#39;webgl=
 opengl&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;&#39;, &#39;=
webgl gles2 angle&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;opengl-or=
-es&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 encha=
nt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libse=
cret \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
@@ -61,6 +63,7 @@ PACKAGECONFIG[enchant] =3D &quot;-DENABLE_SPELLCHECK=3DON=
,-DENABLE_SPELLCHECK=3DOFF,enchant<br>
=C2=A0PACKAGECONFIG[gles2] =3D &quot;-DENABLE_GLES2=3DON,-DENABLE_GLES2=3DO=
FF,virtual/libgles2&quot;<br>
=C2=A0PACKAGECONFIG[webgl] =3D &quot;-DENABLE_WEBGL=3DON,-DENABLE_WEBGL=3DO=
FF,virtual/libgl&quot;<br>
=C2=A0PACKAGECONFIG[opengl] =3D &quot;-DENABLE_GRAPHICS_CONTEXT_GL=3DON,-DE=
NABLE_GRAPHICS_CONTEXT_GL=3DOFF,virtual/libgl&quot;<br>
+PACKAGECONFIG[opengl-or-es] =3D &quot;-DUSE_OPENGL_OR_ES=3DON,-DUSE_OPENGL=
_OR_ES=3DOFF&quot;<br>
=C2=A0PACKAGECONFIG[libsecret] =3D &quot;-DUSE_LIBSECRET=3DON,-DUSE_LIBSECR=
ET=3DOFF,libsecret&quot;<br>
=C2=A0PACKAGECONFIG[libhyphen] =3D &quot;-DUSE_LIBHYPHEN=3DON,-DUSE_LIBHYPH=
EN=3DOFF,libhyphen&quot;<br>
=C2=A0PACKAGECONFIG[woff2] =3D &quot;-DUSE_WOFF2=3DON,-DUSE_WOFF2=3DOFF,wof=
f2&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157060): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157060" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157060</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86414212/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86414212/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003a62e005cea17d63--

