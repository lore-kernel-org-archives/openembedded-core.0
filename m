Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17ECCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:57:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.34303.1697187437138686641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="124340620"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="124340620"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:57:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BB07C68E1
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:57:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 71ADFCF7E3
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:57:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B04F16BA6E;
	Fri, 13 Oct 2023 17:57:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.58 -> 0.59
Date: Fri, 13 Oct 2023 16:56:54 +0800
Message-Id: <1697187414-4041-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--2.033500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svLytc
	ctiFPZDiCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0eCbuVI7hVbLvIO
	fPEvWQc6EZazhtGkI+nk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w5SV4
	j4fX6E/YEGGBpy4DEbaVoiG6CEn2/9QhLMUlErhxZ+wDncla3FoM1g1ocZn82tcDzQO5c+YowD5
	qEgK02iQa7RdJVZ3R6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue with symbol visibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.58.bb b/meta/recipes-core/ell/ell_0.59.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.58.bb
rename to meta/recipes-core/ell/ell_0.59.bb
index 04e8566305..0483dbe582 100644
--- a/meta/recipes-core/ell/ell_0.58.bb
+++ b/meta/recipes-core/ell/ell_0.59.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b"
+SRC_URI[sha256sum] = "370dc2b7c73cd57856017180a2a70a15ca1b0183bfd453b3cffe2d707c37da3d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


