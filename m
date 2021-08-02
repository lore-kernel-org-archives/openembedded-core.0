Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.15997.1627879904231364135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rCmbhfDI;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so4001928pjs.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ziDFBXPmtJ68XCIjzzeX+SHTZZs/kAEk/dJ5MTlnyE=;
        b=rCmbhfDIIDKhkmSDvJi0BrMNuhC+GIr4/9AvhUIBjfy5d8qkxdz9NmaNC09PBeQY87
         Tx+pVQonYfVJLRYPIQBlPCK2FettzgAnc/ARZ4q98YV4nntnaAXw/9rRZ606EVqCW1Vb
         PUPZMTCum7Fw9/7sSHkEyjNqcD8xd1Sm5Jz8+tvUwy9L2dg8Yr1BsaOhEO4/3GAbrLGg
         GX0p6104iB89xCKgF0oxpPzg1SfV5MjhsOsysfE02LnMwMykdhrTm+facVcfmS0BFFYh
         k/2TkArO4EPWULjV669dAV0gYVNvTwmxWPaRKcoMT6ydwi4Uqu0kJ9pRNdUWTxd2Mv5k
         /ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ziDFBXPmtJ68XCIjzzeX+SHTZZs/kAEk/dJ5MTlnyE=;
        b=Qpd/3kQ92Mq/Z5Zh3V6KfR4N4htluvmByU5fVyPRDEVtvRwW4qeyM8448OeptmYRw6
         Zukm2ieQjKGpwv113uG6XCG3GEI8FZCgwPqQ1KdtiB+1cTx3o4eEYghiMEIttN/sgh9G
         OYaK14KRyF1HwTvmmlPfaAM9RKY9EJWdScSBJLc+YQE/CKP03hIcQlxwhShKrcq51m3/
         EkGhqAgS0GSia9O/27gpHRa9dxuzKUU1iQuyUlWsRYBqtOCdytb0mkjXZ6I9ge+shsTE
         wF1/eDU0p2eUxpBE7hSAQUTiy/YgwQnJhlYWEKjk1YEGhmtl+Lr9MtAJfpSdOKFCex1l
         ogRw==
X-Gm-Message-State: AOAM532Fl+7RT2QJJUqVNQ/GWqENRCn1Qi/eHlPDaLYqME8Q3H0qDjsR
	MKEWtOEMtiuczb7DabuNOLN2Vv0F0lXeRA==
X-Google-Smtp-Source: ABdhPJyW15h7D99sj9s/ficmV3/CNnXEj75til+ijDY18iIL33WW6owUlYmZtGb07NITvm+aHQsacw==
X-Received: by 2002:a65:40c6:: with SMTP id u6mr1061786pgp.390.1627879903695;
        Sun, 01 Aug 2021 21:51:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id 16sm10153313pfu.109.2021.08.01.21.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 21:51:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] glibc: Drop DUMMY_LOCALE_T define patch
Date: Sun,  1 Aug 2021 21:51:38 -0700
Message-Id: <20210802045139.3481193-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802045139.3481193-1-raj.khem@gmail.com>
References: <20210802045139.3481193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was needed for very old centos distros which are no longer supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.34.bb      |  1 -
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch | 29 -------------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 -
 3 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
index 1543b92a7e..6100f3d4c4 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
@@ -31,7 +31,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
 "
 # Makes for a rather long rev (22 characters), but...
diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
deleted file mode 100644
index f195e07891..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9e07bc25e344152d7bf0712152d9c5fe4abcbf46 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
-
-This is a hack to fix building the locale bits on an older
-CentOs 5.X machine
-
-Upstream-Status: Inappropriate [other]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- locale/programs/config.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/locale/programs/config.h b/locale/programs/config.h
-index 2edcf3696c..5350101e38 100644
---- a/locale/programs/config.h
-+++ b/locale/programs/config.h
-@@ -19,6 +19,9 @@
- #ifndef _LD_CONFIG_H
- #define _LD_CONFIG_H	1
-
-+#ifndef DUMMY_LOCALE_T
-+#define DUMMY_LOCALE_T
-+#endif
- /* Use the internal textdomain used for libc messages.  */
- #define PACKAGE _libc_intl_domainname
- #ifndef VERSION
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 9017e8ccde..da0f456990 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -48,7 +48,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0026-intl-Emit-no-lines-in-bison-generated-files.patch \
--
2.32.0
