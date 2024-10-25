Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36220D11712
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.5574.1729834798452323015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZRj9nBC6;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wtSPjrYuHLB8OLUA9lea2avaWXr5kj43jRNyePXFBLI=;
  b=ZRj9nBC6hzuhJ01+/cvOan0HhnQeg1ZiwedcxbVymluW04+rEDLsivtL
   X4pjIkwv4Doj868I+hxDQbHLPWJ57CU0p130Lf2CPMHy/CAzl727pQjSi
   l1M9U1aNkuQkIUfMC57DutXMjVS5l1TGFQ4WZ2BRIj212r62h4l/OaMWM
   SHFtAm1jowsS44GdQGen5Nku64M2U1QxUey075fzF9E5I9ENfaU6qI182
   sLtIZ2yYIJ90YA/S5p3m2rvrwbBMZ7FI4hSr7fYcbLyVAPPVhemFr5oZx
   SgbdwQEY6Fc9DSG1SqMN0udyP14rBjXfJ39Ls2P+TwY+aFGZEYu2Fey6u
   A==;
X-CSE-ConnectionGUID: 3o9VARv8Rry9L70EOb8aTg==
X-CSE-MsgGUID: zGJ7IhwQSBas0GcpWhpB6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="156936520"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="156936520"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CB616C68E5
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16DF2D9698
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D8A901022B
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 854941A01E9;
	Fri, 25 Oct 2024 13:39:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/22] epiphany: upgrade 47.0 -> 47.1
Date: Fri, 25 Oct 2024 13:39:10 +0800
Message-Id: <1729834769-4717-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--10.992700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfOE1lwX1jWv/eBw
	lzWEEXt2ThsOEyUhITnyok7JBT7dMc+TzbQmIx5KfiKzBf4Yf9gwLjM7t3iRo3So+S4LQW8RwSO
	gWCbsQUo4TZp9PdZBMYukveHb+ULvmDcRJzGLWpIc9jA4mLo8uRSez4ASfuuplsj4vrSq2jzlA7
	g/sXkwnGxASncyoJTXDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZeRlBdzYSbt4kB32
	ynv+GCSlqnO4loyPKWdqC2fLtk9xB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8J8ZmFz8BSfWQdjO
	77+F1piJeelWkqZ0J55WL15RX0ik0X/jRT2yP4g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206319

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Allow adding bookmarks in incognito mode
 * Disable tab navigation shortcuts in tab overview
 * Don't store page snapshots in web app mode
 * Fix ephy-about suggestions not using pretty URL
 * Fix crash in save password popover
 * Fix crash when opening multiple preferences or history dialogs
 * Fix crash when long pressing page
 * Fix target origin property when using CSV password import
 * Add tooltips to bookmarks tag rows
 * Fix crash in history dialog
 * Improve certificate selection dialog
 * Fix non-translatable strings in autofill preferences
 * Stop setting web view background color
 * Fix failure to unregister autofill message handler

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../epiphany/{epiphany_47.0.bb => epiphany_47.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_47.0.bb => epiphany_47.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_47.0.bb b/meta/recipes-gnome/epiphany/epiphany_47.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_47.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.1.bb
index b3e295737d..a726d01314 100644
--- a/meta/recipes-gnome/epiphany/epiphany_47.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "8e38ee7f90fd6054f8aef0e7f505d53c4520742f5acd1f008282a47b2764affa"
+SRC_URI[archive.sha256sum] = "642fd72045f6e9b18f09c3ef16df762d9b7816119abb22edd5d82ef687c6a004"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


