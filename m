Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01BFCDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:10:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.34533.1697188205749088680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="114872871"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="114872871"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:10:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E990C68E4
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:10:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78F7DCF7EC
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:10:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B184F200501A4;
	Fri, 13 Oct 2023 18:09:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.24.0 -> 1.25.0
Date: Fri, 13 Oct 2023 17:09:42 +0800
Message-Id: <1697188182-4774-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--3.910500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrESq28IHhFOKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN46cXaPycFZsc0o6rNiKBihHfiujuTbedEXo
	uQwO8rUmxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzkj9sPI22ooZl+g
	de6s9BUbemB4Aoy3VQZSYHF1rdRUcFhYu94EMQr1/JUNPemyVy+ANkhnRsqXHkDq6FvXhhKn/wQ
	LT4hvXoiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189053

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Update to cairo 1.18.0 for the Windows wheel
Provide a Windows arm64 wheel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.24.0.bb => python3-pycairo_1.25.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.24.0.bb => python3-pycairo_1.25.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.24.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.24.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
index 8059750de0..a9e89b0f7a 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.24.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "1444d52f1bb4cc79a4a0c0fe2ccec4bd78ff885ab01ebe1c0f637d8392bcafb6"
+SRC_URI[sha256sum] = "37842b9bfa6339c45a5025f752e1d78d5840b1a0f82303bdd5610846ad8b5c4f"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.34.1


