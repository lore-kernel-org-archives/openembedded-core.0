Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F64EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:00:58 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.18763.1687964451208362090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Qg2jH5HE;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-98934f000a5so702109866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687964449; x=1690556449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vi5t2a9MYuyp/wIaphUCkXkHQWz5PuRamRT27WH+Db8=;
        b=Qg2jH5HEumQoFEMGO06HKnq/vhvxBaJED9T/wWZmqjqv/soO3lhO5XmY1A9ceDAPR6
         smSslDzvLxEpO8WLDoW+/yYWpVelbK+0Dvfz+3dYu8gV0jSkvjNb40r2b7h7Jc739ay9
         EPC4RZIq19tVgtYNFOqvpB3Z3bhS6uwvsadXQtZdV/XL4Lh4CVejnHXhhLRvZe4SYxdR
         vo8EgNxERGEHijvOVWEf7+bDBFG+GnbNa2RTw4N3JH+bC6UUvAhuKwjpsnTo7+buttL2
         koiGcqfwojt1mYuURi7RaM1zF9pHj2rQvrIyvBPBnXYcZUgt4U3lUhJylGB0hu436Y1h
         nZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964449; x=1690556449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vi5t2a9MYuyp/wIaphUCkXkHQWz5PuRamRT27WH+Db8=;
        b=ZB3wLSIAYQwu577MIdGby8tIDdJiLryIASe9r0MZSNeN3m1ZaX8H0ZK1DpFTLle8sH
         ur5YAXJOGUGP8O0SQeHCuprY7wtdhwJXP+n0Yc6R7IoIcHy0Y0hQmhJt072b2tHXGka/
         H5x/DFepbBGtcbiuoMacT3Ac0wnXzjqH0sE1XRcEsf/xuP2A9mTtHymRJCOcJa2mAR36
         N/hrIf+X7CWEtKXcxMIuBllZ/m8UjfpKNdno/loP5zST7N0RifAlFDT7toggYBHpddUU
         joqwjPvP20wEjvSwsIWbSkf18dH97mU4V/9B/t2BZRD8Xdwe0DNGH3DGkudQznJ5eN2y
         QRcQ==
X-Gm-Message-State: AC+VfDyrhjVweAVdsPN2KFENUEqIUayJyd1wgW451fnyQkGhPGxMY/BG
	ymdIRnuWdqeE5R4c1v4lUpWQWUDbQjnglA==
X-Google-Smtp-Source: ACHHUZ4eor9Tb9OZ0cWnZ1W7f8cSF8ydoMX0IADZRB2hyW3e12CvlmnIpmtu5qpQU+EavouDTcJjcQ==
X-Received: by 2002:a17:907:848:b0:988:aeb7:2a37 with SMTP id ww8-20020a170907084800b00988aeb72a37mr24888444ejb.33.1687964449456;
        Wed, 28 Jun 2023 08:00:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906720300b009926928d486sm969433ejk.35.2023.06.28.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:00:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] webkitgtk: update 2.38.5 -> 2.40.2
Date: Wed, 28 Jun 2023 17:00:41 +0200
Message-Id: <20230628150043.70814-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230628150043.70814-1-alex@linutronix.de>
References: <20230628150043.70814-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183589

Drop backports.

Add extra options that require additional dependencies, and fail without them.

Disable the recipe on ancient x86 without SSE support; SSE is now
required.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
 ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
 ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
 ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
 ...0b55f52ff8b883296f4845269e2ed746acb3.patch | 37 ----------------
 ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
 ...ebkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} | 16 ++++---
 7 files changed, 111 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb => webkitgtk_2.40.2.bb} (90%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-gnome/epiphany/epiphany_43.1.bb
index ea22723a97a..c97ede459da 100644
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
index 00000000000..bbe265059d5
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
index 32f92f7ff5f..34e0ff9af38 100644
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
index 00000000000..79da855ff45
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
diff --git a/meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch b/meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch
deleted file mode 100644
index 762de409957..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 93920b55f52ff8b883296f4845269e2ed746acb3 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Fri, 31 Mar 2023 12:24:09 -0700
-Subject: [PATCH] Fix build of SourceBrush.cpp
- https://bugs.webkit.org/show_bug.cgi?id=254821
-
-Unreviewed build fix.
-
-* Source/WebCore/platform/graphics/SourceBrush.cpp:
-(WebCore::SourceBrush::setGradient):
-(WebCore::SourceBrush::setPattern):
-
-Canonical link: https://commits.webkit.org/262434@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/93920b55f52ff8b883296f4845269e2ed746acb3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/platform/graphics/SourceBrush.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/Source/WebCore/platform/graphics/SourceBrush.cpp
-+++ b/Source/WebCore/platform/graphics/SourceBrush.cpp
-@@ -65,12 +65,12 @@ Pattern* SourceBrush::pattern() const
- 
- void SourceBrush::setGradient(Ref<Gradient>&& gradient, const AffineTransform& spaceTransform)
- {
--    m_brush = { Brush::LogicalGradient { WTFMove(gradient), spaceTransform } };
-+    m_brush = Brush { Brush::LogicalGradient { { WTFMove(gradient) }, spaceTransform } };
- }
- 
- void SourceBrush::setPattern(Ref<Pattern>&& pattern)
- {
--    m_brush = { WTFMove(pattern) };
-+    m_brush = Brush { WTFMove(pattern) };
- }
- 
- WTF::TextStream& operator<<(TextStream& ts, const SourceBrush& brush)
diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
deleted file mode 100644
index 1ff9dcea7ef..00000000000
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
index f7fa6dfb98c..ac6681a0ced 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
@@ -13,10 +13,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
-           file://93920b55f52ff8b883296f4845269e2ed746acb3.patch \
+           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
+           file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch \
            "
-SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
+SRC_URI[sha256sum] = "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -28,6 +28,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
 DEPENDS += " \
           ruby-native \
           gperf-native \
+          unifdef-native \
           cairo \
           harfbuzz \
           jpeg \
@@ -72,6 +73,8 @@ PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
 PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
+PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
+PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
@@ -137,6 +140,9 @@ ARM_INSTRUCTION_SET:armv7a = "thumb"
 ARM_INSTRUCTION_SET:armv7r = "thumb"
 ARM_INSTRUCTION_SET:armv7ve = "thumb"
 
+# ANGLE requires SSE support as of webkit 2.40.x on 32 bit x86
+COMPATIBLE_HOST:x86 = "${@bb.utils.contains_any('TUNE_FEATURES', 'core2 corei7', '.*', 'null', d)}"
+
 # introspection inside qemu-arm hangs forever on musl/arm builds
 # therefore disable GI_DATA
 GI_DATA_ENABLED:libc-musl:armv7a = "False"
@@ -152,8 +158,8 @@ src_package_preprocess () {
             ${B}/JavaScriptCore/DerivedSources/*.h \
             ${B}/JavaScriptCore/DerivedSources/yarr/*.h \
             ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.cpp \
-            ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
+            ${B}/WebCore/DerivedSources/*.cpp \
+            ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 
 }
 
-- 
2.30.2


