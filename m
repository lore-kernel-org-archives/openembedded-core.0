Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E0CC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:21:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.73887.1705310472799262843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146154029"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146154029"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:21:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48304D4F5A
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:21:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 85FFDD3F04
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:21:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 168D8202CCD2B
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:21:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B09D81A015F;
	Mon, 15 Jan 2024 17:21:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-jinja2: upgrade 3.1.2 -> 3.1.3
Date: Mon, 15 Jan 2024 17:20:15 +0800
Message-Id: <1705310415-24524-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-3.901400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytGQgIVrmBL5DBC
	Awy9Ft7J3MsLjm46NZz4IS0j/HVkZu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1KEfeQTpODV8eBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZL5Bv83+mlrTT05ICYBfeLIy30V4QPdB1CeUEtff8vim3Pc9
	h1yoKTNIM068r8cY/7eyyOVWsAwgaRMUutON7iNrV6vSMljyH9Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193656

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix compiler error when checking if required blocks in parent templates are empty.
-xmlattr filter does not allow keys with spaces.
-Make error messages stemming from invalid nesting of {% trans %} blocks more helpful

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
index fa6d930a9c..18057809c8 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
+SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.34.1


