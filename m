Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0E2C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:20:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.74333.1705310397412391236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="125560939"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="125560939"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:19:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E5A07D50B1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:19:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 325D9D39ED
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:19:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B83366895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:19:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C2761A0070;
	Mon, 15 Jan 2024 17:19:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.92.2 -> 6.92.9
Date: Mon, 15 Jan 2024 17:19:22 +0800
Message-Id: <1705310362-24488-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2SdtvoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJUkBtPHEm7pqv+BAJcbABMca6KJ8GJs/tQJL
	qLECWAjFnXxgOivlGoMJMpdvDXL/i7fvNXZSNMI+QS6f9EzICcO6IcZa5Rz0f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193655

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.92.2.bb => python3-hypothesis_6.92.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.92.2.bb => python3-hypothesis_6.92.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb
index ab5dd3223d..ae64391e33 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "841f89a486c43bdab55698de8929bd2635639ec20bf6ce98ccd75622d7ee6d41"
+SRC_URI[sha256sum] = "629f31788243559d35d3101ef8e94caf736cf8efaad3f0dd66ec7dbb31b8ef19"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


