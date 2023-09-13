Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFA5CA5520
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:32:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7635.1694597552837785343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131777416"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131777416"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:32:30 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEEF1C3F84
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:32:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5410CF7C0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:32:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6359D200501A8;
	Wed, 13 Sep 2023 18:32:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iproute2: upgrade 6.4.0 -> 6.5.0
Date: Wed, 13 Sep 2023 17:31:52 +0800
Message-Id: <1694597512-21432-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--7.599100-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrPxq3ixYTmGC8kWs0jYwiwkXSJ4c3nT+Qesxn4GpC3Y2uTAXNPNyDOE0/tWY/sOuvoKzN
	3kYLPjJLTobumdHDKGQjRHotpINbSUUpG8SniXON5x7RpGJf1ayiKgKtIyB4ofIGCZubTsxAjJl
	ierVE/nwF6gCrM4kDtOzTDkfilYT5H0YXYnbGozFEUknJ/kEl7dB/CxWTRRu25FeHtsUoHu2RYa
	j3HZ9PHdYChIbQIo5YBKVLOLlYl3AbblsQQEcyPFhXMjdQIJpg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187564

From: Wang Mingyu <wangmy@fujitsu.com>

0001-bridge-mdb.c-include-limits.h.patch
removed since it's included in 6.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-bridge-mdb.c-include-limits.h.patch  | 41 -------------------
 .../{iproute2_6.4.0.bb => iproute2_6.5.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.4.0.bb => iproute2_6.5.0.bb} (95%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
deleted file mode 100644
index f9a0e35d83..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-bridge-mdb.c-include-limits.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b13f04c0c685b6d2474aa7d97e191531f327bc45 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Thu, 20 Jul 2023 14:32:23 -0400
-Subject: [PATCH] bridge/mdb.c: include limits.h
-
-Upstream-Status: Submitted
-(https://lore.kernel.org/netdev/20230720203726.2316251-1-tgamblin@baylibre.com/)
-
-While building iproute2 6.4.0 with musl using Yocto Project, errors such
-as the following were encountered:
-
-| mdb.c: In function 'mdb_parse_vni':
-| mdb.c:666:47: error: 'ULONG_MAX' undeclared (first use in this function)
-|   666 |         if ((endptr && *endptr) || vni_num == ULONG_MAX)
-|       |                                               ^~~~~~~~~
-| mdb.c:666:47: note: 'ULONG_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
-
-Include limits.h in bridge/mdb.c to fix this issue. This change is based
-on one in Alpine Linux, but the author there had no plans to submit:
-https://git.alpinelinux.org/aports/commit/main/iproute2/include.patch?id=bd46efb8a8da54948639cebcfa5b37bd608f1069
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- bridge/mdb.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mdb.c b/bridge/mdb.c
-index fbb4f704..18793458 100644
---- a/bridge/mdb.c
-+++ b/bridge/mdb.c
-@@ -15,6 +15,7 @@
- #include <string.h>
- #include <arpa/inet.h>
- #include <netdb.h>
-+#include <limits.h>
- 
- #include "libnetlink.h"
- #include "utils.h"
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
similarity index 95%
rename from meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
index 32e2f8176b..db46c8317a 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.5.0.bb
@@ -13,10 +13,9 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-           file://0001-bridge-mdb.c-include-limits.h.patch \
            "
 
-SRC_URI[sha256sum] = "4c51b8decbc7e4da159ffb066f590cfb93dbf9af7ff86b1647ce42b7c179a272"
+SRC_URI[sha256sum] = "a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.34.1


