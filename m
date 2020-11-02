Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.1146.1604335766660829405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pzl84Eyx;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id a71so9658396edf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tLcSUmrNAsliU+WKtrPLvdlLhfp0ZWSqvyPkcWxqIhI=;
        b=Pzl84EyxBU1c2QiE5BzhNQoo4M663uNm7KIhsbPcaasqo3bufvTIdIqiWUJjJkWT5l
         MPLg1QH1WtYSdPL9q6T7DO54I6QQi1h4BTAt6p783ow0CrKrqCPeuJ1WgDpRYo2yTtvA
         y8S6oCegeHD4NaYaSBQdx2a5htSML62s9AavYrATCYiUG4hWPfdxV3mAxpHs7eJEUjlt
         lyrHYjwgV8cKmmQGsN+3vlpA5w8EANn9M5hw/xU+BUGbWDA93tKYt7rBk/Aw5M1laajR
         6tlLu7/u+h8o8918T3q5pCwakJNKVp3dB9YUGOuAFxMYCH9cofgZVMtBGhLF+CMX0XhL
         vFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLcSUmrNAsliU+WKtrPLvdlLhfp0ZWSqvyPkcWxqIhI=;
        b=dzHicEm0TUAKHnjG4tD0tZg77jrm7Z3qZ58kHz/ZV459j+dwtWVy2e6Hvy8aNnEnuI
         bQygfoJcMWIld28Hzl6F6J9E8JR0NjvhfFlz3NFMv4Ha/OQWIOk/Ce/E1GipXlgM4tzj
         vmmoDY8RTkBIrS340zLfOtXpz36B1RJiXIDuU9+Z5gfC0nlHN6ehuBT3cGIntEwbfMT4
         WIUvLWrIoL7dCwfIGveTkOWtf5KnizhpJsrZJvukYybkC03RLtB8fiLlMhcyRhec09Rc
         mEla5cVLhhDaWGzeBFYpyAMcVHv91n0P4Ig1emRRNpHgZYiNMdk86Qnu67XbrGDoa/2o
         5EAA==
X-Gm-Message-State: AOAM530PZNZyfOjHXAwe6HCU6cRi9jk2GBUJsG+7IUQTLkQoUCUd3fCP
	lJCgTqV3xGioSI08tXJuikIN4KirqKaAMA==
X-Google-Smtp-Source: ABdhPJxeBi+37vBf7M91aLTBrz+pC14lk58MiGrWee77S37BNu8c5xANdwHuwwq5UBvHbkqsPLpWyg==
X-Received: by 2002:a05:6402:1b19:: with SMTP id by25mr12726847edb.108.1604335764876;
        Mon, 02 Nov 2020 08:49:24 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:24 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/80] vulkan-samples: replace vulkan-demos
Date: Mon,  2 Nov 2020 17:47:55 +0100
Message-Id: <20201102164907.27572-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vulkan-samples is the official collection, and vulkan-demos
author has stated that he will be mostly contributing there:
https://github.com/SaschaWillems/Vulkan#Khronossamples

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 ...emos-with-questionably-licensed-data.patch | 98 -------------------
 .../vulkan/vulkan-demos_git.bb                | 44 ---------
 ...o-not-hardcode-lib-as-installation-t.patch | 29 ++++++
 .../vulkan/vulkan-samples_git.bb              | 19 ++++
 5 files changed, 49 insertions(+), 143 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-demos_git.bb
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0f86b89d35..3df5a0434a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -712,9 +712,9 @@ RECIPE_MAINTAINER_pn-vim-tiny = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-vulkan-demos = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
deleted file mode 100644
index 153e662733..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 663d51cd31fd98411e25f37aaf52b591d9639bf5 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 30 Jul 2018 17:23:29 +0300
-Subject: [PATCH] Don't build demos with questionably licensed data
-
-Some of the models don't have open source compatible licenses:
-don't build demos using those. Also don't build demos that need
-resources that are not included.
-
-ssao:
-scenerendering:
-        Sibenik model, no license found
-
-deferred:
-deferredmultisampling:
-deferredshadows:
-        armor model, CC-BY-3.0
-
-vulkanscene:
-imgui:
-shadowmapping:
-        vulkanscene model, no license found
-
-indirectdraw:
-        plant model, no license found
-
-hdr:
-pbribl:
-pbrtexture:
-        Require external Vulkan Asset Pack
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- examples/CMakeLists.txt | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index a53c834..71a12e7 100644
---- a/examples/CMakeLists.txt
-+++ b/examples/CMakeLists.txt
-@@ -55,9 +55,6 @@ set(EXAMPLES
- 	conditionalrender
- 	conservativeraster
- 	debugmarker
--	deferred
--	deferredmultisampling
--	deferredshadows
- 	descriptorsets
- 	displacement
- 	distancefieldfonts
-@@ -65,9 +62,6 @@ set(EXAMPLES
- 	gears
- 	geometryshader
- 	gltfscene
--	hdr
--	imgui
--	indirectdraw
- 	inlineuniformblocks
- 	inputattachments
- 	instancing
-@@ -83,23 +77,16 @@ set(EXAMPLES
- 	parallaxmapping
- 	particlefire
- 	pbrbasic
--	pbribl
--	pbrtexture
- 	pipelines
- 	pipelinestatistics
- 	pushconstants
- 	pushdescriptors
- 	radialblur
- 	renderheadless
--	scenerendering
- 	screenshot
--	shadowmapping
--	shadowmappingomni
--	shadowmappingcascade
- 	skeletalanimation
- 	specializationconstants
- 	sphericalenvmapping
--	ssao
- 	stencilbuffer
- 	subpasses
- 	terraintessellation
-@@ -113,7 +100,6 @@ set(EXAMPLES
- 	texturesparseresidency
- 	triangle
- 	viewportarray
--	vulkanscene
- )
- 
- buildExamples()
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
deleted file mode 100644
index 4175a56157..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "Collection of Vulkan examples"
-LICENSE = "MIT"
-DEPENDS = "zlib"
-
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
-                    file://examples/triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
-
-SRCREV_glm = "1ad55c5016339b83b7eec98c31007e0aee57d2bf"
-SRCREV_ktx = "726d14d02c95bb21ec9e43807751b491d295dd3c"
-
-SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
-           git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm \
-           git://github.com/KhronosGroup/KTX-Software;destsuffix=git/external/ktx;name=ktx;lfs=0 \
-           file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
-           "
-UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "4818f85916bf88c1ca8c2ed1a46e0e758651489e"
-UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
-S = "${WORKDIR}/git"
-
-REQUIRED_DISTRO_FEATURES = 'vulkan'
-
-inherit cmake features_check
-DEPENDS = "vulkan-loader assimp wayland-protocols wayland-native"
-
-do_install_append () {
-    # Remove assets that have uncertain licenses
-    rm ${D}${datadir}/vulkan-demos/models/armor/* \
-       ${D}${datadir}/vulkan-demos/models/sibenik/* \
-       ${D}${datadir}/vulkan-demos/models/vulkanscene* \
-       ${D}${datadir}/vulkan-demos/models/plants.dae \
-       ${D}${datadir}/vulkan-demos/textures/texturearray_plants*
-
-    mv ${D}${bindir}/screenshot ${D}${bindir}/vulkan-screenshot
-}
-
-EXTRA_OECMAKE = "-DRESOURCE_INSTALL_DIR=${datadir}/vulkan-demos"
-
-ANY_OF_DISTRO_FEATURES = "x11 wayland"
-
-# Can only pick one of [wayland,xcb]
-PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'xcb', d)}"
-PACKAGECONFIG[wayland] = "-DUSE_WAYLAND_WSI=ON, -DUSE_WAYLAND_WSI=OFF, wayland"
-PACKAGECONFIG[xcb] = ",,libxcb"
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch
new file mode 100644
index 0000000000..90fe277a41
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch
@@ -0,0 +1,29 @@
+From 5fb216d35b6846074196e80421f3162df3b9c8cd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 1 Nov 2020 23:19:22 +0000
+Subject: [PATCH] CMakeLists.txt: do not hardcode 'lib' as installation target
+
+Upstream-Status: Inappropriate [already fixed in newer versions]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e00f8c77..f9896eed 100644
+--- a/third_party/spirv-cross/CMakeLists.txt
++++ b/third_party/spirv-cross/CMakeLists.txt
+@@ -67,8 +67,8 @@ macro(spirv_cross_add_library name config_name)
+   install(TARGETS ${name}
+       EXPORT ${config_name}Config
+       RUNTIME DESTINATION bin
+-      LIBRARY DESTINATION lib
+-      ARCHIVE DESTINATION lib
++      LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++      ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+       PUBLIC_HEADER DESTINATION include/spirv_cross)
+   install(FILES ${hdrs} DESTINATION include/spirv_cross)
+   install(EXPORT ${config_name}Config DESTINATION share/${config_name}/cmake)
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
new file mode 100644
index 0000000000..241a313a7b
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "The Vulkan Samples is collection of resources to help develop optimized Vulkan applications."
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
+
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
+           file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
+           "
+UPSTREAM_CHECK_COMMITS = "1"
+SRCREV = "f52361d3cd6ac8c30fc3365a464b4e220c32cfd6"
+
+UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = 'vulkan'
+
+inherit cmake features_check
+
+FILES_${PN} += "${datadir}"
-- 
2.29.0

