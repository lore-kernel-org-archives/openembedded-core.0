Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA6EC636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 05:50:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8250.1676267450103511677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 21:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VnpjjTfa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14080584dc=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31D5mUUm021753
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:50:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=/K2s5aqJyjmzFnGXEo8YA/e8dy5DW+Y87HFC3d8pAcM=;
 b=VnpjjTfamJAvMOppEAtDOffZL1PlDJmhvvt0ErNqXJTUuQ93jSYVTuShVZcZu1JbSAJI
 4tyqRYlclCsy117MHpkyXgmld5ZqC8YV7TumI1SSWVu2UhgF3ASCmI8s/JzLQY/U4u21
 UyNq72sR73s0AR2cYd29kZ2pqiBgWCsi0Q7smpG7LxvIE+fsp9Ua+YS9ngMyhh30L1Nw
 wltIXpX+OBzF5Mey7TMXEfwZv8KZxMbyxu6nobrwE0bNs6WJK1r2VWtbNUYxy+joA5Z4
 I7oKQ3Pw01ksm+R7HOM2ZawJ66+Q6L6CM1XwMxePoqGMj0yZkZxJaDmjJt0zxdJFaqTI pQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdrs3dr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:50:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sun, 12 Feb 2023 21:50:49 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 12 Feb 2023 21:50:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/1] webkitgtk: 2.36.8 -> 2.38.4
Date: Mon, 13 Feb 2023 13:50:43 +0800
Message-ID: <20230213055043.15294-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230213055043.15294-1-kai.kang@windriver.com>
References: <20230213055043.15294-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GFrY-XCI1hUh4iqvlgwnkNP66Pq9ly6Y
X-Proofpoint-GUID: GFrY-XCI1hUh4iqvlgwnkNP66Pq9ly6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 05:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177084

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk 2.36.8 to latest version 2.38.4 which solves a lot of
CVEs. Copies recipe and patches from master branch and only keep value
PACKAGECONFIG_SOUP with 'soup2'.

According to webkitgtk release information file NEWS[1], it adds new
apis but no removal from webkitgtk 2.35.3 to 2.38.4. Compare header
files, webkitgtk 2.38.4

* updates version numbers
* adds new data structures and apis
* marks some existing apis deprecated

[1]: https://github.com/WebKit/WebKit/blob/webkitglib/2.38/Source/WebKit/gtk/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...spection.cmake-prefix-variables-obta.patch |  39 +--
 .../0001-Fix-build-without-opengl-or-es.patch | 133 --------
 ...tings-so-that-gtkdoc-generation-work.patch |  47 ---
 ...trospection-files-do-not-quote-CFLAG.patch |  78 -----
 ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
 ...bb461f040b90453bc4e100dcf967243ecd98.patch |  30 ++
 ...ebkitgtk_2.36.8.bb => webkitgtk_2.38.4.bb} |  15 +-
 7 files changed, 348 insertions(+), 290 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.8.bb => webkitgtk_2.38.4.bb} (92%)

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
deleted file mode 100644
index 3d02be9894..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 01f5ab0edf3dd8f76d37fd36c2dcd3108be33a7b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 4 Apr 2022 21:20:05 +0200
-Subject: [PATCH] When building introspection files, do not quote CFLAGS.
-
-This does not seem to be propagated to the compiler correctly:
-
-In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/syslimits.h:7,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/limits.h:34,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/lib/glib-2.0/include/glibconfig.h:11,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/gtypes.h:32,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:32,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:30,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/build/Source/JavaScriptCore/tmp-introspectb51ks33n/JavaScriptCore-4.0.c:2:
-/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/limits.h:203:75: error: no include path in which to search for limits.h
-  203 | #include_next <limits.h>                /* recurse down to the real one */
-      |                                                                           ^
-In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:32,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:30,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/build/Source/JavaScriptCore/tmp-introspectb51ks33n/JavaScriptCore-4.0.c:2:
-/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/gtypes.h:35:10: fatal error: time.h: No such file or directory
-   35 | #include <time.h>
-      |          ^~~~~~~~
-compilation terminated.
-Traceback (most recent call last):
-  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/unixccompiler.py", line 117, in _compile
-    self.spawn(compiler_so + cc_args + [src, '-o', obj] +
-  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/ccompiler.py", line 910, in spawn
-    spawn(cmd, dry_run=self.dry_run)
-  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/spawn.py", line 91, in spawn
-    raise DistutilsExecError(
-distutils.errors.DistutilsExecError: command '/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc' failed with exit code 1
-
-Upstream-Status: Inappropriate [upstream has rewritten the whole thing as of https://github.com/WebKit/WebKit/commit/b0ae032850bb6b2672051bab8032fc9f9ef5eb97]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Source/JavaScriptCore/PlatformGTK.cmake | 2 +-
- Source/WebKit/PlatformGTK.cmake         | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
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
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
new file mode 100644
index 0000000000..32f92f7ff5
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -0,0 +1,296 @@
+From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 2 Jun 2022 11:19:06 +0300
+Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
+ path seems unused https://bugs.webkit.org/show_bug.cgi?id=241182
+
+Reviewed by NOBODY (OOPS!).
+
+Move the NEON fast path for the SVG lighting filter effects into
+FELightingSoftwareApplier, and arrange to actually use them by
+forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
+
+Some changes were needed to adapt platformApplyNeon() to the current
+state of filters after r286140. This was not detected because the code
+bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
+not get used much these days: CPU(ARM_THUMB2) is more common. It should
+be possible to use the NEON fast paths also in Thumb mode, but that is
+left for a follow-up fix.
+
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
+(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
+(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
+(WebCore::FELighting::platformApplyNeonWorker): Deleted.
+(WebCore::FELighting::getPowerCoefficients): Deleted.
+* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
+(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
+(WebCore::FELighting::platformApplyNeon): Deleted.
+* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
+* Source/WebCore/platform/graphics/filters/FELighting.h:
+* Source/WebCore/platform/graphics/filters/PointLightSource.h:
+* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
+* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
+---
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
+ .../graphics/filters/DistantLightSource.h     |  4 ++
+ .../platform/graphics/filters/FELighting.h    |  7 ---
+ .../graphics/filters/PointLightSource.h       |  4 ++
+ .../graphics/filters/SpotLightSource.h        |  4 ++
+ .../software/FELightingSoftwareApplier.h      | 16 ++++++
+ 7 files changed, 57 insertions(+), 36 deletions(-)
+
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
+     return s_FELightingConstantsForNeon;
+ }
+ 
+-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
+ {
+     neonDrawLighting(parameters);
+ }
+@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
+     "b .lightStrengthCalculated" NL
+ ); // NOLINT
+ 
+-int FELighting::getPowerCoefficients(float exponent)
++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
+ {
+     // Calling a powf function from the assembly code would require to save
+     // and reload a lot of NEON registers. Since the base is in range [0..1]
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+@@ -24,14 +24,15 @@
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#ifndef FELightingNEON_h
+-#define FELightingNEON_h
++#pragma once
+ 
+ #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+ 
+-#include "FELighting.h"
++#include "FELightingSoftwareApplier.h"
++#include "ImageBuffer.h"
+ #include "PointLightSource.h"
+ #include "SpotLightSource.h"
++#include <wtf/ObjectIdentifier.h>
+ #include <wtf/ParallelJobs.h>
+ 
+ namespace WebCore {
+@@ -93,14 +94,14 @@ extern "C" {
+ void neonDrawLighting(FELightingPaintingDataForNeon*);
+ }
+ 
+-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
+ {
+-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
+-    FELightingPaintingDataForNeon neonData = {
++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
++    WebCore::FELightingPaintingDataForNeon neonData = {
+         data.pixels->data(),
+         1,
+-        data.widthDecreasedByOne - 1,
+-        data.heightDecreasedByOne - 1,
++        data.width - 2,
++        data.height - 2,
+         0,
+         0,
+         0,
+@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
+     // Set light source arguments.
+     floatArguments.constOne = 1;
+ 
+-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
+ 
+     floatArguments.colorRed = color.red;
+     floatArguments.colorGreen = color.green;
+     floatArguments.colorBlue = color.blue;
+     floatArguments.padding4 = 0;
+ 
+-    if (m_lightSource->type() == LS_POINT) {
++    if (data.lightSource->type() == LS_POINT) {
+         neonData.flags |= FLAG_POINT_LIGHT;
+-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
+         floatArguments.lightX = pointLightSource.position().x();
+         floatArguments.lightY = pointLightSource.position().y();
+         floatArguments.lightZ = pointLightSource.position().z();
+         floatArguments.padding2 = 0;
+-    } else if (m_lightSource->type() == LS_SPOT) {
++    } else if (data.lightSource->type() == LS_SPOT) {
+         neonData.flags |= FLAG_SPOT_LIGHT;
+-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
+         floatArguments.lightX = spotLightSource.position().x();
+         floatArguments.lightY = spotLightSource.position().y();
+         floatArguments.lightZ = spotLightSource.position().z();
+@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
+         if (spotLightSource.specularExponent() == 1)
+             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
+     } else {
+-        ASSERT(m_lightSource->type() == LS_DISTANT);
++        ASSERT(data.lightSource->type() == LS_DISTANT);
+         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
+         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
+         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
+@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
+     // Set lighting arguments.
+     floatArguments.surfaceScale = data.surfaceScale;
+     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
+-    if (m_lightingType == FELighting::DiffuseLighting)
+-        floatArguments.diffuseConstant = m_diffuseConstant;
++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
++        floatArguments.diffuseConstant = data.diffuseConstant;
+     else {
+         neonData.flags |= FLAG_SPECULAR_LIGHT;
+-        floatArguments.diffuseConstant = m_specularConstant;
+-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
+-        if (m_specularExponent == 1)
++        floatArguments.diffuseConstant = data.specularConstant;
++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
++        if (data.specularExponent == 1)
+             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
+     }
+     if (floatArguments.diffuseConstant == 1)
+         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
+ 
+-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
+     if (optimalThreadNumber > 1) {
+         // Initialize parallel jobs
+-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
+ 
+         // Fill the parameter array
+         int job = parallelJobs.numberOfJobs();
+         if (job > 1) {
+             int yStart = 1;
+-            int yStep = (data.heightDecreasedByOne - 1) / job;
++            int yStep = (data.height - 2) / job;
+             for (--job; job >= 0; --job) {
+                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
+                 params = neonData;
+                 params.yStart = yStart;
+-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
++                params.pixels += (yStart - 1) * data.width * 4;
+                 if (job > 0) {
+                     params.absoluteHeight = yStep;
+                     yStart += yStep;
+                 } else
+-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
++                    params.absoluteHeight = (data.height - 1) - yStart;
+             }
+             parallelJobs.execute();
+             return;
+@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
+ } // namespace WebCore
+ 
+ #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
+-
+-#endif // FELightingNEON_h
+--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+@@ -25,6 +25,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class DistantLightSource : public LightSource {
+--- a/Source/WebCore/platform/graphics/filters/FELighting.h
++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
+@@ -35,8 +35,6 @@
+ 
+ namespace WebCore {
+ 
+-struct FELightingPaintingDataForNeon;
+-
+ class FELighting : public FilterEffect {
+ public:
+     const Color& lightingColor() const { return m_lightingColor; }
+@@ -67,11 +65,6 @@ protected:
+ 
+     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
+ 
+-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
+-    static int getPowerCoefficients(float exponent);
+-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
+-#endif
+-
+     Color m_lightingColor;
+     float m_surfaceScale;
+     float m_diffuseConstant;
+--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class PointLightSource : public LightSource {
+--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+@@ -26,6 +26,10 @@
+ #include "LightSource.h"
+ #include <wtf/Ref.h>
+ 
++namespace WTF {
++class TextStream;
++} // namespace WTF
++
+ namespace WebCore {
+ 
+ class SpotLightSource : public LightSource {
+--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+@@ -36,6 +36,7 @@
+ namespace WebCore {
+ 
+ class FELighting;
++struct FELightingPaintingDataForNeon;
+ 
+ class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
+     WTF_MAKE_FAST_ALLOCATED;
+@@ -132,8 +133,23 @@ private:
+ 
+     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
+     static void applyPlatformGenericWorker(ApplyParameters*);
++
++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
++    static int getPowerCoefficients(float exponent);
++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
++
++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
++    {
++        applyPlatformNeon(data, paintingData);
++    }
++#else
+     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
++#endif
++
+     static void applyPlatform(const LightingData&);
+ };
+ 
+ } // namespace WebCore
++
++#include "FELightingNEON.h"
diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
new file mode 100644
index 0000000000..1ff9dcea7e
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
@@ -0,0 +1,30 @@
+From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 16 Jan 2023 16:55:26 -0800
+Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include in
+ ANGLE https://bugs.webkit.org/show_bug.cgi?id=250689
+
+Unreviewed build fix.
+
+* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
+
+Canonical link: https://commits.webkit.org/258968@main
+
+Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=250689]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
+index 94cb93e01fc0..ec7bda372f30 100644
+--- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
++++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
+@@ -12,6 +12,7 @@
+ 
+ #include <algorithm>
+ #include <array>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
similarity index 92%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
index 7b2c5c6e36..4359f7431f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
@@ -9,23 +9,22 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
                     file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
                     "
 
-SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
+SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
-           file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-           file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
-           file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
+           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
+           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
            "
-SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
+SRC_URI[sha256sum] = "4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f64455e1ccf9693cc1d36"
 
-inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
+inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
-DEPENDS = " \
+DEPENDS += " \
           ruby-native \
           gperf-native \
           cairo \
@@ -82,7 +81,7 @@ setup_python_link() {
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
+		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
                 -DPYTHON_EXECUTABLE=`which python3` \
                 -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
-- 
2.17.1


