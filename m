Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933EDC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:04:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.15211.1700643868747416614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140530535"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140530535"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:04:27 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 58E6DD9DAD
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:04:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97DCBD1F47
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:04:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4ADEE20D6;
	Wed, 22 Nov 2023 18:04:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-certifi: upgrade 2023.7.22 -> 2023.11.17
Date: Wed, 22 Nov 2023 17:03:47 +0800
Message-Id: <1700643827-9670-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10-4.221500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yRIRh9wkXSlFyWrnMF4C9YiU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN7ucGeLolz1HfVqwz+CynaV42zm1Zi+MJ1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrX3MqZpcHZvvdLeb2RiTyOk4ZfrerwyIp7qQQLCTJ+gpQFTCSwy86OCde+D1SRNV7JFCK
	7rFS1kfU37QXht3NrWrPx6iuBXUkR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191035

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Remove inaccurate date from LICENSE

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-certifi_2023.7.22.bb => python3-certifi_2023.11.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-certifi_2023.7.22.bb => python3-certifi_2023.11.17.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
index c4e1e7b917..daed712362 100644
--- a/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
@@ -5,9 +5,9 @@ which ships with the Requests codebase, and is derived from Mozilla Firefox's ca
 HOMEPAGE = " http://certifi.io/"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082"
+SRC_URI[sha256sum] = "9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


