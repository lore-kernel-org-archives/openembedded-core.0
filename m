Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.22829.1627645516982390687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WksP76+j;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id b7so10956368wri.8
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uddZCl/hgMI7z6Id6DQc0vOu7dMzBCNULkOBp3AlXB0=;
        b=WksP76+jAyFM7p5Zi46JPE8VvtDEyQ+dUBh8A81YVMwQkGM0mPyg4VhvHmUQuANbYf
         lMO1oAAxox9I2G+JbCIbb3AhuBAKsZjR8xsOJSipF38gXfM7W7NfbCyKvR2skrRTEOJs
         cZU4mqslgcVwtUKxpt20DzsLkzzu3dXAdqQvuatJNssUIR9HwB6kth+64LVORTDAbvJi
         tStQcVNgdRxVYfbtY7yZ3lUxCuJ1aESOmkmBEj/7Qo5t3mbZIcJetcSbgGxY4XUr59BV
         tq8B4Si6Kl2RoF/w/amIJk33cQvZOpFagc1BcfIKNm6nmZCzvTUesgs7kxYKYccJ8Ika
         dULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uddZCl/hgMI7z6Id6DQc0vOu7dMzBCNULkOBp3AlXB0=;
        b=DY9V+Ytx4zCJP3kl2X1KIyekiFZ4BHwGqY6sIvYD5k1XwsFAky+26k4+oWggGoPX2Q
         ALBATp5aq8bJJjtUQ9AzJKWfcvIHbMfmXjXyjflV0Cu2JBWRW2jm/O6xV6k6LRXoCBoQ
         UcIU1dU7BCmpBCxzIEKTg/LvZw7nVnJ98cSjPh/hUupxtB8YFLNOdNGA4+2aIl5JiCL5
         3gE0emQEGKhr7/2B3dzFXiyAPbsUw4v3z5g7XZrV7BGqyc6IYaPAp4OrazBi1hCJUOnN
         CUps8RGK/xB6KbmGms5kOKYvC62zxkj/tLmRgzeqwLeUzeXmplefU0yplG4iC010S+PZ
         Sksw==
X-Gm-Message-State: AOAM531yscEhp648PPrYg86sk/PUKlO2r2ZGyqwOsqQxUK/89b6MjhhL
	EC2r1AJa3SgWi6D+NA905tEZNrxtgf4=
X-Google-Smtp-Source: ABdhPJyIPEQ3c+uwBi3QDMBGJ28Ku3bK9v4REDRR2DYq8XN4ZinUdp2xM9xAunGhHRCKoRyDydPKNw==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr2527633wrs.365.1627645515578;
        Fri, 30 Jul 2021 04:45:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/9] freetype: update 2.10.4 -> 2.11.0
Date: Fri, 30 Jul 2021 13:45:03 +0200
Message-Id: <20210730114507.732448-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting, changed location in source tree.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../freetype/freetype/use-right-libtool.patch | 23 ++++++++++++++++---
 ...{freetype_2.10.4.bb => freetype_2.11.0.bb} |  4 ++--
 2 files changed, 22 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.10.4.bb => freetype_2.11.0.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
index 3368f7ddd3..b389455f5d 100644
--- a/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
+++ b/meta/recipes-graphics/freetype/freetype/use-right-libtool.patch
@@ -1,3 +1,8 @@
+From 50499e4482d40cff2ef05905c658ba4380e7e6fc Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 7 Jan 2016 21:13:07 +0000
+Subject: [PATCH] freetype: enable out-of-tree builds, and use host zlib
+
 Freetype think that it knows best about where libtool is, and explicitly the
 libtool autoconf macros telling it where to find the libtool script.  Of course
 we prefix the script with the target triplet, so it's wrong.  Fix this by
@@ -7,8 +12,20 @@ put libtool is used.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
---- freetype-2.6/builds/unix/unix-cc.in.orig	2016-01-07 19:21:45.244943479 +0000
-+++ freetype-2.6/builds/unix/unix-cc.in	2016-01-07 19:21:50.213112131 +0000
-@@ -19,1 +18,1 @@
+---
+ builds/unix/unix-cc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/builds/unix/unix-cc.in b/builds/unix/unix-cc.in
+index 89be450..72609d3 100644
+--- a/builds/unix/unix-cc.in
++++ b/builds/unix/unix-cc.in
+@@ -16,7 +16,7 @@ CC           := @CC@
+ COMPILER_SEP := $(SEP)
+ FT_LIBTOOL_DIR ?= $(PLATFORM_DIR)
+ 
 -LIBTOOL := $(FT_LIBTOOL_DIR)/libtool
 +LIBTOOL := $(FT_LIBTOOL_DIR)/@LIBTOOL@ --tag CC
+ 
+ 
+ # The object file extension (for standard and static libraries).  This can be
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.4.bb b/meta/recipes-graphics/freetype/freetype_2.11.0.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.10.4.bb
rename to meta/recipes-graphics/freetype/freetype_2.11.0.bb
index 8462cd3511..2893e21fec 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.4.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.0.bb
@@ -8,14 +8,14 @@ BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 SECTION = "libs"
 
 LICENSE = "FreeType | GPLv2+"
-LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1 \
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
-SRC_URI[sha256sum] = "86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784"
+SRC_URI[sha256sum] = "8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.31.1

