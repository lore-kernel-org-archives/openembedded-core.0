Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9308.1602632739480354355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MpBmuZSu;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id x7so1524848wrl.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 16:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dhQXygc1AxAWdskGre/pD2ZDMlns2W41d91QTDcTA+o=;
        b=MpBmuZSuih797mmOoI6j+OOhKb4PwpEd/+U5KCkUo2vebDTkxCf9RaMFUPREw3FLnG
         uOoQ7IawcdCQum9O9wqAYB9v9WxccGDiPXbsITyXmQ0TsaaWGRhjWC06SeuMi1wZrQny
         hEhTGq5rh6ig6jfE/x+0O6MzKLao/FqlEJ1fopiHTWcVrEdWzYtmFUHum6Sixj61/PFS
         iS0I42bq+bVHKPphEFUC5e/7RLSu9oh++W2knzYB0+FdRyYi9ZO/4ADj7cK1Yndba/Y4
         M1Hw5agB/5sS14OkkiGWu0rFhNySbvtiDv1KhxHNm2xK8MAkmCIBHaN+0yDQ+ssWO2c/
         jcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dhQXygc1AxAWdskGre/pD2ZDMlns2W41d91QTDcTA+o=;
        b=oxs6AS27Mj4wIVYpjzGz5lY3l+s5FK8/+JQ4pDkGHbylRXGOfJ7vGLEjjUPUp0FlRv
         H10IvwNQuXAqCNOGahwAcxChWc/B0yjrjDjxfe6Ogs0Fgxgrca0XyjsDVmyHCzFunQFh
         6u7pPECJpv6dZ4SxEPg+sZua6eOvfCcn0eYSqrVubpUdUlwIDsL1n2OgZlaMyO/RYzdx
         5u8OdKOQp+l8MyUDo0GITJ93qX52wOv9S/xpg1khb0F7Bblq0SUKeW5bVwv2iN5WuYo/
         j2NuT+FV1sK7V1vajBYFKugdRJWa2FpA8Txn93Q80uIMMstcWDPWmIgOHTrdDOj6zDkk
         U+Mw==
X-Gm-Message-State: AOAM5335gh8lmMCS3YC14Lm+B2Kk1zORceQIrY44drTLMg7l8tulIqQf
	eEQdIbNaDJ46mqN5r71mo76lgtvTAX8HA2Oc
X-Google-Smtp-Source: ABdhPJxS97n4dZOz+mQuplnV0/cwZUIMyDZM+rlFWzcsIAJPL8dmwzgcxsFuBbDfK76nODlOdN94gg==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr2173542wro.339.1602632737715;
        Tue, 13 Oct 2020 16:45:37 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o184sm747718wmo.37.2020.10.13.16.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:45:37 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 4/4] shaderc: add receipe
Date: Wed, 14 Oct 2020 00:44:52 +0100
Message-Id: <20201013234452.2294860-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013234452.2294860-1-quaresma.jose@gmail.com>
References: <20201013234452.2294860-1-quaresma.jose@gmail.com>
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
 ...link-order-of-libglslang-and-libHLSL.patch | 47 ++++++++++++
 ...2019.0-fix-build-against-new-glslang.patch | 71 +++++++++++++++++++
 .../shaderc/shaderc_2019.0.bb                 | 37 ++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
 create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb

diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
new file mode 100644
index 0000000000..d11d6e20d4
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
@@ -0,0 +1,47 @@
+From d352129a9df212b384a908fd3cfe5a1739cb003a Mon Sep 17 00:00:00 2001
+From: Niklas Haas <git@haasn.xyz>
+Date: Tue, 29 May 2018 07:34:00 +0200
+Subject: [PATCH 1/2] Fix the link order of libglslang and libHLSL
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
+index acf6fb0..0f5d888 100644
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
+index ec0e8fb..ded089d 100644
+--- a/libshaderc_util/CMakeLists.txt
++++ b/libshaderc_util/CMakeLists.txt
+@@ -28,8 +28,8 @@ target_include_directories(shaderc_util
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
+-- 
+2.28.0
+
diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
new file mode 100644
index 0000000000..5becbeb274
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
@@ -0,0 +1,71 @@
+From f7dfc70c2709b2d77768a73dc883d92d44bb1b29 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Tue, 13 Oct 2020 15:20:11 +0100
+Subject: [PATCH 2/2] shaderc-2019.0: fix build against new glslang
+
+posted to the arch package repository by: svenstaro@gmail.com
+https://github.com/archlinux/svntogit-packages/commit/72283b634a0bd7c8d99cc605e273fe1294b77b44
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ libshaderc/src/shaderc.cc       |  2 +-
+ libshaderc_util/src/compiler.cc | 10 +---------
+ 2 files changed, 2 insertions(+), 10 deletions(-)
+
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
+-- 
+2.28.0
+
diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
new file mode 100644
index 0000000000..636bd780d0
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
@@ -0,0 +1,37 @@
+SUMMARY  = "A collection of tools, libraries and tests for shader compilation"
+DESCRIPTION = "The Shaderc library provides an API for compiling GLSL/HLSL \
+source code to SPIRV modules. It has been shipping in the Android NDK since version r12b."
+SECTION = "graphics"
+HOMEPAGE = "https://github.com/google/shaderc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRCREV = "34c412f21f945f4ef6ed4453f8b5dc4bb9d739e4"
+SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
+           file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch \
+           file://0002-shaderc-2019.0-fix-build-against-new-glslang.patch \
+"
+S = "${WORKDIR}/git"
+
+inherit cmake python3native
+
+DEPENDS = "spirv-tools glslang"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Releas -DSHADERC_SKIP_TESTS=ON"
+
+do_configure_prepend() {
+    # de-vendor libs and disable git versioning
+    sed '/examples/d;/third_party/d' -i ${S}/CMakeLists.txt
+    sed '/build-version/d' -i ${S}/glslc/CMakeLists.txt
+    
+    # TODO: probably there is better solution for this.
+    # I dont know any method for get the version of a receipe in DEPENDS
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

