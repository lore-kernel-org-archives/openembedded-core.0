Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC01DC04A94
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4248.1689585042654153737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="113014155"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="113014155"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 800D7DE623
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:48 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66D59D5D44
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 882802FC8579;
	Mon, 17 Jul 2023 18:10:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 6.7.0 -> 6.8.0
Date: Mon, 17 Jul 2023 17:10:21 +0800
Message-Id: <1689585025-23731-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--0.235500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4BC5HdxA3MwScH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogMWCgdCzp+adXu122+iJtpV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S78eWWsCAG6TdhDmB77XadCzH2vlNMR7HUvsGIb2FzOWzxU
	3DFrx/xxlM8bNinySVcKzn5RaSzMRaOP39r2F7N3YBduKH/QsES7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184451

From: Wang Mingyu <wangmy@fujitsu.com>

Features
==========
    Require Python 3.8 or later.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_6.7.0.bb => python3-importlib-metadata_6.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_6.7.0.bb => python3-importlib-metadata_6.8.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
index 5ad7ae81ad..b8dd4bb701 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "1aaf550d4f73e5d6783e7acb77aec43d49da8017410afae93822cc9cca98c4d4"
+SRC_URI[sha256sum] = "dbace7892d8c0c4ac1ad096662232f831d4e64f4c4545bd53016a3e9d4654743"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


