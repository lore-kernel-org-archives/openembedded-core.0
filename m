Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D111C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:42:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14245.1701214947360403313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="120655813"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="120655813"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:42:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 83B10D618D
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:42:22 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BA63A7F8E8
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:42:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC123869FA;
	Wed, 29 Nov 2023 08:42:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 1.3.0 -> 2.0.0
Date: Wed, 29 Nov 2023 07:41:45 +0800
Message-Id: <1701214905-1791-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFWMAzi+7d0ch3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrWR4f0xcAjyeUmvfeA5hbaa9tk7aKYSndiRRyJVS0U8LYvtXsZJ+0DH6FK
	q5u7y6js0YHEUXS3wzXti0Io6SfuV2S0Zdruvysh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191417

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_1.3.0.bb => python3-sphinx-rtd-theme_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.3.0.bb => python3-sphinx-rtd-theme_2.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
index 83bf705766..46b46bf017 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "590b030c7abb9cf038ec053b95e5380b5c70d61591eb0b552063fbe7c41f0931"
+SRC_URI[sha256sum] = "bd5d7b80622406762073a04ef8fadc5f9151261563d47027de09910ce03afe6b"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.34.1


