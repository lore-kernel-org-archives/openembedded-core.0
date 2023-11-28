Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F32C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:44:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.14283.1701215064914528547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="129307597"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="129307597"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:44:22 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CC72D9DA5
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:44:20 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7C0D1662C
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A56F72FC7070;
	Wed, 29 Nov 2023 08:44:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] resolvconf: upgrade 1.91 -> 1.92
Date: Wed, 29 Nov 2023 07:43:44 +0800
Message-Id: <1701215024-1920-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.002
X-TMASE-Result: 10--0.112200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytYC5LPd7BvbfG/
	dKWbb1AL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547KeTtOdjMy6AgE
	srFaUqymD/SpuYoqPDTKHYLsR4q0LHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w5pBR
	zwp6ZH1B1hZU622c8RQ0YK6Zg2JEBUW0/cpuuQZiLu96Z1wKEzCacmiMsn6D4zdgVG72PCoXod5
	dq/F6VNaFqCsdxl0l2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191420

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * resolvconf(8): Fix new paragraph.
 * Move binaries to /usr.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../resolvconf/{resolvconf_1.91.bb => resolvconf_1.92.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.91.bb => resolvconf_1.92.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
index 09a0ab7d27..226cb7ee77 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "859209d573e7aec0e95d812c6b52444591a628d1"
+SRCREV = "86047276c80705c51859a19f0c472102e0822f34"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


