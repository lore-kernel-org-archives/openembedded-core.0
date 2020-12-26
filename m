Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.19199.1608974898455623096
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXy+nKWa;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r5so5535934eda.12
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y5d2EVL77MxpF+mAstn/vwayH1BPVbCnIb75JKBNhFs=;
        b=eXy+nKWavuDC/+Sxfjh0F9EEOFoADUtszfY2jOZiSHd62AlvlTen0AQoihxwtjgunJ
         6HzDhhir29lKwdv2u3neYEZnmKs/cQTZ0ilXeYzHxXuk+47e9QYqfDeLN3UpsmRvNdZo
         REler9SaHY5TBqYvdAgfrRvrrmVhXIjX+38KNLI42Nq1VOpyaQLdfQ06RmK6dHETo8dx
         j/iHcogHB9G3G2kx9B46zQ5peTa8MJ2QUT1d3lBAS0MT+Uy5J1dP7rbYII14I+OxBNNf
         715ZMXgN48xgBxdef6EK5mtqBPRtCcAgUkPGNnof3fqtLjIbQ3xx+qAtNzSVn8/8WPzA
         JoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5d2EVL77MxpF+mAstn/vwayH1BPVbCnIb75JKBNhFs=;
        b=PWWdUPTCxJgjYGNkwFPaNIJm4evuCygBvsKd9QNi9UxPIqHF89oMmhcP6tU8t4WcKm
         0UuBPGhp6VYMnPJt2DM9wH+/Fbn2mt7jtCwzqn6vx2u9gqyoYL3mQHo+lL/jimkxYFtq
         f5qFd768Ri/VGMSuvA6cHg3Om4cxTEa/WrWdJP08xEy0w6I8sZZqKULYiQkpa/R2H5ui
         h4oyb6j/Wo4ruMEzvVhAtm37xvPs3GZdBrFRWqyg7DDPRVbHEDEtjHGXkg+TT0kqI51T
         bSUrmozj5RksnVy9kglzzZHZAAlh2Ww2e0FbPJ2JLBekFhQdlVnG5cbxQ/jBgqCi4kPJ
         1MeA==
X-Gm-Message-State: AOAM533BrVYYn9v44pvpy4hyjoh/+BSukGGQilO7fN4OgIZ8Acu9aOqo
	F287Tzx03j2i62Hwcw9zTZZa60GEEjo=
X-Google-Smtp-Source: ABdhPJwrCNbhQzQawiPkk8EBVKKB41fpbD8XSlZ/Zvh2GnycpawP1dSPpwtjsmpS7u1bLOYP5vFfwA==
X-Received: by 2002:a05:6402:1045:: with SMTP id e5mr35076749edu.40.1608974897071;
        Sat, 26 Dec 2020 01:28:17 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:16 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 44/48] vulkan-loader: upgrade 1.2.154.1 -> 1.2.162.0
Date: Sat, 26 Dec 2020 10:27:28 +0100
Message-Id: <20201226092732.52323-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...name-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch | 40 +++++++++++++++++++
 ....2.154.1.bb => vulkan-loader_1.2.162.0.bb} |  6 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.154.1.bb => vulkan-loader_1.2.162.0.bb} (87%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch b/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
new file mode 100644
index 0000000000..26b1a40f26
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
@@ -0,0 +1,40 @@
+From 5ae24ece75f2caa69216da7075334711642f5588 Mon Sep 17 00:00:00 2001
+From: Michel Zou <xantares09@hotmail.com>
+Date: Wed, 16 Dec 2020 15:03:23 +0100
+Subject: [PATCH] Rename LIB_SUFFIX to VULKAN_LIB_SUFFIX
+
+Closes #527
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Loader/commit/66a23ac8c566299343668f094de50798a5f4a0e4]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ loader/CMakeLists.txt | 2 +-
+ loader/vulkan.pc.in   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/loader/CMakeLists.txt b/loader/CMakeLists.txt
+index 659511855..ba9f460f1 100644
+--- a/loader/CMakeLists.txt
++++ b/loader/CMakeLists.txt
+@@ -327,7 +327,7 @@ if(PKG_CONFIG_FOUND)
+         set(PRIVATE_LIBS "${PRIVATE_LIBS} -l${LIB}")
+     endforeach()
+     if(WIN32)
+-        set(LIB_SUFFIX "-1")
++        set(VULKAN_LIB_SUFFIX "-1")
+     endif ()
+     configure_file("vulkan.pc.in" "vulkan.pc" @ONLY)
+     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/vulkan.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+diff --git a/loader/vulkan.pc.in b/loader/vulkan.pc.in
+index fc17cb1f3..44049ee34 100644
+--- a/loader/vulkan.pc.in
++++ b/loader/vulkan.pc.in
+@@ -6,7 +6,7 @@ includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
+ Name: @CMAKE_PROJECT_NAME@
+ Description: Vulkan Loader
+ Version: @VK_API_VERSION@
+-Libs: -L${libdir} -lvulkan@LIB_SUFFIX@
++Libs: -L${libdir} -lvulkan@VULKAN_LIB_SUFFIX@
+ Libs.private: @PRIVATE_LIBS@
+ Cflags: -I${includedir}
+ 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
similarity index 87%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
index 23bf59f8a6..d39e7af975 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
@@ -9,8 +9,10 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.154"
-SRCREV = "2aa801755eab3fab610d9676c4dd94054e30c854"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
+           file://0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch \
+           "
+SRCREV = "7a313093b5c4af964d50a5a64e73d7df6152ea3f"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

