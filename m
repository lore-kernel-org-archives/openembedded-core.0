Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAD4E7D261
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:29:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.14191.1695716938066709465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121667944"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="121667944"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:28:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 768C8C68E4
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:28:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B15DDD5007
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:28:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E9536B4CA;
	Tue, 26 Sep 2023 17:28:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.18.0 -> 3.19.0
Date: Tue, 26 Sep 2023 16:28:21 +0800
Message-Id: <1695716901-10366-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10-1.608700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrK1zvw58EecvxiuLXNGbfqGKF
	LqZhp2Q7QldmeUbKs0ENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDfBDJhzPNa7asd/oBUHSssVDo
	Oh17uDwOPp0zys0BvG9N35WkTluuwRJsPTFabvU5fDzRct+vaO04kzD7U3+X1KPTa+iqFPBex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188233

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The update() methods of TupleHash128 and TupleHash256 objects can now hash
 multiple items (byte strings) at once. Thanks to Sylvain Pelissier.
- Added support for ECDH, with Crypto.Protocol.DH.
- GH#754: due to a bug in cffi, do not use it on Windows with Python 3.12+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pycryptodome_3.18.0.bb => python3-pycryptodome_3.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.18.0.bb => python3-pycryptodome_3.19.0.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.18.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.19.0.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.18.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.19.0.bb
index a1e4b42bdf..92fe1aa17a 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.18.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.19.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "c9adee653fc882d98956e33ca2c1fb582e23a8af7ac82fee75bd6113c55a0413"
+SRC_URI[sha256sum] = "bc35d463222cdb4dbebd35e0784155c81e161b9284e567e7e933d722e533331e"
 
-- 
2.34.1


