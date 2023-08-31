Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8D8C83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:32:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8406.1693449146409817740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="131426960"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="131426960"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:32:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FDEACA1F0
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:20 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78881D63AC
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 94B6D86C8D;
	Thu, 31 Aug 2023 11:32:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core][PATCH] kbd: upgrade 2.6.1 -> 2.6.2
Date: Thu, 31 Aug 2023 10:32:11 +0800
Message-Id: <1693449131-27658-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-3.769200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmRWCjDJRYeAZ3xuhkRWK22GNBDrXAxJU4Unpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFHugPvMr5xAf/Jo0+b0tCyYPH/
	+FbKOyQILx1IzeKzcIQxYsKgk1Vexjq/dWNxotCHm/zTUPwkgbwX1zV/m/ppFplBWinIvEQex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
loadkeys:
    Don't look for keymap in the current directory.

keymaps:
    Add colemak mod-dh keymaps.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.6.1.bb => kbd_2.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.1.bb => kbd_2.6.2.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.1.bb b/meta/recipes-core/kbd/kbd_2.6.2.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.1.bb
rename to meta/recipes-core/kbd/kbd_2.6.2.bb
index 112039b919..abd039f7a9 100644
--- a/meta/recipes-core/kbd/kbd_2.6.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.2.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "2eb6c6c972be9589bab733275bf020beb5f644d5f9439737920e701af6cf3485"
+SRC_URI[sha256sum] = "33e3bb3c3f55933b10f053b14b5f69a2e24c28543e9ec7690246fe47628dd94f"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.34.1


