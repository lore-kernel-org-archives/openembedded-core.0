Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C11BC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.10652.1710313783572303602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=inK7pABs;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313783; x=1741849783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=azcgxek2wi1vquf1kxE4cL8XjU/Tt3WEcvvQnYQCkF0=;
  b=inK7pABsmTN3DTSVWCsdJXvOcht7BgraSPpLqgtQ45FHWW5/1NNYQQL0
   +DZcgbIi/2xzl49TgGXQMrC6GxNpFZQESdTrlh1ByIE4F8xzl0d9ZdZwP
   GAHiZiePHV6Qo4XAPMi5PSt1X/L/mTnkBf25xJGQRtF31hoblnO+9/145
   fBS4NGJciVV6SiSJvMk6KGFG+Qy8F4Z7BbUnOu4hGu45uCzAmhNbun78O
   iP8HejaWr+ZCkKbr2I88jSsdXyEWA5/zwqmOBWqU8zNPV11Q50p0V0SL9
   DBSP0qqke7jJbL94BIx6ruVYjSVudpAEEKp2IKNqi/U3BwQgGV/SjvaiW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140106958"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140106958"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:41 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B3F6EB462
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B70D5D501C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DDDE21F7A7
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B3841A006B;
	Wed, 13 Mar 2024 15:09:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/36] xev: update 1.2.5 -> 1.2.6
Date: Wed, 13 Mar 2024 15:08:33 +0800
Message-Id: <1710313714-12541-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.428600-10.000000
X-TMASE-MatchedRID: Ll6vM9Ck4lCvbHkumykHI4XQ/hu1OV/0nQkHrAHoKqbDqO6/8R69QJLV
	1mlmbQlMKNLrUo1TED0ZgUTtI4MiD/whJGOqvyFj+GYt8f/VhTs3l2plwgrtWJrlnRPQNUDst9h
	PnlbRrOyhOywUZIftbeaffHI8kAmiHY/bzRmIaZHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtqLL9e8wEQHNQ7USYHYsk/MyopIKQ2KwZt5snG0CalbTeFFSFKmEWD5pgF
	hLXO5MTqDyUwyFaqhvReNQfuyz4sreG9uA+XnT1HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197037

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Mark graceful_exit as noreturn
-Mark global variables as "static" since there's only one source file
-gitlab CI: stop requiring Signed-off-by in commits
-Fix overflow on XmbLookupString buffer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-app/xev_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.6.bb
index 1d2e66b7b4..182aeff1b7 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
@@ -12,6 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
+SRC_URI[sha256sum] = "61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7"
 
 SRC_URI_EXT = "xz"
-- 
2.34.1


