Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20EFC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:38:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.38457.1698997115369958684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126799361"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126799361"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:38:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FFBCD9DA8
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:38:31 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A529D67AA
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:38:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 32658880A3;
	Fri,  3 Nov 2023 16:38:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 23.2.1 -> 23.3.1
Date: Fri,  3 Nov 2023 15:33:09 +0800
Message-Id: <1698996789-30889-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--0.006400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrZG3SCLP7QtJeNs5tWYvjCUrc
	A9rqr8Z64CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2e63p3Evo7CYnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFKYj8Qx2Wf3EYMCH/UD1RqOaaw
	DMxIdSnxQQgBkOd4fpESQiYiPgaDRUPcdiZUiVS3lLOkqkJ5uJo46AlIGcW+eUwBhs/4LP2+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190128

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://pip.pypa.io/en/stable/news/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_23.2.1.bb => python3-pip_23.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_23.2.1.bb => python3-pip_23.3.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_23.2.1.bb b/meta/recipes-devtools/python/python3-pip_23.3.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_23.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_23.3.1.bb
index c92e2dbd57..3699bdf515 100644
--- a/meta/recipes-devtools/python/python3-pip_23.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.3.1.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "fb0bd5435b3200c602b5bf61d2d43c2f13c02e29c1707567ae7fbc514eb9faf2"
+SRC_URI[sha256sum] = "1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


