Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6A8C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:27:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.74038.1705310856360250908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146153596"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146153596"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:27:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A818E8BE9
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:27:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A793D946F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:27:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B336920079DF3
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:27:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 517741A0070;
	Mon, 15 Jan 2024 17:27:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.17.03 -> 0.17.04
Date: Mon, 15 Jan 2024 17:27:19 +0800
Message-Id: <1705310839-24802-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--0.889700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDQEElETurAJU89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAEZsDlf25h3JiCBPLZxa1NL30bBezJMjJkUkW2EoJyeGYbwLDZfBsAyFYoAa5arIiYdzb
	lBvN9zQ3ioB699LIwQBaF3TE4iz2fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193663

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/ColinIanKing/stress-ng/releases/tag/V0.17.04

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.17.03.bb => stress-ng_0.17.04.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.03.bb => stress-ng_0.17.04.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.04.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.03.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.04.bb
index 0da5294f31..fde51f67ac 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.04.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "8c39f5a2d9b199189456f414afd9e536dae69d1b"
+SRCREV = "2f22ad595f067aa940cfe4f64107e10872c2f7b5"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


