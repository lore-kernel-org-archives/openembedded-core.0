Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86627C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:40:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8934.1700037601000641096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="139717433"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="139717433"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:39:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B1013D7AC6
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:39:56 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3FA7D5FF6
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:39:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B19202FC8227;
	Wed, 15 Nov 2023 17:39:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pbr: upgrade 5.11.1 -> 6.0.0
Date: Wed, 15 Nov 2023 16:37:38 +0800
Message-Id: <1700037458-1616-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl5q8/xv2Um1avoLR4+zsDTtnlV
	v2XS+do+44W7c5QMc4RpuNPZweveG+LC3gJK4HtoCDYOqmdPAQAo+4EQ70vUsYx5lBqRphbN5Vf
	W3YU/7Sm6Nrq8oRTtJXEyt9UBdPPjyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190572

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pbr_5.11.1.bb => python3-pbr_6.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_5.11.1.bb => python3-pbr_6.0.0.bb} (33%)

diff --git a/meta/recipes-devtools/python/python3-pbr_5.11.1.bb b/meta/recipes-devtools/python/python3-pbr_6.0.0.bb
similarity index 33%
rename from meta/recipes-devtools/python/python3-pbr_5.11.1.bb
rename to meta/recipes-devtools/python/python3-pbr_6.0.0.bb
index 520dbef8dd..6c8171196a 100644
--- a/meta/recipes-devtools/python/python3-pbr_5.11.1.bb
+++ b/meta/recipes-devtools/python/python3-pbr_6.0.0.bb
@@ -1,4 +1,4 @@
 inherit setuptools3
 require python-pbr.inc
 
-SRC_URI[sha256sum] = "aefc51675b0b533d56bb5fd1c8c6c0522fe31896679882e1c4c63d5e4a0fccb3"
+SRC_URI[sha256sum] = "d1377122a5a00e2f940ee482999518efe16d745d423a670c27773dfbc3c9a7d9"
-- 
2.34.1


