Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.846.1602610546056944607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wvw3cMLv;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 13so460594wmf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SGIGQQleA9fGYckyaIyG9XfRKrAQyBL4Df/WUCEdSA0=;
        b=Wvw3cMLveRtZu7GunzgXTi3r7+ipb9eeJVsAKXSlgy5xZksT3nTSCkemjARioRsZbV
         KYz8hu8nL6WRFlk5HMTb7pln5KBstnS36DRc/ceSS0v/9U8f+c0zciRilYOtSofQ0Lym
         FI92bYHT+O8X/e0rNsRaNg9AcVNM2Utzg2japgT09RViKGsTxvmsxNRwmxH56j0MG+f4
         Re5V8Ncvs5AqQB6fsA4c2JMIMz+C5zXBHA2qggmz8uXwVEOZJrIvC+6eigjz8ehIEfgn
         8LIdRzdBK1h1uKFD8Gdf6seMpnfVkOUDgG67GXU4ynn49gzP6sJC8pojG1gsouwbZf0B
         eOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SGIGQQleA9fGYckyaIyG9XfRKrAQyBL4Df/WUCEdSA0=;
        b=FL9raNL58YaoEnVYwDkk9sCuZ7rpBBVnSPeL4Zro+PVescJuVL6jC72yt56cyxv1hr
         sGxO0p0neOP/aIe/J65Mc+SwYq38dWn2DuHgPdgTgD08Re/SOJHig8RKv4YNI7Q+RWnf
         uAaCU44Odu2Uz8WT97rfNxvyPD7gvjDj/wzd27gW2H5iA//pRw/1tTYaoRiQoVTfGTwn
         db4btChZjqAiWchO8sAbPEb54eE4tRBDJLbNM/SGF2G4VE5P3XbSgqnzvhtUFGa3lHS5
         obQuntsDnQeVDA1cQVky3tlbmb2ZUii+qwaETGlvd3EkVijMSuob/PK5xVJhOsp1aTRt
         W/Sg==
X-Gm-Message-State: AOAM532Ny8ukhucjNvJayo0Wq7Xu7lVGKrbzkf2C0upds33Vz9/y3h7l
	L81yYB78dPv+d2ALxndNF2pOc2G+RuvtAg==
X-Google-Smtp-Source: ABdhPJyACl+9pIAUWASyS4i0zy7uy9ytKpc278StSo+BwbOJfHT5XCMSJ2k+73t4Jv7KyZHzCtERTw==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr964358wmi.73.1602610541263;
        Tue, 13 Oct 2020 10:35:41 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w1sm297412wrp.95.2020.10.13.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:35:40 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/5] shaderc: add receipe
Date: Tue, 13 Oct 2020 18:35:01 +0100
Message-Id: <20201013173502.2245733-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013173502.2245733-1-quaresma.jose@gmail.com>
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A collection of tools, libraries and tests for shader compilation

This receipe is needed to build the gstreamer vulkan plugin
as it provides the binary glslc.

It is based on arch linux shaderc packge including the patches
https://github.com/archlinux/svntogit-packages/blob/91f0fa6ee3a220264a448527c1a8cf037caaad8e/trunk/PKGBUILD

    * 0001-fix-glslang-link-order.patch
      Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e67]

    * 0002-shaderc-2019.0-fix-build-against-new-glslang.patch
      Upstream-Status: Pending

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../files/0001-fix-glslang-link-order.patch   | 44 +++++++++++++++
 ...2019.0-fix-build-against-new-glslang.patch | 54 +++++++++++++++++++
 .../shaderc/shaderc_2019.0.bb                 | 36 +++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
 create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb

diff --git a/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
new file mode 100644
index 0000000000..a404c85839
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0001-fix-glslang-link-order.patch
@@ -0,0 +1,44 @@
+From 21c8be385b3fab5edcb934a6d99f69fd389c4e67 Mon Sep 17 00:00:00 2001
+From: Niklas Haas <git@haasn.xyz>
+Date: Tue, 29 May 2018 07:34:00 +0200
+Subject: [PATCH] Fix the link order of libglslang and libHLSL
+
+libglslang depends on libHLSL, so the latter needs to be specified last.
+This fixes an issue when trying to build shaderc against system-wide
+versions of libglslang/libHLSL, rather than the in-tree versions from
+third_party.
+
+Additionally, libshaderc_util also depends on SPIRV-Tools
+---
+ glslc/CMakeLists.txt           | 2 +-
+ libshaderc_util/CMakeLists.txt | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
+index acf6fb0b..0f5d8886 100644
+--- a/glslc/CMakeLists.txt
++++ b/glslc/CMakeLists.txt
+@@ -18,7 +18,7 @@ add_library(glslc STATIC
+ shaderc_default_compile_options(glslc)
+ target_include_directories(glslc PUBLIC ${glslang_SOURCE_DIR})
+ target_link_libraries(glslc PRIVATE glslang OSDependent OGLCompiler
+-  HLSL glslang SPIRV ${CMAKE_THREAD_LIBS_INIT})
++  glslang SPIRV HLSL ${CMAKE_THREAD_LIBS_INIT})
+ target_link_libraries(glslc PRIVATE shaderc_util shaderc)
+ 
+ add_executable(glslc_exe src/main.cc)
+diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.txt
+index 873540ab..6d0c465c 100644
+--- a/libshaderc_util/CMakeLists.txt
++++ b/libshaderc_util/CMakeLists.txt
+@@ -34,8 +34,8 @@ endif(SHADERC_ENABLE_INSTALL)
+ 
+ find_package(Threads)
+ target_link_libraries(shaderc_util PRIVATE
+-  glslang OSDependent OGLCompiler HLSL glslang SPIRV
+-  SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
++  glslang OSDependent OGLCompiler glslang HLSL SPIRV
++  SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})
+ 
+ shaderc_add_tests(
+   TEST_PREFIX shaderc_util
diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
new file mode 100644
index 0000000000..807540cf62
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
@@ -0,0 +1,54 @@
+diff --git a/libshaderc/src/shaderc.cc b/libshaderc/src/shaderc.cc
+index 3c3c3de..b5fc6cb 100644
+--- a/libshaderc/src/shaderc.cc
++++ b/libshaderc/src/shaderc.cc
+@@ -20,7 +20,7 @@
+ #include <sstream>
+ #include <vector>
+ 
+-#include "SPIRV/spirv.hpp"
++#include "glslang/SPIRV/spirv.hpp"
+ 
+ #include "libshaderc_util/compiler.h"
+ #include "libshaderc_util/counting_includer.h"
+diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
+index ef7867f..acc172b 100644
+--- a/libshaderc_util/src/compiler.cc
++++ b/libshaderc_util/src/compiler.cc
+@@ -26,7 +26,7 @@
+ #include "libshaderc_util/string_piece.h"
+ #include "libshaderc_util/version_profile.h"
+ 
+-#include "SPIRV/GlslangToSpv.h"
++#include "glslang/SPIRV/GlslangToSpv.h"
+ 
+ namespace {
+ using shaderc_util::string_piece;
+@@ -291,17 +291,12 @@ std::tuple<bool, std::vector<uint32_t>, size_t> Compiler::Compile(
+       bases[static_cast<int>(UniformKind::StorageBuffer)]);
+   shader.setShiftUavBinding(
+       bases[static_cast<int>(UniformKind::UnorderedAccessView)]);
+-  shader.setHlslIoMapping(hlsl_iomap_);
+   shader.setResourceSetBinding(
+       hlsl_explicit_bindings_[static_cast<int>(used_shader_stage)]);
+   shader.setEnvClient(target_client_info.client,
+                       target_client_info.client_version);
+   shader.setEnvTarget(target_client_info.target_language,
+                       target_client_info.target_language_version);
+-  if (hlsl_functionality1_enabled_) {
+-    shader.setEnvTargetHlslFunctionality1();
+-  }
+-
+   const EShMessages rules = GetMessageRules(target_env_, source_language_,
+                                             hlsl_offsets_,
+                                             generate_debug_info_);
+@@ -478,9 +473,6 @@ std::tuple<bool, std::string, std::string> Compiler::PreprocessShader(
+   }
+   shader.setEnvClient(target_client_info.client,
+                       target_client_info.client_version);
+-  if (hlsl_functionality1_enabled_) {
+-    shader.setEnvTargetHlslFunctionality1();
+-  }
+ 
+   // The preprocessor might be sensitive to the target environment.
+   // So combine the existing rules with the just-give-me-preprocessor-output
diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
new file mode 100644
index 0000000000..ac3db09937
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
@@ -0,0 +1,36 @@
+SUMMARY  = "A collection of tools, libraries and tests for shader compilation"
+DESCRIPTION = ""
+SECTION = "graphics"
+HOMEPAGE = "https://github.com/google/shaderc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI = "https://github.com/google/shaderc/archive/v${PV}.tar.gz \
+           file://0001-fix-glslang-link-order.patch \
+           file://0002-shaderc-2019.0-fix-build-against-new-glslang.patch \
+"
+SRC_URI[md5sum] = "8eb2b40712db2762a5cc40b568fd8ad9"
+SRC_URI[sha256sum] = "1018cd02be52295272fdbffa056ee24b881be277c83d039ad554d91230f4e11b"
+
+inherit cmake python3native
+
+DEPENDS = "spirv-tools-native glslang-native"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Releas -DSHADERC_SKIP_TESTS=ON"
+
+do_configure_prepend() {
+    # de-vendor libs and disable git versioning
+    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
+    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt
+    
+    # TODO: probably there is better solution for this.
+    # I dont know any method for get the version of a receipe dependent
+    # so do this ugly hack
+    cat <<- EOF > ${S}/glslc/src/build-version.inc
+"${PV}\\n"
+"$(pkg-config --modversion SPIRV-Tools)\\n"
+"$(glslangValidator --version | head -1 | cut -d' ' -f3)\\n"
+EOF
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

