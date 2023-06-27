Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DA4C001DE
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7535.1687850363892851065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122377545"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122377545"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C1B2E8521
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AE5D2D9681
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DB816C833;
	Tue, 27 Jun 2023 16:19:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nettle: upgrade 3.9 -> 3.9.1
Date: Tue, 27 Jun 2023 15:17:09 +0800
Message-Id: <1687850250-20040-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--0.615900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yYL5ja7E+OhyTfK5j0EZbyue38zXnNg9Q7/E
	Sxz77lNOa6hy+yFMbF9J0JX/TDdJ2lpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVUdyG
	0kjowQuN9QH9yh70TTAcxJ7EWCZcO4iXZcg3LMco6N/cDgNNi4bFk511UyURngW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcsN44yNZKKt50fkUy9XMuFhCIDSlr3CeoixO4
	Ay6YS5cYOw+J8CUyRoNsw8o0tUzszpiPY1LUVhrRiugAiM4ZDtfKWXeAhjgWv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183452

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes:
==========
* Fix OCB loop for processing messages of size 272 bytes or
  larger.
* Fix alignment bug in the new x86_64 non-pclmul assembly
  implementation of ghash.
* Fix build-time memory leak in eccdata.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/nettle/{nettle_3.9.bb => nettle_3.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.9.bb => nettle_3.9.1.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.9.bb b/meta/recipes-support/nettle/nettle_3.9.1.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.9.bb
rename to meta/recipes-support/nettle/nettle_3.9.1.bb
index 7a5bdb2a03..6bb76a6217 100644
--- a/meta/recipes-support/nettle/nettle_3.9.bb
+++ b/meta/recipes-support/nettle/nettle_3.9.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI[sha256sum] = "0ee7adf5a7201610bb7fe0acbb7c9b3be83be44904dd35ebbcd965cd896bfeaa"
+SRC_URI[sha256sum] = "ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


