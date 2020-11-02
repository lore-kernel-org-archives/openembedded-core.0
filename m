Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.1172.1604335769131415979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gwjqzyez;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id oq3so17942796ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lWdWaVxFp1Ux7ROWdETRrGo7QgmdlNSYHd5RX+gQfc=;
        b=gwjqzyezNiEfwm+ETlwry6iwK5H571rdjXrIJzVJHjVjcYeWkqeQYGNZBIS0GaTU8U
         9QYcuCFqzCp4T1WoyeqGQpOC2H8vZTlJlqamGxZM55aHYv5PqGk3+KK7Kq3nCMDuoXrW
         zp87v5m8Z8CbZS4/NHhuxXD7Un7COPje0m65SbcV6mYml2dlJ2qwPccHxupAyP4m2QN4
         UPyntJ+ys+UQtqM69Dy3Ed3T/tozS5b2mFDqtjjCIyo1TVpA2TD7SEsYut7mjsPZy5Vf
         fQTFF0oF+Km5Uq6KiCe8zQF5B7dei9fEoPINBMWTtqlzo1nkdMbLqcnlX5WzoEya8Vcw
         rkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lWdWaVxFp1Ux7ROWdETRrGo7QgmdlNSYHd5RX+gQfc=;
        b=BRTayWjZ9VZewsuKrUWYTcbvOE+buB/oEiGzeg1Sz0XlZzJ9vjn+8l5F1pszTb1vtg
         DJBxELWU46H7xTyeZTKpzuhFjeBkAo44+UEf+JGQWHjQurfZ0ncqkQP+1sTvFsX5qOmL
         82TFNvsFTdEMqFXBqi6+8YZDTtScyaeuswfFoWkZzyp+X+5l1yj2TNrCVTSvRVlsXhT6
         L2QbiIQQCxljK5z5bCsg72TYcY9VGzEZ1GfAghgVc65jv00XY58JC5M+h3Y7et/uGpSJ
         G8mP2Ywhol5V3GcbDyeZK/O6oKmMrd8SP+92k6y8op2GgDu/AcXez7t+phettSEZk/qc
         h+Zw==
X-Gm-Message-State: AOAM530Auwl7bHoZLFSxx5RWf1hE37Z14/wUaCIrYzNm9/qcJ6+vSNwQ
	fqsLzbkZfCysOLcVHaa/a9XTlIhmshzCiQ==
X-Google-Smtp-Source: ABdhPJy4Qb7ttNSscP+csObFftQHzjHLQOM8Ej5LsieQEpMSLhUoSsXzUqeYn6vDxpJnBm0wM+frww==
X-Received: by 2002:a17:906:d20a:: with SMTP id w10mr14326197ejz.3.1604335767408;
        Mon, 02 Nov 2020 08:49:27 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:26 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/80] adwaita-icon-theme: upgrade 3.36.1 -> 3.38.0
Date: Mon,  2 Nov 2020 17:47:58 +0100
Message-Id: <20201102164907.27572-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...ta-icon-theme_3.36.1.bb => adwaita-icon-theme_3.38.0.bb} | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.36.1.bb => adwaita-icon-theme_3.38.0.bb} (93%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 5da3fbf6d8..c8c70c4b58 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 0a867caa8803a78f7cf3a204c4c358bc63daaf28 Mon Sep 17 00:00:00 2001
+From 8b3b153b6b95662316528ef083365b46cf5f7841 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e749112..58790e8 100644
+index 449865d..888649e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.36.1],
+ AC_INIT([adwaita-icon-theme], [3.38.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
similarity index 93%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
index 2d78bea2c8..ff557978dc 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
@@ -16,8 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "c61ca9d6b3ce70a9ab66dcff945923ff"
-SRC_URI[sha256sum] = "e498518627044dfd7db7d79a5b3d437848caf1991ef4ef036a2d3a2ac2c1f14d"
+SRC_URI[sha256sum] = "6683a1aaf2430ccd9ea638dd4bfe1002bc92b412050c3dba20e480f979faaf97"
 
 DEPENDS += "librsvg-native"
 
-- 
2.29.0

