Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.14021.1602945012770225349
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 07:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eMkLvAnF;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t9so6596788wrq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3qJePZS+S7w5+c3gyDfAp179xyt+x7WTTVhh3znz7Cw=;
        b=eMkLvAnFa84YZ3Q/WjWmHysl+vzVI6OftNVAXjhVO3q4iLxfUy0b6pg7lnaeDUwAfq
         bekU2VTD/qz5fVBKKbR+ugpPp+k6jQ41PT1Jyjmi3GKmGtebgeH3RJERoIVtlZTARMHU
         WO6A91hTXya0hLtF2qEgOTHp5EMnfDN5YtZ3YZ/8iVBHb40/DIVDbtNgS1c+ZXAvVl55
         g0EFDm5RW3zSXnQMncF7dNJRPtNME2tY5MCM9O2Tie3bJDpiSc7weMR5AUk7UiC3oGWw
         YSKveGL2UQ23blyPp4a/HkrkIoS3NyMi1viu0+9yqumHoZvHzMJT8JTVklB7HYPkSynZ
         24xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3qJePZS+S7w5+c3gyDfAp179xyt+x7WTTVhh3znz7Cw=;
        b=GQOcUmJXwy6clNYQUeQwN0BljZCN6QY676k+U8YW5VPWh04cHtX00TAp/6hG/dZhU6
         VVrMMu0QFYr3pwYK7svoyDUC1X1dt6iT78e0EDRhnX5128FRyVtQmF7/mVAv2up6xnku
         XXiBKcGQtKmp2Iq33xc9wrNg2X0Bx/+PiVo0j5QZ8x3Nsh9TXvGIDNsqqka4zHVDGX+V
         t9dBiGCcPOCgQfBUfW3uhWNl0dx13VzDBiiu5vULWR70kWDm6TUUoGl+8zyAKqMG2/co
         zzpl7gIMlP9m7rsRSm65tS4tR/4SHgzs9A/9tkxGPyKmwbRZaRqBffofTyjn24sY7gfx
         ZZBA==
X-Gm-Message-State: AOAM533LphWyLNwVlF+5QoULFSmsuQaaCP6s61BC7OwCJQEIWXek0Q4X
	L4irzLLJQMRvVOWomeO6gNSfNNBhNF3N2w==
X-Google-Smtp-Source: ABdhPJws9c3T93hPa/C2OzBx9eakQah1I3zDDcPc0E8SB9zirbfXskrHva3U21qPH2oBzYVTjorUSQ==
X-Received: by 2002:a5d:5009:: with SMTP id e9mr3214549wrt.104.1602945011021;
        Sat, 17 Oct 2020 07:30:11 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id c18sm8816700wrq.5.2020.10.17.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:30:10 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 4/5] shaderc: add receipe
Date: Sat, 17 Oct 2020 15:29:34 +0100
Message-Id: <20201017142935.3605756-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017142935.3605756-1-quaresma.jose@gmail.com>
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
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
index 0000000000..b13752799a
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
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Releas -DSHADERC_SKIP_TESTS=ON"
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
2.28.0

