Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904A1C61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:03:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15193.1700643795687975356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140024642"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140024642"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:03:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AFB8D66DD
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:03:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DD9ADA23E
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:03:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AFE120079123;
	Wed, 22 Nov 2023 18:03:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] log4cplus: upgrade 2.1.0 -> 2.1.1
Date: Wed, 22 Nov 2023 17:01:56 +0800
Message-Id: <1700643716-9595-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.006
X-TMASE-Result: 10-3.373100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzIFck3f6fvyGf0
	psGams1saV5RRANvkG5WQYoAtT7byj13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW4Em8Adulyv5Q1UuEJlsPFUXSJ4c3nT+QcrT6V6InEuV7Fk511UyURnAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUXLnAlBPmXQWbt538++hO5k/o0
	zXktMnLZX++9D/VU9d8t6xFQ1yZ0mt8OezVtA/Sh8ZH77EUpACyz4Huw8M6jAPWBYyALXXp7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191032

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add missing source files to MSVC project files.
-Resolve environment variables in include directive in configuration file. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../log4cplus/{log4cplus_2.1.0.bb => log4cplus_2.1.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.1.0.bb => log4cplus_2.1.1.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
index e0c16d2e73..be3c787ab2 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "2a8eb99d71b0680c0520c7c16248cdb4195da82f396b79fea30b0d9e289c8c72"
+SRC_URI[sha256sum] = "42dc435928917fd2f847046c4a0c6086b2af23664d198c7fc1b982c0bfe600c1"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.34.1


