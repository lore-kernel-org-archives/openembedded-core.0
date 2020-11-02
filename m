Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1198.1604335764966835227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z4nA+K06;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id v4so15064748edi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1H0M+eu7+P5/C4SbXdMmQBkM43V9zHqVow+ucnkHb7I=;
        b=Z4nA+K06R9DFjCFNjBs1wFXe1TN6nTdIERDmlyfuI+lVCGIyb5TEFfvkYh/DXRrhU+
         Mbj7CB3/QsmvVZXSfxxcUioqkgyoq12TMx6yGYZ+ge3m7wyjM+Y01KCGSLv/sj4Soh3K
         kNAGuzFNXhlgQnULFljWoWYwAZp/RlnPdItsJ+Atw5PH8ndkXhffkA/iN8S6lAPmbeVl
         Yy3+RHQ7KE5XprnFJsB03k8hi+dxF9jOabXUcpPXrVNdCWNjHdWKO1I2P4dXu6jVrB5g
         PMPAT79P4BUO6lLEbQksAXH+d4mZ1ayUJVC61VQXLDfLwm0iIGRKs6yiOvkXE1ln2k7e
         jryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1H0M+eu7+P5/C4SbXdMmQBkM43V9zHqVow+ucnkHb7I=;
        b=N1Pw0XbVzlNLkEoTd3o5BL9sq40TGmwtUqgO9OaCTElwA1opeOvVFXA1J6uWG3eiTe
         oCPIHCmWqwaLemJOIZAPqEwpsVcMVMFFP0g0J7XSlEIj/cAKuOYkpmFgUQwaXp1Z5dwU
         JPZtaDUG7tl1dGVA5cen01jJoH4MwCKjYTrhMby0AmQorVWbpGiQcHYK2FOkc34mLs/f
         reiWxotHZzYKfxNPBFE5uBqwop+YtKfOh08wDNNi7ETSR/s4CnISB2LQ+EvTIc4FJ+QZ
         P/Gb7QUO6lrns9b70Pubv7JtCQBYpIJK6IXj1sB+nbnPtS+zs86qJf5j/wA0N9r9kPzM
         +1sA==
X-Gm-Message-State: AOAM531sf3LmjJzTzNZGcSkeLWeXWp37A64+wxK3B5O9YmMMsgdUwFkK
	/qII1oVLcC1o62ptLlLAXQ+NVEpv2GTC0g==
X-Google-Smtp-Source: ABdhPJy0etF15QQNy6S1AYjPQ7iY2TkZuRRiQ+Mj8MQyquxyU98FKdpPoklfmK4FTllbfmXdA+Fjpg==
X-Received: by 2002:a50:f104:: with SMTP id w4mr7160094edl.381.1604335763199;
        Mon, 02 Nov 2020 08:49:23 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:22 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/80] shaderc: upgrade 2019.0 -> 2020.3
Date: Mon,  2 Nov 2020 17:47:53 +0100
Message-Id: <20201102164907.27572-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 0002-shaderc-2019.0-fix-build-against-new-glslang.patch
as issue fixed upstream.

Rebase 0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...link-order-of-libglslang-and-libHLSL.patch | 30 ++++----
 ...2019.0-fix-build-against-new-glslang.patch | 73 -------------------
 .../{shaderc_2019.0.bb => shaderc_2020.3.bb}  |  3 +-
 3 files changed, 15 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
 rename meta/recipes-graphics/shaderc/{shaderc_2019.0.bb => shaderc_2020.3.bb} (90%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
index 1ca84a29bb..7102e25bcf 100644
--- a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
@@ -1,7 +1,7 @@
-From 53f1f5c714df1f0a2eb57c1ce00bc66fc9a1690e Mon Sep 17 00:00:00 2001
+From 0b9468d4face34879214f500b15e810cdd1a81a1 Mon Sep 17 00:00:00 2001
 From: Niklas Haas <git@haasn.xyz>
 Date: Tue, 29 May 2018 07:34:00 +0200
-Subject: [PATCH 1/3] Fix the link order of libglslang and libHLSL
+Subject: [PATCH] Fix the link order of libglslang and libHLSL
 
 libglslang depends on libHLSL, so the latter needs to be specified last.
 This fixes an issue when trying to build shaderc against system-wide
@@ -13,29 +13,30 @@ Additionally, libshaderc_util also depends on SPIRV-Tools
 Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e67]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  glslc/CMakeLists.txt           | 2 +-
  libshaderc_util/CMakeLists.txt | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index acf6fb0..0f5d888 100644
+index 31664d1..35b3f19 100644
 --- a/glslc/CMakeLists.txt
 +++ b/glslc/CMakeLists.txt
-@@ -18,7 +18,7 @@ add_library(glslc STATIC
- shaderc_default_compile_options(glslc)
- target_include_directories(glslc PUBLIC ${glslang_SOURCE_DIR})
- target_link_libraries(glslc PRIVATE glslang OSDependent OGLCompiler
--  HLSL glslang SPIRV ${CMAKE_THREAD_LIBS_INIT})
-+  glslang SPIRV HLSL ${CMAKE_THREAD_LIBS_INIT})
- target_link_libraries(glslc PRIVATE shaderc_util shaderc)
+@@ -43,7 +43,7 @@ if (SHADERC_ENABLE_WGSL_OUTPUT)
+ endif(SHADERC_ENABLE_WGSL_OUTPUT)
  
- add_executable(glslc_exe src/main.cc)
+ target_link_libraries(glslc PRIVATE
+-  glslang OSDependent OGLCompiler HLSL glslang SPIRV    # Glslang libraries
++  glslang OSDependent OGLCompiler glslang SPIRV HLSL    # Glslang libraries
+   $<$<BOOL:${SHADERC_ENABLE_WGSL_OUTPUT}>:libtint>      # Tint libraries, optional
+   shaderc_util shaderc                                  # internal Shaderc libraries
+   ${CMAKE_THREAD_LIBS_INIT})
 diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.txt
-index ec0e8fb..ded089d 100644
+index 48f9991..984cc06 100644
 --- a/libshaderc_util/CMakeLists.txt
 +++ b/libshaderc_util/CMakeLists.txt
-@@ -28,8 +28,8 @@ target_include_directories(shaderc_util
+@@ -46,8 +46,8 @@ add_definitions(-DENABLE_HLSL)
  
  find_package(Threads)
  target_link_libraries(shaderc_util PRIVATE
@@ -46,6 +47,3 @@ index ec0e8fb..ded089d 100644
  
  shaderc_add_tests(
    TEST_PREFIX shaderc_util
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch b/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
deleted file mode 100644
index b31b88de48..0000000000
--- a/meta/recipes-graphics/shaderc/files/0002-shaderc-2019.0-fix-build-against-new-glslang.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 44e99802fa16bb5b53b5e80c2c84f305802d494d Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Tue, 13 Oct 2020 15:20:11 +0100
-Subject: [PATCH 2/3] shaderc-2019.0: fix build against new glslang
-
-posted to the arch package repository by: svenstaro@gmail.com
-https://github.com/archlinux/svntogit-packages/commit/72283b634a0bd7c8d99cc605e273fe1294b77b44
-
-Upstream-Status: Pending
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- libshaderc/src/shaderc.cc       |  2 +-
- libshaderc_util/src/compiler.cc | 10 +---------
- 2 files changed, 2 insertions(+), 10 deletions(-)
-
-diff --git a/libshaderc/src/shaderc.cc b/libshaderc/src/shaderc.cc
-index 3c3c3de..b5fc6cb 100644
---- a/libshaderc/src/shaderc.cc
-+++ b/libshaderc/src/shaderc.cc
-@@ -20,7 +20,7 @@
- #include <sstream>
- #include <vector>
- 
--#include "SPIRV/spirv.hpp"
-+#include "glslang/SPIRV/spirv.hpp"
- 
- #include "libshaderc_util/compiler.h"
- #include "libshaderc_util/counting_includer.h"
-diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index ef7867f..acc172b 100644
---- a/libshaderc_util/src/compiler.cc
-+++ b/libshaderc_util/src/compiler.cc
-@@ -26,7 +26,7 @@
- #include "libshaderc_util/string_piece.h"
- #include "libshaderc_util/version_profile.h"
- 
--#include "SPIRV/GlslangToSpv.h"
-+#include "glslang/SPIRV/GlslangToSpv.h"
- 
- namespace {
- using shaderc_util::string_piece;
-@@ -291,17 +291,12 @@ std::tuple<bool, std::vector<uint32_t>, size_t> Compiler::Compile(
-       bases[static_cast<int>(UniformKind::StorageBuffer)]);
-   shader.setShiftUavBinding(
-       bases[static_cast<int>(UniformKind::UnorderedAccessView)]);
--  shader.setHlslIoMapping(hlsl_iomap_);
-   shader.setResourceSetBinding(
-       hlsl_explicit_bindings_[static_cast<int>(used_shader_stage)]);
-   shader.setEnvClient(target_client_info.client,
-                       target_client_info.client_version);
-   shader.setEnvTarget(target_client_info.target_language,
-                       target_client_info.target_language_version);
--  if (hlsl_functionality1_enabled_) {
--    shader.setEnvTargetHlslFunctionality1();
--  }
--
-   const EShMessages rules = GetMessageRules(target_env_, source_language_,
-                                             hlsl_offsets_,
-                                             generate_debug_info_);
-@@ -478,9 +473,6 @@ std::tuple<bool, std::string, std::string> Compiler::PreprocessShader(
-   }
-   shader.setEnvClient(target_client_info.client,
-                       target_client_info.client_version);
--  if (hlsl_functionality1_enabled_) {
--    shader.setEnvTargetHlslFunctionality1();
--  }
- 
-   // The preprocessor might be sensitive to the target environment.
-   // So combine the existing rules with the just-give-me-preprocessor-output
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/recipes-graphics/shaderc/shaderc_2020.3.bb
similarity index 90%
rename from meta/recipes-graphics/shaderc/shaderc_2019.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2020.3.bb
index 3bd9c61a55..f5edf53caf 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.3.bb
@@ -6,10 +6,9 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "34c412f21f945f4ef6ed4453f8b5dc4bb9d739e4"
+SRCREV = "1fce59794079f90ceb091190adbbb5499acd4e95"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch \
-           file://0002-shaderc-2019.0-fix-build-against-new-glslang.patch \
            file://0003-cmake-de-vendor-libs-and-disable-git-versioning.patch \
            "
 S = "${WORKDIR}/git"
-- 
2.29.0

