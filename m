Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C89FC001E0
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7580.1687850377078420346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101083447"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101083447"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B34FE428A
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51469D3F13
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC61D6C833;
	Tue, 27 Jun 2023 16:19:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pluggy: upgrade 1.0.0 -> 1.2.0
Date: Tue, 27 Jun 2023 15:17:22 +0800
Message-Id: <1687850250-20040-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-1.343700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrKQNhMboqZlpL/3rQmWrTBkPb
	+5Kp9e4iVlR4IQJ5z6UNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7Oki
	GGidO7I9AYdLFXr37PgYUFsN5WfiFEuM/sJgx7r9vTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ16kDg2UIcpVjccKwgQI9QrrpWv15DCXHHiyL6K0x/5JrTTybKiA2XqS/0v
	cRfeQS6IScFocjEFZz9vACO9rFBbnMtM0rRvFS7YltngPZ0gyBTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183465

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
#405: The new-style hook wrappers, added in the yanked 1.1.0 release, now require an explicit wrapper=True designation in the @hookimpl() decorator.
#364: Python 3.6 is no longer supported.
#260: Added "new-style" hook wrappers, a simpler but equally powerful alternative to the existing hookwrapper=True wrappers.
#364: Python 3.11 and 3.12 are now officially supported.
#394: Added the :meth:`~pluggy._callers._Result.force_exception` method to _Result.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pluggy_1.0.0.bb => python3-pluggy_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.0.0.bb => python3-pluggy_1.2.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
index 99ae6336b7..3322bb523b 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "4224373bacce55f955a878bf9cfa763c1e360858e330072059e10bad68531159"
+SRC_URI[sha256sum] = "d12f0c4b579b15f5e054301bb226ee85eeeba08ffec228092f8defbaa3a4c4b3"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
-- 
2.34.1


