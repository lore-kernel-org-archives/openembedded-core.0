Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFF3C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:10:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8550.1700035831358416315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="118541026"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="118541026"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:10:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A0F7D7AE3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:10:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F5A3D5FFC
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:10:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83F9440E91;
	Wed, 15 Nov 2023 17:10:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 249 -> 251
Date: Wed, 15 Nov 2023 16:09:41 +0800
Message-Id: <1700035781-1017-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.005
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtB00
	/kkeBTwBKYB7tFaW45ez6WlCD/Xw6UICfBSE4k5BuxjypqquZ2D6qIiqKc/Okh68bXrx3WzF2d4
	yJyApY9GkgG/MVPMhS9SQtGccsEjTyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190560

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_249.bb => diffoscope_251.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_249.bb => diffoscope_251.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_249.bb b/meta/recipes-support/diffoscope/diffoscope_251.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_249.bb
rename to meta/recipes-support/diffoscope/diffoscope_251.bb
index b679103694..8862509e05 100644
--- a/meta/recipes-support/diffoscope/diffoscope_249.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_251.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bc4d8cb3198025013784ef7e3fa61b7a642de39e5b790c45d7c29d153306fbdd"
+SRC_URI[sha256sum] = "c9ba2fc24379b2ba4457dc7be6970884cc2ee94c20d44f3889c2a4741e6178d3"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


