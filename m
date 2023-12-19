Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD4CC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:16:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9137.1702980983276335548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143915040"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143915040"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:16:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 73431D9DA8
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:16:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BDB44D9779
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:16:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5051C6BF46
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:16:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F32831A006F;
	Tue, 19 Dec 2023 18:16:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wcwidth: upgrade 0.2.11 -> 0.2.12
Date: Tue, 19 Dec 2023 18:16:11 +0800
Message-Id: <1702980971-8696-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-2.200900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzaLLNNBNZTFFv3p
	36RPEH2uLt6eTpYJL04LioMnGl/y1Os7nlF/fCJoXhAJXzg+RzUVXS1gkafkD0ag3J1YcXZEQwq
	razBQOMiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192720

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove a .pyi file was misplaced in the wheel file distributed on pypi for 0.2.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wcwidth_0.2.11.bb => python3-wcwidth_0.2.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.11.bb => python3-wcwidth_0.2.12.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.11.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.11.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
index c4db61e062..ae845a39a7 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.11.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "25eb3ecbec328cdb945f56f2a7cfe784bdf7a73a8197398c7a7c65e7fe93e9ae"
+SRC_URI[sha256sum] = "f01c104efdf57971bcb756f054dd58ddec5204dd15fa31d6503ea57947d97c02"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


