Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5FAC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:15:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.9173.1702980951788089849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="131927416"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="131927416"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:15:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 14946D64AD
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:15:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 00851BF3C8
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:15:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C68D2026E773
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:15:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 484D41A006F;
	Tue, 19 Dec 2023 18:15:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-typing-extensions: upgrade 4.8.0 -> 4.9.0
Date: Tue, 19 Dec 2023 18:15:39 +0800
Message-Id: <1702980939-8660-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-2.690700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBZUipC+zHNir6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFH6r0gCfntwx0iwOavDz5LHD5L
	tJqfbvrmaQtBk4yfpzKyGquDUCrxF4Xo9V8rXE47CMzGRwSPDJHncPDaODjUHnd1vm+/1qhOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192719

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/python/typing_extensions/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...g-extensions_4.8.0.bb => python3-typing-extensions_4.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.8.0.bb => python3-typing-extensions_4.9.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb
index 33749a9f0f..3553c597ac 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "df8e4339e9cb77357558cbdbceca33c303714cf861d1eef15e1070055ae8b7ef"
+SRC_URI[sha256sum] = "23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


