Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A1AC47422
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:23:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.73952.1705310633167011571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134548900"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134548900"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:23:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 754DCD9DA5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:23:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B764FCF7E7
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:23:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DA9540337
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:23:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB7AF1A0070;
	Mon, 15 Jan 2024 17:23:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-more-itertools: upgrade 10.1.0 -> 10.2.0
Date: Mon, 15 Jan 2024 17:22:19 +0800
Message-Id: <1705310539-24598-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-1.027700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrNmVjpriVEtnVbZFdXapsKdHr
	jDQf/LmC3Rq1qtW57uMxONWxQSnHS2JZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEbev
	5wFKyVv4NUccATRyd1AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07QdNP5JHgU8AyAjLoCjZnSHz0hDs/LoBKunXtxypbNX0OrA/NRg3IoTJPlZ6Irl90PRK9
	hy1+TAU/4/eDAMtmPeZTO6vC2oyzViZVPfx/VMy8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193658

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-factor, iter_index, sieve, and unique_justseen were updated to match the
 itertools docs
-first was was optimized
-takewhile_inclusive was was refactored
-combination_with_replacement_index was was optimized
-nth_permutation, nth_combination_with_replacement, combination_index, and
 combination_with_replacement_index were optimized
-batched now accepts a strict argument
-time_limited was improved for Windows
-Several typing updates were made
-Some documentation issues were fixed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ore-itertools_10.1.0.bb => python3-more-itertools_10.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.1.0.bb => python3-more-itertools_10.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
index be2a73c369..fb28c35cbd 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "626c369fa0eb37bac0291bce8259b332fd59ac792fa5497b59837309cd5b114a"
+SRC_URI[sha256sum] = "8fccb480c43d3e99a00087634c06dd02b0d50fbf088b380de5a41a015ec239e1"
 
 inherit pypi python_flit_core ptest
 
-- 
2.34.1


