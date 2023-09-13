Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E715FCA552E
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:41:53 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7802.1694598105440278324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="131981765"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="131981765"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:41:42 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 470E6CD7E2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:41:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 769BBD620E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:41:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 63A7570B10;
	Wed, 13 Sep 2023 18:41:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.4.1 -> 7.4.2
Date: Wed, 13 Sep 2023 17:41:06 +0800
Message-Id: <1694598066-21876-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10-0.862900-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFokyC
	7/z+TOC3SUQWNWP9oCzXBENcZr/92UAhvNB5B6uKx9U+7HnM1TODnmblFLAswl4a0aNSuN1VJV5
	8NUakn3AQVF+RdRwAmcZVoMGhOufGDjTsktSvAHI2oY2TxKHZF9X7h8zsQ6S4lPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDdfeP+V/VXwsn5nfR7I2dFMGiFdFNUvODwanR
	UYx3SG4WyXEB937q1d5OPD8XJFfpB8TzIzimOwPur1QVFMnSQrEQdG7H66TyHEqm8QYBtMOLhgm
	65YT+lRD7zcuAJPX+NlvgysVhua3QXSBfxZdZr8rjGmPOohkPNAHeRdGGXDjEBf5rH0gcYfdwEX
	sEAv6ulqocY88K0K3gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187575

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========

Bug Fixes
----------
-Fix doctest collection of functools.cached_property objects.
-Fixed bug using --importmode=importlib which would cause package __init__.py
 files to be imported more than once in some cases.
-Fixed bug where user_properties where not being saved in the JUnit XML file
 if a fixture failed during teardown.
-Fixed crash when parsing long command line arguments that might be interpreted
 as files.

Improved Documentation
----------------------
-Improved disclaimer on pytest plugin reference page to better indicate this is
 an automated, non-curated listing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.4.1.bb => python3-pytest_7.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.1.bb => python3-pytest_7.4.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.1.bb b/meta/recipes-devtools/python/python3-pytest_7.4.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.4.2.bb
index e9ded985cb..710aa51716 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.4.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "2f2301e797521b23e4d2585a0a3d7b5e50fdddaaf7e7d6773ea26ddb17c213ab"
+SRC_URI[sha256sum] = "a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


