Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20CDC54E56
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8418.1709105610013304442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fYgAIuN4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105617; x=1740641617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Rx8KLDJs53bkytQ1p1UmM4WlJnvHMu38dmn4iRjO69Q=;
  b=fYgAIuN4OuSPtP8XgrLOQ7xgFJ6HHFYOJGGVH6wARSF9bIh3ksLo9d4o
   OAgklrTp8YSXNqV1jZk4H8uSzBnTT5dPswgTAIK2V+VjJQURy8DYz9mnf
   0lg40uLZV2DwOp+20ipCmrlMG4ehYL7499ChbKMGBLz4V7CC9VzbDlIis
   0P1PQwaekAAPINphtFXXkKykkv5CnBtmJSbnVNsu/df789OJVq7XGuzFy
   5KCoCnWN/OW5fgEr9+P5AUGsGgEMb9t6D8/w3wA0/UJ/5I5GAnTTMu4rx
   +vb/cH0NO9sZwztnNwsqLUR/ng0BmYkerUp8PeNlxmKdGXTcLd7FOQ4m9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="152444764"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="152444764"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BC68AF0FF8
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDFEE170C08
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C20D41180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 250051A006A;
	Wed, 28 Feb 2024 15:33:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/48] python3-certifi: upgrade 2023.11.17 -> 2024.2.2
Date: Wed, 28 Feb 2024 15:32:38 +0800
Message-Id: <1709105575-24259-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGBUtfqgsaZaLuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOPzkhwYoSgw+gXt
	cEh7T+p96+85aXj+r7mJmhJZo4X6+aq4qUXlaL/gR1k7TMwa8YlBXKHMP921p/IkRiOlOyp7gMP
	KozdxxEgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196356

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-certifi_2023.11.17.bb => python3-certifi_2024.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2023.11.17.bb => python3-certifi_2024.2.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index daed712362..4e61b8d9d4 100644
--- a/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1"
+SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


