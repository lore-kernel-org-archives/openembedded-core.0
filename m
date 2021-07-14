Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1613.1626228805440214807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 19:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ig2UfQDe;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id m83so626173pfd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 19:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4YOlNyydCZ5ZiqU9OxD3SYOq/wGrQbBTMN3FDqwQWTs=;
        b=ig2UfQDetLTqvl8451GOaF+Z/to5e0WbsbMnw6Vh7whoizO4DpZS3VVuYRUEFP5YB1
         zos61vz+Dd3aIg6QIhmQwVmNs/55JrTmstrHtJiC0VkCHoz7r1xBifv4xUAFTCi/mgKE
         9RGsy005vBB2p/xunFQPiPoNeu0RO2cR6jQOFEgclNCLDBbFPByXh86gPxmDeLKartvh
         DkeZQ4+J2O0pqKhsMgeemzG2d6aoG+H089xiZzdBTXWyKBeayitHdS65HkYjMxkjwnBf
         ApxrCSed4//afMeVkwxz6m2LGdJoyHlj8Vz51IdxASDal/pYMxEFD/6vkWN5R5Nwezad
         9Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4YOlNyydCZ5ZiqU9OxD3SYOq/wGrQbBTMN3FDqwQWTs=;
        b=boQtPxDbh9fgrOAx9JhzLyI9H/AVY3smDts2iT9/yHHUq0luJYMeUUI1Y0jjVF5yL8
         7DDGs9NYOZV8v0l5+C52yBcAYjmj6ctn6sU+K6EDshojsNdV8uUup1O22e2w3mekc5kM
         A56YA/V8ogVtZ+p5LQuqidYU5Ov3lUmEj9Hqa7i1es1suxQRzLZ4QbgbaVqvEH9saYr5
         xBeyStxkjzf9kbNgW61J+uECNvUAWhBLDZqxGHUz88/dFGROJ/vPzANivd0MOiO3xaRP
         SDHGXgqL1CLDCfD1isIbjAr8iPwuy3B6M+OecrgFUHvdSB+7Mk0NOVKEgPG8UmOI+BbO
         ULqg==
X-Gm-Message-State: AOAM531E0WG+TpGDD/muZ99CU0XrINFspHng/v6YPkQ0Lg4Z1NRflkZ0
	Vlj0T/EGdLAnovNHNB0Ir4weAzy1IRVTPQ==
X-Google-Smtp-Source: ABdhPJxZPtQy1x5gqLG1pOTWFIenc8ICysFAYcunWBYETcwnxgTRjdLENPTqf+n7tSetxm1r+tZ59Q==
X-Received: by 2002:a63:5e46:: with SMTP id s67mr7080916pgb.397.1626228804848;
        Tue, 13 Jul 2021 19:13:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id f5sm458321pfn.134.2021.07.13.19.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:13:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libseccomp: Update to main branch
Date: Tue, 13 Jul 2021 19:13:21 -0700
Message-Id: <20210714021322.1245535-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get RV32 imlementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-configure.ac-Bump-version-to-2.5.99.patch | 26 +++++++++++++++++++
 .../libseccomp/libseccomp_2.5.1.bb            |  7 +++--
 2 files changed, 29 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch

diff --git a/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
new file mode 100644
index 0000000000..f30ca77465
--- /dev/null
+++ b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
@@ -0,0 +1,26 @@
+From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Jun 2021 23:13:20 -0700
+Subject: [PATCH] configure.ac: Bump version to 2.5.99
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3e87734..48e796f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,7 +19,7 @@ dnl #
+ dnl ####
+ dnl libseccomp defines
+ dnl ####
+-AC_INIT([libseccomp], [0.0.0])
++AC_INIT([libseccomp], [2.5.99])
+ 
+ dnl ####
+ dnl autoconf configuration
+-- 
+2.32.0
+
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
index 8fe1023901..5f79f3dbcb 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
 
 DEPENDS += "gperf-native"
 
-SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
+SRCREV = "${AUTOREV}"
 
-SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
+SRC_URI = "git://github.com/kraj/libseccomp.git;branch=riscv32 \
+           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
            file://run-ptest \
            "
 
-COMPATIBLE_HOST_riscv32 = "null"
-
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest features_check
-- 
2.32.0

