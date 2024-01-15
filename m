Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60C6C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 08:59:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.73340.1705309145347601644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 00:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134546307"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134546307"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 17:59:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FAB3E7522
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:59:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78124D88A6
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:58:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 224A6202D20C9
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:58:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4CE81A0070;
	Mon, 15 Jan 2024 16:58:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 6.6.0 -> 6.7.0
Date: Mon, 15 Jan 2024 16:58:29 +0800
Message-Id: <1705309109-23884-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-1.000600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ8eC2pVr1wb7hXk2RXhtGjOjf3A4DTYuFV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SKLa2ee51uvhQmJlaOC9qR6Afp2RG5CsLDyd3a88KkR19cl
	GxTw1otRTCBNt+s7RT04v6qKBozAcEolATcwKqc2nutkqCvK3iS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193641

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.6.0.bb => iproute2_6.7.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.6.0.bb => iproute2_6.7.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
index 417702e627..640b3013f1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "8738c804afd09f0bf756937f0c3de23117832a98d8cbbf50386cf5005cd613ce"
+SRC_URI[sha256sum] = "ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.34.1


