Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6812CC46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:29:48 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8626.1702978179253786377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="122686470"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="122686470"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:29:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B432D3EB2
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:29:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A9B8DD3F29
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:29:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DE0F228912
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:29:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA4EB1A006F;
	Tue, 19 Dec 2023 17:29:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libnl: upgrade 3.8.0 -> 3.9.0
Date: Tue, 19 Dec 2023 17:29:24 +0800
Message-Id: <1702978164-7513-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--4.038200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tLC42PB7KOrbNdVHptfHl6EzEoOqAAVLP4qCLIu0mtILkSP9NNISXxYFB
	yhrH0UHexfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzmXLMkP6x28fibt
	jLcseRbhDcZhP8yKBlRRvBj4xRbBtJ7FgFA//0HB0CsJsm1jITRCFg8dHZCvt6OCLOyyecd0VxZ
	v123CY9iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192697

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libnl/{libnl_3.8.0.bb => libnl_3.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.8.0.bb => libnl_3.9.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.8.0.bb b/meta/recipes-support/libnl/libnl_3.9.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.8.0.bb
rename to meta/recipes-support/libnl/libnl_3.9.0.bb
index 28b2e5733e..db9d93e8cb 100644
--- a/meta/recipes-support/libnl/libnl_3.8.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.9.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "bb726c6d7a08b121978d73ff98425bf313fa26a27a331d465e4f1d7ec5b838c6"
+SRC_URI[sha256sum] = "aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.34.1


