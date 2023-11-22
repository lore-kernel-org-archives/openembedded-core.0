Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C2EC61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:08:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.15289.1700644113876522911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119914562"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119914562"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:08:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D523C148F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:08:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CADF6D60E7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:08:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B22AC2FC7AA8;
	Wed, 22 Nov 2023 18:08:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-urllib3: upgrade 2.0.7 -> 2.1.0
Date: Wed, 22 Nov 2023 17:07:43 +0800
Message-Id: <1700644063-9909-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10-3.405900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+/UKSk38cGDA7t
	FvCWixbmZFBG9rFbfMLSfPTtJ4xSfv4/7++nTNOS5p1ddw6V4RtUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw65x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAU60sxS3oVZM1jSnVMBLUnm9kLW
	SRN33LRBOvwadx5P3kX1vwo2x046KRrkPo+i5dX39pHHGNPFTWjmsLesWX4OaU7IT6zPkjI7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191041

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Removed support for the deprecated urllib3[secure] extra.
-Removed support for the deprecated SecureTransport TLS implementation.
-Removed support for the end-of-life Python 3.7.
-Allowed loading CA certificates from memory for proxies.
-Fixed decoding Gzip-encoded responses which specified x-gzip content-encoding.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_2.0.7.bb => python3-urllib3_2.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.7.bb => python3-urllib3_2.1.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb b/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
index c286838086..b5b37e2924 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
+SRC_URI[sha256sum] = "df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7b52d54"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


