Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39388C54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:08:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10785.1710313738383967211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iBSXC8vd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313739; x=1741849739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L69dipx6sYMW+K9owHfOtfffmU4N5P2kUyQ6BuaAMBA=;
  b=iBSXC8vdWyqbhMpaLfJAIDcKcbMatVUD0nbCf5Q1HQZKdksmpW1vNaOT
   142MiVR7e3vhmg9V6WB9t6ZBTsmAd0vKAdjEs4Yew6JWv8Ec/bdbGuVy0
   b1myy0uemZDRO4bEi78LWUN9GMUPtDdjkWIeyNKROxQU49luJSIKJs1fC
   DZ2nOEUiB937SQLBWYZhdkb/cX6gqm+iMjuVClp1iuBWu0kblmQoF30Gr
   kIa57zp3xJhQw2yHeKeNLTZmbmrcT2tshRqfiY4X5R6Zy37b2ywYj4UAU
   1AYTurI/+B4I57TqUHfXLR/TYuyVHEMoDELort0UPlLYzFfy3wu5buxgu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="153950863"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="153950863"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:08:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DBAC7DD93A
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E80FFD837
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A0A2820097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 000071A006B;
	Wed, 13 Mar 2024 15:08:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/36] encodings: upgrade 1.0.7 -> 1.1.0
Date: Wed, 13 Mar 2024 15:08:01 +0800
Message-Id: <1710313714-12541-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--0.690800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Kra+vQMboyiAAVyxvzDpk2G5pGxLam/HB6eq1uFhZl8MKlVw8BwlyGmNGnI
	4eybhdxjWk/GODt1z5CBVkkagR9g7/wK+uaIQF0B0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197005

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add a meson build system
-Add the ISO8859-14 encoding

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-font/{encodings_1.0.7.bb => encodings_1.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.7.bb => encodings_1.1.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
rename to meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
index 5906da416a..7432c08ec0 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb
@@ -11,7 +11,7 @@ PE = "1"
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS:${PN} = ""
 
-SRC_URI[sha256sum] = "3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4"
+SRC_URI[sha256sum] = "9ff13c621756cfa12e95f32ba48a5b23839e8f577d0048beda66c67dab4de975"
 
 SRC_URI_EXT = "xz"
 
-- 
2.34.1


