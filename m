Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842D5E7D263
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:35:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14293.1695717334306297486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="112521884"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="112521884"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:35:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EAABD3EC5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:35:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A6B2CCFBBF
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:35:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF6AE2005932A;
	Tue, 26 Sep 2023 17:35:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.8.7 -> 2023.9.19
Date: Tue, 26 Sep 2023 16:33:37 +0800
Message-Id: <1695717217-12271-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10--1.146300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mregIHHX2L4YwZFeXguNpWv0mY
	fhvEN/pW+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSQW+C1YFOZoB2ua0N46S0eNiEeGqw4ObfsJtyYDX3i3rSvmLr3ytik7T/IyImBWf+ysGG
	lycfRkRC3SMqx/MpF1QSQt0Fh+NGPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188236

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add Trove classifier for Django 5.0 (#153)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2023.8.7.bb => python3-trove-classifiers_2023.9.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.8.7.bb => python3-trove-classifiers_2023.9.19.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
index 9aed0d62e4..aa062f659b 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.8.7.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c9f2a0a85d545e5362e967e4f069f56fddfd91215e22ffa48c66fb283521319a"
+SRC_URI[sha256sum] = "3e700af445c802f251ce2b741ee78d2e5dfa5ab8115b933b89ca631b414691c9"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


