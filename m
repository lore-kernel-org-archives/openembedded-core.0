Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3935DC54E63
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8420.1709105611380585283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KfiP4fx3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105614; x=1740641614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eGpxQz9EHwD9qQ6AOdG795HN7dGioeN4PbAs5xzty7c=;
  b=KfiP4fx3ZkD6Na7htSk6D3FfA1Yyxa51b9FsMAmhxbk0bt3WH76bGyes
   ChVkLVRSa2Ra1nJsbjkkbpQEcTSlqjG00q8AUpn8/GVJ3jKDpi+0dDFkn
   oMtutyT7kYbnGJGAMshvg8Lo1ysCjrBF5XmE3REqvyB/c7Paa8mIJsr4C
   pjrE1mO6BWzrfIKhOUrw7XY8yT0M2LerNwB5UJN/QsERuDNYryBHjFiZA
   Orjbqq/R3i+kDAwqG/Q5gAVGnVwA56TT5HxIFG/XM49mekwy0cCTgxvH8
   2lNt0SWEkme4FUgg+2WHRV/RCxhcGJVvjLazDfdHCV2q3hIsR1LStV7Ji
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150945765"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150945765"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EDD22A0DFB
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0079D547B
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C7412008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DFF281A006A;
	Wed, 28 Feb 2024 15:33:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/48] pango: upgrade 1.51.0 -> 1.52.0
Date: Wed, 28 Feb 2024 15:32:34 +0800
Message-Id: <1709105575-24259-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--6.982800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mregIHHX2L4YzfUZT83lbkEIIP
	FubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUNEzEoOqAAVLNr2qJoNIuCjfdsGrGaOKdNLHN
	FiwmJRq/de+c0gz7NjHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiTzGo
	6QVla/Cse9GX0UxNsSstG25F8gYTrokzMepQNzXn7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add pango_font_map_reload_font
- Improve formatting of font sizes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.51.0.bb => pango_1.52.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.51.0.bb => pango_1.52.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.51.0.bb b/meta/recipes-graphics/pango/pango_1.52.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.51.0.bb
rename to meta/recipes-graphics/pango/pango_1.52.0.bb
index 85a0270a3f..7505ff9279 100644
--- a/meta/recipes-graphics/pango/pango_1.51.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.52.0.bb
@@ -23,7 +23,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "74efc109ae6f903bbe6af77eaa2ac6094b8ee245a2e23f132a7a8f0862d1a9f5"
+SRC_URI[archive.sha256sum] = "1ec8518879c3f43224499f08e8ecbbdf4a5d302ed6cd3853b4fa949f82b89a9b"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


