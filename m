Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6188DC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:21:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8671.1700036475138517482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="128069449"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="128069449"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:21:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 81DECD64B3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:21:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0B45D94A0
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:21:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0453220050199;
	Wed, 15 Nov 2023 17:21:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.42.0 -> 2.42.1
Date: Wed, 15 Nov 2023 16:16:01 +0800
Message-Id: <1700036161-1134-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10-1.290600-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uZSVZPP+dKGhthg+SZ4LtA3QqJN4m15UF9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrYrVNFHZp9t3iJPKSI32XSApV8/lj0oVKqELs/A5KURlP7OEIqO54TQgdM
	pAIEYD+F47uhfSpqZPL7XxLVchc1Ry6NLlhOnt9R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190562

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.42.0.bb => git_2.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.42.0.bb => git_2.42.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.42.0.bb b/meta/recipes-devtools/git/git_2.42.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.42.0.bb
rename to meta/recipes-devtools/git/git_2.42.1.bb
index c417b11b1e..33269d39a9 100644
--- a/meta/recipes-devtools/git/git_2.42.0.bb
+++ b/meta/recipes-devtools/git/git_2.42.1.bb
@@ -160,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "34aedd54210d7216a55d642bbb4cfb22695b7610719a106bf0ddef4c82a8beed"
+SRC_URI[tarball.sha256sum] = "839d75c91ddfa9f7534f7b0888e462e3ad1422bb8ef12ec35f6261cea18efe33"
-- 
2.34.1


