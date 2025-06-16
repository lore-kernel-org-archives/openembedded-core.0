Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED3CC7EE32
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.26249.1750065415084199234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EwmfGTiR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065415; x=1781601415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u73iczd7lZyb/Ph6BbqpSj/B9ihBgaaimu4iR9m3ScM=;
  b=EwmfGTiRKEnCRX6j4ZmVkV7cMmUF4MWbYrRYKMJ/XU4XW2WGKqxzSmPc
   nS31yl+h6Uoxmf1AeJxq3MHw8lmgXkaaUTDvw+As8P9wRrb88v6LQmahQ
   O2Dn+T3dPAmIPTrQUbOj9HqcUpyoiswYoD5ewldaO/AW/WgpvGyJNajhR
   3q6HARYqGGlEJuVCc942Eow5ezQR48dXoYy0ZVHH7CQIAGbT7LoPt9sU1
   de6GNvg4j8HXBWqNO62BY4/lf0pVLTHt4ytF5PPpWUyCrFrN8yZgNXfjD
   9H/rQslpok7wlHYra2p5h2elmT9zZYmIrbMwTy8ZEdfeB+q1iQvy11mae
   g==;
X-CSE-ConnectionGUID: 5fA708xWQfef5h9e8Lzpdw==
X-CSE-MsgGUID: tYmBnf+3TnGuy+zVYrHWdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="181797828"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="181797828"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96747D8E1B
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41EE7D4C03
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 842451A0074;
	Mon, 16 Jun 2025 17:16:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/24] libffi: upgrade 3.4.8 -> 3.5.1
Date: Mon, 16 Jun 2025 17:16:24 +0800
Message-ID: <20250616091643.918-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218778

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

not-win32.patch
refreshed for 3.5.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.4.8.bb => libffi_3.5.1.bb}             | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.8.bb => libffi_3.5.1.bb} (89%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 8efeb9c357..26263731f3 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From d7263091bbea40fd97d4fccd295c0ea4f5a80ad7 Mon Sep 17 00:00:00 2001
+From 28d0fd6b73163fc2dbc10c7dc838a8222671f88c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f047895..630bdd5 100644
+index 258107d..ef1a285 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -402,7 +402,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -403,7 +403,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.4.8.bb b/meta/recipes-support/libffi/libffi_3.5.1.bb
similarity index 89%
rename from meta/recipes-support/libffi/libffi_3.4.8.bb
rename to meta/recipes-support/libffi/libffi_3.5.1.bb
index 7f927c650b..be16008e0f 100644
--- a/meta/recipes-support/libffi/libffi_3.4.8.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.1.bb
@@ -8,12 +8,12 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1db54c9fd307a12218766c3c7f650ca7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "bc9842a18898bfacb0ed1252c4febcc7e78fa139fd27fdc7a3e30d9d9356119b"
+SRC_URI[sha256sum] = "f99eb68a67c7d54866b7706af245e87ba060d419a062474b456d3bc8d4abdbd1"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.43.0


