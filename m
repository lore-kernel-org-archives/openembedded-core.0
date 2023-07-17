Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAF3C00528
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4239.1689585050399384770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124763006"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124763006"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72ED6D4240
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:46 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 65386BF4A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84C762FC860B;
	Mon, 17 Jul 2023 18:10:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.31 -> 3.1.32
Date: Mon, 17 Jul 2023 17:10:19 +0800
Message-Id: <1689585025-23731-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--4.316800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mraZATGA5/BXhs1Ir4NZzFmpGH
	Z85Onc+2mk4WTYuTAYTRUm39DvuQZz13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7v0LMVKXbDRXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7f9I
	b2ggbf9pwNeI2LBIEADIFHet3q8djNPPSLKEIQevSvwMLmz57zKNeOiu5qhLBpL9p25l2lkVE8c
	BYNCSjP5AY1wrG2nw2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184450

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Block insecure non-multi options in clone/clone_from
-Don't rely on __del__
-fix pypi long description
-Name top-level exceptions as private variables
-commit trailers should be a list instead of a dictionary
-Fix up the commit trailers functionality

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.31.bb b/meta/recipes-devtools/python/python3-git_3.1.32.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.31.bb
rename to meta/recipes-devtools/python/python3-git_3.1.32.bb
index 08b9f66bcb..f217577eb8 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.31.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.32.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce3bcf69adfdf7c7d503e78fd3b1c492af782d58893b650adb2ac8912ddd573"
+SRC_URI[sha256sum] = "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd0361b228c3a67a62f6"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


