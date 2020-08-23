Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.181952.1598214078888097660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4t3bgan;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id f24so3958282edw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VS3IBAoLjaItDxgUaQUIA4sDlEcvPhe1EDuHgvN0FEI=;
        b=j4t3bganTC4wWcp+J6nYomHH5IFrAPmOSuRD3jWjogGsmFC1tKFuo9o7a8QncnRLOd
         u+g7EtLSXcq92dRK5/MkS1zDhEonjPbqQRGItERBYG5IJ7ZaybiIfNKDYsdWUDcp60pN
         IT/ge9tLFnul64t/N6R/RQvKU38Sh07wERCPvNOK0zjflsGGT354T811QxQoeytXSPaq
         0sJDjE9POYKqn6wQwYq9vTncGuJvwK/cbE35OLZvmxO10VWCdtgXy4qI4OcUFc057RS5
         vtszuIIx612yCTBNSBXY8oYGbuSlXs3x8xubE12mln7v2qYnLh4fJ8z6N/UI5izLfTAS
         cr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VS3IBAoLjaItDxgUaQUIA4sDlEcvPhe1EDuHgvN0FEI=;
        b=hG96LCkhinhZEmADAM6SPXhFQjyGmCe6x2iItX6BKs1VkdJQSckAYHgGR6pKQdl1KV
         FDB9BdesHZEPYPheZnW012M0qcM+d6C6fDxgb9Kc6SHC1t324fW5KClVLFebD22aI9iM
         Okwk1M3TJBJgPu3NwBJCePDf0sVIQjPN4Q1wiSu2ZTL9Nv/x/XZDvt+exNyZdp4s4+Mi
         2NYAQyR086EHktkSpEkoY+mX4GI/wwtREMoxKE1OLrsUwXNBG6tASVEGjS9thG5AzOIk
         uS5G83LHtT+XohiaVsP5hno/xFZBLahoSNXmd5g6GqlR1g32CX4QT+ghoGHEtU9lHjc0
         44mQ==
X-Gm-Message-State: AOAM533OsvxNpj2My2BxGkUgZDnnytNNMJpvrxP3E8uZdiVwaZY2K6s1
	ZROJ68EN9rjaOmicKEegz2SDiPzXRQw=
X-Google-Smtp-Source: ABdhPJx2ySo1nNOnJ/2W5wU0ICxIy0hh/y7lSpT5C0AFMcdlhpnCpdObiw+0CqfUuym3EvN7Y/O71g==
X-Received: by 2002:a50:e848:: with SMTP id k8mr2634099edn.192.1598214077063;
        Sun, 23 Aug 2020 13:21:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/37] font-alias: upgrade 1.0.3 -> 1.0.4
Date: Sun, 23 Aug 2020 22:20:06 +0200
Message-Id: <20200823202031.24686-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: editor tags change
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../nocompiler.patch                          | 24 +++++++++++++------
 ...ont-alias_1.0.3.bb => font-alias_1.0.4.bb} | 11 ++++-----
 2 files changed, 22 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-alias-1.0.3 => font-alias-1.0.4}/nocompiler.patch (52%)
 rename meta/recipes-graphics/xorg-font/{font-alias_1.0.3.bb => font-alias_1.0.4.bb} (59%)

diff --git a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch b/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
similarity index 52%
rename from meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
rename to meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
index 0b9fb8ccc0..e54eee4ea9 100644
--- a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
+++ b/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
@@ -1,22 +1,32 @@
+From fa2bbd48a55d54bd2dae30edf7936e3ab7587c96 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 17 May 2011 23:03:02 +0000
+Subject: [PATCH] Improve handling of 'all' architecture recipes and their
+
 Upstream-Status: Inappropriate [configuration]
 
 XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
 
 XORG_CWARNFLAGS -> AC_PROG_CC_C99
 XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
-XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host 
+XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host
 
 each of which triggers the use of the host compiler. As an "all"
 architecture package, it shouldn't need a compiler (and doesn't).
 
 RP 17/5/2011
 
-diff -uNr font-alias-1.0.3.orig//configure.ac font-alias-1.0.3/configure.ac
---- font-alias-1.0.3.orig//configure.ac	2011-05-18 21:29:18.378258643 +0200
-+++ font-alias-1.0.3/configure.ac	2011-05-18 21:32:06.865258593 +0200
-@@ -28,12 +28,12 @@
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3407c69..9fe1f89 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,12 +27,12 @@ AC_INIT([font-alias], [1.0.4],
+         [font-alias])
  AM_INIT_AUTOMAKE([foreign dist-bzip2])
- AM_MAINTAINER_MODE
  
 -# Require xorg-macros: XORG_DEFAULT_OPTIONS
  m4_ifndef([XORG_MACROS_VERSION],
@@ -29,4 +39,4 @@ diff -uNr font-alias-1.0.3.orig//configure.ac font-alias-1.0.3/configure.ac
 +XORG_INSTALL
  AC_PROG_INSTALL
  
- XORG_FONTROOTDIR
+ # Require X.Org's font util macros 1.2 or later
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
similarity index 59%
rename from meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
rename to meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
index c5990a9e44..e4b70c69dc 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
@@ -4,10 +4,11 @@ require xorg-font-common.inc
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf0158b89be493d523d69d9f29265038 \
-                    file://cyrillic/fonts.alias;md5=f40795b0640d6785826aecd3b16f6124 \
+                    file://cyrillic/fonts.alias;md5=d27bc65a2655cacdbc2644b51c064c20 \
                     file://75dpi/fonts.alias;md5=6bc48023f2ae7f3bfc105db7b0ee6b49 \
-                    file://misc/fonts.alias;md5=a8ec05d528431d4c9703b55a7efd67a8 \
-                    file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb"
+                    file://misc/fonts.alias;md5=1bdafa7c31aa54f87f3531f2ef8ed5a6 \
+                    file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb \
+                    "
 
 SRC_URI += "file://nocompiler.patch"
 
@@ -18,7 +19,5 @@ RDEPENDS_${PN}_class-native = "font-util-native"
 inherit allarch
 
 PE = "1"
-PR = "r3"
 
-SRC_URI[md5sum] = "6d25f64796fef34b53b439c2e9efa562"
-SRC_URI[sha256sum] = "8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a"
+SRC_URI[sha256sum] = "f3111ae8bf2e980f5f56af400e8eefe5fc9f4207f4a412ea79637fd66c945276"
-- 
2.28.0

