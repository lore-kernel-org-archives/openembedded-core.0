Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA91AC04A6A
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4237.1689585049035777116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="112509828"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="112509828"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A4BBDAE0C
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:44 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD77DD5E8E
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E68972FC86AA;
	Mon, 17 Jul 2023 18:10:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.1 -> 41.0.2
Date: Mon, 17 Jul 2023 17:10:17 +0800
Message-Id: <1689585025-23731-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-0.244700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhrv/q8PjBL0ry5
	zA+nB60F4R2fARKOYDAMyw6hMrtYUIG9V0kqQ2uQP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFKl7ih+SW4+zwp0g32rgsX64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0V6hmtqy1QAkbRVA/TYh7XLKyHznZyj9zPziPlaLIt8z/kx
	+c2cu3Na5ZzGQn+OGRxEduBPgo6QlUbVIH064RtK8a2scHBlnIdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184448

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fixed bugs in creating and parsing SSH certificates where critical options
 with values were handled incorrectly. Certificates are now created correctly
 and parsing accepts correct values as well as the previously generated
 invalid forms with a warning. In the next release, support for parsing these
 invalid forms will be removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
index 016620e710..52f2c35315 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "23b08c39777ec7b2774a11f945d1746301b1e88ecff2e5326d7f50ea0f42d580"
+SRC_URI[sha256sum] = "028dff94a8522ca818b11295ff12df55f348f33a193c0597ddfe8239e53d1582"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.34.1


