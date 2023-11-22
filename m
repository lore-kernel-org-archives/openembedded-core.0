Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8545EC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:55:26 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.15095.1700643325746357818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119945838"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119945838"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:23 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D70AD4F51
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:55:21 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FAEDE647A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:55:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76D3B2FC8304;
	Wed, 22 Nov 2023 17:55:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 251 -> 252
Date: Wed, 22 Nov 2023 16:54:28 +0800
Message-Id: <1700643268-9248-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--2.593800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrp/YxNkZPmnLxTeWUBV+Z2b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S9MHEIl7Sq2ZjOuWoMlyA1cHI24UvGYHOHafWUaHsuSipCc
	nVBQXfSYiuIR//yCHJXFUg82fll92rCNU5IbA5WGiSfvi32ajXS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* As UI/UX improvement, try and avoid printing an extended traceback if
  diffoscope runs out of memory.
* Mark diffoscope as stable in setup.py (for PyPI.org). Whatever diffoscope
  is, at least, not "alpha" anymore.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_251.bb => diffoscope_252.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_251.bb => diffoscope_252.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_251.bb b/meta/recipes-support/diffoscope/diffoscope_252.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_251.bb
rename to meta/recipes-support/diffoscope/diffoscope_252.bb
index 8862509e05..86dc85df83 100644
--- a/meta/recipes-support/diffoscope/diffoscope_251.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_252.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c9ba2fc24379b2ba4457dc7be6970884cc2ee94c20d44f3889c2a4741e6178d3"
+SRC_URI[sha256sum] = "e268384fa484f3dd8a936da626e6ef1b231dcb286d09a360f37548637f8dd46d"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


