Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086CECD1284
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.7940.1711413458363001447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TZXXaw1q;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413458; x=1742949458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LfBV8gVx81PU6Pxb4N2Afe8pJ8o2jOr+eQKPAQGUoko=;
  b=TZXXaw1qWwkxKzXMwzgVtdtKF09qwTXEX4NKaBJnB0jlIAVQKKb4/Jfr
   4wrRoSLbu1kbsVu1rb/GfH3CamaFEfwznnybQXvkG8avDS8fa1LtK+XmC
   BtWAHvRNAwCnxsTdyyZMg/g6KjSYD4xvCnxht0nrd2DSTZAz2xnyr4nb0
   j0vxnbRnjHEdrz4IT6ackzcW9YDHx0gRQ9Du1OhrWsZFpr3M9J/Nrg7p+
   OYkvmfkr1vajNRDwgLkbGO4ecrjUhm825795IJDew7G3PqyHFH9vnCIpW
   6sLgEKfqT82gnnU6iu3eBjMLhT/sxNA2oxERjd2LLvkEMCAcXVMOkB8If
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132127825"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132127825"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:36 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AD01D4804
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97923D5D1B
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DFBF411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF0B81A006A;
	Tue, 26 Mar 2024 08:37:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 21/34] python3-license-expression: upgrade 30.2.0 -> 30.3.0
Date: Tue, 26 Mar 2024 08:34:39 +0800
Message-Id: <1711413292-3025-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--1.755200-10.000000
X-TMASE-MatchedRID: KH0UlMEvP5MFWIzFaWZsv31zro62qhdCcDzcoONn/M6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4dhF
	dMmEgTe1HMN742UtgxmRU2U31Qn1slShFTwuwIfPnNVJ7z8SbXjSDO4M0w9nCUwjBfO26TBse5x
	2TP9NIvgZHiYA4zBraCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197511

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Use latest skeleton
-Update license list to latest ScanCode and SPDX 3.23
-Drop support for Python 3.7
-Release prep v30.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.2.0.bb => python3-license-expression_30.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.2.0.bb => python3-license-expression_30.3.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
index 7059cf76ee..f36336b592 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "599928edd995c43fc335e0af342076144dc71cb858afa1ed9c1c30c4e81794f5"
+SRC_URI[sha256sum] = "1295406f736b4f395ff069aec1cebfad53c0fcb3cf57df0f5ec58fc7b905aea5"
 
 inherit pypi ptest python_setuptools_build_meta
 
-- 
2.34.1


