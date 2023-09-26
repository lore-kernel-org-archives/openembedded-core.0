Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584CAE7D25E
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:26:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.14357.1695716802497323372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="133507330"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="133507330"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:26:40 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD2F1D3EA3
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:26:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B540D3F15
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:26:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83AD72005932A;
	Tue, 26 Sep 2023 17:26:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.3 -> 41.0.4
Date: Tue, 26 Sep 2023 16:25:58 +0800
Message-Id: <1695716758-9469-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10--5.873000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M2cOoA6G23444Cu
	qghmtWfXnKe51V/OS9oF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uYJA
	+HBwSFifJDvFr4liuHI2h2ZcIum9ErWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaM0mg9xJw+lOU3XpRoEdE8p60h5AhhfstuqBbP3zohyyCy2p7NyWE0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188231

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.1.3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_41.0.3.bb => python3-cryptography-vectors_41.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.3.bb => python3-cryptography-vectors_41.0.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
index 1b499e0299..6b5d8adee9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "80de0452c4b34f56f5518e81ebd75b6b905f5728aaed521d42e41f4ebc8a43fb"
+SRC_URI[sha256sum] = "440af2813ea7aeb52181ec651a36d9ae8f0976e8b3a62b411a800fe6fa57a19e"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.34.1


