Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4353C05051
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4250.1689585046790070710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124256820"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124256820"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DF0BCA1E4
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D660D5B45
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B00B2FC86AA;
	Mon, 17 Jul 2023 18:10:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.15.0 -> 3.16.2
Date: Mon, 17 Jul 2023 17:10:14 +0800
Message-Id: <1689585025-23731-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-2.226900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yRIRh9wkXSlFoNYsx0VGh/UH4DTIEE89jOMb
	uVzdyYYaneKcrLeiIMPy8CgcvMUqjyx8gAeFAQ+BA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLL/fdNahJQfo7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3AOYBgO8VzZFLIpRhBLGcyHvB4cIAmtMqlAm+pJnR9L7/OA
	9DfBVydkCBVQQ8DT9XOINgFVs821cOkyO5KEw6dlRT3LnXowIwdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184444

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Remove unnecessary and incorrect copyright notice.

Changelog:
============
Bugfixes
---------
-In Path.match, Windows path separators are no longer honored. The fact that
 they were was incidental and never supported. (#92)
-Fixed name/suffix/suffixes/stem operations when no filename is present and
 the Path is not at the root of the zipfile. (#96)
-Reworked glob utilizing the namelist directly. (#101)
-Replaced the fnmatch.translate with a fresh glob-to-regex translator for more
 correct matching behavior. (#98)

Features
----------
    Require Python 3.8 or later.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.15.0.bb => python3-zipp_3.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.15.0.bb => python3-zipp_3.16.2.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb b/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-zipp_3.15.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.16.2.bb
index 45654ff6f1..9dff59ffaf 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "112929ad649da941c23de50f356a2b5570c954b65150642bccdd66bf194d224b"
+SRC_URI[sha256sum] = "ebc15946aa78bd63458992fc81ec3b6f7b1e92d51c35e6de1c3804e73b799147"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


