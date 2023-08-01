Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCDFC04FE0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.7615.1690875710662044360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114337573"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114337573"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3962C68E5
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:45 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ED44CF7CF
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62A2A2FC84CD;
	Tue,  1 Aug 2023 16:41:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-editables: upgrade 0.4 -> 0.5
Date: Tue,  1 Aug 2023 15:41:20 +0800
Message-Id: <1690875687-21573-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzXwAEyrcFm7gMF8
	OOtJrDDN4SobteZrXTFvwPXgUa2DPZX5ztAPmVCyXpBqddXNOSllSFJdaQydii7fadwRdUKnf2T
	NYPnrijiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185203

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix a bug that broke importlib.invalidate_caches

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-editables_0.4.bb => python3-editables_0.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-editables_0.4.bb => python3-editables_0.5.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-editables_0.4.bb b/meta/recipes-devtools/python/python3-editables_0.5.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-editables_0.4.bb
rename to meta/recipes-devtools/python/python3-editables_0.5.bb
index c53186997a..f3261183cb 100644
--- a/meta/recipes-devtools/python/python3-editables_0.4.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41bc1be47b7bb8240db3ef928c7cb0bf"
 
-SRC_URI[sha256sum] = "dc322c42e7ccaf19600874035a4573898d88aadd07e177c239298135b75da772"
+SRC_URI[sha256sum] = "309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


