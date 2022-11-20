Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4B2C4167B
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.12312.1668951100174541724
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Byf44z9Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id b12so2423023wrn.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJomUzOyFySxNvec1l0XidORDbkvphlmoQEZ242Q2u8=;
        b=Byf44z9YG6DCM7FJF471EalVTFagbzbIW2UtdJkvBW/3Ph3d5bJWAYbqVISlC40trc
         0ivp9GTIT+mfLjEzqvFIMhh5KPemigPy9DmYtIbVjKwhi6jt4lQ9gHwmRTzC+MYM74CA
         D4AfvageuONsrXTOxTv/Usb3M9AcGiztieYPptCRYWCZCAqANyr64Cf2ZoOyCM51Ct1g
         ePQjzd7SwNiVl6TEsgpudkZEJXdTnOkma9Lt/H2sFbiadBUYjaJdsQu+hP2AzaomkmZT
         N42EOLyBOdWLI6xx2oHc7B5OJL0A8pF0PMucwA5BUXfUweE3sXNI8JfdBJ9EGrTXxWsX
         wj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJomUzOyFySxNvec1l0XidORDbkvphlmoQEZ242Q2u8=;
        b=PV2QQ2VMVpdWSwj7uGVxisTgLdOheuWAOgZ/1e49zKnLYfdvYcdt+6RdP1c4Mo3+i0
         p/pgQSW8ar35QPhPkqqSzEuMAdBBCcnfE5Cy20+Y8WuXKTym8XnFELP2DZKa+c7i4B+l
         H+ex7WP0qaCGSVvYWwuakFLDreVPzO2q08Oy+RJ63mNASMmjB1vG+dqzHa21LH1iiOTf
         OAcdl8kZReWczjvN1TJzxfed/YreESd6aRguePfuwsBEJjeEgyB4lmMpSLTAuyALMQb6
         20FJnbsz2kzdGuXBBwFYx2yqnMVaBMBbP5bXjwL2IJCk6qmtmCuryLaqRTJMIbWRormA
         qVHQ==
X-Gm-Message-State: ANoB5plEOVscyoNqNMlaGjtI9f4NMT3chJgtXbCo+111ArADNHudSPMa
	+Je638Z7FFAS2fQf0HpesVWaGz7KFOQ=
X-Google-Smtp-Source: AA0mqf63Xnvs8t+Q2uKm0L44k7L3jH6aiVXaToCrO7uaWdPCKLbtK7a7pQJmBsZKIaFTASTI3lVd+Q==
X-Received: by 2002:a5d:4601:0:b0:241:bf7b:b2e5 with SMTP id t1-20020a5d4601000000b00241bf7bb2e5mr5426151wrq.626.1668951098504;
        Sun, 20 Nov 2022 05:31:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/17] webkitgtk: update 2.36.7 -> 2.38.2
Date: Sun, 20 Nov 2022 14:31:18 +0100
Message-Id: <20221120133122.2464634-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173595

Upstream has rewritten gobject introspection support,
so the two related patches are ported to that:
0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
0001-When-building-introspection-files-do-not-quote-CFLAG.patch
The latter patch is also promoted from Inappropriate to Pending

gtk-doc has been replaced with gi-docgen, accordingly
0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch is removed.

Drop
fix-gstreamer-include-paths.patch
(backport)
0001-Fix-build-without-opengl-or-es.patch
(upstream fixed the issue; follow the link in the patch for details)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...spection.cmake-prefix-variables-obta.patch |  39 ++---
 .../0001-Fix-build-without-opengl-or-es.patch | 133 ------------------
 ...tings-so-that-gtkdoc-generation-work.patch |  47 -------
 ...trospection-files-do-not-quote-CFLAG.patch |  67 +++------
 .../fix-gstreamer-include-paths.patch         |  51 -------
 ...ebkitgtk_2.36.7.bb => webkitgtk_2.38.2.bb} |   9 +-
 6 files changed, 40 insertions(+), 306 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.7.bb => webkitgtk_2.38.2.bb} (94%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 2379924cc9..8ae39f14e1 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From e0bf97eecfa601e08b9578f00b1000890284241a Mon Sep 17 00:00:00 2001
+From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -9,30 +9,21 @@ reasons why this is not approproiate for upstream submission.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
- Source/cmake/FindGObjectIntrospection.cmake | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ Source/cmake/FindGI.cmake | 3 +++
+ 1 file changed, 3 insertions(+)
 
-diff --git a/Source/cmake/FindGObjectIntrospection.cmake b/Source/cmake/FindGObjectIntrospection.cmake
-index be96814a..ae67b593 100644
---- a/Source/cmake/FindGObjectIntrospection.cmake
-+++ b/Source/cmake/FindGObjectIntrospection.cmake
-@@ -16,7 +16,6 @@
- # Redistribution and use is allowed according to the terms of the BSD license.
+diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
+index af039cbb..b3e810cd 100644
+--- a/Source/cmake/FindGI.cmake
++++ b/Source/cmake/FindGI.cmake
+@@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
+     endif ()
+ endif ()
  
++set(_GI_SCANNER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_SCANNER_EXE}")
++set(_GI_COMPILER_EXE "$ENV{PKG_CONFIG_SYSROOT_DIR}${_GI_COMPILER_EXE}")
++
+ find_program(GI_SCANNER_EXE NAMES ${_GI_SCANNER_EXE} g-ir-scanner)
+ find_program(GI_COMPILER_EXE NAMES ${_GI_COMPILER_EXE} g-ir-compiler)
  
--
- find_package(PkgConfig QUIET)
- if (PKG_CONFIG_FOUND)
-     if (PACKAGE_FIND_VERSION_COUNT GREATER 0)
-@@ -30,6 +29,9 @@ if (PKG_CONFIG_FOUND)
-         pkg_get_variable(INTROSPECTION_GENERATE gobject-introspection-1.0 g_ir_generate)
-         pkg_get_variable(INTROSPECTION_GIRDIR gobject-introspection-1.0 girdir)
-         pkg_get_variable(INTROSPECTION_TYPELIBDIR gobject-introspection-1.0 typelibdir)
-+        set(INTROSPECTION_SCANNER "$ENV{PKG_CONFIG_SYSROOT_DIR}${INTROSPECTION_SCANNER}")
-+        set(INTROSPECTION_COMPILER "$ENV{PKG_CONFIG_SYSROOT_DIR}${INTROSPECTION_COMPILER}")
-+        set(INTROSPECTION_GENERATE "$ENV{PKG_CONFIG_SYSROOT_DIR}${INTROSPECTION_GENERATE}")
-         set(INTROSPECTION_VERSION "${_pc_gir_VERSION}")
-         if (${INTROSPECTION_VERSION} VERSION_GREATER_EQUAL "1.59.1")
-             set(INTROSPECTION_HAVE_SOURCES_TOP_DIRS YES)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
deleted file mode 100644
index 09256951f4..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 646e347c173dbb9782492ac7cb4f54b65533ba90 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 17 Oct 2021 20:49:21 +0000
-Subject: [PATCH] Fix build without opengl-or-es
-
-* fix build failure when opengl-or-es is disabled:
-  In file included from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp:30,
-                   from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/build/DerivedSources/WebKit/unified-sources/UnifiedSource-54928a2b-36.cpp:1:
-  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:41:10: fatal error: WebCore/CoordinatedGraphicsLayer.h: No such file or directory
-     41 | #include <WebCore/CoordinatedGraphicsLayer.h>
-        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  compilation terminated.
-
-* the CoordinatedGraphicsLayer.h header installation is controled by
-  USE_COORDINATED_GRAPHICS in webkitgtk-2.34.0/Source/WebCore/platform/TextureMapper.cmake
-  but in Source/cmake/OptionsGTK.cmake USE_COORDINATED_GRAPHICS was enabled only inside
-  if (USE_OPENGL_OR_ES)
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232934]
----
- .../DrawingAreaProxyCoordinatedGraphics.cpp                 | 2 +-
- .../DrawingAreaProxyCoordinatedGraphics.h                   | 2 +-
- .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp  | 2 +-
- .../CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h    | 2 +-
- .../WebPage/CoordinatedGraphics/LayerTreeHost.cpp           | 4 ++--
- .../WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h  | 6 +++---
- 6 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-index 038d9ee2..5e828a10 100644
---- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-+++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-@@ -152,7 +152,7 @@ void DrawingAreaProxyCoordinatedGraphics::setBackingStoreIsDiscardable(bool isBa
- #endif
- }
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
- void DrawingAreaProxyCoordinatedGraphics::adjustTransientZoom(double scale, FloatPoint origin)
- {
-     send(Messages::DrawingArea::AdjustTransientZoom(scale, origin));
-diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
-index b23a45ff..cd263402 100644
---- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
-+++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.h
-@@ -57,7 +57,7 @@ private:
-     void waitForBackingStoreUpdateOnNextPaint() override;
-     void setBackingStoreIsDiscardable(bool) override;
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
-     void adjustTransientZoom(double scale, WebCore::FloatPoint origin) override;
-     void commitTransientZoom(double scale, WebCore::FloatPoint origin) override;
- #endif
-diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
-index 33ac2e1d..42375784 100644
---- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
-+++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.cpp
-@@ -486,7 +486,7 @@ void DrawingAreaCoordinatedGraphics::didUpdate()
-     displayTimerFired();
- }
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
- void DrawingAreaCoordinatedGraphics::adjustTransientZoom(double scale, FloatPoint origin)
- {
-     if (!m_transientZoom) {
-diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
-index d8dc6df7..c8322364 100644
---- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
-+++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/DrawingAreaCoordinatedGraphics.h
-@@ -84,7 +84,7 @@ private:
-     void updateBackingStoreState(uint64_t backingStoreStateID, bool respondImmediately, float deviceScaleFactor, const WebCore::IntSize&, const WebCore::IntSize& scrollOffset) override;
-     void didUpdate() override;
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
-     void adjustTransientZoom(double scale, WebCore::FloatPoint origin) override;
-     void commitTransientZoom(double scale, WebCore::FloatPoint origin) override;
- #endif
-diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
-index f3304d10..ca0476ff 100644
---- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
-+++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.cpp
-@@ -156,7 +156,7 @@ void LayerTreeHost::layerFlushTimerFired()
- 
-     bool didSync = m_coordinator.flushPendingLayerChanges(flags);
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
-     // If we have an active transient zoom, we want the zoom to win over any changes
-     // that WebCore makes to the relevant layers, so re-apply our changes after flushing.
-     if (m_transientZoom)
-@@ -453,7 +453,7 @@ void LayerTreeHost::renderNextFrame(bool forceRepaint)
-     }
- }
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
- FloatPoint LayerTreeHost::constrainTransientZoomOrigin(double scale, FloatPoint origin) const
- {
-     FrameView& frameView = *m_webPage.mainFrameView();
-diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
-index 4f727e41..b070266e 100644
---- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
-+++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
-@@ -37,7 +37,7 @@
- #include <wtf/Forward.h>
- #include <wtf/OptionSet.h>
- #include <wtf/RunLoop.h>
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
- #include <WebCore/CoordinatedGraphicsLayer.h>
- #endif
- 
-@@ -100,7 +100,7 @@ public:
- 
-     WebCore::PlatformDisplayID displayID() const { return m_displayID; }
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
-     void adjustTransientZoom(double, WebCore::FloatPoint);
-     void commitTransientZoom(double, WebCore::FloatPoint);
- #endif
-@@ -213,7 +213,7 @@ private:
- #endif // USE(COORDINATED_GRAPHICS)
-     WebCore::PlatformDisplayID m_displayID;
- 
--#if PLATFORM(GTK)
-+#if PLATFORM(GTK) && USE(COORDINATED_GRAPHICS)
-     bool m_transientZoom { false };
-     double m_transientZoomScale { 1 };
-     WebCore::FloatPoint m_transientZoomOrigin;
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
deleted file mode 100644
index 866e9d9d09..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 1c7e7a385387d7febf633bbb6d2b99ece523e719 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 11 Aug 2016 17:13:51 +0300
-Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
- OpenEmbedded build system
-
-This requires setting a few environment variables so that the transient
-binary is build and linked correctly, and disabling the tweaks to RUN
-variable from gtkdoc.py script so that our qemu wrapper is taken into use.
-
-Upstream-Status: Inappropriate [oe-specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Source/cmake/GtkDoc.cmake | 2 +-
- Tools/gtkdoc/gtkdoc.py    | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Source/cmake/GtkDoc.cmake b/Source/cmake/GtkDoc.cmake
-index 18e86448..102c873a 100644
---- a/Source/cmake/GtkDoc.cmake
-+++ b/Source/cmake/GtkDoc.cmake
-@@ -4,7 +4,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
-     add_custom_command(
-         OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
-         DEPENDS ${DocumentationDependencies}
--        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LDFLAGS=${CMAKE_EXE_LINKER_FLAGS}" ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
-+        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
-         COMMAND touch ${_stamp_name}
-         WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
-         VERBATIM
-diff --git a/Tools/gtkdoc/gtkdoc.py b/Tools/gtkdoc/gtkdoc.py
-index 054cafa1..416de7d1 100644
---- a/Tools/gtkdoc/gtkdoc.py
-+++ b/Tools/gtkdoc/gtkdoc.py
-@@ -320,9 +320,9 @@ class GTKDoc(object):
-                     additional_ldflags = '%s %s' % (additional_ldflags, arg)
-             ldflags = ' "-L%s" %s ' % (self.library_path, additional_ldflags) + ldflags
-             current_ld_library_path = env.get('LD_LIBRARY_PATH')
--            if current_ld_library_path:
-+            if current_ld_library_path and 'RUN' not in env:
-                 env['LD_LIBRARY_PATH'] = '%s:%s' % (self.library_path, current_ld_library_path)
--            else:
-+            elif 'RUN' not in env:
-                 env['LD_LIBRARY_PATH'] = self.library_path
- 
-         if ldflags:
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
index 3d02be9894..4ef0dbfe2f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
@@ -1,9 +1,9 @@
-From 01f5ab0edf3dd8f76d37fd36c2dcd3108be33a7b Mon Sep 17 00:00:00 2001
+From 89ac299e0d9436f1effaa07711458d616574cc8f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 4 Apr 2022 21:20:05 +0200
-Subject: [PATCH] When building introspection files, do not quote CFLAGS.
+Subject: [PATCH] Propagate CFLAGS to introspection targets
 
-This does not seem to be propagated to the compiler correctly:
+Otherwise, important things do not get passed to the compiler in cross compiling with a sysroot scenario:
 
 In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/syslimits.h:7,
                  from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/limits.h:34,
@@ -31,48 +31,25 @@ Traceback (most recent call last):
     raise DistutilsExecError(
 distutils.errors.DistutilsExecError: command '/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc' failed with exit code 1
 
-Upstream-Status: Inappropriate [upstream has rewritten the whole thing as of https://github.com/WebKit/WebKit/commit/b0ae032850bb6b2672051bab8032fc9f9ef5eb97]
+Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Source/JavaScriptCore/PlatformGTK.cmake | 2 +-
- Source/WebKit/PlatformGTK.cmake         | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/Source/JavaScriptCore/PlatformGTK.cmake b/Source/JavaScriptCore/PlatformGTK.cmake
-index 1c3c8fb7..efd18807 100644
---- a/Source/JavaScriptCore/PlatformGTK.cmake
-+++ b/Source/JavaScriptCore/PlatformGTK.cmake
-@@ -71,7 +71,7 @@ if (ENABLE_INTROSPECTION)
-     add_custom_command(
-         OUTPUT ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS JavaScriptCore
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS="-Wno-deprecated-declarations ${CMAKE_C_FLAGS}" LDFLAGS=
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-             ${INTROSPECTION_SCANNER}
-             --quiet
-diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
-index 48d1820d..ded05035 100644
---- a/Source/WebKit/PlatformGTK.cmake
-+++ b/Source/WebKit/PlatformGTK.cmake
-@@ -675,7 +675,7 @@ if (ENABLE_INTROSPECTION)
-     add_custom_target(WebKit2-${WEBKITGTK_API_VERSION}-gir
-         DEPENDS WebKit
-         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS="-Wno-deprecated-declarations ${CMAKE_C_FLAGS}" LDFLAGS=
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-             ${INTROSPECTION_SCANNER}
-             --quiet
-@@ -721,7 +721,7 @@ if (ENABLE_INTROSPECTION)
-         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS="-Wno-deprecated-declarations ${CMAKE_C_FLAGS}"
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
-             LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-             ${INTROSPECTION_SCANNER}
--- 
-2.30.2
 
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/cmake/FindGI.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
+index b3e810cd..e22a75f7 100644
+--- a/Source/cmake/FindGI.cmake
++++ b/Source/cmake/FindGI.cmake
+@@ -340,7 +340,7 @@ function(GI_INTROSPECT namespace nsversion header)
+         DEPENDS ${gir_deps} ${gir_srcs}
+         VERBATIM
+         COMMAND_EXPAND_LISTS
+-        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}"
++        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS}"
+             "${GI_SCANNER_EXE}" --quiet --warn-all --warn-error --no-libtool
+             "--output=${gir_path}"
+             "--library=$<TARGET_FILE_BASE_NAME:${opt_TARGET}>"
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch b/meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch
deleted file mode 100644
index 2c6be87902..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-gstreamer-include-paths.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 25efd1478b48b5406fdab3b7b9c1f7e0ef95a7ed Mon Sep 17 00:00:00 2001
-From: Pablo Saavedra <psaavedra@igalia.com>
-Date: Mon, 27 Jun 2022 16:56:04 -0700
-Subject: [PATCH] Fix include gstreamer path on cross compiler toolchains
- https://bugs.webkit.org/show_bug.cgi?id=241483
-
-Reviewed by Adrian Perez de Castro.
-
-Set the include paths for the gstreamer components to the full path
-using the find_path(). This function relies in CMAKE_FIND_ROOT_PATH to
-find the right place where the includes they are. This fixes possible
-warnings/errors on cross toolchains using -Wpoison-system-directories
-and -Werror=poison-system-directories.
-
-* Source/cmake/FindGStreamer.cmake:
-
-Canonical link: https://commits.webkit.org/251895@main
-
-Upstream-Status: Backport [2.37.1 https://github.com/WebKit/WebKit/commit/25efd1478b48b5406fdab3b7b9c1f7e0ef95a7ed]
----
- Source/cmake/FindGStreamer.cmake | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Source/cmake/FindGStreamer.cmake b/Source/cmake/FindGStreamer.cmake
-index 3216f6974b53..b65a11f30871 100644
---- a/Source/cmake/FindGStreamer.cmake
-+++ b/Source/cmake/FindGStreamer.cmake
-@@ -75,12 +75,20 @@ macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
-     # ${includedir}/gstreamer-1.0 which remains correct. The issue here is that
-     # we don't rely on the `Cflags`, cmake fails to generate a proper
-     # `.._INCLUDE_DIRS` variable in this case. So we need to do it here...
-+
-+    # Populate the list initially from the _INCLUDE_DIRS result variable.
-+    set(${_component_prefix}_INCLUDE_DIRS ${PC_${_component_prefix}_INCLUDE_DIRS})
-+
-     set(_include_dir "${PC_${_component_prefix}_INCLUDEDIR}")
-     string(REGEX MATCH "(.*)/gstreamer-1.0" _dummy "${_include_dir}")
-+
-     if ("${CMAKE_MATCH_1}" STREQUAL "")
--        set(${_component_prefix}_INCLUDE_DIRS "${_include_dir}/gstreamer-1.0;${PC_${_component_prefix}_INCLUDE_DIRS}")
--    else ()
--        set(${_component_prefix}_INCLUDE_DIRS "${PC_${_component_prefix}_INCLUDE_DIRS}")
-+        find_path(${_component_prefix}_RESOLVED_INCLUDEDIR NAMES "${_include_dir}/gstreamer-1.0")
-+        # Only add the resolved path from `_INCLUDEDIR` if found.
-+        if (${_component_prefix}_RESOLVED_INCLUDEDIR)
-+            list(APPEND ${_component_prefix}_INCLUDE_DIRS
-+                 "${${_component_prefix}_RESOLVED_INCLUDEDIR}")
-+        endif ()
-     endif ()
- 
-     find_library(${_component_prefix}_LIBRARIES
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.2.bb
similarity index 94%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.2.bb
index f3e1adee70..616416f6dc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.2.bb
@@ -11,16 +11,13 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
-           file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-           file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
-           file://fix-gstreamer-include-paths.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            "
-SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
+SRC_URI[sha256sum] = "f3eb82899651f583b4d99cacd16af784a1a7710fce9e7b6807bd6ccde909fe3e"
 
-inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
+inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
@@ -84,7 +81,7 @@ setup_python_link() {
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
+		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
                 -DPYTHON_EXECUTABLE=`which python3` \
                 -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
-- 
2.30.2


