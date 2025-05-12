Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8913AC5479B
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.45975.1747040642648610192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kyOTBQbZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UsALQ5E2H9IIWNRc6Vin6++Ay0bKLvFc9pXH3XY82e8=;
  b=kyOTBQbZSeXf0gn7CEwfeJJw52D4GGnVzLok+HvsiiN8XuMUjxEeudN7
   dYrfs3tWNrJ17chMxokgbrayfIiXKk1FfuMmsSenTuExh9/0yx26OCOXc
   fj49+P6xd742lqPAJbAD5Q7daTasRABjexkZxruFGmBoS64CYZ811W46e
   6OxCGhIkrMikvB2DQWNT+nCXTDQgc2Yms32yS/+0ZGfQRK+TL0oshnTyA
   U9b7ZgFZq6Kg9Ty9LPzAMigbE84D5oklI9Aw60K5tjTZU33wHrwtmEsfj
   sfWpy7WjWdcyLqetWDEnpxNil3J0ZJw3jVAIizbq31lBwYnjjSxpVtFkM
   g==;
X-CSE-ConnectionGUID: /LZ042JcSq2vjQhqdb0GzA==
X-CSE-MsgGUID: jgl1MCE5TraDLvt8HMlg3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125950"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125950"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C95A7D5059
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 89E25D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1FC141A009A;
	Mon, 12 May 2025 17:03:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/56] libffi: upgrade 3.4.7 -> 3.4.8
Date: Mon, 12 May 2025 17:03:05 +0800
Message-Id: <1747040619-7566-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216323

From: Wang Mingyu <wangmy@fujitsu.com>

not-win32.patch
refreshed for 3.4.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.4.7.bb => libffi_3.4.8.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.7.bb => libffi_3.4.8.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index f4ed839ed8..8efeb9c357 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From be9d4cc110c159812699780348686da371296b94 Mon Sep 17 00:00:00 2001
+From d7263091bbea40fd97d4fccd295c0ea4f5a80ad7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 816bfd6..e37c5a8 100644
+index f047895..630bdd5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -401,7 +401,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -402,7 +402,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.4.7.bb b/meta/recipes-support/libffi/libffi_3.4.8.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.4.7.bb
rename to meta/recipes-support/libffi/libffi_3.4.8.bb
index b2caaa88ba..7f927c650b 100644
--- a/meta/recipes-support/libffi/libffi_3.4.7.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.8.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1db54c9fd307a12218766c3c7f650ca7"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "138607dee268bdecf374adf9144c00e839e38541f75f24a1fcf18b78fda48b2d"
+SRC_URI[sha256sum] = "bc9842a18898bfacb0ed1252c4febcc7e78fa139fd27fdc7a3e30d9d9356119b"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.43.0


