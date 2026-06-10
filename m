Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC51CD98CD
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16557.1781085004856593375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MPhjXYoU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085005; x=1812621005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bIy8y4+gpnDWFxP1E0u9bZ8qgvUQVLk2jLMBxw/7Y44=;
  b=MPhjXYoU+9T7YDQM2nLXlP4CFTzmd2JarolA6ctMJRMxIgtGbg3IQiZL
   m6QiqUNpkfw/e5KgwU6BCPQMzTKEpJI8chtNorrbuOyGtgaIpwh+0eCRJ
   6RubhTfs+c8JbNEUMnRSZV9XSncj8Jq1yXGsIKVa3il06nLuk1Y3RFgut
   Rc6KfvhXYZIWMZyrqGiCX0s09Cbmhum/CW02Yro00Ly14tHqMETnezDj7
   VJp/ZvvkuL1iFQC7rELl557fZrcCjNgRcgTJ9vxj2oVI/XXWYVvKeaOp/
   J0bna+FFEVym5/2THIRz3+QgP2kabhk3vDgg8Y9DPaLe32WCA1amM4EfP
   Q==;
X-CSE-ConnectionGUID: y27DRBuITHOZ0ep8vcE5Vw==
X-CSE-MsgGUID: SHyv/bAjTt2H6r7r1BLAGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="246966930"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="246966930"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6D77C8203C3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:03 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 24844180025A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4D45E1400270;
	Wed, 10 Jun 2026 09:50:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/16] ghostscript: upgrade 10.07.0 -> 10.07.1
Date: Wed, 10 Jun 2026 17:49:25 +0800
Message-ID: <20260610094932.2264-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238335

From: Wang Mingyu <wangmy@fujitsu.com>

out-of-tree.patch
refreshed for 10.07.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ghostscript/ghostscript/out-of-tree.patch | 30 ++++++++-----------
 ...ript_10.07.0.bb => ghostscript_10.07.1.bb} |  2 +-
 2 files changed, 14 insertions(+), 18 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.07.0.bb => ghostscript_10.07.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
index 202c9d6c7c..8cf539a3cd 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -1,14 +1,21 @@
-Fix the build to do out-of-tree properly.
+From 6d9852d5bac17a5fc7f605bd596e93528b0fcf81 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 2 Apr 2026 14:41:42 +0100
+Subject: [PATCH] Fix the build to do out-of-tree properly.
 
 The patches are in progress but are being submitted upstream.
 
 Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=709289]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff -rU3 a/configure.ac b/configure.ac
---- a/configure.ac	2025-09-09 10:36:39.000000000 +0100
-+++ b/configure.ac	2026-03-31 15:35:08.988262612 +0100
-@@ -400,7 +400,7 @@
+diff --git a/configure.ac b/configure.ac
+index b2b3678..dd00e86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -400,7 +400,7 @@ if test x"$with_arch_h" = x""; then
            *)
              ARCH_CONF_HEADER=
              if test x"$host" != x"$build"; then
@@ -17,18 +24,7 @@ diff -rU3 a/configure.ac b/configure.ac
              else
                ARCH_CONF_HEADER=
              fi
-@@ -869,8 +869,8 @@
- AC_SUBST(RECURSIVE_MUTEXATTR)
- 
- dnl Tesseract/Leptonica detection
--TESSERACTDIR=tesseract
--LEPTONICADIR=leptonica
-+TESSERACTDIR=$srcdir/tesseract
-+LEPTONICADIR=$srcdir/leptonica
- OCR_VERSION=0
- OCR_SHARED=0
- LEPTONICAINCLUDE=
-@@ -886,7 +886,7 @@
+@@ -889,7 +889,7 @@ AC_ARG_WITH([tesseract], AS_HELP_STRING([--without-tesseract],
  
  if test x$with_tesseract != xno; then
    AC_MSG_CHECKING([for local Tesseract library source])
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
index 1b6cb4aaae..3254872036 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch \
            "
 
-SRC_URI[sha256sum] = "ed6ea62022e3f4d5a6569b6efc9361b63a6d118bfcad8f0beb897c37885b5cad"
+SRC_URI[sha256sum] = "2fc74362f9be6fae1b0a65d38fdcfd4f0b518cc3b07c5581fb661eb4d2e15251"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.43.0


