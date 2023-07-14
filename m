Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31D1C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 07:15:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13422.1689318912181772891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 00:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mJNFe2Q0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6559fb2604=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36E5XbGK019413
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=YuHRjHdXo+SL6YDtlix9mZ8v2y1Av8XS9i4LYEODG70=; b=
	mJNFe2Q0umNJPo9PHJmdBIR0sDQ7VAO7SplKPGW/xB4r086Kg5aMOKa2x78Y/wZn
	t0W4/01ubBuCxSKbL/dTyVwjnvw8dYwPjJDGZxli25xsu2p0/dlnj4IM+Y9nnLU8
	KLkZFQtHKJbaxni91ikIgYmJE6jv147ZAVBjsu0kPBAt/klhjupa1e39u4wbWrHT
	xnjIC/jJS8epi9NaCPPFvqXOLhmT9shwlbsrzK0iHVHv1mbUy20muoPip2kKaaO7
	gInunHONjRH1J+nrxY6NWkh0+UAU3qSLCaxfGGVhdGEwRxMFkb2ALNUqcZh1Vs94
	7OKLhopQ+BkqK85qy5MPog==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpujrh82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:15:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 00:15:09 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 00:15:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 1/1] webkitgtk: update 2.38.5 -> 2.40.2
Date: Fri, 14 Jul 2023 15:15:04 +0800
Message-ID: <20230714071504.2894925-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714071504.2894925-1-kai.kang@windriver.com>
References: <20230714071504.2894925-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8Ap8YOQ-AqGHLKzooQ6OGE5zHJxssYXm
X-Proofpoint-ORIG-GUID: 8Ap8YOQ-AqGHLKzooQ6OGE5zHJxssYXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_04,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307140066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 07:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184254

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop backports.

Add extra options that require additional dependencies, and fail without them.

Disable the recipe on ancient x86 without SSE support; SSE is now
required.

(From OE-Core rev: fdc50a50d8f2c4975584c04db0c5e0e83cf62f99)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry pick from master and update context for SRC_URI.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
 ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
 ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
 ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
 ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
 ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} | 15 +++++--
 6 files changed, 111 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} (90%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-gnome/epiphany/epiphany_43.1.bb
index ea22723a97..c97ede459d 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_43.1.bb
@@ -38,3 +38,6 @@ PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
+
+# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
+COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
new file mode 100644
index 0000000000..bbe265059d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
@@ -0,0 +1,28 @@
+From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 26 Jun 2023 14:30:02 +0200
+Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducibility
+ of __TIMESTAMP__
+
+__TIMESTAMP__ refers to mtime of the file that contains it, which is unstable
+and breaks binary reproducibility when the file is generated at build time. To ensure
+this does not happen, mtime should be set from the original file.
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/15293]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/JavaScriptCore/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index 43dc22ff..c2e3b1cd 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -159,6 +159,7 @@ add_custom_command(
+     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
+     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in
+     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in > ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
++    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
+             VERBATIM
+ )
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
index 32f92f7ff5..34e0ff9af3 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -1,8 +1,8 @@
-From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
+From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
-Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
- path seems unused https://bugs.webkit.org/show_bug.cgi?id=241182
+Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
+ unused https://bugs.webkit.org/show_bug.cgi?id=241182
 
 Reviewed by NOBODY (OOPS!).
 
@@ -30,19 +30,21 @@ left for a follow-up fix.
 * Source/WebCore/platform/graphics/filters/PointLightSource.h:
 * Source/WebCore/platform/graphics/filters/SpotLightSource.h:
 * Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
----
+
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+---
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
diff --git a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
new file mode 100644
index 0000000000..79da855ff4
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
@@ -0,0 +1,41 @@
+From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
+From: Diego Pino Garcia <dpino@igalia.com>
+Date: Mon, 22 May 2023 19:58:50 -0700
+Subject: [PATCH] [GLIB] Fix build error after 264196@main
+ https://bugs.webkit.org/show_bug.cgi?id=256917
+
+Reviewed by Michael Catanzaro.
+
+Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
+enabled.
+
+* Source/WTF/wtf/glib/Sandbox.cpp:
+(WTF::isInsideUnsupportedContainer):
+
+Canonical link: https://commits.webkit.org/264395@main
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandbox.cpp
+index 7d84e830ab33e..9b07bb8cb5a9b 100644
+--- a/Source/WTF/wtf/glib/Sandbox.cpp
++++ b/Source/WTF/wtf/glib/Sandbox.cpp
+@@ -36,6 +36,7 @@ bool isInsideFlatpak()
+     return returnValue;
+ }
+ 
++#if ENABLE(BUBBLEWRAP_SANDBOX)
+ bool isInsideUnsupportedContainer()
+ {
+     static bool inContainer = g_file_test("/run/.containerenv", G_FILE_TEST_EXISTS);
+@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
+ 
+     return inContainer && !supportedContainer;
+ }
++#endif
+ 
+ bool isInsideSnap()
+ {
diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
deleted file mode 100644
index 1ff9dcea7e..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 16 Jan 2023 16:55:26 -0800
-Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include in
- ANGLE https://bugs.webkit.org/show_bug.cgi?id=250689
-
-Unreviewed build fix.
-
-* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
-
-Canonical link: https://commits.webkit.org/258968@main
-
-Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=250689]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-index 94cb93e01fc0..ec7bda372f30 100644
---- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-+++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
-@@ -12,6 +12,7 @@
- 
- #include <algorithm>
- #include <array>
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
similarity index 90%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
index 36c6233b33..ac6681a0ce 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
@@ -13,9 +13,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
+           file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch \
            "
-SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
+SRC_URI[sha256sum] = "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -27,6 +28,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
 DEPENDS += " \
           ruby-native \
           gperf-native \
+          unifdef-native \
           cairo \
           harfbuzz \
           jpeg \
@@ -71,6 +73,8 @@ PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
 PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
+PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
+PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
@@ -136,6 +140,9 @@ ARM_INSTRUCTION_SET:armv7a = "thumb"
 ARM_INSTRUCTION_SET:armv7r = "thumb"
 ARM_INSTRUCTION_SET:armv7ve = "thumb"
 
+# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
+COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
+
 # introspection inside qemu-arm hangs forever on musl/arm builds
 # therefore disable GI_DATA
 GI_DATA_ENABLED:libc-musl:armv7a = "False"
@@ -151,8 +158,8 @@ src_package_preprocess () {
             ${B}/JavaScriptCore/DerivedSources/*.h \
             ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
             ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
+            ${B}/WebCore/DerivedSources/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 
 }
 
-- 
2.34.1


