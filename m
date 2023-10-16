Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC0BCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:31:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.112993.1697445094863551209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="115116565"
X-IronPort-AV: E=Sophos;i="6.03,228,1694703600"; 
   d="scan'208";a="115116565"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:31:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46A3FD9DAC
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:31:30 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83033D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:31:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5565D2FC8401;
	Mon, 16 Oct 2023 17:31:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wcwidth: upgrade 0.2.6 -> 0.2.8
Date: Mon, 16 Oct 2023 16:31:18 +0800
Message-Id: <1697445078-29713-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27938.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27938.006
X-TMASE-Result: 10-0.964700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrCZa9cSpBObnRJq3/nCaAjL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AGAD6h6FZmESl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzhtcJIMM0DYNZ9/
	S5//aHrl9U9W27DyhstgCbqxLYMft3stEczdjtvhus6/DZoHJyc2Mj6uNqFseVvDQEgj02XXsSc
	z0LR2UFiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189274

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Include requirements files in the source distibution

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wcwidth_0.2.6.bb => python3-wcwidth_0.2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.6.bb => python3-wcwidth_0.2.8.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
index fbd008c13d..e906a6d73a 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "a5220780a404dbe3353789870978e472cfe477761f06ee55077256e509b156d0"
+SRC_URI[sha256sum] = "8705c569999ffbb4f6a87c6d1b80f324bd6db952f5eb0b95bc07517f4c1813d4"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


