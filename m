Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA2EC83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:34:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8443.1693449257342159158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="130125919"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="130125919"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:34:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 381E5DE583
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:34:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 63ABAD63D9
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:34:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6620D20077BBE;
	Thu, 31 Aug 2023 11:34:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librepo: upgrade 1.15.1 -> 1.15.2
Date: Thu, 31 Aug 2023 10:33:48 +0800
Message-Id: <1693449228-27840-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--0.227400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrG24YVeuZGmMCiXI7bHFUBWf0
	psGams1sOuzeNmOGKnPUqA+C93oBWjmuh/dvjPRUOyPKih4Rysj/W9duQaNZ5Zg6V3Cf70yovqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBC26qzoFs8n7rencS+jsJiem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUm//py/6VFkVqKtdbWcjHbnnle
	br2EZreysFNFr3KQcKe/S9lprUcPQSsU0f8ObaSBU9/vmpgWDyTS5TAFoAwnW9LBo0Ga9x+7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186939

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
    Fixes and optimizations in header files
    Fix lr_gpg_list_keys function when keys are empty
    Update PGP test vectors
    Fix CMake warnings
    Bump glib version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librepo/{librepo_1.15.1.bb => librepo_1.15.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.15.1.bb => librepo_1.15.2.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.15.1.bb b/meta/recipes-devtools/librepo/librepo_1.15.2.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.15.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.15.2.bb
index 2c8d6fc719..995301d601 100644
--- a/meta/recipes-devtools/librepo/librepo_1.15.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.15.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "5f4de4a4e85845d4184fbd30c03ff8a8ec7df4af"
+SRCREV = "1a0a5fd2b040d00872118b32d09d1f79730897a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


