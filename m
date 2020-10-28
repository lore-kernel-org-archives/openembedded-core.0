Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.3888.1603919180808084648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YbWWxvvi;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id l24so930804edj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O/GYLEkEFGVkz6gPaLD5SOvBg/wEy1+oK7huhrLqcNE=;
        b=YbWWxvvimG00a3EzvLI+b76fk+IOV7lRZJeP/7ITswTm5EX1Hi8EEBf98yfnUiYcs7
         HLcG6/yMpRH+cUY4eR9bU25dh/DV73/pVdalVHJrlQgHlUtojDWPS3CfEsdylauiJOOQ
         LJpJUhI2Li2Nuk8PmEGFweGatxgZ/vFDTxmBHOFXaSzLpXhnJKNPidGLyHIG6Sm3TSo+
         SDAMPRD+JieC2/z2WEePb1EtfJJDyUcx3b5ovxElCbDeESAtLFavNIe2t3mAMxTISnOr
         r80byKRoev466OK7OX5TojHzsdPLLUpfdXYomIwYyPrdWKfud8ssRbsPgxHXW5pPfRy3
         YOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O/GYLEkEFGVkz6gPaLD5SOvBg/wEy1+oK7huhrLqcNE=;
        b=TDfefdBuNWqQGULdfu5OnkrWBCHdB6VCb8JQS/V6s/3tYipuLmJgwWnFkfl0A6rls5
         8vXpJVMBvzSzjpS5+lGSSGGlkaDQ0nn+0yrCMNKH398+Dz8Ni+NQguBsGdhY1ohKYjnZ
         jsw/1E0OEA8q2kDL4TWYRMdaKU+kiZCwdFSKML0mB6JS4vjzdCxP7y+fQKxAbkv7T9VJ
         aTvQyGH5zAtN9HtYmP37CeJeGedctjiBS9Xb6CA/TPn34gQ/QoI9zn0dvInujRXDWW+h
         swfBFIvcWZd+mOe35NvarjaLN8I1p8arSHBq6jioZJSkxJh3asaibOieXC4uO8CyhgTB
         92AQ==
X-Gm-Message-State: AOAM532TNPLsBZ0gjLFpkgl97ml9gL5kblixvG1jdc9RXFWekvEaQCPp
	YLXP1XHppsVHiUGIrOcG4MYwHTnNmcFLnA==
X-Google-Smtp-Source: ABdhPJwe98e1fg2JNZeG22IqMDDpnc7H7oOoWQJlbfFE8XaqAlI+J4cNt1pgRRAkRz3UZ2Q94VMLUw==
X-Received: by 2002:a50:dec5:: with SMTP id d5mr860401edl.362.1603919179142;
        Wed, 28 Oct 2020 14:06:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/33] gsettings-desktop-schemas: update 3.36.1 -> 3.38.0
Date: Wed, 28 Oct 2020 22:05:40 +0100
Message-Id: <20201028210558.21070-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop 0001-Do-not-skip-gir-installation-for-cross-compiling.patch as
upstream has done the same change.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...gir-installation-for-cross-compiling.patch | 33 -------------------
 ...bb => gsettings-desktop-schemas_3.38.0.bb} |  4 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.36.1.bb => gsettings-desktop-schemas_3.38.0.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch
deleted file mode 100644
index c481b18f1c..0000000000
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-Do-not-skip-gir-installation-for-cross-compiling.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 42e58c4c3e95a4a78ee8294f9b3901726bbbabe4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sat, 11 May 2019 00:21:11 +0200
-Subject: [PATCH] Do not skip gir installation for cross compiling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We are cool and can handle cross gobject-introspection.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- headers/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/headers/meson.build b/headers/meson.build
-index 3ce8b61..1132695 100644
---- a/headers/meson.build
-+++ b/headers/meson.build
-@@ -19,7 +19,7 @@ enums_xml = custom_target(
-   install: true,
-   install_dir: schemasdir)
- 
--if not meson.is_cross_build() and get_option('introspection')
-+if get_option('introspection')
-   noinst_lib = shared_library('noinst',
-                               headers,
-                               install: false)
--- 
-2.20.1
-
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
index f54b242e73..34681197d8 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.36.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
@@ -13,6 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "708ddd8dec388ebda5539667604197c3"
-SRC_URI[archive.sha256sum] = "004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9d9"
-SRC_URI += "file://0001-Do-not-skip-gir-installation-for-cross-compiling.patch"
+SRC_URI[archive.sha256sum] = "5704c8266004b296036671f223c705dc046aa694a1b1abb87c67e7d2747a8c67"
-- 
2.29.0

