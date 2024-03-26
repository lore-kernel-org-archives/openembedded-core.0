Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4338CC54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7887.1711413316904058813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bKFG2iZc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413316; x=1742949316;
  h=from:to:cc:subject:date:message-id;
  bh=cITBs5/2rHfz9BkIfs/Kp8ChKD+Zk/mgO4pLNBT4QwQ=;
  b=bKFG2iZckLgycK9Mi+FcTKzql1lJ8uVyCzL6A0ShaIyYq4kB1FLHU8Gh
   YDfAuiWUcN5aFg3zd0eUC2NmiywFWpy0XiwEiYz3MFYlhLxX8S1lzDV/R
   NXLB0/02rc7ErC1CrtdCfPjocNsvAuxFQeLC8WEnegHBeeN9Ide5D136t
   lDZ99p/ybb7xSIK2id5Yn/pwYvFOjaIFtjz3vhU97RDXhHWmPG4vCeqbn
   hNSL910joBTdRd3FpOgvImCt7cbMdiO77ywGN5xU8rwgY4pjhp84VGdAi
   CZcd7fY2glPbLX8fGTQMtHa6YQhAdNcRQrIJg/8mo4W7mSLQj33IEKoVJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="140943722"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="140943722"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E2C311AE3C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59081B3C99
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4A8920097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4CC7A1A006A;
	Tue, 26 Mar 2024 08:35:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 01/34] adwaita-icon-theme: upgrade 45.0 -> 46.0
Date: Tue, 26 Mar 2024 08:34:19 +0800
Message-Id: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10-1.463100-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyszJzfx3gDtB9SH
	nJDq2yhMawBiNWESjq/VialIT7MCpN4bgXBxaoBL7LuOEAY9BqSIrmqDVyayv5mPq8jhF/uE8Vy
	NvRg9N2oNUccATRyd1PL3NxFKQpq17VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DW9n
	uzdghUMkp7kgdbMWVsGzmfNonkO2KtYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOTfzCYRkf0AZC1RaDnKC04mbG+aiD9TfsmZzrO7GFVA3NWhgiUS/5m1nQrvDauI7VpI6T
	OAVwvtc40aiLbYr4SY9tH3Up4R9Ngr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197491

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- cursors: fix windows build
- cursors: reinstate some x11 cursor names
- symbolic: thunderbolt, phone & export fixes
- index.theme: remove duplicate entries
- cursors: clean up shapes, sync DND metaphors with macos
- symbolic: revert about metaphor
- symbolic: shared screen metaphor update
- fullcolor: antialias 16x16 a little more
- symbolic: replace filled silhouettes with outlines
- cursors: only cover the CSS named
- symbolic: help-about metaphor
- symbolic: sync not-junk metaphor (https://gitlab.gnome.org/GNOME/evolution/-/issues/1710#note_1924546)
- symbolic: cleaned up export with Symbolic Preview

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{adwaita-icon-theme_45.0.bb => adwaita-icon-theme_46.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_45.0.bb => adwaita-icon-theme_46.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
index 0bd98288f6..2f3e4e7b85 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc688751b9d6215c623cb4e42ff1"
+SRC_URI[archive.sha256sum] = "4bcb539bd75d64da385d6fa08cbaa9ddeaceb6ac8e82b85ba6c41117bf5ba64e"
 
 DEPENDS += "librsvg-native"
 
-- 
2.34.1


