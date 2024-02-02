Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15653C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 01:00:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.12681.1706835617792885989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 17:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qzkb65lJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706835618; x=1738371618;
  h=from:to:cc:subject:date:message-id;
  bh=CgKl1+5a4RWRgxvMuwxq4fFUhmffnEsWcsajgoEWgc4=;
  b=Qzkb65lJlZk73JpWEq507xgPIdiszUvyuNnv6u8xTbc+gSIMTB0JKuly
   QLgAU4lOBFGS/I7b1iLCi7ROpDjCk15lJcYVkiuHXmGxhkStIHEaz3dMQ
   vHFN0bAQPTwKOFXD9s4Eoh7cUZqROmCbjImXGG4eBy4k067MxsFXUCuPL
   al4aYV93l11ob3jCe2hn1wO2v4+X8qgLZkkVnduWev0L9FLukFIF4XtTZ
   /QE7PenNoXn48QJOuIutHfZMn+TXP2aW+tOLWm7GW+HdiUa/GrsUreZ0R
   8LKT3IiTWCZALXIYqf879hV/iwLYcGEZu6T3pOWPwOVdmY0bsisUHbP65
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="149795319"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="149795319"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 10:00:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 09E08CA1FF
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:00:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24C30BF4D6
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:00:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7E9120074728
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:00:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 439CB1A009A;
	Fri,  2 Feb 2024 09:00:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinxcontrib-htmlhelp: upgrade 2.0.4 -> 2.0.5
Date: Fri,  2 Feb 2024 08:58:21 +0800
Message-Id: <1706835501-20456-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-1.386100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpcuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIf6JusNB0lCxWzeAaVm3D8daOXwUeU1tS88T
	948+G4dPe21hueB3XmbmRt6q4TTXL90c/F8InZ/vRc6Fhbd7ltQ9LL+X5qR2r+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 01:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194777

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tmlhelp_2.0.4.bb => python3-sphinxcontrib-htmlhelp_2.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.4.bb => python3-sphinxcontrib-htmlhelp_2.0.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
index a0a4b4496f..532d1fc22a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "6c26a118a05b76000738429b724a0568dbde5b72391a688577da08f11891092a"
+SRC_URI[sha256sum] = "0dc87637d5de53dd5eec3a6a01753b1ccf99494bd756aafecd74b4fa9e729015"
 
 PYPI_PACKAGE = "sphinxcontrib-htmlhelp"
 
-- 
2.34.1


