Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF180C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:22:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.36990.1698996161926462365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="137947567"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="137947567"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:22:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0046ED6186
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:22:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 39502CF7D2
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:22:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6719620050190;
	Fri,  3 Nov 2023 16:22:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyrsistent: upgrade 0.19.3 -> 0.20.0
Date: Fri,  3 Nov 2023 15:21:26 +0800
Message-Id: <1698996086-30584-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--2.812100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt3QkOFqpqGoT6y
	zEmkViqrnuC4VmJFPYZ3CaEssjFbZ13vqo4Ydbl4eDbLSPm9dkZJziJDtUPgzZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xCE2NlBjIjcKXqmmYTGpxgjL8
	WDWZGeou0B0MT8S0EkgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyDMFlSyvGkM9dvh3jyJAx7pCu0
	Qbq3TMuxLiLiqZf9VNEFr8oZ/CFNqd637jzVetVMYdOb2BuASXEUwRxUoTEaKNf+FLeGiT3/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190121

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix #245, never introduce new nodes during discard.
 * Fix #268, do not rely on well implemented __ne__ for keys in pmaps, instead do explicit inversion of equality
   comparison when checking for inequality.
 * Officially support Python 3.12.
 * Officially drop support for Python 3.7.
 * Fix #273, build more types of wheels. Thanks @jams2 for this!
 * Fix #282, add generic types to types. Thanks @lukasK9999 for this!
 * Fix #281, defaultdict can now be frozen. NB! This is a backwards incompatible fix since defaultdict was not
   previously frozen.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pyrsistent_0.19.3.bb => python3-pyrsistent_0.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyrsistent_0.19.3.bb => python3-pyrsistent_0.20.0.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
rename to meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
index 05654c348d..9661f1474e 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Persistent/Immutable/Functional data structures for Python"
 HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e"
+LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=f798dc4222a29fea881fa998cdf4a8c8"
 
-SRC_URI[sha256sum] = "1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440"
+SRC_URI[sha256sum] = "4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8f265a4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


