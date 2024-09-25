Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3A0C369A9
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9326.1727246990413115226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NmdUKSd/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246995; x=1758782995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4Gge1fxUhpSlWFqjkNbaieDydSiYRaKRK2vgUdS/Pyk=;
  b=NmdUKSd/M2T0fR+pcIiBiWWseJiiO792bonTPaiA3eJ9SMHEyb7kDzce
   xEtlA8m34x/kxi8edJLwJjuU3/nGf3+yanXYJkjHf4nHn2eCpvk5fbe4w
   pGT4wxzMkyIc70tLYQidoW4pBYyn8iVEvoKGY7dEZIh5tiMYTwJlVEYk9
   jXa2O0PeR/FP/2i/V8VAUbNfb+e7PrMwwxcAHQJrG9De52HPdmH3WLWls
   MRt4vDo8sgE7ko+z3Ebxl4Yb7qn7UCopHE2tRzVS69AcVsNFTzAUHLxOH
   qzbmIo73QcqVpPpiRr84ZfNJNzN4Q9YFN+qA9Dn5eiHlyMzi9gno+rWkj
   w==;
X-CSE-ConnectionGUID: u8/Ke6ndRQa3+UFhMAQ6qg==
X-CSE-MsgGUID: SzxOfsxcTm+Bg/NpdVnLBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="154170433"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="154170433"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2174C53D0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20AB0D7534
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D96C401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C52F1A01E9;
	Wed, 25 Sep 2024 14:49:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 46/47] wpebackend-fdo: upgrade 1.14.2 -> 1.14.3
Date: Wed, 25 Sep 2024 14:49:19 +0800
Message-Id: <1727246960-20665-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--3.106600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvfKapXkCLRBQC7
	AZSleJMNbzWPfbpIiHY1JywOaw65diVqGFW47VyNA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYj92Syca4aYVu2PzD0SpTPWdVNZaI2n6/wKA9ZJkcOhmXE5Co/aUb2CjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcso/nJa0WL0WQMBi9UoxJYa+gswNVAZnX2fJD
	u3ePZYOJZkhS7Qtm0vDwyC+71jh0S5yNx9MTxdG9TabO8CYusJ88YIGDlmM1P6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204939

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix build issues in some configurations that require en explicit cast
  to EGLNativeWindowType.
- Fix memory leak when the view backend wl_resource is destroyed.
- Fix wpe_dmabuf_pool object leak.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wpebackend-fdo_1.14.2.bb => wpebackend-fdo_1.14.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.2.bb => wpebackend-fdo_1.14.3.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb
index b3d7b229c8..c8cce5447b 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38"
+SRC_URI[sha256sum] = "10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.34.1


