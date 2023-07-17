Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA38C04FDF
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4237.1689585049035777116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="112509830"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="112509830"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:48 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CEDF5E428B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:46 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17A16D20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 39EE32FC86AA;
	Mon, 17 Jul 2023 18:10:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.80.0 -> 6.81.2
Date: Mon, 17 Jul 2023 17:10:20 +0800
Message-Id: <1689585025-23731-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-0.042800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr8ej03A8UqeUpoXuw5q0KwDTI
	xI7tqkhQlxPsRwiY5LxQBRuXIzynG+pUHl5WQb/QgvmNrsT46HJNLPQl0QAltKG9MDPi2X0Svqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgMIel4HZJ22+gW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipckMZrBrKiGm1nyYTNrmNSxY+FQ+6AcmuM14Wg
	zvS9FnvFv3xa2E4Q1dU3Qxrim4vvats5cdvPULTyq3k0j4HUMPRVvwD/KhvOv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184449

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-If the HYPOTHESIS_NO_PLUGINS environment variable is set, we'll avoid loading
 plugins such as the old Pydantic integration or HypoFuzz' CLI options.
-This is probably only useful for our own self-tests, but documented in case it
 might help narrow down any particularly weird bugs in complex environments.
-Fixes some lingering issues with inference of recursive types in
 hypothesis.strategies.from_type. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.80.0.bb => python3-hypothesis_6.81.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.80.0.bb => python3-hypothesis_6.81.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
index 82f855d4b7..93bf638759 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.81.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "75d74da36fd3837b5b3fe15211dabc7389e78d882bf2c91bab2184ccf91fe64c"
+SRC_URI[sha256sum] = "e35165a73064370d30d476d7218f600d2bf861ff218192c9e994cb36aa190ae7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


