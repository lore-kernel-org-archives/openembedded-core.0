Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.24831.1621869673779644506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CTc1HTY7;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id e17so10489760pfl.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K3uFmK2ypiRI6XOZPGiTi+nLpydh85qtvml/szlRF+w=;
        b=CTc1HTY7rexppDm3BepN60zjMaDEp7skVP2vBbWgGChRruTLaKamQPK+TynDOqyWeb
         avKPqkNnT7HLhUVnEKyfVENa3WW4Z7g5wC4FxG7HqLusBXRm2PaEI8BEC5NZ1cAdCbCq
         xE9UtfgZ0n+86rk5eJCJUYpVfpRgk8WNsVaXVfHZfhT0g8sROVTA6SQnGQXfkUDRfcSB
         roc5aFv5DJdGYoVkI0DQBwAgMvDZeeyk2AT8Il3n/7CAIxRCrcZP4+9yBTWsQpA2W02T
         tnywH8zOGcT2IWXh1chIJtap3ApGu6Liz2FlYSjCTmjWgERSmVxLvah0eYGfihPoFWqP
         QJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K3uFmK2ypiRI6XOZPGiTi+nLpydh85qtvml/szlRF+w=;
        b=fftACTlyXiM5ks/VbmvVf8tXdQfDdj92bLk35RsnxIfjX8STVRZbb8n7M9SinKjbV1
         SnxHJI0J/H2XtYKXqbvekGDxKiN6dZfnXncb4Dx98N6WuiVRwYULD971NoRZW7k9nKjr
         HyYTmaZRjEirIQAKfnMDRAuRavsNMAgN6NlfK86a7ejmkIqAwSslVQxW+eHerutpIHMq
         WAXDI7MOLvptBK2s7cBu/JqXHaK0Y/zDy+QiG/OHnt5digF5xwE39rfrgBynFEISy4Yw
         Y+6zltzcavfyk/jKFdHqp1lWEZxHl1mfxJAQU+8Caaz4AR7wmZb6DfhHKng7ypIovQ6u
         956A==
X-Gm-Message-State: AOAM531Gb+iUYBs84vLnWWRfDkVXAdyIDAjqp/z3MgKSGkhnnSc+pQZ9
	Kws83SQ0f5g/E6I9XiVJ9DM/irmxmkEelg==
X-Google-Smtp-Source: ABdhPJwiW7p08jz8rvaJvxrlaJ0stEAqvVpGcHqsAR73SD7wPAOuiTXVuYJxhxbeZz3lXhLrFdfVog==
X-Received: by 2002:a63:4386:: with SMTP id q128mr7565106pga.397.1621869672818;
        Mon, 24 May 2021 08:21:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id j2sm14425373pji.34.2021.05.24.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 08:21:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc: Update to latest on release/gcc-11 branch
Date: Mon, 24 May 2021 08:21:06 -0700
Message-Id: <20210524152106.4160032-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There has been 150+ fixes made available after gcc 11.1.0
was released, details of these fixes is here

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;hp=releases/gcc-11.1.0;h=9ee61d2b51d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use download mirror to fetch the patch

 meta/recipes-devtools/gcc/gcc-11.1.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
index 713002266a..aa7ac9be59 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -6,7 +6,7 @@ PV = "11.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "11.1.0"
+BINV = "11.1.1"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -25,7 +25,10 @@ LIC_FILES_CHKSUM = "\
 
 #RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
 #BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
+
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
+            http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=yes;name=backports \
+           "
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -67,6 +70,7 @@ SRC_URI = "\
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
 "
 SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
+SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
-- 
2.31.1

