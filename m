Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D26C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:41:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8936.1700037674639100482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="128071444"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="128071444"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:41:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AD8FD619A
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:41:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9687FF991
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:41:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 94B1285C9B;
	Wed, 15 Nov 2023 17:41:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-testtools: upgrade 2.7.0 -> 2.7.1
Date: Wed, 15 Nov 2023 16:39:58 +0800
Message-Id: <1700037598-1654-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10--2.845400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMVx/3ZYby794YeSlHZYFos0K
	ErW5SfmWbSL9AN4UjlvzSn+RSRAmrFpCIuRr0RxKA9lly13c/gEQhNjZQYyI3BdHcHEd3javfCx
	PmMXdYL4i+t+0AiFaYhPUpUX8s8NPOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtYN5aWYvP7iKyB1NvYiT6U7psl+Dfy5WamYL4WN7+UqKRw2IEl7GKJLPBR
	ak1PaeDtUt2sDfiKbkdehH17ko4YimddnoVvYtAHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Remove various unused imports.
* Fix build backend. This should prevent version from being set to 0.0.0
  when building wheels.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-testtools.inc               | 2 +-
 .../{python3-testtools_2.7.0.bb => python3-testtools_2.7.1.bb}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.7.0.bb => python3-testtools_2.7.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index 76f99c2058..759166d63d 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 inherit pypi
 
-SRC_URI[sha256sum] = "eec326f4275e6a55e5540302d01a0ae0a9e48991d7aade38a5c8ed093c37993a"
+SRC_URI[sha256sum] = "df6de96010e29ee21f637a147eabf30d50b25e3841dd1d68f93ee89ce77e366c"
 
 DEPENDS += " \
     ${PYTHON_PN}-pbr \
diff --git a/meta/recipes-devtools/python/python3-testtools_2.7.0.bb b/meta/recipes-devtools/python/python3-testtools_2.7.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-testtools_2.7.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.7.1.bb
-- 
2.34.1


