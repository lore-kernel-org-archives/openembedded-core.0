Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845B1E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77564.1734425912124024557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DExihVgN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425915; x=1765961915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q8tHNtfWWt6miQdDvpRymbrp+4cwoS6A1KMAbWX6/7g=;
  b=DExihVgNwxnP/Wc/l4nlCmEdAXMNEN95fc8tGY0RO3JfudMe5OxyiEcm
   hxzOUU1fV//DnVG0T/7GIN3RRcsko3gjWmMlXL2JC0I19VbubEXBP6r/C
   4/miXksZSnZtTO9blp/1nM5by+f4IFIlVSQNQX7Qd+bpmHTkjOC5LjjQG
   JiNGe96iMWnoEqQ0SOhs+Hj6IcH2MNCJz58Uvm7mdzDIdWWNrf1eNfSvK
   0G24W8HWEhpq0UCaMwzT/asnVbXIJriXqFF0Xj5GXWPibxaqUqgeB9INh
   GrN49mpCWr+oYADfuYkDlyo1ZThzt2cAlRJXrU1PWOkzNvqr6EsZXvzCG
   g==;
X-CSE-ConnectionGUID: VIFR0oDzRna/XNRQc5I6jQ==
X-CSE-MsgGUID: LA+VzNTQTaaRfk06QZlUdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953389"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953389"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B783CDBB84
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BD0BBF3CE
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C2A62007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BCE361A000B;
	Tue, 17 Dec 2024 16:58:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 12/21] libxrender: upgrade 0.9.11 -> 0.9.12
Date: Tue, 17 Dec 2024 16:57:58 +0800
Message-Id: <1734425887-18069-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwP/hxxPCwzUoPEQdG7H66TyHEqm8QYBtMOXM6
	8AVEqrHghlAmNj2XlmrFCUPg2qJEvpNJ6VYh9HGEmDTzbKCMAL7Afzi8rEmJStBgRnQfkcmXvHs
	TR+PWylu7OzNMIhlqFgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208815

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libxrender_0.9.11.bb => libxrender_0.9.12.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.11.bb => libxrender_0.9.12.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
index e138764dff..e946d9dd41 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
@@ -18,5 +18,5 @@ PE = "1"
 XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
-SRC_URI[sha256sum] = "bc53759a3a83d1ff702fb59641b3d2f7c56e05051fa0cfa93501166fa782dc24"
+SRC_URI[sha256sum] = "b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97"
 
-- 
2.43.0


