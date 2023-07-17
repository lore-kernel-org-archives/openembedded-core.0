Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D62C04E69
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4248.1689585042654153737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="113014152"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="113014152"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F926E4289
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:45 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D94AD20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B239D2FC8579;
	Mon, 17 Jul 2023 18:10:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-editables: upgrade 0.3 -> 0.4
Date: Mon, 17 Jul 2023 17:10:18 +0800
Message-Id: <1689585025-23731-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-1.016400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxYC5LPd7BvbRTV
	Hawf9wLzwulnsMSzBfgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaQDiwjPc96MOu80/sBhTIUwVf8eToLIt9MTN2LZ5aqyfUbzhyz/gvqS6ZUWHSRQSO+/i
	gkyKwDTrmlefEiErhk1gVRoKj78AAQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184447

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Add a new add_to_subpackage method.
 Add type annotations.
 Internal admin: Switch to nox for automation
 Internal admin: Switch to ruff for linting
 Internal admin: Switch from setuptools to flit_core

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-editables_0.3.bb => python3-editables_0.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-editables_0.3.bb => python3-editables_0.4.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-editables_0.3.bb b/meta/recipes-devtools/python/python3-editables_0.4.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-editables_0.3.bb
rename to meta/recipes-devtools/python/python3-editables_0.4.bb
index b42ff06872..4987b02f0b 100644
--- a/meta/recipes-devtools/python/python3-editables_0.3.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41bc1be47b7bb8240db3ef928c7cb0bf"
 
-SRC_URI[sha256sum] = "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a"
+SRC_URI[sha256sum] = "dc322c42e7ccaf19600874035a4573898d88aadd07e177c239298135b75da772"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


