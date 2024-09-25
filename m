Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00292CF58C3
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.9321.1727246989241421908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fZZi72bg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246990; x=1758782990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r0hFwTgdkTZJjqHlQZGAIGDdSECjYI7p1SUIZvwPbgM=;
  b=fZZi72bgwn4FCVf0KHOB8URZVYYABarlsmlisToOP7Iuyv/V+Tu/SD8O
   LxQrBTuLVDQyAm3kpDRqv7z0VaZmvKY7uvUGsvCmp4oEVC4N0ILjDOxtZ
   rXRkh+jbkXrlCKS+Ipr89oF3RktbYmlQNxIHBwk8FAPwpXLMl0E5VZpmR
   /b7XTSQZZ6aENkRAkp4DwJzUIsLFIBWPfE3rCOF+/mkekGfS70dgBWxlm
   6UOc613C2OJf9DJ6BzpKBGLc8AfLqA18Tt8B3YhHCnUH6k8nw3bCwPzWw
   NjXh/wn3nXLw5jxNAuht3fHYEksnUY4f23hGDPojCP5Csg+KG1a8LCkZ0
   g==;
X-CSE-ConnectionGUID: BtlZy//GRUmyTTOyMym27w==
X-CSE-MsgGUID: ue7pEsFyTXu/6Y5Dd9G5WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="176849296"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="176849296"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF164D4F57
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3188D5BA3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 85F0A401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 36B3B1A01E9;
	Wed, 25 Sep 2024 14:49:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/47] python3-hypothesis: upgrade 6.111.2 -> 6.112.1
Date: Wed, 25 Sep 2024 14:49:00 +0800
Message-Id: <1727246960-20665-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-1.089200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrB8N4SAwGIo4hm837eIt7zb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BzNCdGumZsSZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S/Qm3bLW7pJdl2hYydRsrrc4JKuuByeG9tW5I/Hm1Fhbxjp
	wzXUmUlSu228Zu4td2Gpn7lg/QKABujRgr5mAtAR9kV7dpNFNQS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204917

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- removes a now-incorrect internal assertion about numpy's typing after recent
  numpy changes (currently only in numpy's nightly release).
- adds support for variable-width bytes in IR layer
- changes the draw_* interface

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.111.2.bb => python3-hypothesis_6.112.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.111.2.bb => python3-hypothesis_6.112.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
index 3da0ce8c04..e4b7b53579 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "0496ad28c7240ee9ba89fcc7fb1dc74e89f3e40fbcbbb5f73c0091558dec8e6e"
+SRC_URI[sha256sum] = "b070d7a1bb9bd84706c31885c9aeddc138e2b36a9c112a91984f49501c567856"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


