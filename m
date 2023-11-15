Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744CBC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:25:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8723.1700036734501389076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="139548862"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="139548862"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:25:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9B98D9D90
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:25:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15EB2D88C2
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:25:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA0C76BB55;
	Wed, 15 Nov 2023 17:25:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 6.5.0 -> 6.6.0
Date: Wed, 15 Nov 2023 16:21:10 +0800
Message-Id: <1700036470-1194-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10-1.000600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ8eC2pVr1wb7hXk2RXhtGjOjf3A4DTYuFV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SidBleFpMYOYP3VTW4TsQZVsT76JweDDbQw92bYY3Z8/gIC
	jK3WERNIW/Ar52a4oDc+hqrS38QzjsAfyW8M3N7J4nvp+u4meYS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190563

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.5.0.bb => iproute2_6.6.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.5.0.bb => iproute2_6.6.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
index 2b28b10c20..417702e627 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463"
+SRC_URI[sha256sum] = "8738c804afd09f0bf756937f0c3de23117832a98d8cbbf50386cf5005cd613ce"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.34.1


