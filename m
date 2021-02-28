Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.7681.1614526639589938229
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6JcoFBY;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id w1so23544449ejf.11
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MHTBR1kwkdGbvMT4ibJ8N1BGt7U+kJrPRqFTSlkuiFQ=;
        b=n6JcoFBYEDr4DkBVwX87TKRqSuFQo8hx3qnxz0oosB9rQUlBt8TFvbUa1wBPGMOlD1
         yDxuIIQSelVZySFlHZ5vjb+xk8Y/VaVx6hcZOvOMjk4pWbYIvhz2uRGFlFdPg/u0yuoz
         xdWO8PGaDckegWg8Nw6h3m7meuVhQAPiPSd4cUGw0jKoqCxLeyhcaQKS2v/DAiRU9giA
         UqXJvgOe5QWtjv2BX5H71ybOlFobeJVw5tbdbwOyIqL5DjElC1+zHLySwJnSZ+YaHrHR
         eV4J8wjw5Z8k51+ujCWnVosFOu8A2t755S/0jWYmX2xTUPeua6SrfViK1L8bNNiDDycg
         PxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHTBR1kwkdGbvMT4ibJ8N1BGt7U+kJrPRqFTSlkuiFQ=;
        b=f1v1x6fOPApARlyhWBomWXS1LRmkqxjm3egKUgtea9QsLs5y0Luo2lKLVO8C2TK2qG
         d3J7kwHwfJlsq9cA+2cPsRs9vRv5XGdpYAjRyTONMIh8p2xmvovljgDbhQzp4JFLBZZD
         QXcSNsmwVR0u8ES3/obdnMEhchZeZxe6Hys3PrqCOG0a/AHRNMYR6kXdivnWtG5Y3e+e
         K+Tir15USVZpbk4LYZc5abxMNCUufYb0Sc4NCkn4KbbSB4M1KsNZr3MLWUTyQQGiQ1M7
         ZwUfpYZxqSENHV7SLK8NschzMhshnShP7albY9lwunJSK2CJFgoK6t3kQNuXXqYOTXN9
         1fuA==
X-Gm-Message-State: AOAM531XZY2vpmuXsHw3FUHSqow74Kd4vM6jNNza4NTsrd98rrTPgvNY
	mrRQVqrN4k6aVEMvwza6JC4zwKZ1yDZf6g==
X-Google-Smtp-Source: ABdhPJxmDJRdtiiyErbiPUwgZJRKID0tr43hWhDzazAOs2lTbMLg8yTGNbwn/JESqREu/S2t9okhjQ==
X-Received: by 2002:a17:907:76b6:: with SMTP id jw22mr1927223ejc.11.1614526638241;
        Sun, 28 Feb 2021 07:37:18 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:17 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/24] librepo: update 1.12.1 -> 1.13.0
Date: Sun, 28 Feb 2021 16:36:47 +0100
Message-Id: <20210228153702.498275-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch | 38 +++++--------------
 ...les-with-pkg-config-not-with-cmake-m.patch |  8 ++--
 .../{librepo_1.12.1.bb => librepo_1.13.0.bb}  |  2 +-
 3 files changed, 15 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.12.1.bb => librepo_1.13.0.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index b61f0c9324..46ab9a1132 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From b08a3b71e716dd0485ef51036d32e4c304fb4e67 Mon Sep 17 00:00:00 2001
+From 82bd6d196a0453657cbacaaedd75b2d2fe0bf9ba Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
@@ -7,35 +7,17 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- librepo/python/python2/CMakeLists.txt | 12 ++++++------
- librepo/python/python3/CMakeLists.txt | 12 ++++++------
- 2 files changed, 12 insertions(+), 12 deletions(-)
+ librepo/python/CMakeLists.txt | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/librepo/python/python2/CMakeLists.txt b/librepo/python/python2/CMakeLists.txt
-index a0f1f9a..1665079 100644
---- a/librepo/python/python2/CMakeLists.txt
-+++ b/librepo/python/python2/CMakeLists.txt
-@@ -1,9 +1,9 @@
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
--from sys import stdout
--from distutils import sysconfig
--path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
--stdout.write(path)"
--OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
-+#from sys import stdout
-+#from distutils import sysconfig
-+#path=sysconfig.get_python_lib(True, prefix='${CMAKE_INSTALL_PREFIX}')
-+#stdout.write(path)"
-+#OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
+diff --git a/librepo/python/CMakeLists.txt b/librepo/python/CMakeLists.txt
+index 52fc39e..2024407 100644
+--- a/librepo/python/CMakeLists.txt
++++ b/librepo/python/CMakeLists.txt
+@@ -16,12 +16,12 @@ SET (librepomodule_SRCS
+ 
+ MESSAGE("Building python bindings")
  
- MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
-diff --git a/librepo/python/python3/CMakeLists.txt b/librepo/python/python3/CMakeLists.txt
-index 52ba44e..da51e10 100644
---- a/librepo/python/python3/CMakeLists.txt
-+++ b/librepo/python/python3/CMakeLists.txt
-@@ -1,9 +1,9 @@
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
 -from sys import stdout
 -from distutils import sysconfig
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index 73902e5f58..d61d8fbf85 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
@@ -1,4 +1,4 @@
-From f5a1dfe4c87c228165bc25e7fe464120d8139a3d Mon Sep 17 00:00:00 2001
+From 25113b34bc1aae377d7bf447e69528783e2c177e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:23:27 +0200
 Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
@@ -12,13 +12,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e949dbe..c954b2e 100644
+index a45d5c4..40249e6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -31,7 +31,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
+@@ -32,7 +32,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
  PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
  PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
- FIND_PACKAGE(CURL REQUIRED)
+ FIND_PACKAGE(CURL 7.52.0 REQUIRED)
 -FIND_PACKAGE(Gpgme REQUIRED)
 +PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
 +set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
diff --git a/meta/recipes-devtools/librepo/librepo_1.12.1.bb b/meta/recipes-devtools/librepo/librepo_1.13.0.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.12.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.13.0.bb
index e90928d2ed..0a68e0ac4f 100644
--- a/meta/recipes-devtools/librepo/librepo_1.12.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.13.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "d4ad350291f2937c0b6a3eea9e1d0c8e1051fc32"
+SRCREV = "a244d78bab11510408fb9413f1c78c2f56c69fa5"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

