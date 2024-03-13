Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBBAC54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10793.1710313754204451074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iejneaBq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313757; x=1741849757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZQb54rFwKbbcgSUvspCAi5dBBLSx8ecmhZy26qzuSis=;
  b=iejneaBqg6+uacPYlIzRbE5EjG4kAH/jF+eQCks4s+oRdnc4QJsPts+s
   pDAJQ6LwHm6QYBw9eS2ZZ1p1Uwm6glJfvwPzAxReAnlGbtfvjEbK8Z3nG
   PB2gLoh56IYRgyd1M1VExGBS84PN9HdpXqvoZu0+8rv3prOmagYqWeVx3
   H1Q6YuwB3tiLVSJ9Tjk/F4AGtDrDitNfVTbjB5rMXp2zlpfO6bP4dhC/4
   JoofzJ9c/4Kipup0W9kOd4Nt1bJ99eEI7RFMpawRG/rgre0pmVqIcFPXK
   MhD3n2njt0DVmHh8ZymwJMj1wK7sg/i6dwXlkuiNF5ETyAZaK8zjl0RI4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152393605"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152393605"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F374DD4801
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29B4D9EE72
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B97A22C666B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 67B921A006B;
	Wed, 13 Mar 2024 15:09:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/36] libsdl2: upgrade 2.30.0 -> 2.30.1
Date: Wed, 13 Mar 2024 15:08:09 +0800
Message-Id: <1710313714-12541-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--3.116800-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiEmxOjZ1LZ2ZQN
	dSgLxtlLOPFX9aajL0uvRrOvcymP1z3b9SMZbm85atGCGdi/nWqdeTGim1ekLwSdIl2jJ7sQvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgGv34qCfZeB4vitJf2NjlOx0Ih
	mXtI1gDC++B0pV1xLFeTjw/FyRX6QfE8yM4pjsDw9ejiC/BQPdLzP5snaeb1Qqtq5d3cxkNRwHP
	zrPx3/L0q0h29P5VqaVdD55quUjjJPeVIF5Iy45sdlQkXqCGfKE1MA45EuSLBZM/60hM2po6ogr
	u87K1CJknCdqz1Hvh/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197013

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed a regression causing SDL_WaitEvent() to return spurious failures
-Fixed X11 cursors on the latest release of GNOME
-Wayland windows automatically have OpenGL enabled again
-Fixed memory corruption when converting signed 16-bit audio to float
-Fixed audio artifacts when converting signed 8-bit audio to float
-Fixed the clip rectangle not being updated when the viewport changes in the SDL renderer
-Convert mouse wheel coordinates to the rendering view in the SDL renderer
-Fixed a crash handling controllers on macOS
-Fixed a crash setting a window fullscreen with Emscripten
-Fixed the keyboard automatically popping up when resuming an application on Android

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.0.bb => libsdl2_2.30.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.0.bb => libsdl2_2.30.1.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
index 99dbf36477..891e91190a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0"
+SRC_URI[sha256sum] = "01215ffbc8cfc4ad165ba7573750f15ddda1f971d5a66e9dcaffd37c587f473a"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


