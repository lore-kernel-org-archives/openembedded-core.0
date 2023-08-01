Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C14DC04FE1
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7592.1690875711348803815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114651480"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114651480"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB57DDB3C7
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:46 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 12C5DD5E8F
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 373A72FC8177;
	Tue,  1 Aug 2023 16:41:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markdown: upgrade 3.4.3 -> 3.4.4
Date: Tue,  1 Aug 2023 15:41:21 +0800
Message-Id: <1690875687-21573-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--1.459600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyZtziFUn+D+bHt
	jfbsLqDM5SReHH9+PHhuQsPOio482G0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7QgB
	GadtUdrIXGEgoKREeqK4y6XsG22BNRHaw2W9R8av+pswssfuVOD4gXnYzGe1tibi/Y1caUGE5Bi
	80Wzrd6OUiRRovEXa6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185204

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Add a special case for initial 's to smarty extension (#1305).
 Unescape any backslash escaped inline raw HTML (#1358).
 Unescape backslash escaped TOC token names (#1360).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.4.3.bb => python3-markdown_3.4.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.4.3.bb => python3-markdown_3.4.4.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.4.3.bb b/meta/recipes-devtools/python/python3-markdown_3.4.4.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markdown_3.4.3.bb
rename to meta/recipes-devtools/python/python3-markdown_3.4.4.bb
index 1624e15f95..6a7e6f7c3e 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.4.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "8bf101198e004dc93e84a12a7395e31aac6a9c9942848ae1d99b9d72cf9b3520"
+SRC_URI[sha256sum] = "225c6123522495d4119a90b3a3ba31a1e87a70369e03f14799ea9c0d7183a3d6"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


