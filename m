Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC72C83F1D
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:42:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8622.1693449719113434572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129923481"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129923481"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:41:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CAB09DE56F
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:41:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 041FBBF4BF
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:41:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 873042007471D;
	Thu, 31 Aug 2023 11:41:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pigz: upgrade 2.7 -> 2.8
Date: Thu, 31 Aug 2023 10:40:00 +0800
Message-Id: <1693449600-28209-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--3.753400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2uzBxqYmYFr6Nz4cH5hW96YOwpfLMeBwRvlhMBfJp59WRItcoSAIccJHYw
	dSmesTAC5iEI90L56oQqmTaZrF/FUJ8H7844WHI7dCok3ibXlQX0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtLNT92EYkxw8YqxvUvlga1flpMgoTmXNzbfJFxdd97Ld7o4UT9bdhF1JFe
	t5ZIrI0n4XFGUKYRanbKlv6Wn6IZuZhOzATxuTBHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186948

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/pigz/{pigz_2.7.bb => pigz_2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pigz/{pigz_2.7.bb => pigz_2.8.bb} (94%)

diff --git a/meta/recipes-extended/pigz/pigz_2.7.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
similarity index 94%
rename from meta/recipes-extended/pigz/pigz_2.7.bb
rename to meta/recipes-extended/pigz/pigz_2.8.bb
index 9a1c591b27..fcf0c93e41 100644
--- a/meta/recipes-extended/pigz/pigz_2.7.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -9,7 +9,7 @@ LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
-SRC_URI[sha256sum] = "b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707"
+SRC_URI[sha256sum] = "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0"
 PROVIDES:class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-- 
2.34.1


