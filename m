Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D32C83F22
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:47:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8671.1693450025845381280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109549404"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109549404"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:47:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 785B9E8521
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:47:01 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C31C8D5EB9
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:47:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E847E86C8D;
	Thu, 31 Aug 2023 11:46:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pluggy: upgrade 1.2.0 -> 1.3.0
Date: Thu, 31 Aug 2023 10:45:52 +0800
Message-Id: <1693449952-28343-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-0.212700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr1+Cp0Qg3BZ6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9SuvtBzlaEqGAN6i+va16ubsT
	aWd4cSvTzhiJqDW6V2C5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAEAa2jGxoL+tdvgkwgfD1HqQ2Y+RpjrOXxT11hVqbASsHf+I/P29xVfdvxgzEnn9Ua5Zi
	xJcywgz5fHNkEEyb4Pu78oVJ18wfPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186951

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    #426: Python 3.7 is no longer supported.
    #428: Pluggy now exposes its typings to static type checkers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pluggy_1.2.0.bb => python3-pluggy_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.2.0.bb => python3-pluggy_1.3.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
index 3322bb523b..c149cbb0e2 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "d12f0c4b579b15f5e054301bb226ee85eeeba08ffec228092f8defbaa3a4c4b3"
+SRC_URI[sha256sum] = "cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
-- 
2.34.1


