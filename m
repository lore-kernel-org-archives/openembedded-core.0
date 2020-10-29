Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.2990.1604001817296503908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SyoLc37V;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id w23so962973wmi.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uaoVHiG2y8NYSyC7qCCuTMSTSIKZ7vgrFjqAC45Kwd4=;
        b=SyoLc37VzqvPcwf4tLORarcCUtjDNz6vssGy8CkgRh3CKLI90eF/G5zAhaJeGTFvpq
         5Kj/8/VKjmH6e27yd1mDJLYUrmJd7E8lU5vrLuwErokGTmhfRz+ey8IuyDwMFijQ6enD
         f4R3K/JoHFm6AKHCRYoiDUMwUXn7yCgGIHTCukjHvV/INVqqe4lBEVCdYV2exEGjm8P3
         Yz+H8iiQ62WjW2HCD8ZBN8DxV5jk83TAhZ3amQDpSGAObjfPmx0hsw1aJH+mZJ38sQgm
         JiyjX25wTJxS6VgeDDf2Vqs2PqR/k4IbB4C766P41PTCNiOnMuhmVd1AwufMZRRPubkW
         L8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uaoVHiG2y8NYSyC7qCCuTMSTSIKZ7vgrFjqAC45Kwd4=;
        b=GmkpWq1onwOev3WAhbLo2zAPeRyGMwzqebNJGBbG8hGpSE4outQ6Uo9u3b1Zd9o5aN
         RsdoknEKWauOCg2/CEvIR3EiNkB8YObPvWDpedSC0/6gRi/71u1ls+XJW01Ph7KyXIqA
         cG4FZR546v6QTPyNcHAEIYcv2iXcJFXRkDuGQyVRgBU+5wqdxpcDrNMuPwLfzEew5U5X
         OHS9zvgfqamTT3qTmwSP1S/0bPOfBH8bC/O1AJqSu8M8FuMqxOt8pMq5+52ofb7iy+YW
         ay2+/4FFSnE2v9DmNIVlT2LsmOccJAWxTgLom3osifBc/O7cUDVWmt5XBEkou/QRBUor
         Rubg==
X-Gm-Message-State: AOAM532rSVXXo7Vp7PiWab4GrOypjokZU3HNXkKhcxoRhnFpcKopnVTL
	HzHxqHWvAT+ImUfbXVA0ihQTaEDrBIBqng==
X-Google-Smtp-Source: ABdhPJz9bVnD2pWR7wGGCwOJuHbar4fJg68imwK4Jl3H+O+Y/gEW36cvfT6K5YrmREiwQyHewg1FaA==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr950403wmi.58.1604001815282;
        Thu, 29 Oct 2020 13:03:35 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b63sm1519422wme.9.2020.10.29.13.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:03:34 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 4/6] shaderc: add receipe
Date: Thu, 29 Oct 2020 20:03:19 +0000
Message-Id: <20201029200321.1886511-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029200321.1886511-1-quaresma.jose@gmail.com>
References: <20201029200321.1886511-1-quaresma.jose@gmail.com>
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

    * 0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
      Upstream-Status: Inappropriate [configuration]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...link-order-of-libglslang-and-libHLSL.patch | 51 +++++++++++++
 ...2019.0-fix-build-against-new-glslang.patch | 73 +++++++++++++++++++
 ...ndor-libs-and-disable-git-versioning.patch | 53 ++++++++++++++
 .../shaderc/shaderc_2019.0.bb                 | 34 +++++++++
 4 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
 create mode 100644 meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
 create mode 100644 meta/recipes-graphics/shaderc/shaderc_2019.0.bb

diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
new file mode 100644
index 0000000000..1ca84a29bb
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
@@ -0,0 +1,51 @@
+From 53f1f5c714df1f0a2eb57c1ce00bc66fc9a1690e Mon Sep 17 00:00:00 2001
+From: Niklas Haas <git@haasn.xyz>
+Date: Tue, 29 May 2018 07:34:00 +0200
+Subject: [PATCH 1/3] Fix the link order of libglslang and libHLSL
+
+libglslang depends on libHLSL, so the latter needs to be specified last.
+This fixes an issue when trying to build shaderc against system-wide
+versions of libglslang/libHLSL, rather than the in-tree versions from
+third_party.
+
+Additionally, libshaderc_util also depends on SPIRV-Tools
+
+Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e67]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
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
index 0000000000..b31b88de48
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
@@ -0,0 +1,73 @@
+From 44e99802fa16bb5b53b5e80c2c84f305802d494d Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Tue, 13 Oct 2020 15:20:11 +0100
+Subject: [PATCH 2/3] shaderc-2019.0: fix build against new glslang
+
+posted to the arch package repository by: svenstaro@gmail.com
+https://github.com/archlinux/svntogit-packages/commit/72283b634a0bd7c8d99cc605e273fe1294b77b44
+
+Upstream-Status: Pending
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
diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
new file mode 100644
index 0000000000..0d58925adc
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
@@ -0,0 +1,53 @@
+From e092619a9ef7910ad56acfb8728c66f0125d176a Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sat, 17 Oct 2020 12:51:50 +0100
+Subject: [PATCH 3/3] cmake: de-vendor libs and disable git versioning
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ CMakeLists.txt              | 2 --
+ glslc/CMakeLists.txt        | 1 -
+ glslc/src/build-version.inc | 0
+ 3 files changed, 3 deletions(-)
+ create mode 100644 glslc/src/build-version.inc
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a4e779b..cfa7bd8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,7 +70,6 @@ endif(MSVC)
+ 
+ # Configure subdirectories.
+ # We depend on these for later projects, so they should come first.
+-add_subdirectory(third_party)
+ 
+ if(SHADERC_ENABLE_SPVC)
+ add_subdirectory(libshaderc_spvc)
+@@ -79,7 +78,6 @@ endif()
+ add_subdirectory(libshaderc_util)
+ add_subdirectory(libshaderc)
+ add_subdirectory(glslc)
+-add_subdirectory(examples)
+ 
+ add_custom_target(build-version
+   ${PYTHON_EXECUTABLE}
+diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
+index 0f5d888..08686e0 100644
+--- a/glslc/CMakeLists.txt
++++ b/glslc/CMakeLists.txt
+@@ -26,7 +26,6 @@ shaderc_default_compile_options(glslc_exe)
+ target_include_directories(glslc_exe PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/.. ${spirv-tools_SOURCE_DIR}/include)
+ set_target_properties(glslc_exe PROPERTIES OUTPUT_NAME glslc)
+ target_link_libraries(glslc_exe PRIVATE glslc shaderc_util shaderc)
+-add_dependencies(glslc_exe build-version)
+ 
+ shaderc_add_tests(
+   TEST_PREFIX glslc
+diff --git a/glslc/src/build-version.inc b/glslc/src/build-version.inc
+new file mode 100644
+index 0000000..e69de29
+-- 
+2.28.0
+
diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
new file mode 100644
index 0000000000..3bd9c61a55
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
@@ -0,0 +1,34 @@
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
+           file://0003-cmake-de-vendor-libs-and-disable-git-versioning.patch \
+           "
+S = "${WORKDIR}/git"
+
+inherit cmake python3native
+
+DEPENDS = "spirv-tools glslang"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DSHADERC_SKIP_TESTS=ON"
+
+do_configure_prepend() {
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
2.29.1

