Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52D4C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:49:53 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.38432.1698997790526187920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138278582"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138278582"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:49:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 359E2D9D8F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:49:46 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59FA5BF4CE
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:49:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B38F2FC82BD;
	Fri,  3 Nov 2023 16:49:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-testtools: upgrade 2.6.0 -> 2.7.0
Date: Fri,  3 Nov 2023 15:49:09 +0800
Message-Id: <1698997749-31311-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--4.572600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvk6Qbi+9i6D59M
	m+epcXwrzxuDv4B7y9lD5q/aHXQ9mPPfj/RbxQwm8t4fUUGeErRMkOX0UoduuWAN6i+va16ud8u
	5EqsUWd+KhXV7aRCSUuaffHI8kAmibAGOCaWkxjtvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZL1rSpr4D4x+/FM2TcuP3QYLmzYLTtBn78wXiodwXr3A+S0A
	DL006jQgZyHdfTYzZ0nyGnWoTpVRQ7+4q/oWg8f2DeQAIFst5tLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190135

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix compatibility with Python 3.12.
* Add typing in various modules (still lacking full coverage).
* Drop the 'test' command for distutils. This has been
  deprecated since 2.6.0.
* Drop support for Python 3.6.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-testtools.inc               | 2 +-
 .../{python3-testtools_2.6.0.bb => python3-testtools_2.7.0.bb}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.6.0.bb => python3-testtools_2.7.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index e004d0eb0b..76f99c2058 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 inherit pypi
 
-SRC_URI[sha256sum] = "28b65e14c0f2d3ecbbfb5f55c9dcde5e4faa80ac16a37a823909a1fe3cbcb30a"
+SRC_URI[sha256sum] = "eec326f4275e6a55e5540302d01a0ae0a9e48991d7aade38a5c8ed093c37993a"
 
 DEPENDS += " \
     ${PYTHON_PN}-pbr \
diff --git a/meta/recipes-devtools/python/python3-testtools_2.6.0.bb b/meta/recipes-devtools/python/python3-testtools_2.7.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-testtools_2.6.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.7.0.bb
-- 
2.34.1


