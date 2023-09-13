Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12A5CA552A
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:39:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7765.1694597980219067224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="111397152"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="111397152"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:39:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DED96D29E8
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:39:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DED5AD620E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:39:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDF13200501A8;
	Wed, 13 Sep 2023 18:39:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.34 -> 3.1.35
Date: Wed, 13 Sep 2023 17:39:09 +0800
Message-Id: <1694597949-21747-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--2.687800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytM+b8yxBqvA6B8
	tGwEqygaekTbGFZcpAocG6dIciYEQhLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7v0LMVKXbDRXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7D5U
	g41liakeys/CKTb4MZD/rEphywSMxjfB55Jxx3BFj6HZOKkcJsuXezpJCdpMEqCCrxbIUa/vtRh
	8H02L1yS3fe2NERSwSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187572

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix Windows environment variable upcasing bug
-Added test for PR #1645 submodule path
-Tests fail due to security vulnerability fix in git 2.38.1 acknowledged
-3.1.30 & 3.1.31: failing tests acknowledged help wanted
-Only make config more permissive in tests that need it
-Fix CVE-2023-41040
-Fix 'Tree' object has no attribute '_name' when submodule path is normal path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.34.bb => python3-git_3.1.35.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.34.bb => python3-git_3.1.35.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.34.bb b/meta/recipes-devtools/python/python3-git_3.1.35.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.34.bb
rename to meta/recipes-devtools/python/python3-git_3.1.35.bb
index 308c787c2d..9b2e36d5af 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.34.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.35.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "85f7d365d1f6bf677ae51039c1ef67ca59091c7ebd5a3509aa399d4eda02d6dd"
+SRC_URI[sha256sum] = "9cbefbd1789a5fe9bcf621bb34d3f441f3a90c8461d377f84eda73e721d9b06b"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


