Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA4CC46CA1
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:09:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.34527.1697188170693469515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="123738908"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="123738908"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:09:28 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DCEDCD7E4
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:09:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 90E4E1FEFC
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:09:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E127A20050192;
	Fri, 13 Oct 2023 18:09:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-packaging: upgrade 23.1 -> 23.2
Date: Fri, 13 Oct 2023 17:07:41 +0800
Message-Id: <1697188061-4736-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--6.361500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrga/LppctYyx794qAHfSq0hdL
	W7pLTfAOtXsVuWP6y7rD8BZgRo2tOFcPBqi5jTLuHWRJEfGP5nlcsgu/IQFPzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/25MoGKfGX+6YA3qL69rXq4Gp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sClsMPsOQcIwnDVhrUgq+M7SaC
	h+xLREDXt6yPjPBf93ZDcdx8hqLcA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189052

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Document calendar-based versioning scheme
-Enforce that the entire marker string is parsed
-Requirement parsing no longer automatically validates the URL
-Canonicalize names for requirements comparison
-Introduce metadata.Metadata
-Introduce the validate keyword parameter to utils.validate_name()
-Introduce utils.is_normalized_name()
-Make utils.parse_sdist_filename() and utils.parse_wheel_filename() raise
 InvalidSdistFilename and InvalidWheelFilename, respectively, when the
 version component of the name is invalid

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_23.1.bb => python3-packaging_23.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_23.1.bb => python3-packaging_23.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.1.bb b/meta/recipes-devtools/python/python3-packaging_23.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_23.1.bb
rename to meta/recipes-devtools/python/python3-packaging_23.2.bb
index 53d3522dd7..2d35936615 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_23.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "a392980d2b6cffa644431898be54b0045151319d1e7ec34f0cfed48767dd334f"
+SRC_URI[sha256sum] = "048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


