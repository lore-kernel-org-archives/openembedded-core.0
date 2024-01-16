Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754F5C3DA79
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 02:07:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.1929.1705370853449567500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 18:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="145700520"
X-IronPort-AV: E=Sophos;i="6.04,197,1695654000"; 
   d="scan'208";a="145700520"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 11:07:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 69B76DC648
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:07:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63465BF3E3
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:07:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB2082007911C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 11:07:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 758871A015E;
	Tue, 16 Jan 2024 10:07:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Jiang Kai <jiangkai@fujitsu.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] debianutils: upgrade 5.15 -> 5.16
Date: Tue, 16 Jan 2024 10:06:37 +0800
Message-Id: <1705370800-31004-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
References: <1705370800-31004-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.004
X-TMASE-Result: 10-0.572800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+RMg1M5QvEWU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjF1+0
	KsXaxWz7i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFCGd0CRgcy72rec0YnKYJqwOJa
	4SDd4+YaIfBRjYWcIW7DpJ6vpIbTieBuX/PkTSN9jyCF+mHJksALW4zlglmg/jP1mtoYED1Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193810

From: Jiang Kai <jiangkai@fujitsu.com>

Changelog:
 Upload to unstable per request of Chris Hofstaedtler.

Signed-off-by: Jiang Kai <jiangkai@fujitsu.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.15.bb => debianutils_5.16.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.15.bb => debianutils_5.16.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.15.bb b/meta/recipes-support/debianutils/debianutils_5.16.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.15.bb
rename to meta/recipes-support/debianutils/debianutils_5.16.bb
index b1368a3b2e..ec629d8b73 100644
--- a/meta/recipes-support/debianutils/debianutils_5.15.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.16.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "d886c15810b58e57411048f57d7fb941a6819987"
+SRCREV = "9e0facf19b17b6d090a5dcc8cacb0c16e5ad9f72"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


