Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD5BCA5527
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:35:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7697.1694597734782433316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="111396796"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="111396796"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:35:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10A40CD7E2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:35:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45011B98B4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:35:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CDA79200501AE;
	Wed, 13 Sep 2023 18:35:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: upgrade 1.55.1 -> 1.56.0
Date: Wed, 13 Sep 2023 17:35:08 +0800
Message-Id: <1694597708-21598-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--5.137400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/bNdVHptfHl6jhXy0Khej9LVBDonH99+Vq2EwWJsUOPMnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSkj80Za3RRg8DrAOSAsGOBzsfwjRY4TKPURJ5
	ftxcfao1GCo7hZjomY1846HZiC3kg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187568

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.55.1.bb => nghttp2_1.56.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.55.1.bb => nghttp2_1.56.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.55.1.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.56.0.bb
index 1be9a348ae..a011bd4536 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.55.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "19490b7c8c2ded1cf7c3e3a54ef4304e3a7876ae2d950d60a81d0dc6053be419"
+SRC_URI[sha256sum] = "65eee8021e9d3620589a4a4e91ce9983d802b5229f78f3313770e13f4d2720e9"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


