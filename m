Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A215CC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:20:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.37721.1698996045071412354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126163553"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126163553"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:20:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 638F5D9D92
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:20:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9648BBF4CE
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:20:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C563020050190;
	Fri,  3 Nov 2023 16:20:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ghostscript: upgrade 10.02.0 -> 10.02.1
Date: Fri,  3 Nov 2023 15:19:52 +0800
Message-Id: <1698995992-30490-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10-0.922700-10.000000
X-TMASE-MatchedRID: 0sS0L/mwt9gFWIzFaWZsv31zro62qhdCVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOYVvyqiyuzVAgX2Xt4pvYkejMOEZ5AL0SOHJ
	uFuxWAjAshOqt515qDRPT4WWiXjYzuJXEeLLJ6+yeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUIDt2uBz9KIMMWULeQaUjJBCS+077XjCb4KkR26zjMQcRlMHybKRrn79UWTbYq8uSoNX
	gOLTuhzh/mufi3xiaZzJnrPCtZIo+jgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190119

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 4bad0f86e1..18c296128a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
            "
 
-SRC_URI[sha256sum] = "e54062f166708d84ca82de9f8304a04344466080f936118b88082bd55ed6dc97"
+SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.34.1


