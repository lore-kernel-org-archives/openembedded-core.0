Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.1745.1589477414449422500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gqIpln+G;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id f6so1534072pgm.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=84wJTmHipKBumV9pzB6i1hKN5a5an2wJ+OwBYrbN9r0=;
        b=gqIpln+G8WSLXAE719aKcQmD7b/PNHopuFn+Jr1a5PD++qXemyHshYPAmBXvXwbD9B
         PO4oK7XMU/DGP4n8RNC+TUg2ZkJUmeZ9e6DxdaEG39AcZo6BVlIw3W19BdlSKQdzpIEg
         KXOIJ1d81v/daiu3yhaGdCviQMmNztjn/xsZuLLZJLokicOk2kcylnGU7qjzaaLCR6RL
         LH1r0AGUSPtmNIXykp+CIhYw7RjNKfFZQWC1BWa2qU6bSy4JNwknAIdU8SLvQGtlEMc4
         K6wnehVB5m4QZ+liFf8eiR7/wgdVYp0qxBljt2AaQgbRpVrBVdzX/8ER4j3lrWiPmBTp
         9uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=84wJTmHipKBumV9pzB6i1hKN5a5an2wJ+OwBYrbN9r0=;
        b=YYYEK0FninOqy2TA2fBjm9IhKfLpBWTGECORls2rZH6h0cb6l8455mUd7q/L+5X1y5
         2w/JdX0b5Nv2oKSwKjY6R9s9iw5cls9xks5QjUc3ugRM30cTVG0csbVYW/VXfoNedeBa
         bAsyZH5z2+8ZpmQAWTWD8FcMX2otqFHPAOzWaNNHfkMIYK24w66Wy1A8Nf+NIFQZnHQU
         MwYZcjCe8H1eJidHNmIn5vTycgaCF3GSN2ORTBwzjUHbJap9oaG3qps4uxAI0fKAfGTK
         kgYBQY3BdTEBLPivywTVefesy2+6/vJITkXGRD7xQAYz4UFokQccuwh3qhvZ6Q9zg7c+
         cJSQ==
X-Gm-Message-State: AOAM530xMXmBGDVAfGOUWthLfI2whJ6faKjLSTADJmeB/pHbhGAuJ0cg
	xYXnX1W+PGbGkMRHP5SP93rPZ7Caj9M=
X-Google-Smtp-Source: ABdhPJzT2sVPUyv75DB1o195EHyAW9lCdbtKcv8BJO3kjMhqVfsui89bx9ByPifaH69yHeSU8NHGkw==
X-Received: by 2002:a65:6094:: with SMTP id t20mr5122523pgu.220.1589477413580;
        Thu, 14 May 2020 10:30:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3cf8])
        by smtp.gmail.com with ESMTPSA id a21sm1977460pfk.32.2020.05.14.10.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:30:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc: Drop reverting __getauxval patch
Date: Thu, 14 May 2020 10:30:10 -0700
Message-Id: <20200514173010.3407-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514173010.3407-1-raj.khem@gmail.com>
References: <20200514173010.3407-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue has been fixed in valgrind itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-10.1.inc        |  3 +-
 ...se-__getauxval-instead-of-getauxval-.patch | 47 -------------------
 ...mic-Do-not-enforce-march-on-aarch64.patch} |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch
 rename meta/recipes-devtools/gcc/gcc-10.1/{0039-libatomic-Do-not-enforce-march-on-aarch64.patch => 0038-libatomic-Do-not-enforce-march-on-aarch64.patch} (96%)

diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
index 82b5a20a42..041d426187 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -65,8 +65,7 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-Enable-CET-in-cross-compiler-if-possible.patch \
            file://0037-mingw32-Enable-operation_not_supported.patch \
-           file://0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch \
-           file://0039-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0038-libatomic-Do-not-enforce-march-on-aarch64.patch \
 "
 SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
 
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch b/meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch
deleted file mode 100644
index fc9228277a..0000000000
--- a/meta/recipes-devtools/gcc/gcc-10.1/0038-Revert-AArch64-Use-__getauxval-instead-of-getauxval-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 2101fb718935c7cf1cc2ad201bdeb1e635b54b0a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 11 May 2020 11:03:41 -0700
-Subject: [PATCH] Revert "[AArch64] Use __getauxval instead of getauxval in LSE
- detection code in libgcc"
-
-This reverts commit 5a57016dd2758cc63a544f191f77635342397a72.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libgcc/config/aarch64/lse-init.c | 17 ++++++++---------
- 1 file changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/libgcc/config/aarch64/lse-init.c b/libgcc/config/aarch64/lse-init.c
-index 00e9ab8cd1c..74acef25cce 100644
---- a/libgcc/config/aarch64/lse-init.c
-+++ b/libgcc/config/aarch64/lse-init.c
-@@ -29,20 +29,19 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- _Bool __aarch64_have_lse_atomics
-   __attribute__((visibility("hidden"), nocommon));
- 
--/* Gate availability of __getauxval on glibc.  All AArch64-supporting glibc
--   versions support it.  */
--#ifdef __gnu_linux__
-+/* Disable initialization of __aarch64_have_lse_atomics during bootstrap.  */
-+#if !defined(inhibit_libc) && defined(HAVE_SYS_AUXV_H)
-+# include <sys/auxv.h>
- 
--# define AT_HWCAP	16
--# define HWCAP_ATOMICS	(1 << 8)
--
--unsigned long int __getauxval (unsigned long int);
-+/* Disable initialization if the system headers are too old.  */
-+# if defined(AT_HWCAP) && defined(HWCAP_ATOMICS)
- 
- static void __attribute__((constructor))
- init_have_lse_atomics (void)
- {
--  unsigned long hwcap = __getauxval (AT_HWCAP);
-+  unsigned long hwcap = getauxval (AT_HWCAP);
-   __aarch64_have_lse_atomics = (hwcap & HWCAP_ATOMICS) != 0;
- }
- 
--#endif /* __gnu_linux__  */
-+# endif /* HWCAP */
-+#endif /* inhibit_libc */
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc-10.1/0038-libatomic-Do-not-enforce-march-on-aarch64.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch
rename to meta/recipes-devtools/gcc/gcc-10.1/0038-libatomic-Do-not-enforce-march-on-aarch64.patch
index fecb562f51..3946acea11 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1/0039-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0038-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 411fc85c14bb14b07c0db807c55d25ce3f3e507f Mon Sep 17 00:00:00 2001
+From 38d262bfe7c0c894c364dc6e4dc7971e78a73974 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
-- 
2.26.2

