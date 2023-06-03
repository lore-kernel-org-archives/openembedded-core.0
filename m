Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E122BC7EE24
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 04:49:02 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.6333.1685767733671185863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 21:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=b26ary3l;
 spf=pass (domain: underview.tech, ip: 209.85.161.41, mailfrom: vince@underview.tech)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-55854c3576eso1792992eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 21:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1685767732; x=1688359732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H27cUKQ8/oiSTVlDFkNoUm1hcrpoOsr4JDH5SzDo6yE=;
        b=b26ary3l8xdu8lYpeacWmh+jI1tuq9zpSXmtNBaucx5ivYWR/4H9WAnEmiXHuCR7Az
         SvQvEQqohQQvORUcdUfhwBiCkCSY4ALB5siT4QFCMFkW+NZ1/cD/0mebqaG9w7OEOsLC
         bIVJ/lKLfKhbGE5PUqCliO2X5X8gerDZe3WDXjXOPqm8tPqrbm3Mn0EDY8r4Kf1zdFsq
         VkGfdNCm96DhePGlBTXqvVxpdc/QZNHBkiGNHeyM47DPl91gUG+QEww7jdOPaWNxndPp
         /USKcVn5unyPADIEacWNPVSi0BqYWI1hChUBQwkBoUyN2TUhHlM+9OEPYgrkSo4vKOJL
         WzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685767732; x=1688359732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H27cUKQ8/oiSTVlDFkNoUm1hcrpoOsr4JDH5SzDo6yE=;
        b=TLgjOdN9ekdyg0ULjGuhiJXoWqe6YmLk7ajZ9jFn8xkFLpZFndKYbgrXL1EZ8YFf5w
         3QWkuFM62ShMAhb/alX6J9D/fHqCi74L/+g8K3lPuF1pniaNme/O+uv9v4863tIfSCsh
         UUKSXS9O8JgRBcPvyFeT4f6TQ0rvRbd7E5N494zpM9yw6e0lixTZnbnsKBlHGJQll2tA
         SevZpF3atH2IUoHsYTsg1nThFRMcmOrQ58wmDgO0g8pTdq5RC9ZQvRH7JyXPh33n3ROt
         UPtZ5C1Q0A84UVz12kEbmsxfx83j8iJ/KnVKpSSc6HRh5W19uuqHSQb1PFyvSPuBb+3x
         XNdA==
X-Gm-Message-State: AC+VfDzdMFC8kF89TQWhqze+QXMuufGZykMmpISZ0E6DVeyFGx1JSkBQ
	HyhI5sY0IqqOHCRsaScsdJB5IOvTROLcYN1g2DA=
X-Google-Smtp-Source: ACHHUZ7asPj5xHgRh+AA7qRDDGCeiN/JUQnypm7sHamoN9KImkbiBeqJtd7C8E+NJ1a5pMFXBcQbKQ==
X-Received: by 2002:a05:6808:a10:b0:399:b7bd:9041 with SMTP id n16-20020a0568080a1000b00399b7bd9041mr1701734oij.34.1685767732657;
        Fri, 02 Jun 2023 21:48:52 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:c1f3:bfba:6f2e:e0c3])
        by smtp.gmail.com with ESMTPSA id k4-20020a4a4304000000b005584e0c8f9csm1188074ooj.3.2023.06.02.21.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 21:48:52 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] vulkan-validation-layers: add new recipe v1.3.243.0
Date: Fri,  2 Jun 2023 23:48:42 -0500
Message-Id: <20230603044842.3551010-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 04:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182345

Recipe added with a fix to

error: '../recipe-sysroot/usr/lib', needed by
'layers/libVkLayer_khronos_validation.so', missing
and no known rule to make it

Taking a look into ${B}/build.ninja
LINK_LIBRARIES = \
    layers/libVkLayer_utils.a
    <absolute path>/recipe-sysroot/usr/lib64/libSPIRV-Tools-opt.so
    <absolute path>/recipe-sysroot/usr/lib64/libSPIRV-Tools.so
    <absolute path>/recipe-sysroot/usr/lib

"../recipe-sysroot/usr/lib" doesn't exists when base_libdir = lib64.
After research there appears to be no solution to fix
"../recipe-sysroot/usr/lib" from being included in cmake LINK_LIBARIES.

Solution is to temporarily create it "../recipes-sysroot/usr/lib" to
bypass build issues.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulkan-validation-layers_1.3.243.0.bb     | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
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
index 0000000000..2d71b66f55
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
@@ -0,0 +1,73 @@
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
+# error: '../recipe-sysroot/usr/lib', needed by 'layers/libVkLayer_khronos_validation.so', missing and no known rule to make it
+# Taking a look into ${B}/build.ninja
+# LINK_LIBRARIES = \
+#    layers/libVkLayer_utils.a
+#    <absolute path>/vulkan-validation-layers/1.3.243.0-r0/recipe-sysroot/usr/lib64/libSPIRV-Tools-opt.so
+#    <absolute path>/vulkan-validation-layers/1.3.243.0-r0/recipe-sysroot/usr/lib64/libSPIRV-Tools.so
+#    <absolute path>/vulkan-validation-layers/1.3.243.0-r0/recipe-sysroot/usr/lib
+# "../recipe-sysroot/usr/lib" doesn't exists when base_libdir = lib64. After research there appears
+# to be no solution to fix "../recipe-sysroot/usr/lib" from being included in cmake LINK_LIBARIES.
+# Temporarily create it "../recipes-sysroot/usr/lib" to bypass build issues.
+do_configure:prepend:class-target () {
+    if [ "${libdir}" = "/usr/lib64" ]; then
+        ln -sfv "${STAGING_LIBDIR}" "${STAGING_DIR_TARGET}/usr/lib"
+    fi
+}
+
+do_compile:append:class-target () {
+    if [ "${libdir}" = "/usr/lib64" ]; then
+        rm -rf  "${STAGING_DIR_TARGET}/usr/lib"
+    fi
+}
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


