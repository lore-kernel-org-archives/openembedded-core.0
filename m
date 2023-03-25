Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C23C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 07:44:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17261.1679730284417255467
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 00:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qtbqeUyV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24482fab1e=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32P7ibcv004246
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 07:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=S4ToK0euB911MJz6qfOyU4b7E/CS9pXZR0IsxTvj6Y8=;
 b=qtbqeUyVMs6l1FpGXYJ3V15zgzwDwIP6v2+QG7xBI+BPy9h2jOQZ7ORCzktRvgQwqJ4x
 flICS+oLRwcqmX5G4wedGfaBuow6o9C9RsXeWX6N8eUJUH31X9HMB+a7HT7XiNyXpaOY
 4uZn3/QQN4rcJFSnUWLejErwVdTBqKReaJvlz0eZHrT4C9VVoWEjlz7tpAnCz3yxZGQM
 859IWHu+qNkspAJcOKt8EUoyYTfU8LbYF3HmX8mvm5hNq6D3cM9jWtn2sAO+hTgv2Khd
 3G263GDQcOY52YOD7QjAONNhQC6QPTOA347CqCYP1TQDo4LHns93/qHxqpgJY5WNQqMG eg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbr5vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 07:44:43 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sat, 25 Mar 2023 00:44:42 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 25 Mar 2023 00:44:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: 2.38.5 -> 2.40.0
Date: Sat, 25 Mar 2023 15:44:39 +0800
Message-ID: <20230325074439.21643-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: oxneSk7TSv5bhsPT_XXwNw4NVvanITvu
X-Proofpoint-ORIG-GUID: oxneSk7TSv5bhsPT_XXwNw4NVvanITvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303250063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 07:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179088

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.38.5 to 2.40.0
* remove d318bb461f040b90453bc4e100dcf967243ecd98.patch which applied already
* rebase 0d3344e17d258106617b0e6d783d073b188a2548.patch
* add dependency unifdef-native
* remove packgeconfig 'opengl' that ENABLE_GRAPHICS_CONTEXT_GL has been
  removed and replaced with ENABLE(WEBGL)[1]
* remove packageconfig 'angle' that non-ANGLE WebGL implementations has
  been removed[2]
* add packageconfig 'gst-gl' that USE_GSTREAMER_GL invokes functions
  from gstreamer1.0-plugins-base which only build with gles2 and egl
* add packageconfig 'gst-transcoder' which depends on gstreamer1.0-plugins-bad
* disable USE_AVIF
* adjust indent by replacing tabs with spaces

Highlights of the WebKitGTK 2.40.0 release[3]
* New GTK4 API is now stable.
* Use ANGLE for WebGL implementation and enable WebGL2.
* Prefer EGL over X11, intead of GLX, where available.
* Add support for speech synthesis using Flite.
* Enable the async clipboard API.
* Add API to query the permission state of web features.
* Add API to support asynchronously returning values from user script messages.
* Make it possible to handle WebKitDownload::decide-destination signal asynchronously.
* Add new JavaScript execution APIs.
* Make webkit://gpu output exportable as JSON.
* Fix large memory allocation when uploading content.

[1]: https://github.com/WebKit/WebKit/commit/09da49a2cc5dfea8eafe7cbcefd6b6f8a17c7f38
[2]: https://github.com/WebKit/WebKit/commit/d257ea20c5996ada3c009a6a2f4a639f92c0e2ca
[3]: https://webkitgtk.org/2023/03/17/webkitgtk2.40.0-released.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch | 34 +++++++++++++++++++
 ...44e17d258106617b0e6d783d073b188a2548.patch | 32 ++++++++++++-----
 ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.0.bb} | 29 ++++++++--------
 3 files changed, 72 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.0.bb} (87%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch
new file mode 100644
index 0000000000..dc56bbb92c
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/11913]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From de30f1a1caf81902d254e046e382f9cf9cd62c58 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 24 Mar 2023 17:58:29 +0800
+Subject: [PATCH] FindLibGcrypt.cmake: check PC_GCRYPT_FOUND
+
+After `pkg_check_modules(PC_GCRYPT QUIET libgcrypt)` in
+FindLibGcrypt.cmake, PC_GCRYPT_FOUND will be set but PC_GCRYPT is kept
+empty. So check PC_GCRYPT_FOUND instead.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Source/cmake/FindLibGcrypt.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/cmake/FindLibGcrypt.cmake b/Source/cmake/FindLibGcrypt.cmake
+index 8bee72963902..2e84cfc4e9b1 100644
+--- a/Source/cmake/FindLibGcrypt.cmake
++++ b/Source/cmake/FindLibGcrypt.cmake
+@@ -49,7 +49,7 @@ if (PkgConfig_FOUND)
+     set(LibGcrypt_VERSION ${PC_GCRYPT_VERSION})
+ endif ()
+ 
+-if (LIBGCRYPTCONFIG_SCRIPT AND NOT PC_GCRYPT)
++if (LIBGCRYPTCONFIG_SCRIPT AND NOT PC_GCRYPT_FOUND)
+     execute_process(
+         COMMAND "${LIBGCRYPTCONFIG_SCRIPT}" --prefix
+         RESULT_VARIABLE CONFIGSCRIPT_RESULT
+-- 
+2.34.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
index 32f92f7ff5..d47e7ac419 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -35,14 +35,16 @@ Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
- .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
+ .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
  .../graphics/filters/DistantLightSource.h     |  4 ++
  .../platform/graphics/filters/FELighting.h    |  7 ---
  .../graphics/filters/PointLightSource.h       |  4 ++
  .../graphics/filters/SpotLightSource.h        |  4 ++
  .../software/FELightingSoftwareApplier.h      | 16 ++++++
- 7 files changed, 57 insertions(+), 36 deletions(-)
+ 7 files changed, 56 insertions(+), 35 deletions(-)
 
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+index f6ff8c20..42a97ffc 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
 @@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
@@ -63,6 +65,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
      // Calling a powf function from the assembly code would require to save
      // and reload a lot of NEON registers. Since the base is in range [0..1]
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
+index b17c603d..e4629cda 100644
 --- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 +++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
 @@ -24,14 +24,15 @@
@@ -104,7 +108,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          0,
          0,
          0,
-@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
+@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
      // Set light source arguments.
      floatArguments.constOne = 1;
  
@@ -133,7 +137,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          floatArguments.lightX = spotLightSource.position().x();
          floatArguments.lightY = spotLightSource.position().y();
          floatArguments.lightZ = spotLightSource.position().z();
-@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
+@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
          if (spotLightSource.specularExponent() == 1)
              neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
      } else {
@@ -142,7 +146,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
          floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
          floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
-@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
+@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
      // Set lighting arguments.
      floatArguments.surfaceScale = data.surfaceScale;
      floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
@@ -192,16 +196,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
              }
              parallelJobs.execute();
              return;
-@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
+@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
  } // namespace WebCore
  
  #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
 -
 -#endif // FELightingNEON_h
+diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
+index 70c6512f..b032c82e 100644
 --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-@@ -25,6 +25,10 @@
- #include "LightSource.h"
+@@ -26,6 +26,10 @@
+ #include <wtf/ArgumentCoder.h>
  #include <wtf/Ref.h>
  
 +namespace WTF {
@@ -211,6 +217,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  namespace WebCore {
  
  class DistantLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
+index 53beb596..e78a9354 100644
 --- a/Source/WebCore/platform/graphics/filters/FELighting.h
 +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
 @@ -35,8 +35,6 @@
@@ -222,7 +230,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  class FELighting : public FilterEffect {
  public:
      const Color& lightingColor() const { return m_lightingColor; }
-@@ -67,11 +65,6 @@ protected:
+@@ -64,11 +62,6 @@ protected:
  
      std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
  
@@ -234,6 +242,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Color m_lightingColor;
      float m_surfaceScale;
      float m_diffuseConstant;
+diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
+index 3a5723f0..675d63f5 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
@@ -247,6 +257,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  namespace WebCore {
  
  class PointLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
+index 684626f7..dea58389 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
@@ -260,6 +272,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  namespace WebCore {
  
  class SpotLightSource : public LightSource {
+diff --git a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
+index c974d921..e2896660 100644
 --- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
 +++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
 @@ -36,6 +36,7 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
similarity index 87%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
index e52920883a..f3d426ed7f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.0.bb
@@ -13,9 +13,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://0001-FindLibGcrypt.cmake-check-PC_GCRYPT_FOUND.patch \
            "
-SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
+SRC_URI[sha256sum] = "a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -27,6 +27,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
 DEPENDS += " \
           ruby-native \
           gperf-native \
+          unifdef-native \
           cairo \
           harfbuzz \
           jpeg \
@@ -42,8 +43,8 @@ DEPENDS += " \
 
 PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2 gst-gl', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
                    enchant \
                    libsecret \
@@ -51,13 +52,11 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
-PACKAGECONFIG[angle] = "-DUSE_ANGLE_WEBGL=ON,-DUSE_ANGLE_WEBGL=OFF"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11 libxcomposite libxdamage libxrender libxt"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/egl"
-PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/egl"
 PACKAGECONFIG[opengl-or-es] = "-DUSE_OPENGL_OR_ES=ON,-DUSE_OPENGL_OR_ES=OFF"
 PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
@@ -69,6 +68,8 @@ PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
 PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
+PACKAGECONFIG[gst-gl] ="-DUSE_GSTREAMER_GL=ON,-DUSE_GSTREAMER_GL=OFF"
+PACKAGECONFIG[gst-transcoder] ="-DUSE_GSTREAMER_TRANSCODER=ON,-DUSE_GSTREAMER_TRANSCODER=OFF,gstreamer1.0-plugins-bad"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
@@ -79,14 +80,15 @@ setup_python_link() {
 }
 
 EXTRA_OECMAKE = " \
-		-DPORT=GTK \
-		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-		-DENABLE_MINIBROWSER=ON \
+                -DPORT=GTK \
+                ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+                ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
+                -DENABLE_MINIBROWSER=ON \
                 -DPYTHON_EXECUTABLE=`which python3` \
                 -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                 -DENABLE_GAMEPAD=OFF \
-		"
+                -DUSE_AVIF=OFF \
+                "
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
@@ -158,8 +160,7 @@ src_package_preprocess () {
             ${B}/JavaScriptCore/DerivedSources/*.h \
             ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
             ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
-
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.h
 }
 
-- 
2.17.1


