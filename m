Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54581C001DF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7536.1687850368657859700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122378672"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122378672"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:27 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F428C68E5
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 938E6D5070
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EAE36C833;
	Tue, 27 Jun 2023 16:19:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.26.5 -> 2.28.0
Date: Tue, 27 Jun 2023 15:17:04 +0800
Message-Id: <1687850250-20040-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--0.621900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XZj7E6vHnuNZ4N+DtUJi5cYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUs0JDTxRKFH46wC7w5LE1l83b9T
	q+QvuieWQBoTWWqHoYm1Kejk//ud6sUaWEm3ZQgGwrnT5JAPTfSZ2x2T8uPyOUxCuBpkoAkYgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183449

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.26.5.bb => libsdl2_2.28.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.5.bb => libsdl2_2.28.0.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
index 3274475da1..1228217e8c 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "ad8fea3da1be64c83c45b1d363a6b4ba8fd60f5bde3b23ec73855709ec5eabf7"
+SRC_URI[sha256sum] = "d215ae4541e69d628953711496cd7b0e8b8d5c8d811d5b0f98fdc7fd1422998a"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


