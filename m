Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA7AC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 13:53:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.36887.1634565206329359807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TTCCjyhF;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso36282wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uR/6P6FFTOAoeQ8C/ona8VvBC4yl5jB2XktCoLaiCAY=;
        b=TTCCjyhF+ZLxeMILKGFGkqSvV+eYogs9QGWiQJLaFMryt8D3nh5v6DadCIrmNFuw7a
         GdTVEODZeldkDjcPsHvjBYTwGrejyEcG/WK8XIzGyRpYU8BrzGqEA+MNQISHxOL0AmBb
         lEwCQkXlWtDO+xItx7/JutCPNUazVbfdAJ0pcaZvkkufy0jN8qQYAUgSI+iRJG4uu6UA
         qJHm3mcS+XJOuJzylaU9yZR2hSZooU/1jRoJTfftgd3w4Ss1z4YfUma60xvc3WGh2O0p
         JiR1oCs0ttK28lVDchlnPieYKjQ37dFVNtLwPiOPTdpbzbbxp7MVMhCkl7fCJ/IDetnr
         pYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uR/6P6FFTOAoeQ8C/ona8VvBC4yl5jB2XktCoLaiCAY=;
        b=SB0Rg74bJeWKLAxmECAbvL0sYssVlzzvw6O8K/FlXn5tQVPKpjuu8l2KvJcLk2JUWB
         BXAy1BcW4PFxYa+RirK0kmIT9qnVUgzE5lt6K9NbvWPnW2MW8wZvUeXeeDuPkX/kcCCH
         qNOtSA2AEnuklWcahBCJhE1GvF+Sse+btQTVjG2oAtfxVg6lFCQSwAat7a2Y2eaSGTys
         FyYSLvxaH2THcRdVPcTrmo0csDClMHDtfn8UFn+qcYWwYH9D+Tq7ccfmTANYSlPbP8oa
         vzPFk+YYS40xQRi2Z7PEp6Ae8G1BGsdDN0NjR1i2HkMRttauqsVOf2AdEMUk7MmkGdWn
         dbKA==
X-Gm-Message-State: AOAM531ocpVERG2ci2laOX+1okej6+lpAKH99dTC8JdSp3Ez/BEyILSw
	LjYwyiEGJrwACFfE0BjgH3DfgNiUbug=
X-Google-Smtp-Source: 
 ABdhPJwRVkIsohn0wVq4/8Et3dWtj+RELo6ZcQKWwG6rGGEvCS961ReBTIHo7JWlkVeQZWeJMjgftA==
X-Received: by 2002:a1c:8054:: with SMTP id b81mr31177445wmd.87.1634565204462;
        Mon, 18 Oct 2021 06:53:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 36sm12037925wrc.92.2021.10.18.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 06:53:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
Date: Mon, 18 Oct 2021 15:53:22 +0200
Message-Id: <20211018135322.246963-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 13:53:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157060

* added in:
  https://github.com/WebKit/WebKit/commit/29421afdcd64250c839fc1dbf26c9089584e224c

* fixes build without opengl in DISTRO_FEATURES which was failing since upgrade to 2.34.0 with:

| CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):
|   Either GLX or EGL is needed.
| Call Stack (most recent call first):
|   Source/cmake/WebKitCommon.cmake:220 (include)
|   CMakeLists.txt:20 (include)

* and add a patch to fix building this version with opengl and gles disabled
  (default oe-core setup without opengl in DISTRO_FEATURES)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Fix-build-without-opengl-or-es.patch | 133 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.34.0.bb  |   3 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
new file mode 100644
index 0000000000..e4c7d77ccd
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
@@ -0,0 +1,133 @@
+From 646e347c173dbb9782492ac7cb4f54b65533ba90 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 17 Oct 2021 20:49:21 +0000
+Subject: [PATCH] Fix build without opengl-or-es
+
+* fix build failure when opengl-or-es is disabled:
+  In file included from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp:30,
+                   from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/build/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-36.cpp:1:
+  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:41:10: fatal error: WebCore/CoordinatedGraphicsLayer.h: No such file or directory
+     41 | #include <WebCore/CoordinatedGraphicsLayer.h>
+        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  compilation terminated.
+
+* the CoordinatedGraphicsLayer.h header installation is controled by
+  USE_COORDINATED_GRAPHICS in webkitgtk-2.34.0/Source/WebCore/platform/TextureMapper.cmake
+  but in Source/cmake/OptionsGTK.cmake USE_COORDINATED_GRAPHICS was enabled only inside
+  if (USE_OPENGL_OR_ES)
+
+Upstream-Status: Pending
+---
+ .../DrawingAreaProxyCoordinatedGraphics.cpp                 | 2 +-
+ .../DrawingAreaProxyCoordinatedGraphics.h                   | 2 +-
+ .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp  | 2 +-
+ .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h    | 2 +-
+ .../WebPage/CoordinatedGraphics/LayerTreeHost.cpp           | 4 ++--
+ .../WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h  | 6 +++---
+ 6 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
+index 038d9ee2..5e828a10 100644
+--- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
++++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
+@@ -152,7 +152,7 @@ void DrawingAreaProxyCoordinatedGraphics::setBackingStoreIsDiscardable(bool isBa
+ #endif
+ }
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+ void DrawingAreaProxyCoordinatedGraphics::adjustTransientZoom(double scale, FloatPoint origin)
+ {
+     send(Messages::DrawingArea::AdjustTransientZoom(scale, origin));
+diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
+index b23a45ff..cd263402 100644
+--- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
++++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
+@@ -57,7 +57,7 @@ private:
+     void waitForBackingStoreUpdateOnNextPaint() override;
+     void setBackingStoreIsDiscardable(bool) override;
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+     void adjustTransientZoom(double scale, WebCore::FloatPoint origin) override;
+     void commitTransientZoom(double scale, WebCore::FloatPoint origin) override;
+ #endif
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
+index 33ac2e1d..42375784 100644
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
+@@ -486,7 +486,7 @@ void DrawingAreaCoordinatedGraphics::didUpdate()
+     displayTimerFired();
+ }
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+ void DrawingAreaCoordinatedGraphics::adjustTransientZoom(double scale, FloatPoint origin)
+ {
+     if (!m_transientZoom) {
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
+index d8dc6df7..c8322364 100644
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
+@@ -84,7 +84,7 @@ private:
+     void updateBackingStoreState(uint64_t backingStoreStateID, bool respondImmediately, float deviceScaleFactor, const WebCore::IntSize&, const WebCore::IntSize& scrollOffset) override;
+     void didUpdate() override;
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+     void adjustTransientZoom(double scale, WebCore::FloatPoint origin) override;
+     void commitTransientZoom(double scale, WebCore::FloatPoint origin) override;
+ #endif
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
+index f3304d10..ca0476ff 100644
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
+@@ -156,7 +156,7 @@ void LayerTreeHost::layerFlushTimerFired()
+ 
+     bool didSync = m_coordinator.flushPendingLayerChanges(flags);
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+     // If we have an active transient zoom, we want the zoom to win over any changes
+     // that WebCore makes to the relevant layers, so re-apply our changes after flushing.
+     if (m_transientZoom)
+@@ -453,7 +453,7 @@ void LayerTreeHost::renderNextFrame(bool forceRepaint)
+     }
+ }
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+ FloatPoint LayerTreeHost::constrainTransientZoomOrigin(double scale, FloatPoint origin) const
+ {
+     FrameView& frameView = *m_webPage.mainFrameView();
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
+index 4f727e41..b070266e 100644
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
+@@ -37,7 +37,7 @@
+ #include <wtf/Forward.h>
+ #include <wtf/OptionSet.h>
+ #include <wtf/RunLoop.h>
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+ #include <WebCore/CoordinatedGraphicsLayer.h>
+ #endif
+ 
+@@ -100,7 +100,7 @@ public:
+ 
+     WebCore::PlatformDisplayID displayID() const { return m_displayID; }
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+     void adjustTransientZoom(double, WebCore::FloatPoint);
+     void commitTransientZoom(double, WebCore::FloatPoint);
+ #endif
+@@ -213,7 +213,7 @@ private:
+ #endif // USE(COORDINATED_GRAPHICS)
+     WebCore::PlatformDisplayID m_displayID;
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
+     bool m_transientZoom { false };
+     double m_transientZoomScale { 1 };
+     WebCore::FloatPoint m_transientZoomOrigin;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
index 25e1d422cc..e54cbbacf9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-ANGLE-do-not-enable-SSE-on-x86.patch \
+           file://0001-Fix-build-without-opengl-or-es.patch \
            "
 
 SRC_URI[sha256sum] = "880c8ee626f67019f67557ca09e59a23ecf245e60f6173215f1a8823cb09af34"
@@ -49,6 +50,7 @@ DEPENDS = " \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2 angle', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
                    enchant \
                    libsecret \
                   "
@@ -61,6 +63,7 @@ PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
 PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/libgl"
+PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
 PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
-- 
2.32.0


