Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1A9C7EE31
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.26617.1685610252527821640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="97825973"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="97825973"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59559D3EB2
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95E97CF7EF
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D3A4688857;
	Thu,  1 Jun 2023 18:04:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 1.2.0 -> 1.2.1
Date: Thu,  1 Jun 2023 17:03:36 +0800
Message-Id: <1685610221-29015-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFWMAzi+7d0ch3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrWoFC2Jk1aNvpLDX05U0cjhnIiscSv2Qjw5CCRLM2l7HG+ORUKmPBoAm1X
	f5togAglTqSOXXNACfhQccTUYJZKA4GXcrPHIEZh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182085

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_1.2.0.bb => python3-sphinx-rtd-theme_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.2.0.bb => python3-sphinx-rtd-theme_1.2.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.1.bb
index d9cd18e0ed..25de0159b6 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "a0d8bd1a2ed52e0b338cbe19c4b2eef3c5e7a048769753dac6a9f059c7b641b8"
+SRC_URI[sha256sum] = "cf9a7dc0352cf179c538891cb28d6fad6391117d4e21c891776ab41dd6c8ff70"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.34.1


