Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.24581.1611511690339208099
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cu/QrTtx;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id j18so8650266wmi.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5rtSvmTeLrgQJtlgAzOnFP/Pod/iWzbgWfsnVz31GBI=;
        b=cu/QrTtxjsLCb9xOqn+qMB0l0YWMFotJS67lKZboA51BlpHho7s5dxmncZcDWZnIbZ
         Q1Bj5gd+EKCwiHsTpc/cpoeEYQU7ULauZWTqlkvmZ6SQ0s9NKoKcS16A/7hmZY5CGnTP
         XMCWMkr7/sxgkSOohO4FvueS6AJnEGQcdpNaDXnRUFnUvRdrrnqVF+DwWAX6ceIR/1d3
         ZyWz6rA2j49pD1OPQgvf8x0DY1Hqb/w8nkO2XUIBg/tbynab2DDZRKZR2QIL6JKvqgS9
         A6CmyivIHHxrwbOxBp2gyt6kqGeE3oKxBBf/Kk8+QttdGHiaHmwqhTkl5dVuKJVOipQQ
         99fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5rtSvmTeLrgQJtlgAzOnFP/Pod/iWzbgWfsnVz31GBI=;
        b=iWjTP+He9WhZcPHCEmwVDFCoq0DDehnhBJwBozzKZG59mvIfPuTJPpgZycKK/k+Z+V
         GnLYZ4x5LiE3DFDwD1AAUvJOBLgwRT/AYu9EbfbgmCpUEJiPeq6X1kXp6qsMIJENxGkt
         VwLzJcdfA9WTtsD+YHigl3ePHn8pliCGcTZte/9Yk+r/3Qh6MnnMHUwOCRMRMMGTDhHB
         f+Rln7KJFRoXCltxqSJWpKHDJxLEbNdW9/Vy7mLFWOO8K+U/m+cLdvB6WWGvjCjvzXak
         ZG9F3k5BTDz7DlhDovH7ZB4zIB4jQgnWNgNLEIK0uHToEHBSZ03pThqbU/vx8MzV7MVq
         blrg==
X-Gm-Message-State: AOAM530L2aGpy23zUFLhb8/bNkhsEvNxbAFgpZNQnXIffwKxBkC6viOi
	MaMw6GR1F0pZsI26GE596DAVltAjrC7brQ==
X-Google-Smtp-Source: ABdhPJzHDTu1bcBvhWNypq3uhj8E7s6Qa7Do4hZTuUXHgadXScSZNiyz+lIYcoRXe3SwnbaNdazmtQ==
X-Received: by 2002:a1c:25c2:: with SMTP id l185mr3667009wml.62.1611511689002;
        Sun, 24 Jan 2021 10:08:09 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id e4sm7554101wrw.96.2021.01.24.10.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:08:08 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 4/4] shaderc: fix the build with glslang 11.1.0
Date: Sun, 24 Jan 2021 18:07:58 +0000
Message-Id: <20210124180758.1610301-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124180758.1610301-1-quaresma.jose@gmail.com>
References: <20210124180758.1610301-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patches:
    * 0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
      is rejected upstream and is not need when glslang as shared libs.

Update pacthes:
    * 0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
      renamed and refreshed from 0003-cmake-de-vendor-libs-and-disable-git-versioning.patch.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...link-order-of-libglslang-and-libHLSL.patch | 49 -------------------
 ...dor-libs-and-disable-git-versioning.patch} |  4 +-
 .../shaderc/shaderc_2020.4.bb                 | 10 ++--
 3 files changed, 9 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
 rename meta/recipes-graphics/shaderc/files/{0003-cmake-de-vendor-libs-and-disable-git-versioning.patch => 0001-cmake-de-vendor-libs-and-disable-git-versioning.patch} (94%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch b/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
deleted file mode 100644
index 7102e25bcf..0000000000
--- a/meta/recipes-graphics/shaderc/files/0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 0b9468d4face34879214f500b15e810cdd1a81a1 Mon Sep 17 00:00:00 2001
-From: Niklas Haas <git@haasn.xyz>
-Date: Tue, 29 May 2018 07:34:00 +0200
-Subject: [PATCH] Fix the link order of libglslang and libHLSL
-
-libglslang depends on libHLSL, so the latter needs to be specified last.
-This fixes an issue when trying to build shaderc against system-wide
-versions of libglslang/libHLSL, rather than the in-tree versions from
-third_party.
-
-Additionally, libshaderc_util also depends on SPIRV-Tools
-
-Upstream-Status: Backport [21c8be385b3fab5edcb934a6d99f69fd389c4e67]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
----
- glslc/CMakeLists.txt           | 2 +-
- libshaderc_util/CMakeLists.txt | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index 31664d1..35b3f19 100644
---- a/glslc/CMakeLists.txt
-+++ b/glslc/CMakeLists.txt
-@@ -43,7 +43,7 @@ if (SHADERC_ENABLE_WGSL_OUTPUT)
- endif(SHADERC_ENABLE_WGSL_OUTPUT)
- 
- target_link_libraries(glslc PRIVATE
--  glslang OSDependent OGLCompiler HLSL glslang SPIRV    # Glslang libraries
-+  glslang OSDependent OGLCompiler glslang SPIRV HLSL    # Glslang libraries
-   $<$<BOOL:${SHADERC_ENABLE_WGSL_OUTPUT}>:libtint>      # Tint libraries, optional
-   shaderc_util shaderc                                  # internal Shaderc libraries
-   ${CMAKE_THREAD_LIBS_INIT})
-diff --git a/libshaderc_util/CMakeLists.txt b/libshaderc_util/CMakeLists.txt
-index 48f9991..984cc06 100644
---- a/libshaderc_util/CMakeLists.txt
-+++ b/libshaderc_util/CMakeLists.txt
-@@ -46,8 +46,8 @@ add_definitions(-DENABLE_HLSL)
- 
- find_package(Threads)
- target_link_libraries(shaderc_util PRIVATE
--  glslang OSDependent OGLCompiler HLSL glslang SPIRV
--  SPIRV-Tools-opt ${CMAKE_THREAD_LIBS_INIT})
-+  glslang OSDependent OGLCompiler glslang HLSL SPIRV
-+  SPIRV-Tools-opt SPIRV-Tools ${CMAKE_THREAD_LIBS_INIT})
- 
- shaderc_add_tests(
-   TEST_PREFIX shaderc_util
diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
similarity index 94%
rename from meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
rename to meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
index e4e3f0be1e..40cc84df26 100644
--- a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
@@ -1,4 +1,4 @@
-From 180250f098e0ab899eff0db3708d9693f3486ff4 Mon Sep 17 00:00:00 2001
+From a07ac322a5a5fd4f0339913eb4456321ad1a69fd Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 17 Oct 2020 12:51:50 +0100
 Subject: [PATCH] cmake: de-vendor libs and disable git versioning
@@ -32,7 +32,7 @@ index 5c74cd8..9451fbc 100644
  add_custom_target(build-version
    ${PYTHON_EXECUTABLE}
 diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index 35b3f19..52006b8 100644
+index 31664d1..358d91b 100644
 --- a/glslc/CMakeLists.txt
 +++ b/glslc/CMakeLists.txt
 @@ -53,7 +53,6 @@ shaderc_default_compile_options(glslc_exe)
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index e886e81d0e..18a08ee6c5 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -8,16 +8,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
-           file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch \
-           file://0003-cmake-de-vendor-libs-and-disable-git-versioning.patch \
+           file://0001-cmake-de-vendor-libs-and-disable-git-versioning.patch \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
 DEPENDS = "spirv-tools glslang"
 
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DSHADERC_SKIP_TESTS=ON"
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DSHADERC_SKIP_TESTS=ON \
+    -Dglslang_SOURCE_DIR=${STAGING_INCDIR}/glslang \
+"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.0

