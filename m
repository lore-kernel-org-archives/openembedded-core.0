Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D13C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:31:46 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.24490.1704180698033428956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="124464524"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="124464524"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:31:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74ED3D69D5
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:31:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A9C0B19077
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:31:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38F0E20093268
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:31:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B79161A0072;
	Tue,  2 Jan 2024 15:31:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodomex: upgrade 3.19.0 -> 3.19.1
Date: Tue,  2 Jan 2024 15:28:55 +0800
Message-Id: <1704180535-8758-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-2.285100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiG8m0JExnub3gj
	0Xrzki4tVR1xYvzUogyp9Q2PiVNnwe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiokYPdc767YuhAZQXEXXZu5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5HhfbSWxAe8a2sRVfkHQEQvejRFYz9nUdejBqUtWK8gcS96nTuR7wK3p8e+TXUVRGUQ16Ob
	EvGktO95VFWly78Mmagvr8bHQdvA/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193216

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed a side-channel leakage with OAEP decryption that could be exploited to carry out a Manger attack.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pycryptodomex_3.19.0.bb => python3-pycryptodomex_3.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.19.0.bb => python3-pycryptodomex_3.19.1.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.19.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.19.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
index 87aff01bfc..d6e5c6d3ee 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "af83a554b3f077564229865c45af0791be008ac6469ef0098152139e6bd4b5b6"
+SRC_URI[sha256sum] = "0b7154aff2272962355f8941fd514104a88cb29db2d8f43a29af900d6398eb1c"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.34.1


