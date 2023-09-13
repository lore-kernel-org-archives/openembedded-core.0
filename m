Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC111CA5526
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:35:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7664.1694597697262375295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131777620"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131777620"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:34:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DCB75DB3BF
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:34:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FA95D20B6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:34:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1736B2FC71E7;
	Wed, 13 Sep 2023 18:34:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libnl: upgrade 3.7.0 -> 3.8.0
Date: Wed, 13 Sep 2023 17:34:29 +0800
Message-Id: <1694597669-21543-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10--4.038200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tLC42PB7KOrbNdVHptfHl6EzEoOqAAVLP4qCLIu0mtILkSP9NNISXxYFB
	yhrH0UHexfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzImHqxPOPhdQ7YC
	LT0mqmcADL5MDYjNaY44cZWz5zpvLWjte6GluqIh0CsJsm1jITRCFg8dHZCvt6OCLOyyecd0VxZ
	v123CY9iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187567

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libnl/{libnl_3.7.0.bb => libnl_3.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.7.0.bb => libnl_3.8.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.7.0.bb b/meta/recipes-support/libnl/libnl_3.8.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.7.0.bb
rename to meta/recipes-support/libnl/libnl_3.8.0.bb
index 38d21ffe9c..28b2e5733e 100644
--- a/meta/recipes-support/libnl/libnl_3.7.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.8.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939"
+SRC_URI[sha256sum] = "bb726c6d7a08b121978d73ff98425bf313fa26a27a331d465e4f1d7ec5b838c6"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.34.1


