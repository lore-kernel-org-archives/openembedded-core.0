Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB36AC7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.26620.1685610258654342845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98458952"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98458952"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02219DAE0F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:09 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D38AD5020
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 704C488857;
	Thu,  1 Jun 2023 18:04:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.5.2 -> 2023.5.24
Date: Thu,  1 Jun 2023 17:03:37 +0800
Message-Id: <1685610221-29015-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--5.401300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyhl74SxBZDGCm6
	LUOF021RAye6NYYDq+DE0/GnRGyw5m0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7U9a
	6zfLFA1bss9r//dw7twYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtrogWdfslJHBKhvJshT5923LOhUttYgJG6M41nbebJ5BBx7Z9LNSyvg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182088

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Add identifier "Programming Language :: Lua" (#145)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2023.5.2.bb => python3-trove-classifiers_2023.5.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.5.2.bb => python3-trove-classifiers_2023.5.24.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.2.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.5.2.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
index 78057feb52..2d484d4b2c 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.2.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.5.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c46d6e40a9581599b16c712e0164fec3764872a4085c673c07559787caedb867"
+SRC_URI[sha256sum] = "fd5a1546283be941f47540a135bdeae8fb261380a6a204d9c18012f2a1b0ceae"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


