Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86306C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:55:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8938.1702979749325150513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123235545"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123235545"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:55:46 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E64B7D7AC6
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:55:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CA89BF4A6
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:55:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3826202CA3E7
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:55:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 727AA1A006F;
	Tue, 19 Dec 2023 17:55:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pathspec: upgrade 0.11.2 -> 0.12.1
Date: Tue, 19 Dec 2023 17:55:38 +0800
Message-Id: <1702979738-8269-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzTI1e7o/2yfEOmq
	ttiNyQ3PyZEnLdcAH0WPM0I3om42bCMV0+Wd4MEbgcxzTlPOAtG/JJl/QY6xxhlg3ucT6FAdX+K
	IcUIfdciB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/cpburnz/python-pathspec/blob/v0.12.1/CHANGES.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathspec_0.11.2.bb => python3-pathspec_0.12.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.11.2.bb => python3-pathspec_0.12.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.11.2.bb b/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_0.11.2.bb
rename to meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
index 37b9e27d33..b61f673397 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.11.2.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "e0d8d0ac2f12da61956eb2306b69f9469b42f4deb0f3cb6ed47b9cce9996ced3"
+SRC_URI[sha256sum] = "a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712"
 
 inherit pypi setuptools3
 
-- 
2.34.1


