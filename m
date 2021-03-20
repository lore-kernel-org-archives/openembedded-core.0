Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9654.1616277001912960519
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EjIZZOEs;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c17so1448579pfn.6
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 14:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TsRy/ulQT9nPwdZKcH8EA40BrYcN9Df5WNDZfnuItc=;
        b=EjIZZOEsaXJ7bvGHbX2j86fNLsSktlVRsFUsl4Fyt6W7Be7WBvQO3QMpL8lFyGs322
         8lLuJiqYnLNdSYaZccnwyiPeGJiZmd8sz2q7j+y/54Dvbd4a2ndiSdQ06/aQBV/X+e7K
         XzQkKGN1/VUdNMI8BMURwgntWCWkSq0sl/mqwHKh8lfsIxagvHH4cppkeHmLrBzgJrzs
         IuDz0p8Ctl5yjEAPDvXZimmmgKZouz7HYciuIvW/D9WFIzmLS9ZjBJstYME41w0Aerc+
         5zO4A/P3Uu/XR2NlipFapIg9olEyYCCYHJA7yaLhtkAbgwk+6cjVWUsAsG88lpKvUnQW
         R2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TsRy/ulQT9nPwdZKcH8EA40BrYcN9Df5WNDZfnuItc=;
        b=Sxi7fORIsQnQmdxesip3MGZyK4Mojbk3oPPyvL2umBpc5OyauQ46usNi+9DZHuCELw
         QOR0LVIarFKq/kOUUAI2C5aZ9kYz2O6oJ9LrnlH4CqrV8Ff9XlvR0LKwmaQFV18EYQGT
         ciqOQL+mXyslG1QcD2sfztClVGmj9KLAiCk6AfSEbXsLVqKoWa4iny37ChmVTH5et8u8
         0dj5vwudkS7xN9NU6yVNwBX1ullSWUOoAIZj1z4xGgdREFGFhIrNf3tV8jYDBSZUM9OF
         9dTNkGz21h6aoqJVlZAFXLRi++BpXeO/JubbP2aspubehc2TDzZxBvAN4N7qef+dtrXP
         9/tA==
X-Gm-Message-State: AOAM5305uQdiqKP6dpq2OOyWcRH75caMf2JAMgrhlfJjVJ26Abm1iHVl
	VWzx4vrxPrmCLd7OaP7dcT+EylurV6Ft6A==
X-Google-Smtp-Source: ABdhPJyBSHPX021FaT/CfxSInOYn/UlyNHADSYqGnztuJVSCEUymIYeo09FemR2IjDIVYXbznJ8nnw==
X-Received: by 2002:a63:d70f:: with SMTP id d15mr17131233pgg.397.1616277001186;
        Sat, 20 Mar 2021 14:50:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id q25sm9212316pfh.34.2021.03.20.14.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:50:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2 3/3] apt: Do not disable NLS
Date: Sat, 20 Mar 2021 14:49:56 -0700
Message-Id: <20210320214956.2477142-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210320214956.2477142-1-raj.khem@gmail.com>
References: <20210320214956.2477142-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to disable cmake po targets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-cmake-Do-not-build-po-files.patch    | 37 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.2.2.bb        |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
new file mode 100644
index 0000000000..2837b7f1b3
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -0,0 +1,37 @@
+From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 Mar 2021 14:45:18 -0700
+Subject: [PATCH] cmake: Do not build po files
+
+Fixes
+| CMake Error at CMakeLists.txt:252 (add_dependencies):
+|   The dependency target "update-po4a" of target "update-po" does not exist.
+|
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3c8ec3f..821a24f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -245,13 +245,6 @@ add_subdirectory(ftparchive)
+ add_subdirectory(methods)
+ add_subdirectory(test)
+ 
+-if (USE_NLS)
+-add_subdirectory(po)
+-
+-# Link update-po4a into the update-po target
+-add_dependencies(update-po update-po4a)
+-endif()
+-
+ # Create our directories.
+ install_empty_directories(
+   ${CONF_DIR}/apt.conf.d
+-- 
+2.31.0
+
diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
index 7ee661d4c8..d1aa5de8df 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
            file://0001-srvrec-Keep-support-for-older-resolver.patch \
+           file://0001-cmake-Do-not-build-po-files.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -41,7 +42,7 @@ BBCLASSEXTEND = "native nativesdk"
 DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
 
 EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
-    -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg \
+    -DDPKG_DATADIR=${datadir}/dpkg \
     -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
     -DWITH_TESTS=False \
 "
-- 
2.31.0

