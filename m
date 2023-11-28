Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E566C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:41:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.14232.1701214910984812943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="141528758"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="141528758"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:41:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A90BD7AE3
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:41:46 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 40113D88B0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:41:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 206C8869FA;
	Wed, 29 Nov 2023 08:41:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.5 -> 41.0.7
Date: Wed, 29 Nov 2023 07:40:52 +0800
Message-Id: <1701214852-1755-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10--5.107500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj+Aw16GgqpO6Dp
	INQWjbmaT7EPQ2+MH5FAO+ZCMzaRsbBAQLqGlKivKrDHzH6zmUXVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRl85pjA/x1xfqZDCB3t1xpSAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDwmOUWirGRkwSZ+6O8afNF77StD
	gj8u3+zMxNLsuNzH3GzG9ILMwMNWQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191416

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Fixed compilation when using LibreSSL 3.8.2.
-Fixed a null-pointer-dereference and segfault that could occur when loading
 certificates from a PKCS#7 bundle. Credit to pkuzco for reporting the issue.
 CVE-2023-49083

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_41.0.5.bb => python3-cryptography-vectors_41.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.5.bb => python3-cryptography-vectors_41.0.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
index 44c67fdd76..4bfdb5f100 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
+SRC_URI[sha256sum] = "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538edd8fc463dc80d5b"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.34.1


