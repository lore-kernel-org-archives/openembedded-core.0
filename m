Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA75BC83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:31:32 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8438.1693449084153955675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="118152973"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="118152973"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:31:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 96113DB4C1
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:31:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB89BCF7CB
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:31:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F7AB6BEF6;
	Thu, 31 Aug 2023 11:31:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.41.0 -> 2.42.0
Date: Thu, 31 Aug 2023 10:30:38 +0800
Message-Id: <1693449038-27548-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10-1.290600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uZSVZPP+dKGhthg+SZ4LtA3QqJN4m15UF9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrUtiTsH2cF6ZhvVE0kv5awe2mKm2vE8ORhVueZydZ6JpjAHUDMGuoMbl/2
	Y8MzkxqPxA0lGSv6wI0CJt7+tad2JMUe/Wv9oeFB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186931

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.41.0.bb => git_2.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.41.0.bb => git_2.42.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.41.0.bb b/meta/recipes-devtools/git/git_2.42.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.41.0.bb
rename to meta/recipes-devtools/git/git_2.42.0.bb
index b84be24b94..c417b11b1e 100644
--- a/meta/recipes-devtools/git/git_2.41.0.bb
+++ b/meta/recipes-devtools/git/git_2.42.0.bb
@@ -160,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "c4a6a3dd1827895a80cbd824e14d94811796ae54037549e0da93f7b84cb45b9f"
+SRC_URI[tarball.sha256sum] = "34aedd54210d7216a55d642bbb4cfb22695b7610719a106bf0ddef4c82a8beed"
-- 
2.34.1


