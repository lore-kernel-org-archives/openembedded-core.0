Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79F8C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:28:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.24459.1704180514315058826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145060546"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145060546"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:28:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA2B4D3EA9
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:28:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F290CE6185
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:28:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 89E7620093268
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:28:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 364A11A0070;
	Tue,  2 Jan 2024 15:28:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.19.0 -> 3.19.1
Date: Tue,  2 Jan 2024 15:28:19 +0800
Message-Id: <1704180499-8722-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-1.184100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiG8m0JExnub3gj
	0Xrzki4tVR1xYvzUogyp9Q2PiVNnwe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz3CdreztzUEPOBY
	yP3XyMrUN04Of24g3OIUzeF8OWpPUzQVLlhApTYDDdUsQYho20hDmtl6L3FrgUtcw62QZEkFqzC
	1VkTX+8iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193215

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed a side-channel leakage with OAEP decryption that could be exploited to carry out a Manger attack.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pycryptodome_3.19.0.bb => python3-pycryptodome_3.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.19.0.bb => python3-pycryptodome_3.19.1.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.19.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.19.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
index 92fe1aa17a..70f16c7f6d 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "bc35d463222cdb4dbebd35e0784155c81e161b9284e567e7e933d722e533331e"
+SRC_URI[sha256sum] = "8ae0dd1bcfada451c35f9e29a3e5db385caabc190f98e4a80ad02a61098fb776"
 
-- 
2.34.1


