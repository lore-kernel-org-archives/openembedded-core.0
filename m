Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BE4C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:21:26 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.26007.1698913281006724525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="139899940"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="139899940"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:21:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EDABD9D92
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:21:16 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6445DD94A9
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:21:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38FE6886FC;
	Thu,  2 Nov 2023 17:21:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.5.2 -> 6.5.3
Date: Thu,  2 Nov 2023 16:17:55 +0800
Message-Id: <1698913076-22037-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
References: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10--2.848800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJIgEe/0Z35VnDICbPFvtnTqhcdnP91eXGUpb//ZJZA4gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFPTVmymuzXJLGz48LcilORTZ91
	pB7FrOTxhULjxVadMSPVMUKZx6iciKQ21aJNb7iKurWtsUJtOiWRWC/fAZ6xyA09fMtUZWAOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190065

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.5.2.bb => btrfs-tools_6.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.2.bb => btrfs-tools_6.5.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
index 2d3f70118d..873d5e7a14 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "546edf535ddecae480a51306e4d08f5dbd4e3ea7"
+SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


