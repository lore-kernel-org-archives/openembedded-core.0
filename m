Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9694.1629636709300943562
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iQZCy4ib;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so21788438wrn.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A9nIIvPecHOBQ0y47MBZfWr4yzVpn1CtQnmAR6CRszo=;
        b=iQZCy4ibwaL1AoRoKSSjOU8nygkdW32aeABKpLcrUth7CrbfPc1Txc5cFdB8993Q4T
         5BnqMhp73D15Bkb2MRMcX+M735hFXeWxqdJjsXBFnh/bl38CaF7vSzruwPABcjeIw3cm
         86CikWkkmFlAWZjjhCHpY1wGe1jo3aIJ3GGnrsILMp3MGGgNWEQtt0JI9wJ61yxhioEj
         GJVqMM4dVowwhWyOaEb1iumjjjlP7jcL4euiVq/pifA9LUrhCLDbC290hc3WzKhe1YpJ
         uQlNLB+St1ZkO+op7X2Y1ThSBlqEOtwh5m3mcs0MHk/+UGJniOjpn2Ckf+stIIrE05y7
         vY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A9nIIvPecHOBQ0y47MBZfWr4yzVpn1CtQnmAR6CRszo=;
        b=VkaqvVZ4az1m0H4vOspI2zuR/ZLpUEODidUXtZg7bnKIghiYAuiJeF8STv/nC7aIFV
         55363PcAQR76n1ufAqgo+06TPuDIK05qToWO9uw4Wwgxf+TGEt1DIEHnfAM4ToBJabil
         bgktkrbgrYlqCLURqZqbhH3wAIJ+PrjPOXglKdFiSygXNMlJFyJgo48Kr/wdu0/g5luX
         VCnZ4wTR9bt20mmsWq9bxMLSpuJLklmIqaAXPUPB5MwXXPDO445OOvHBZonyTrArQcmp
         tuJciah2LbPo8P5sBhzt1w0+yDXlYoJf7iUGVuAr0sMe0AFtf4jn5ZQRgfJ15Ytg37R1
         garQ==
X-Gm-Message-State: AOAM531FNAkkSQtmSi8yWEdewvtN+Tr2tqfIHeLJO/09iAp10hKG+tbY
	K1QA5JT+QEufFklTTd8jm9ADTgLuCEAHFQ==
X-Google-Smtp-Source: ABdhPJz6qFDD3OfV5jpn+bdPAzA1Xl3VZrpPfK3OtKUOCYGx7AkfmHoJFX6WCuL6mf53XAEWgIBfrg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr8550802wru.261.1629636707962;
        Sun, 22 Aug 2021 05:51:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 54/55] rng-tools: upgrade 6.13 -> 6.14
Date: Sun, 22 Aug 2021 14:51:02 +0200
Message-Id: <20210822125103.310416-54-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...o-detect-non-posix-extensions-for-pt.patch | 41 ++++++++++++++++
 ...-either-pthread-affinity-set-methods.patch | 47 +++++++++++++++++++
 .../{rng-tools_6.13.bb => rng-tools_6.14.bb}  | 15 +++---
 3 files changed, 96 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
 rename meta/recipes-support/rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb} (84%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch b/meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
new file mode 100644
index 0000000000..89edc4c403
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch
@@ -0,0 +1,41 @@
+From 66e6adc138eef1367d7492fb79ae4da84ed62934 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@gmail.com>
+Date: Thu, 15 Jul 2021 08:43:01 -0400
+Subject: [PATCH] Adding ability to detect non-posix extensions for pthreads
+
+Theres a desire to build rngd with musl, which doesn't have all the gnu
+extensions (but it has some).  So test for those.  Note, this requires
+the addition of the USE_EXTENSIONS macro to enable -d_GNU_SOURCE
+
+Upstream-Status: Backport
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9df633d..d0c2179 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,7 @@ AC_CANONICAL_TARGET dnl required for broken AX_PTHREAD
+ AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS([rng-tools-config.h])
+ AC_CONFIG_MACRO_DIRS([m4])
++AC_USE_SYSTEM_EXTENSIONS
+ 
+ dnl Parse options
+ 
+@@ -100,6 +101,12 @@ AS_IF(
+ 	], [AC_MSG_NOTICE([Disabling JITTER entropy source])]
+ )
+ 
++AC_CHECK_DECL(pthread_attr_setaffinity_np,
++		[AC_DEFINE([HAVE_PTHREAD_ATTR_SETAFFINITY], 1,[Set ATTR_SETAFFINITY])],
++		[ AC_CHECK_DECL(pthread_setaffinity_np,
++		   [AC_DEFINE([HAVE_PTHREAD_SETAFFINITY],1, [Set PTHREAD_SETAFFINITY])], [ AC_MSG_ERROR([Neither pthread_setaffinity_np nor pthread_attr_setaffinity_np found])],[[#include <pthread.h>]])
++		], [[#include <pthread.h>]])
++
+ AS_IF(
+ 	[ test "x$with_nistbeacon" != "xno"],
+ 	[
diff --git a/meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch b/meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
new file mode 100644
index 0000000000..f7470d04bf
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch
@@ -0,0 +1,47 @@
+From e4909f329245db52415102e96fc7c99ca1445d05 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@gmail.com>
+Date: Thu, 15 Jul 2021 08:48:10 -0400
+Subject: [PATCH] Allow for use of either pthread affinity set methods
+
+musl has support for pthread_setaffinity_np, but not
+pthread_attr_setaffinity_np.  so check for hte existence of either
+function in configure, and use the appropriate one.
+
+Upstream-Status: Backport
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ rngd_jitter.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index ea29436..5c7e09e 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -67,12 +67,25 @@ static int rngd_notime_start(void *ctx,
+ 	for(i=i-1;i>=0;i--) {
+ 		CPU_SET(i,cpus);
+ 	}
+-	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
+ 
++        /*
++	 * Note that only one of:
++	 * HAVE_PTHREAD_ATTR_SETAFFINITY
++	 * and
++	 * HAVE_PTHREAD_SETAFFINITY
++	 * Will ever be set, as per the configure.ac logic
++	 */
++#ifdef HAVE_PTHREAD_ATTR_SETAFFINITY
++	pthread_attr_setaffinity_np(&thread_ctx->notime_pthread_attr, cpusize, cpus);
++#endif
+ 	ret = -pthread_create(&thread_ctx->notime_thread_id,
+ 				&thread_ctx->notime_pthread_attr,
+ 				start_routine, arg);
+ 
++#ifdef HAVE_PTHREAD_SETAFFINITY
++	pthread_setaffinity_np(&thread_ctx->notime_thread_id, cpusize, cpus);
++#endif
++
+ 	CPU_FREE(cpus);
+ 	return ret;
+ }
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.13.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
similarity index 84%
rename from meta/recipes-support/rng-tools/rng-tools_6.13.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.14.bb
index 84dbc76855..6b79a3b040 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.13.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
@@ -8,13 +8,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils openssl"
 
-SRC_URI = "\
-    git://github.com/nhorman/rng-tools.git \
-    file://init \
-    file://default \
-    file://rngd.service \
-"
-SRCREV = "d8dac0e8bede73e42b3d59f3b48c662ad0032e8c"
+SRC_URI = "git://github.com/nhorman/rng-tools.git \
+           file://init \
+           file://default \
+           file://rngd.service \
+           file://0001-Adding-ability-to-detect-non-posix-extensions-for-pt.patch \
+           file://0002-Allow-for-use-of-either-pthread-affinity-set-methods.patch \
+           "
+SRCREV = "c16176d3800b91f4d016b66733b384493b06f294"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

