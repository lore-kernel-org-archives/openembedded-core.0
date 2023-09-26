Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8131AE7D261
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:31:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.14415.1695717071374322631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121668265"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="121668265"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:31:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A4CFD29E8
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:31:07 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 83CB5D5018
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:31:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92BFD2FC90C3;
	Tue, 26 Sep 2023 17:31:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodomex: upgrade 3.18.0 -> 3.19.0
Date: Tue, 26 Sep 2023 16:29:02 +0800
Message-Id: <1695716942-10537-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10-2.709700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrK1zvw58EecvxiuLXNGbfqGKF
	LqZhp2Q7QldmeUbKs0ENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2Z/S
	mwZqazWySkIUZyUQUJ3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Z/x
	4vE3OY1l6HzJqK115JCsWBNvp02gHBkxZ+odKgaEBQ0c8zg07Q0ktxtuZdPQ8RRFtwNTQk1HhaZ
	tD6/2WLsg/CaGOa+EOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188234

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-The update() methods of TupleHash128 and TupleHash256 objects can now hash
 multiple items (byte strings) at once. Thanks to Sylvain Pelissier.
-Added support for ECDH, with Crypto.Protocol.DH.
-GH#754: due to a bug in cffi, do not use it on Windows with Python 3.12+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pycryptodomex_3.18.0.bb => python3-pycryptodomex_3.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.18.0.bb => python3-pycryptodomex_3.19.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.18.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.19.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.18.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.19.0.bb
index cbbc17adba..87aff01bfc 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.18.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.19.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "3e3ecb5fe979e7c1bb0027e518340acf7ee60415d79295e5251d13c68dde576e"
+SRC_URI[sha256sum] = "af83a554b3f077564229865c45af0791be008ac6469ef0098152139e6bd4b5b6"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.34.1


