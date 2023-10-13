Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA4FCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:59:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.34330.1697187576030418483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="135526377"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="135526377"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:59:33 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F5D2C68E6
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:59:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BA7B165EA
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:59:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4A986BC5B;
	Fri, 13 Oct 2023 17:59:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.28.3 -> 2.28.4
Date: Fri, 13 Oct 2023 16:59:20 +0800
Message-Id: <1697187560-4207-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--0.621900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XZj7E6vHnuNZ4N+DtUJi5cYFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUs6xVFa/tEz4zLntjv+NTMdb+ux
	8DpKz2UetXy6kkuO62NR+pbzWAeHe+5zJVr9Lr2UZn+AW4/AKOjCdR+E4ln2qChH9qec3xN4gep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189038

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.28.3.bb => libsdl2_2.28.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.3.bb => libsdl2_2.28.4.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
index f866a3618f..3fed10878f 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518"
+SRC_URI[sha256sum] = "888b8c39f36ae2035d023d1b14ab0191eb1d26403c3cf4d4d5ede30e66a4942c"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


