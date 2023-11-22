Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92498C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:05:16 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.15312.1700643911650146990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119947150"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119947150"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:05:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 972FDDCFC0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:05:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C150ABF4E3
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:05:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E26B8717C;
	Wed, 22 Nov 2023 18:05:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 68.2.2 -> 69.0.2
Date: Wed, 22 Nov 2023 17:04:25 +0800
Message-Id: <1700643865-9708-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--2.318300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrGraPJX0cmS3DZ+9HI5nLbGJj
	g9GXn3itXGvPgv7i4g/1pWb8k2Nlla2ND3M9bd0qecskYZl7mzCgF7yh6oLPs5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2zRPQ8T4oe5ZSlv/9klkDigW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2oZob+yYTEZNmZcDROBMd2ZOFPGSj68rxtmsUmjkXooHAyh
	8Nqi8sGyXKfRcQl22k2F4znaNtTmBHNqT7AzWPM6YWIsG0rOfkdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Added missing estimated date for removing setuptools.dep_util
-Fixed imports of setuptools.dep_util.newer_group. A deprecation warning is
 issued instead of a hard failure.
-Include type information (py.typed, *.pyi) by default
-Exported distutils.dep_util and setuptools.dep_util through setuptools.modified
-Merged with pypa/distutils@7a04cbda0fc714.
-Replaced hardcoded numeric values with dis.opmap, fixing problem with 3.13.0a1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_68.2.2.bb => python3-setuptools_69.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.2.2.bb => python3-setuptools_69.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb b/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_69.0.2.bb
index 06957d7000..8093ab9ba8 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.0.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87"
+SRC_URI[sha256sum] = "735896e78a4742605974de002ac60562d286fa8051a7e2299445e8e8fbb01aa6"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


