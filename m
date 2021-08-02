Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.15817.1627879045931395976
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sEOZCG4B;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so12337831pjb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fYtOp8GNPNLXlU/XSqIKORtaine5BGdjYMbfk2V25ss=;
        b=sEOZCG4BF5jsbYXL3lm+oJgOnxZ2xM7jgOLPvVN8BygVRrLlCMIpunXfZIFBlPddV9
         f9HEd4/73FjK3ak3a8rATSXtLtJvkoChLpBUQCQuoKKkGzdzSgFv8L8+N2X1y4kwkrPg
         gDq3kwAQAn63kZUSDwjB3FpeTEtyqXq7c6FCAtA7915gAvD75ZpvOMuVnQetmLQAruWi
         9cJ7B+S3fGwdZrd73KkAIQtz6CqPA7QMxDvP4e8ebQ4io8cYB9z5aTNPhVNw4oTlNl8x
         n4n2MmOGLis4HKiIgWYbu8CTcPMCGFnHinxvR8pfsTBG0ePsMCWzOpAo4cHo9bU77Th3
         7DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fYtOp8GNPNLXlU/XSqIKORtaine5BGdjYMbfk2V25ss=;
        b=sRGKB6SFhKmOeZBMaXQ5u81xK4nSv6ldOTrU97k4GRlh8qs3G5yRPmiL3I3ByvmZ9N
         U3wcyGBIG8t2Fl3h27rtgPb8B6MRj+yhWZfqRlYekjTnUc1B5S5C6gPOzOYHtp1up2Hl
         pkCd0Lgtc2w7xQX8VyrHPga3aSq6tBIAJ1r1IxhtJMKVI+mti2uBhIVqIbAfLCzBLYuf
         8pODpAfMjLBBVwAT5vym/pJ6qTPU1F0l1MtJhIPEjbCOB+VfLdvTK0Nl92MnChEib26e
         nDUdnzvfHdrEY6/Nbqj+xqA0+q/VsbiJWTtBoGfF62tT8gEAcuqdTEsHPaCpcNWW5EqQ
         3gFA==
X-Gm-Message-State: AOAM5330czdjw0WAHAEUJ/2hWA+L2UKCO5k7llBqQfT6Ii7bhRUIz1Bq
	Q+Ftz+K3j1yI2YaXC7oDhD8Rw+XzvmPyXw==
X-Google-Smtp-Source: ABdhPJz1tO1Iv8MkzPbIZYUe+8J+95L1xbcubsB7c9LDRY070w+By6QSatMj+iLft4UVGal6FnsgbQ==
X-Received: by 2002:a17:90a:c2:: with SMTP id v2mr15066480pjd.96.1627879045167;
        Sun, 01 Aug 2021 21:37:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id c23sm10060073pfn.140.2021.08.01.21.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 21:37:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] glibc: Drop DUMMY_LOCALE_T define patch
Date: Sun,  1 Aug 2021 21:37:20 -0700
Message-Id: <20210802043721.3458646-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802043721.3458646-1-raj.khem@gmail.com>
References: <20210802043721.3458646-1-raj.khem@gmail.com>
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
index c713faaff2..bc60359773 100644
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

