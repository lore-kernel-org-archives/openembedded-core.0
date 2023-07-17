Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96045EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4239.1689585050399384770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124763015"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124763015"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 68607C68E1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:50 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B21D4D20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id DBB392FC86AA;
	Mon, 17 Jul 2023 18:10:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-typing-extensions: upgrade 4.7.0 -> 4.7.1
Date: Mon, 17 Jul 2023 17:10:24 +0800
Message-Id: <1689585025-23731-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-0.879000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQ38zfZwr5+SL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJvLx3Erfg5+gAK/xCOdmAwXu5
	KieZUSqMzdEsg0Ma065LJq0CycEuW3u6EcHkCQNHvJPggXXC5q56JYHDzXz4s2wzfHkwfNlex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184453

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fix support for TypedDict, NamedTuple and is_protocol on PyPy-3.7 and PyPy-3.8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...g-extensions_4.7.0.bb => python3-typing-extensions_4.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.7.0.bb => python3-typing-extensions_4.7.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
index 887cece688..8ff77ba4fd 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.7.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "935ccf31549830cda708b42289d44b6f74084d616a00be651601a4f968e77c82"
+SRC_URI[sha256sum] = "b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


