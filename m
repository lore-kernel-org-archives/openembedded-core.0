Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B32C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:56:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.15197.1700643386864357235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119912956"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119912956"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:56:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 427A1D6188
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:56:22 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D5BBDA241
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:56:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E1CB88489;
	Wed, 22 Nov 2023 17:56:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.59 -> 0.60
Date: Wed, 22 Nov 2023 16:55:21 +0800
Message-Id: <1700643321-9284-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--4.188900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYGdv
	IBM8UuLSh3Zv+QDjMifEdFGzZDMlYCNvqM5/miSs8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQfiq
	1gj2xET9F8lM5Yy7E5yTqGL1PcYrnCitK9hvVVO7dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtiKQqPtiQkW5uJL8fXOCmyaJ79R1agJz92Lg4Kjxzj04syA1KIputs/Ncq
	Xjkb9dy3NqRjEiyJ8R9BCHAnXvi3OOFrIBnfl0PHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with missing NETLINK_EXT_ACK definition.
-Fix issue with incorrect derivation of ECC compressed points.
-Add support for ECC usage from SPAKE2+ key exchange protocol.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.59.bb => ell_0.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.59.bb => ell_0.60.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.59.bb b/meta/recipes-core/ell/ell_0.60.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.59.bb
rename to meta/recipes-core/ell/ell_0.60.bb
index 0483dbe582..4e414f3b90 100644
--- a/meta/recipes-core/ell/ell_0.59.bb
+++ b/meta/recipes-core/ell/ell_0.60.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "370dc2b7c73cd57856017180a2a70a15ca1b0183bfd453b3cffe2d707c37da3d"
+SRC_URI[sha256sum] = "61cec2df694b548e51afa3e7ffd1e1ad31a9fea7bedb93a3a3cc60894390c70f"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


