Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.2816.1593155942477032411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aboJEXVt;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id d15so6110138edm.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j60jdCgIoeYoOZmPTDCr1FiuJ9fOcn3t4cyMn7ZIQoM=;
        b=aboJEXVtTE4vHYib5f09YhD2EfebVVc8Tr4uzmu3I+V59dSK3NHftNIdNFM18tsW/P
         InRZOBYKhOCRfOVeiUt2etLQ16hHnfUIp+uHBr6i86GxqBSZcKUSNTiqWo1zKA6ccgCI
         FaZ/xT6wwS7Cz90RvFc0dBeKMjLbPqdbNmY2fsiMW3Oc2qMGU8GVzC/u0e6hmPcl5K5t
         3jsKRWL772yBvDol+l8/xzgSbYsZYYKmsxX4ey8l6H5KUvYyWmKcC8I61ksalKn2neRI
         GuzO7s9zJKkUSNhY84qrQEQ4vKh8QcCwHzOkF6lHEblmqMcvenqeUYsshmrc5jWrGJMY
         Hsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j60jdCgIoeYoOZmPTDCr1FiuJ9fOcn3t4cyMn7ZIQoM=;
        b=f8pxCFBz+0ZsMRjV4p3gm6ZBdyoquSBys13H5FQQBbQEjJ6j787mzc+XIgelxHfmYu
         d3bGOa3tUMnh5pYAu9e6PxVzT4VEIdpT+5aayJzbO/piryPeKL9YrnBxrHM3qMJot/pd
         2vmDqciVtP2Owr6P4QMWZwvUp1PmmnQuVXPueGNqfeD3/ouonaFTjoMH8Nwyu7HkEnwT
         2jKuGN+jRWiUdswK8/NXG5p1stYP9RkA67kKz8O1UJ+xqrh7SHWqFbNV8ykzHkVk10Fc
         jCCOlPvFe6R9cOSUnTuiAeLtliV8jbxCdE80i65zgcO2LXEPr/Rywk/CFP7SHKyz361q
         EMtg==
X-Gm-Message-State: AOAM532+k6WnGMcodkiYoYZe+xC3SIOFWstGVvoAXIkfyiGYpV3Qr4gC
	uagz/gNuT4aCVX74iuw5xMBztvHlwVU=
X-Google-Smtp-Source: ABdhPJw8FaWsMSEL4dIlByR/vCjbriyxRAGazUU19IUdcgS2iAIehFN27iUGaI6W0FAIG1R3y6uWIg==
X-Received: by 2002:a05:6402:94f:: with SMTP id h15mr1986620edz.313.1593155940788;
        Fri, 26 Jun 2020 00:19:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/30] meson: upgrade 0.54.2 -> 0.54.3
Date: Fri, 26 Jun 2020 09:18:16 +0200
Message-Id: <20200626071844.29134-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  3 +-
 .../0001-Make-CPU-family-warnings-fatal.patch |  2 +-
 ...sort-shared-before-static-fixes-7171.patch | 35 -------------------
 ...pport-building-allarch-recipes-again.patch |  2 +-
 .../{meson_0.54.2.bb => meson_0.54.3.bb}      |  0
 ...on_0.54.2.bb => nativesdk-meson_0.54.3.bb} |  0
 6 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch
 rename meta/recipes-devtools/meson/{meson_0.54.2.bb => meson_0.54.3.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.54.2.bb => nativesdk-meson_0.54.3.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index a0b54f57db..ffa17b3061 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,9 +15,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
-           file://0001-boost-Always-sort-shared-before-static-fixes-7171.patch \
            "
-SRC_URI[sha256sum] = "a7716eeae8f8dff002e4147642589ab6496ff839e4376a5aed761f83c1fa0455"
+SRC_URI[sha256sum] = "f2bdf4cf0694e696b48261cdd14380fb1d0fe33d24744d8b2df0c12f33ebb662"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 8b2263588c..1be94a9b19 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 830db2c7a136b2446d740c9ca025374352ffd16d Mon Sep 17 00:00:00 2001
+From 62c415eedb62905de76e2e0bbd156a947705cab2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch b/meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch
deleted file mode 100644
index 217218180e..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-boost-Always-sort-shared-before-static-fixes-7171.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5862ad6965c60caa861dfdcd29e499c34c4d00da Mon Sep 17 00:00:00 2001
-From: Daniel Mensinger <daniel@mensinger-ka.de>
-Date: Thu, 21 May 2020 13:35:27 +0200
-Subject: [PATCH] boost: Always sort shared before static (fixes #7171)
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/5862ad6965c60caa861dfdcd29e499c34c4d00da]
-
-Signed-off-by: Andrew Geissler <geissonator@gmail.com>
----
- mesonbuild/dependencies/boost.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/boost.py
-index 6e85c534..38497041 100644
---- a/mesonbuild/dependencies/boost.py
-+++ b/mesonbuild/dependencies/boost.py
-@@ -189,13 +189,13 @@ class BoostLibraryFile():
-     def __lt__(self, other: T.Any) -> bool:
-         if isinstance(other, BoostLibraryFile):
-             return (
--                self.mod_name, self.version_lib, self.arch, self.static,
-+                self.mod_name, self.static, self.version_lib, self.arch,
-                 not self.mt, not self.runtime_static,
-                 not self.debug, self.runtime_debug, self.python_debug,
-                 self.stlport, self.deprecated_iostreams,
-                 self.name,
-             ) < (
--                other.mod_name, other.version_lib, other.arch, other.static,
-+                other.mod_name, other.static, other.version_lib, other.arch,
-                 not other.mt, not other.runtime_static,
-                 not other.debug, other.runtime_debug, other.python_debug,
-                 other.stlport, other.deprecated_iostreams,
---
-2.26.2
-
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 18517a6e26..b5b463e68e 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 45df8f0a71c6b60cb98a336f8690af04965dfa9b Mon Sep 17 00:00:00 2001
+From d976d5a8abd6d42edf794d2a4c211fc6697fb14c Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_0.54.2.bb b/meta/recipes-devtools/meson/meson_0.54.3.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.54.2.bb
rename to meta/recipes-devtools/meson/meson_0.54.3.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.54.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.54.3.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.54.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.54.3.bb
-- 
2.27.0

