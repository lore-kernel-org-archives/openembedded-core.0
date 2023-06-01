Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE600C7EE3A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.26251.1685610250670210768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98556122"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98556122"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4894BC68E5
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:06 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 86ECDD67C2
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B63E688864;
	Thu,  1 Jun 2023 18:04:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.17 -> 3.18.0
Date: Thu,  1 Jun 2023 17:03:32 +0800
Message-Id: <1685610221-29015-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-1.117000-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrKQNhMboqZlox9I+EPr/hD4+w
	qgvZUWqofdCuuzQ7DBgQtWQZJqxoDCJcv5X7ObmJL7p//vLv4bPYUDvAr2Y/19MIXgOsLuq/owu
	jpd11c5hcTFAN0zkeIgXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJZjm/42WWfFCgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipciPiJD94az7O3P8Bt5RFqxnu8YnJrve1sRtWa
	/6b7vx5QgdYrUu3ibgJxT/63gcF95B39MyTVx7++cTOGph4ac75wq0cd1BT/f6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182083

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
New features
---------------
* Added support for DER BOOLEAN encodings.
* The library now compiles on Windows ARM64.

  Resolved issues
---------------
* GH#722: "nonce" attribute was not correctly set for XChaCha20_Poly1305 ciphers.
* GH#728: Workaround for a possible x86 emulator bug in Windows for ARM64.
* GH#739: OID encoding for arc 2 didn't accept children larger than 39.
* Correctly check that the scalar matches the point when importing an ECC private key.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycryptodome_3.17.bb => python3-pycryptodome_3.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.17.bb => python3-pycryptodome_3.18.0.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.17.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.18.0.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.17.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.18.0.bb
index 05f654f225..a1e4b42bdf 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.17.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.18.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "bce2e2d8e82fcf972005652371a3e8731956a0c1fbb719cc897943b3695ad91b"
+SRC_URI[sha256sum] = "c9adee653fc882d98956e33ca2c1fb582e23a8af7ac82fee75bd6113c55a0413"
 
-- 
2.34.1


