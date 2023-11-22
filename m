Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C46C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:07:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.15343.1700644031693532460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119367946"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119367946"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:07:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1125D9D92
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:07:07 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0BEFD9460
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:07:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 88BCC2FC8519;
	Wed, 22 Nov 2023 18:07:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyasn1: upgrade 0.5.0 -> 0.5.1
Date: Wed, 22 Nov 2023 17:06:29 +0800
Message-Id: <1700643989-9837-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--0.453300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTlH8jOVX4Ixtm8R
	qAsgLeLoHXATnQqW945527+BW5DJ4FpCIuRr0RxKuce7gFxhKa3Vy4hHC3/gyDEXweQhU7Tmbev
	5wFKyVv7/KVtfZiSDpvNJ+Gjfin75aU++uOchPRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8lBgw
	5G4NYCZN9pjzubZ2rHJ0RPnyOnrZIsCLMQZNzZ1sRXj5MfqdwaWo1F7brYmiYuiu/7+UVDaiPq7
	UGryzyZMeEy/vmAk9e/6dBQIcc3/xZ04CoYsKQq7PFrtVcvroxLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Added support for PyPy 3.10 and Python 3.12
-Updated RTD configuration to include a dummy index.rst redirecting to
 contents.html, ensuring compatibility with third-party documentation and search
 indexes.
-Fixed the API breakage wih decoder.decode(substrateFun=...).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-pyasn1.inc                  | 2 +-
 .../python/{python3-pyasn1_0.5.0.bb => python3-pyasn1_0.5.1.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.5.0.bb => python3-pyasn1_0.5.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 9eb87354cf..52fd98589d 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "97b7290ca68e62a832558ec3976f15cbf911bf5d7c7039d8b861c2a0ece69fde"
+SRC_URI[sha256sum] = "6d391a96e59b23130a5cfa74d6fd7f388dbbe26cc8f1edf39fdddf08d9d6676c"
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb b/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
-- 
2.34.1


