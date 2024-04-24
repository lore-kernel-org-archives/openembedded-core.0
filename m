Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4192C10F16
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11780.1713948176774387245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o7fmHQ5g;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948181; x=1745484181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+AygvEIpUk6K2i2NBaiqxLF+FRKnxVUtuvurVJ0mhtg=;
  b=o7fmHQ5gpI/XIAdK7CWdFhTisx4uUJ6EJ0M0ft2vyPHI79YptXFM1T2+
   cquSGnda1LuufaTg/xn2A2dGhbF9RqxC0gPapusJ2RA2ggms4xOKPn88x
   Kq0cmYFhIkomBwYaiF2gOfu88J48AOipNfkIpwq1kbKzqiVo15RgKz/db
   +4W58M6KRlGWlJPXnldbuHwPg/wum0djVAjxdrk/j45cUxnt//qTPyqmy
   llnYMZoOFjfEzdBDrTyLHu1MxbgKomJu83Kxg8/bOGCuQw6dQQ4QBKOql
   RWN38El/2Uz5fEuH1sQXCcfXYjgaR8EAiIxoiGN8KG253+DR7wOVXJTeS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151922"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151922"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EBA46C68B0
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BE38CF7C7
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B05191EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5BCB31A000A;
	Wed, 24 Apr 2024 16:42:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/38] libsdl2: upgrade 2.30.1 -> 2.30.2
Date: Wed, 24 Apr 2024 16:42:04 +0800
Message-Id: <1713948152-13501-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-2.257400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwieM99Vcucw+ouu
	bAeza+JevqZKbBfdt0J3aWU5jdY62O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKL/KVtfZiSDpgNNUk1GTaRENazZgZY9vGvdCok3ibXlQX0tCKdnhB58hYfw868k05b3PD
	iXO/tFSY6HM5rqDwqtSQ8uFBCNlmTYu5krFUJzdvSM8HkuJh/jVxmWNSF1yoy8/8hX/MoRm++mw
	OC4QW5zHljQ2r50H9S+uiQGY2lTi66fJ0R8Qh18HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198655

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed performance regression initializing controllers on Linux
-Added support for the 6-button SEGA Mega Drive Control Pad for Nintendo Online
-Added support for the MadCatz Saitek Side Panel Control Deck
-Added support for the Hori Fighting Stick EX2
-Added support for the Yawman Arrow flightstick
-Added a gamepad mapping for the Defender Joystick Cobra R4
-Fixed the gamepad mapping for the Sanwa Supply JY-P76USV controller
-Poll for the initial controller state when using DirectInput
-Allow using SDL_RWFromFile() with named pipes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.30.1.bb => libsdl2_2.30.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.1.bb => libsdl2_2.30.2.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
index 891e91190a..f9dacb288c 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "01215ffbc8cfc4ad165ba7573750f15ddda1f971d5a66e9dcaffd37c587f473a"
+SRC_URI[sha256sum] = "891d66ac8cae51361d3229e3336ebec1c407a8a2a063b61df14f5fdf3ab5ac31"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


