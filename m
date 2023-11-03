Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07A8C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:14:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.36320.1698995655082021297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126798439"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126798439"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:14:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id ACE0ED63C5
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:14:10 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3EB5C8BFE
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:14:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BFA662FC7F5C;
	Fri,  3 Nov 2023 16:14:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libnewt: upgrade 0.52.23 -> 0.52.24
Date: Fri,  3 Nov 2023 15:12:55 +0800
Message-Id: <1698995575-30284-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--0.654500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFosWC
	LeeL2Ypg4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed5Vz
	nr0BycoeD/SpuYoqPDXk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4F+7
	oD1bG3X6NU0eRVXkC5PvaIZUFFAEBPdfPiPDSf1nw90ecCcTw6vyWk2x2lG8YI/4C0+8tiIQhpH
	MXnkhnYqs/FmrmBD7KCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190114

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- add support for python3.13
- fix compiler warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb} (94%)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.23.bb b/meta/recipes-extended/newt/libnewt_0.52.24.bb
similarity index 94%
rename from meta/recipes-extended/newt/libnewt_0.52.23.bb
rename to meta/recipes-extended/newt/libnewt_0.52.24.bb
index cd3731cf74..1e39a1c5ca 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.23.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.24.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://0001-detect-gold-as-GNU-linker-too.patch \
            "
 
-SRC_URI[sha256sum] = "caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a"
+SRC_URI[sha256sum] = "5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.34.1


