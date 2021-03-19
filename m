Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.3564.1616143511120381892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hyw02PXg;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id l4so8357188ejc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qG0BODIBrxmNxUWLytwzGKkA8N/spd0Wdb/qMzRLxvM=;
        b=Hyw02PXg/8XNowlYMc4zrprof+hICgvEwQssh7Y5ccJgND+orXxnrooltESfFoVZAp
         147zZP5vynGKh9jZkQaj7cg0RDb5+4l1DbZHU/f9ncnVS/88w7DbcOme9/JvqJ2VO0v5
         wfjoyJN3RvqUv8oG6cZnCM9Vb41xVll7wj05e3tkb4tVyiKSGvbtoNll1sbUzEPgPqsR
         JDn56QkUqpbhDpcJfEljGjHOuW94d1H8K46lRSE23J0JZmkLnnaIuIGe2iyCUhDH9Zjb
         Yy1ebpL/hiVxLbvvi8SrtaLWcCjYPRVibrbR69gpSTFrEaNhakaDy5UNkhZWoFxvvlZv
         z2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qG0BODIBrxmNxUWLytwzGKkA8N/spd0Wdb/qMzRLxvM=;
        b=BzdmFRkGmxWL3qN5qErDGXd2bQGnhPPWxgAXGIsPFmTG0XmyQmtlQboCbMIIkm/C8/
         tZ8VvXfL76tztSacNgl3mggeuv92VmbFieh6hCuQ7SYGWtWy3lZIpIMMGWuB1BMRVY0T
         gxr6I66kPaiiOUqmwlld+YS1FYkaLzSkG9pOsgH2LYMwvqeep8cKfjQQbh1Xds2r7kiy
         wAI0DpsseZnrwUbWHZWI++5kbPIgsFAmc63yzpZblxHpOjL1hFDm4MvaOdkJMmFGAmWk
         dl2YOTg4I4c8/EPc96DsMUlb0rkMA66V9XqgZZmOmH/E74ZZCxv1sqfgY+qoavBkYJsG
         2uew==
X-Gm-Message-State: AOAM531mfJDStWMacQLIJYWUfczzwvV7KCA/s950t3jt7i5h9LTcgOca
	eVfoos0V3m3PMVBK/pgZrLmNgWDuwohA0w==
X-Google-Smtp-Source: ABdhPJxFKI9qUARFgpaIfniVZva9Mq4B4g1ZGX+ZzVp+r1CDh3PlAw5KThItQBlQD9io1f7MQCccDQ==
X-Received: by 2002:a17:906:b4c:: with SMTP id v12mr3077579ejg.330.1616143509547;
        Fri, 19 Mar 2021 01:45:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/16] vulkan: upgrade 1.2.162.0 -> 1.2.170.0
Date: Fri, 19 Mar 2021 09:43:48 +0100
Message-Id: <20210319084401.576728-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...2.162.0.bb => vulkan-headers_1.2.170.0.bb} |  2 +-
 ...name-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch | 40 -------------------
 ....2.162.0.bb => vulkan-loader_1.2.170.0.bb} |  7 ++--
 ...1.2.162.1.bb => vulkan-tools_1.2.170.0.bb} |  4 +-
 4 files changed, 6 insertions(+), 47 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.162.0.bb => vulkan-headers_1.2.170.0.bb} (93%)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.162.0.bb => vulkan-loader_1.2.170.0.bb} (87%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.162.1.bb => vulkan-tools_1.2.170.0.bb} (89%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
index 19ae67cdd4..4c9c94f3d2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.170.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209"
+SRCREV = "1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch b/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
deleted file mode 100644
index 26b1a40f26..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5ae24ece75f2caa69216da7075334711642f5588 Mon Sep 17 00:00:00 2001
-From: Michel Zou <xantares09@hotmail.com>
-Date: Wed, 16 Dec 2020 15:03:23 +0100
-Subject: [PATCH] Rename LIB_SUFFIX to VULKAN_LIB_SUFFIX
-
-Closes #527
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Loader/commit/66a23ac8c566299343668f094de50798a5f4a0e4]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- loader/CMakeLists.txt | 2 +-
- loader/vulkan.pc.in   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/loader/CMakeLists.txt b/loader/CMakeLists.txt
-index 659511855..ba9f460f1 100644
---- a/loader/CMakeLists.txt
-+++ b/loader/CMakeLists.txt
-@@ -327,7 +327,7 @@ if(PKG_CONFIG_FOUND)
-         set(PRIVATE_LIBS "${PRIVATE_LIBS} -l${LIB}")
-     endforeach()
-     if(WIN32)
--        set(LIB_SUFFIX "-1")
-+        set(VULKAN_LIB_SUFFIX "-1")
-     endif ()
-     configure_file("vulkan.pc.in" "vulkan.pc" @ONLY)
-     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/vulkan.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-diff --git a/loader/vulkan.pc.in b/loader/vulkan.pc.in
-index fc17cb1f3..44049ee34 100644
---- a/loader/vulkan.pc.in
-+++ b/loader/vulkan.pc.in
-@@ -6,7 +6,7 @@ includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
- Name: @CMAKE_PROJECT_NAME@
- Description: Vulkan Loader
- Version: @VK_API_VERSION@
--Libs: -L${libdir} -lvulkan@LIB_SUFFIX@
-+Libs: -L${libdir} -lvulkan@VULKAN_LIB_SUFFIX@
- Libs.private: @PRIVATE_LIBS@
- Cflags: -I${includedir}
- 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
similarity index 87%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
index d39e7af975..0f43650698 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
@@ -9,10 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
-           file://0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch \
-           "
-SRCREV = "7a313093b5c4af964d50a5a64e73d7df6152ea3f"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git"
+SRCREV = "c5678a03db383fd0dc5bfb8e9a383043bdbcb57b"
 
 S = "${WORKDIR}/git"
 
@@ -27,6 +25,7 @@ EXTRA_OECMAKE = "\
                  -DBUILD_TESTS=OFF \
                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
                  -DASSEMBLER_WORKS=FALSE \
+                 -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
                  "
 
 # must choose x11 or wayland or both
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
index a5c3bbcb14..9079d921a7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
-SRCREV = "8f0c2e40d4134f53f82ce48de72c7be92baa6b3d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git"
+SRCREV = "88ea55de928a08ba5c5f65a93d1e7c8f666fc43f"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

