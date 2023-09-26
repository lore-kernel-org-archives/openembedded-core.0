Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B29AE7D262
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:33:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14251.1695717212636593545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="112521668"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="112521668"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:33:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8101ECA1EB
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:33:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B29C9D5D7F
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:33:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B95142FC7ABE;
	Tue, 26 Sep 2023 17:33:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-smmap: upgrade 5.0.0 -> 6.0.0
Date: Tue, 26 Sep 2023 16:31:16 +0800
Message-Id: <1695717076-11373-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtvG0
	VHndRxgI7RXSGkIpKplzErTQUz46gPvWJDtDPab8Tk1hTsIMQbZEMaj2LOqrlmblShNfu3+JTfD
	jO4nvkjiRpN3p8SoTLEWVVgldaGh3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188235

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-smmap_5.0.0.bb => python3-smmap_6.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-smmap_5.0.0.bb => python3-smmap_6.0.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-smmap_5.0.0.bb b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-smmap_5.0.0.bb
rename to meta/recipes-devtools/python/python3-smmap_6.0.0.bb
index ea131ef793..02c43e069b 100644
--- a/meta/recipes-devtools/python/python3-smmap_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_6.0.0.bb
@@ -11,7 +11,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "smmap"
 
-SRC_URI[sha256sum] = "c840e62059cd3be204b0c9c9f74be2c09d5648eddd4580d9314c3ecde0b30936"
+SRC_URI[sha256sum] = "8d79028ea6cc131da5eab099a5d95a998d43c6779956fffe3b455040911076da"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-codecs \
                    ${PYTHON_PN}-mmap \
-- 
2.34.1


