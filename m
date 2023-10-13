Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8446CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:04:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.34470.1697187877221587846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="136029035"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="136029035"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:04:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C631DDDC64
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:04:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 11D57BCB60
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:04:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41ADC20050184;
	Fri, 13 Oct 2023 18:04:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-beartype: upgrade 0.15.0 -> 0.16.2
Date: Fri, 13 Oct 2023 17:03:54 +0800
Message-Id: <1697187834-4532-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SKFm53+lf/MWm2Ski2CwDaAQNM9V2QTSchmXUBZSS6VC6IP
	2FWuV+oEvOZ2N9c/FZJI3DIh8ODwy3VsUyw7cCkcVNJPR7wqNHS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189047

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-beartype_0.15.0.bb => python3-beartype_0.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.15.0.bb => python3-beartype_0.16.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb b/meta/recipes-devtools/python/python3-beartype_0.16.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.15.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.16.2.bb
index 14eda1dd7d..20a5b92c61 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.15.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.16.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
 
-SRC_URI[sha256sum] = "2af6a8d8a7267ccf7d271e1a3bd908afbc025d2a09aa51123567d7d7b37438df"
+SRC_URI[sha256sum] = "47ec1c8c3be3f999f4f9f829e8913f65926aa7e85b180d9ffd305dc78d3e7d7b"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


