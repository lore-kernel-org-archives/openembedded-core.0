Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.7845.1614526642831553686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pMjwuacu;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g5so23563743ejt.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=awCK1JBHMPicETV1Tdu6CbpbtdKuiztQBPlAy6NXv8M=;
        b=pMjwuacu81GaihIWpGEKjL5wx1kA1o+hQUh7V/ziiKsKziNDt/1TbXywRq+veHL+l8
         XVbrYB6GIG9huw42309gcg36fDz7iLY4Cz3TRn8FNEx/RxeBMfpLDszaFebdQdra0sHb
         mE1WvBL0h/n3uOgCkZcE41zT15A7IcvD9dzPu9l2dQ8oSMZTBS9aml1WHsEUUiSFlG4d
         ea40lEQDHjHl/wcEgKo2b8VStTd8ASj5gp33Y83eOx5DfQPTyDHFpLcYZrmCB0z9fxnm
         WWJKjBe5J3GqwEtQjn1gACfwbiTNJq0eFAQRwAGrZshdECNF+83xhs6Pa/8ZmpWD/CfZ
         2aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=awCK1JBHMPicETV1Tdu6CbpbtdKuiztQBPlAy6NXv8M=;
        b=KMVr+M4TD7TIyk2EcwXrzWP1FxjSApYA1ic2YC9JLHdmP3h3H1HCXTZBcWhDm1qqrz
         d5vVN1C3CFq+NcxwhLs8h3coqlhyx8lpOBhuSKKPasqqisS4ENn77VrUXO3nhi6o8NYl
         kxUNBitT5vlM9yTjrnVn9lp6o/oSFulyqP8Vjpt5RmWuwmzA/gxLiAKr0AsNqgxoleeJ
         rnRBu0GyNXw2AX1UgrsI8TLXlVa8KSZs0ynSrdXtzR1r8ClVwSd+3ThyDX7Ld656114/
         Ea42D8aOZ76xaha8Fc6EQU9VgonhwHFcbxMg56xWt0ERhkXUgXvdZBlW5v07gKFeQdTH
         5pag==
X-Gm-Message-State: AOAM5308rhof6UItmlVRUmOUBo1GrpQsxneHSsZuu/gdMkBMZxslrbEV
	EhLimvLrblLgH0g+juPEh5l+Q2tJbSq9oA==
X-Google-Smtp-Source: ABdhPJzWQGq7F35b7CYovLTHBXqVzsAloVAvMisGq99HaL9dxDH6SYMvBcnKeXzZKDExAru3+8sDtA==
X-Received: by 2002:a17:906:7194:: with SMTP id h20mr9926001ejk.154.1614526641413;
        Sun, 28 Feb 2021 07:37:21 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:21 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/24] webkitgtk: update 2.30.4 -> 2.30.5
Date: Sun, 28 Feb 2021 16:36:52 +0100
Message-Id: <20210228153702.498275-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch | 14 +++++++-------
 .../{webkitgtk_2.30.4.bb => webkitgtk_2.30.5.bb}   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.4.bb => webkitgtk_2.30.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
index aa9a06701a..0c31c5fa21 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
@@ -1,4 +1,4 @@
-From 0afc194c6446e6c3242f1d706b4564e3a9cb2cee Mon Sep 17 00:00:00 2001
+From 4718888071e29deb8b245b88c81577fd5bac4e5e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 29 Aug 2016 16:38:11 +0300
 Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
@@ -11,12 +11,12 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
-index a074a80..8c6ebb5 100644
+index a069c5f6..ea2f542b 100644
 --- a/Source/WebKit/PlatformGTK.cmake
 +++ b/Source/WebKit/PlatformGTK.cmake
-@@ -728,8 +728,9 @@ if (ENABLE_INTROSPECTION)
-     string(REGEX MATCHALL "-L[^ ]*"
-         INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
+@@ -650,8 +650,9 @@ if (ENABLE_INTROSPECTION)
+         set(GIR_SOURCES_TOP_DIRS "--sources-top-dirs=${CMAKE_BINARY_DIR}")
+     endif ()
  
 -    add_custom_command(
 -        OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
@@ -26,7 +26,7 @@ index a074a80..8c6ebb5 100644
          DEPENDS WebKit
          DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
          COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-@@ -773,7 +774,7 @@ if (ENABLE_INTROSPECTION)
+@@ -699,7 +700,7 @@ if (ENABLE_INTROSPECTION)
      add_custom_command(
          OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
          DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
@@ -35,7 +35,7 @@ index a074a80..8c6ebb5 100644
          COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
              LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
              ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-@@ -828,7 +829,7 @@ if (ENABLE_INTROSPECTION)
+@@ -761,7 +762,7 @@ if (ENABLE_INTROSPECTION)
  
      add_custom_command(
          OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index a16a676d7a..2928b8e55b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://include_xutil.patch \
            "
-SRC_URI[sha256sum] = "d595a37c5001ff787266b155e303a5f2e5b48a6d466f2714c2f30c11392f7b24"
+SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.29.2

