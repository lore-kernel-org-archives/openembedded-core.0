Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EE2C83F24
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:51:53 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8775.1693450312434217925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129925523"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129925523"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:51:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BBD6D29ED
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:51:48 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A43BDBF3C6
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:51:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9ADE2FC2743;
	Thu, 31 Aug 2023 11:51:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 1.2.2 -> 1.3.0
Date: Thu, 31 Aug 2023 10:51:18 +0800
Message-Id: <1693450278-28439-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFWMAzi+7d0ch3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrWoFC2Jk1aNvpLDX05U0cjhnIiscSv2Qjw5CCRLM2l7HG+ORUKmPBoBiAj
	tSMYWZVC6NHkBJsBHEeNiUjQibAdFiLhxFULO16h0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186953

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_1.2.2.bb => python3-sphinx-rtd-theme_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.2.2.bb => python3-sphinx-rtd-theme_1.3.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
index 0fac83a1c9..83bf705766 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "01c5c5a72e2d025bd23d1f06c59a4831b06e6ce6c01fdd5ebfe9986c0a880fc7"
+SRC_URI[sha256sum] = "590b030c7abb9cf038ec053b95e5380b5c70d61591eb0b552063fbe7c41f0931"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.34.1


