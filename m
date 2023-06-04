Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B6DC77B73
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 04:11:39 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.11995.1685851898338986255
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 21:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=ToxjCynB;
 spf=pass (domain: underview.tech, ip: 209.85.167.172, mailfrom: vince@underview.tech)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39817f3e08eso1991609b6e.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1685851897; x=1688443897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeEPEPXk134S6yirhT+GG1R9FolyFoYkpZoX6/KzE9s=;
        b=ToxjCynBXP5XMwJbuujSqLr7YWHdWbETGMA7PW1WZ8hbxZ8cJquAv/r/vOKBkBkA2N
         vdGhjaZ941WBIl8TYGSXjb1vd3D9164QUa8ojSrTaMsEJO0fnsFIffDxsGEwYO5tyEHT
         m6y4w2kS4R4CXMYMFadtQUAHs83cObpnUHPjFs//yODqMVSHRTJny8pvUxIKKRnHtjTi
         Z1PdkAyCh8oAgmZWOaKv+CpSFFqKnGwAx4eDjx9KfeUD8v26Mxfm/E3smOlkMeXDod72
         cCPPk7ALtVSv8vUyoym/uQU2OMDPJsOUfiJo8ZwnPeF3y6tN0z8wqz6jPBkyEKJjgy85
         WO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685851897; x=1688443897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeEPEPXk134S6yirhT+GG1R9FolyFoYkpZoX6/KzE9s=;
        b=aNvV2lxDJn9ocHFD2ze/O+4lncRhyf8WtlwtfgmWC0k+k4PFb24ib7QpYgFx7/7loG
         sxFHZCz1PLwlUyzdKK/L0ODyTNFFQtmTy1/ZqMshDvizK8mec0r+9QamMtuIlo35KLlA
         Bx91J/4zGLUhn9ArEXCKlZrr2F3/p4uVc0+Jo81OaxHTxOPuVnavtPtbansA/g2eYwws
         PNSX8YH8nS9Kryl0XqBFLk23g2Ax4o7326PBkhBGhqopwv4+XX+DaRbSVxebowK38qh9
         QHIWF6UWmJGtXiFgps0t4OTMA1oB5bBRWoDYSkQ1Tiyg/HCGzJ0E0qCefn0VNRRSGXGq
         ZPbQ==
X-Gm-Message-State: AC+VfDwVI2aOhg/wxp62KAfH+v11znr94+UDIQ7lNcF1Oo/oMGD17Afl
	XGoT/kj5+IENI3cg8s3mBtr79WnVF3Uu8nziSIs=
X-Google-Smtp-Source: ACHHUZ6g4h86UJHFSSZ3RoZR4CaCPB+7afsUmmSpNR93kAxeMv6nDAvSL0QzehNsGnXBU+LQZQ2xhg==
X-Received: by 2002:aca:1a14:0:b0:398:4098:33e4 with SMTP id a20-20020aca1a14000000b00398409833e4mr2409154oia.29.1685851897363;
        Sat, 03 Jun 2023 21:11:37 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:dbdc:f63:d1bb:2dce])
        by smtp.gmail.com with ESMTPSA id u15-20020a54438f000000b0039810b2becbsm2058503oiv.48.2023.06.03.21.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 21:11:37 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] vulkan-validation-layers: add new recipe v1.3.243.0
Date: Sat,  3 Jun 2023 23:11:27 -0500
Message-Id: <20230604041127.35885-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 04:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182354

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulkan-validation-layers_1.3.243.0.bb     | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0f7b7287bb..b06ae43dac 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -827,6 +827,7 @@ RECIPE_MAINTAINER:pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-vulkan-validation-layers = "Vincent Davis Jr <vince@underview.tech>"
 RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
new file mode 100644
index 0000000000..6e1ef7a05d
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Vulkan Validation layers"
+DESCRIPTION = "Khronos official Vulkan validation layers to assist developers \
+in verifying that their applications correctly use the Vulkan API"
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
+
+SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.243;protocol=https"
+SRCREV = "4ac0fd8e6cb3d49105d707d9ec07f0f3aa0943d6"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang"
+
+# BUILD_TESTS            - Not required for OE builds
+# USE_ROBIN_HOOD_HASHING - Provides substantial performance improvements on all platforms.
+#                          Yocto project doesn't contain a recipe for package so disabled it.
+EXTRA_OECMAKE = "\
+    -DBUILD_TESTS=OFF \
+    -DUSE_ROBIN_HOOD_HASHING=OFF \
+    -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
+    -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+    -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+    "
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+PACKAGECONFIG ?= "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+    "
+
+inherit cmake features_check pkgconfig
+
+FILES:${PN} += "${datadir}/vulkan ${libdir}"
+
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools,
+# vulkan-validation-layers, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


