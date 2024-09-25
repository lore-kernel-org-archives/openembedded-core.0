Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EFACF9C77
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9246.1727246973247954874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KzNZaMDS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246973; x=1758782973;
  h=from:to:cc:subject:date:message-id;
  bh=1N44SGL04Uob8fgByS1zLCMU+3EoW1wItvTTV9lwstY=;
  b=KzNZaMDS/Z4nzV9bvzzvUHTaqLE0Jk1L7uioI3P+dtHT0O0e7+ok2XBT
   pFWtjsFyWEjjgr/+EQMKIUAD3EbvD+WoSX54aI4yKMo/NV8qnz7/dympH
   5CHNX+MXS65HsiXlvUXpK9AbsbOWZwxrRg8jyHiw+5wGodLCmv1/+XXlA
   ItCvsDk50fLOQiPig7Cfcb/DF2HLZ1oLhT6fFgSiBILif1ZmIc8luoKay
   8p7hf/1Dy8E+Cyf2oZaI5chca0yZpoHt5ZCsojwf65pKHOojRi1LkzIz7
   Dur4NoZz0YcdRhnxhuu7Z3CmDQHM/cuRwiJO1iF73tJFAQF6nY7ckLi8x
   w==;
X-CSE-ConnectionGUID: NJjEj6suR8e0kr968rFo1Q==
X-CSE-MsgGUID: OVZ8RekPRmuNA3LTcRxYBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162105363"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162105363"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D501DB3C1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92914D4F6B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 158E1401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9832C1A000A;
	Wed, 25 Sep 2024 14:49:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/47] adwaita-icon-theme: upgrade 46.2 -> 47.0
Date: Wed, 25 Sep 2024 14:48:34 +0800
Message-Id: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--0.456600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhI9osn8JrdJPHdc
	dDNw+4rLi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFLGA2/MEX3SyAxSnah53wNVtkc
	ujoyfYnjjiHlnPf8JXHborC4IXci3K4wX6pPc/aMDi32EjR7AZE9pRrQtxgAYRLFIfZ/1noOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204895

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 cursors: updated spinners to match libadwaita

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{adwaita-icon-theme_46.2.bb => adwaita-icon-theme_47.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_46.2.bb => adwaita-icon-theme_47.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb
index 14d26ebd19..1ae08f7f05 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_46.2.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "beb126b9429339ba762e0818d5e73b2c46f444975bf80076366eae2d0f96b5cb"
+SRC_URI[archive.sha256sum] = "ad088a22958cb8469e41d9f1bba0efb27e586a2102213cd89cc26db2e002bdfe"
 
 DEPENDS += "librsvg-native"
 
-- 
2.34.1


