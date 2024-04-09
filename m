Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20400CD12A6
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.130859.1712646652159327498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ll8VP1M7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646652; x=1744182652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ccqUZjsaSwrQeJDQzBPfOSV2OlDSgdzknlpYL1mIWzw=;
  b=ll8VP1M7upxWHHf0tJ2wx/HQKixrRfEuv3/3EyLudGCvXjJmDAAo9/oC
   /9Gj+Du+we0XnfD6/GyBkP0XfONiat72Iq+2JxAWAjdJpmLS0gABN9tSP
   AMR4LUMfvAw7PO8Ot93BGrt3u1TVJthly0tKBqhlOraHRreKmQBqu6lhx
   Kn8lBNt5UAuq2h0vR4+91NbV25FrHotg8XCp50iLNVwuC6sYYK7rNmOlT
   ayHTgKAm8hDjUoIDfGoDcq1bc9OhPBykIqQ1XE16h6MHH71ZQuS9ZRVSF
   kLQXUggLVFiQUQhLNO4r7YlwYfO2ps9kYOGJpehzszlfuS74WNEFr0v4Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="134320644"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="134320644"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 68D342A1C3B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A9E6CD12DD
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E6D720093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E16CD1A0002;
	Tue,  9 Apr 2024 15:10:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/33] python3-git: upgrade 3.1.42 -> 3.1.43
Date: Tue,  9 Apr 2024 15:10:13 +0800
Message-Id: <1712646620-16608-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--1.098400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mryqyllX6UJItM+b8yxBqvA3Tv
	92h/oRdl1jypNY0wtab6XlaQTkk4xxBAYzpZxAP8MgcjIsJOvt7zvNxVvAWejZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt2ZI9St7a/zq9tQkN6wV666ZydSrN7pP0BSF2IA0RKlfWhaJJz3Ju8Xopo
	oAqOOOeduAj2XtF8MKjchCbb6N4Hrz1/LpGWme3HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198043

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Issue and test deprecation warnings
-Fix version_info cache invalidation, typing, parsing, and serialization
-Document manual refresh path treatment
-Improve static typing and docstrings related to git object types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.42.bb => python3-git_3.1.43.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.42.bb => python3-git_3.1.43.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.42.bb
rename to meta/recipes-devtools/python/python3-git_3.1.43.bb
index 19885a58c7..45c988117b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
+SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.34.1


