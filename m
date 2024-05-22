Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FE3C27C7B
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5643.1716369333968958930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VJOoXR3G;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369333; x=1747905333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vtPGEwanPOPwtovHUnpUjDiYVy3CCjbHnxku+L4fHzQ=;
  b=VJOoXR3Gd5i+ak2NzvXfHs0X0kA8jkzIKbUBEl5jNjniAmFAkC0zrZbc
   //XPji6IjSM+ISvhasbVOmUBfyhe6fpKcj21M283JHXOpLzx3rLHYE8C5
   Uyo6O2hV2vYFGs/FVlBaO92Ei92LT+RHlALmCtB9W/BBAJ9aKTKXCAuXo
   aQmqX88XpDH3lMR4YTzaFPa9B84tzYa6k538TOvRvhTQZpfZX8G+IIgRv
   f7NhahSKUaRif8v1au2ZddObZOKcTqBwJAXhyHUzkqTyNAaf66fbMPzYu
   8yfeRZ4uxoAbyIAIha6+Gff5mdAuJlVBetWW8Ncg5PZoyiDHpepzKrDPI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147548966"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147548966"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C2FF9DBD91
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B435D7B7B
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7917420097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F7C71A000B;
	Wed, 22 May 2024 17:15:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/42] libsdl2: upgrade 2.30.2 -> 2.30.3
Date: Wed, 22 May 2024 17:14:27 +0800
Message-Id: <1716369289-22526-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.081300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr5sPqcQkI8pskt9BigJAcVnQJ
	Daq+13a7hOmA/K/KlScf1x8HvB3n6m/ksrbkVPtMHWRJEfGP5nlUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiDAixBlu3NnArCLswi3NpjfX71s7cIJuTBMp/5Hn8TSqem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w7atl7AuawSBush2
	pu9AW5WHzToJOcgNS1x3GRjhcPMs9cET2ZUqKtr+y9SqskEzOD6rUGeEDlxbjQbghMmpfF2581i
	KhCPiPKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199716

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fixed Win+V handling (pasting from clipboard history) on Windows
- Fixed Caps Lock and Backspace key mapping for the Colemak keyboard layout on Windows
- Fixed mouse warp on XWayland
- Reduced startup time when scanning for game controllers on Linux
- Fixed building with C89 compilers
- Fixed building with the GDK SDK on Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.2.bb => libsdl2_2.30.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.2.bb => libsdl2_2.30.3.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
index f9dacb288c..68cc2790e5 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "891d66ac8cae51361d3229e3336ebec1c407a8a2a063b61df14f5fdf3ab5ac31"
+SRC_URI[sha256sum] = "820440072f8f5b50188c1dae104f2ad25984de268785be40c41a099a510f0aec"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


