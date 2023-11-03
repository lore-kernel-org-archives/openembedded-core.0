Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC725C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:29:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.37035.1698996556252415615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="137947748"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="137947748"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:29:14 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B4B1BD6187
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:29:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E7E07DA251
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:29:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14F986BF4C;
	Fri,  3 Nov 2023 16:29:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.4 -> 41.0.5
Date: Fri,  3 Nov 2023 15:28:30 +0800
Message-Id: <1698996510-30721-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--4.371000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M0XC9p0ThKQ4dEA
	nAuyokV2zQCB72FLaNroNOYPho+2K20Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKa7IVNHJKd7gAXgr1m1OnKW2EXohiB6drdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt4KD/CZVGL/2AuCK/qaFmaFfZdsWm/twQDnYfUT/QaAc1xpUa3KoUmBWeJ
	ieXGGsgyGmft0p3ZQO6g1C7ov8Q7JJPr/a69k6rHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190124

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.1.4.
Added a function to support an upcoming pyOpenSSL release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_41.0.4.bb => python3-cryptography-vectors_41.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.4.bb => python3-cryptography-vectors_41.0.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
index 6b5d8adee9..44c67fdd76 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "440af2813ea7aeb52181ec651a36d9ae8f0976e8b3a62b411a800fe6fa57a19e"
+SRC_URI[sha256sum] = "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.34.1


