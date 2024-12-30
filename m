Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C870BE77198
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:29:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.58720.1735543772874667718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nUkEJoVs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543774; x=1767079774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DR6CjN+2mCxXPSWovudesTa6J+ySbGOBZ5Uf6FgMbNs=;
  b=nUkEJoVsabMGSU0hA6D+Hg4ANdWhUhAg7XP0USZgsxuN7/jWQTVl/QKW
   c17xc2FeUpRr7jFFBrIprW0J9EiDycDrdK22SyYmhWHN9mesF5Pts2ZV2
   eXATIKHMdIOWYLcJQ0H6cRC4JXu0nAx2zNJx7u1alfVCXLEhvxMjj15Qq
   mZ4UicKuoESd6DkbpH1vC7j1gie718ua5ny9KKR7e8KsWKu0noUM+nOQr
   pnJbtQ6t7ux6ufaJkUAoTEqC+YwmyuftHJNe7my2jxJN3X/IWDFhyNe0W
   MZYaLcB/6Be9vfJZmJ3IZQVN35Adwvv7dWyIOm6rr2oaXET/FMdoX2P1x
   A==;
X-CSE-ConnectionGUID: JrzISzUQRL6VDzuEkdi1XQ==
X-CSE-MsgGUID: lW5UXJBOTIKTmO0dbKTEgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185308656"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185308656"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:29:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 588FD233D3
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26408D5041
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B743F20074EB1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6287D1A0003;
	Mon, 30 Dec 2024 15:29:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 5/6] python3-hypothesis: upgrade 6.122.6 -> 6.123.2
Date: Mon, 30 Dec 2024 15:29:19 +0800
Message-Id: <1735543760-2456-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
References: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--2.063400-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ8eC2pVr1wb5H0YXYnbGozFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtuVf
	c976pNyqFtF0FWbXrPZSTHlC8sy1/mxK/3n9U/19wIOHqfQAujofGexhISLYp6St+RU+YKPhboo
	p5yL+oXOaDBqo9m11G/RtJ6+MhUiDyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209143

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.122.6.bb => python3-hypothesis_6.123.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.122.6.bb => python3-hypothesis_6.123.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb b/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
index 37eac3a1a5..5f13a6ca8b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2642598dc4426945d62b849a915d0d3e2d53f0fb17090f0cf10d8a545a421dc1"
+SRC_URI[sha256sum] = "02c25552783764146b191c69eef69d8375827b58a75074055705ab8fdbc95fc5"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


