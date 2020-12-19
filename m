Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.13134.1608402756352532294
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 10:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eq17p8AQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id q75so6662335wme.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eXbOhwv7nn4k3jPq03+yJaB8thBujVIA3Yl2zJ4E96o=;
        b=Eq17p8AQZV1n+VktSI7rWlx9iFIDh00l4x81sMzyDWBwUf3/zJ6EnRHReuZ0gBUzU1
         s61wdBXegmLDRuyShbBDLNBNpmcLjx+b3BgUkwOLyx/1BV40uqSf2trQAWbkWtwo+Loi
         hLZNnzE14D983E5gaRjgRtpwGJJkwuS3gxz300H85iHHjfZ1gFlpL6vPTBBiLd4v0tb8
         3yi1c1w32EmncRTPLyZpq7ctLwk+B1X1kZOaIti5Lii4JhE+IscUX82SnS6Ro5HcC2c3
         Kh+nS2jtq1qsaC2Zpy36xrQCA7QyUkovleKxp6ucrzuuT+q3IeGqb5BXTvplFJ0cVzqS
         xZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eXbOhwv7nn4k3jPq03+yJaB8thBujVIA3Yl2zJ4E96o=;
        b=kkHdgp6uvYxUf1bcmK3i2vGXt7R2f2gkar9OBvbcqjfM9J9QfYcRLcw4dezsOV0oQP
         tG4iqN5WrFipk+8ocgkZkDh1gEUgNDXnuOXxNEwfuoUuyDIBpguR60O0S5V0um7Voj2D
         t/C4BvkMFMyuSDN4SmOIJmQ6BiJsYlhmWuzOyXJKJszTB7fDVaXm3lrq10uyZ23Awl1D
         b3H85lkxQLYr359EnROoLjOp95gmCBqqG+thu9rNiAEfUY4Zvpu+Z0T37LWBfyoBV4Ks
         CgfA2za3Fu055T5Ej7AQSe4HtuaNft5siTIIKjk8iOdiup7Ixt9h9dVwVGLppqjzo12Y
         57oA==
X-Gm-Message-State: AOAM532ktaiYm8wYbP8J15A7BbPA3U/VzIjy6V+sNErMsPPGszO+pS8x
	SHpMwLj6Soyzuf4e+qQMv6e4VyX+OoqkBA==
X-Google-Smtp-Source: ABdhPJxH9VB+YHpsu/p14wrl57sNVWW/q3vSUAoYir3SgmCxGILLiy8bH+RfAaftSk+aiH1DQvI9Dw==
X-Received: by 2002:a1c:55ca:: with SMTP id j193mr9198225wmb.87.1608402754751;
        Sat, 19 Dec 2020 10:32:34 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id d187sm15715362wmd.8.2020.12.19.10.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 10:32:34 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] shaderc: upgrade 2020.3 -> 2020.4
Date: Sat, 19 Dec 2020 18:32:25 +0000
Message-Id: <20201219183225.1480858-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ndor-libs-and-disable-git-versioning.patch | 19 +++++++------------
 .../{shaderc_2020.3.bb => shaderc_2020.4.bb}  |  2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2020.3.bb => shaderc_2020.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
index 0d58925adc..e4e3f0be1e 100644
--- a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
+++ b/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
@@ -1,11 +1,12 @@
-From e092619a9ef7910ad56acfb8728c66f0125d176a Mon Sep 17 00:00:00 2001
+From 180250f098e0ab899eff0db3708d9693f3486ff4 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 17 Oct 2020 12:51:50 +0100
-Subject: [PATCH 3/3] cmake: de-vendor libs and disable git versioning
+Subject: [PATCH] cmake: de-vendor libs and disable git versioning
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  CMakeLists.txt              | 2 --
  glslc/CMakeLists.txt        | 1 -
@@ -14,18 +15,15 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslc/src/build-version.inc
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a4e779b..cfa7bd8 100644
+index 5c74cd8..9451fbc 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -70,7 +70,6 @@ endif(MSVC)
+@@ -102,12 +102,10 @@ endif(MSVC)
  
  # Configure subdirectories.
  # We depend on these for later projects, so they should come first.
 -add_subdirectory(third_party)
  
- if(SHADERC_ENABLE_SPVC)
- add_subdirectory(libshaderc_spvc)
-@@ -79,7 +78,6 @@ endif()
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
  add_subdirectory(glslc)
@@ -34,10 +32,10 @@ index a4e779b..cfa7bd8 100644
  add_custom_target(build-version
    ${PYTHON_EXECUTABLE}
 diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index 0f5d888..08686e0 100644
+index 35b3f19..52006b8 100644
 --- a/glslc/CMakeLists.txt
 +++ b/glslc/CMakeLists.txt
-@@ -26,7 +26,6 @@ shaderc_default_compile_options(glslc_exe)
+@@ -53,7 +53,6 @@ shaderc_default_compile_options(glslc_exe)
  target_include_directories(glslc_exe PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/.. ${spirv-tools_SOURCE_DIR}/include)
  set_target_properties(glslc_exe PROPERTIES OUTPUT_NAME glslc)
  target_link_libraries(glslc_exe PRIVATE glslc shaderc_util shaderc)
@@ -48,6 +46,3 @@ index 0f5d888..08686e0 100644
 diff --git a/glslc/src/build-version.inc b/glslc/src/build-version.inc
 new file mode 100644
 index 0000000..e69de29
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.3.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2020.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index f5edf53caf..ee9b118371 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "1fce59794079f90ceb091190adbbb5499acd4e95"
+SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch \
            file://0003-cmake-de-vendor-libs-and-disable-git-versioning.patch \
-- 
2.29.2

