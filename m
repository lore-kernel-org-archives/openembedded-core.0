Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C218C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:19:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.74304.1705310344202464995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134162690"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134162690"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:19:01 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D6500D64B1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:18:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 111E9D946E
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:18:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5DC06BD73
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:18:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B0C51A0070;
	Mon, 15 Jan 2024 17:18:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.40 -> 3.1.41
Date: Mon, 15 Jan 2024 17:18:11 +0800
Message-Id: <1705310291-24430-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--1.967500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S/y378Je2+W2h1vCvIsi8hErSf1eI/kQXG4i+qBJq4v+2BN
	QmQHAAX5rchy/5eXpyrqQphT13e9AxvfWNNIhjrmMT4ZDYjExXS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193654

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/gitpython-developers/GitPython/releases/tag/3.1.41

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.40.bb => python3-git_3.1.41.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.40.bb => python3-git_3.1.41.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.40.bb b/meta/recipes-devtools/python/python3-git_3.1.41.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.40.bb
rename to meta/recipes-devtools/python/python3-git_3.1.41.bb
index 47aa7f09ac..de199ef18b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.40.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.41.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4"
+SRC_URI[sha256sum] = "ed66e624884f76df22c8e16066d567aaa5a37d5b5fa19db2c6df6f7156db9048"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


