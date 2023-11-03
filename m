Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA19AC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:32:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.38421.1698996746350350814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138464020"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138464020"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:32:24 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 480CCD9D8F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:32:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B54ED88D8
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:32:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DB616BF4C;
	Fri,  3 Nov 2023 16:32:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.37 -> 3.1.40
Date: Fri,  3 Nov 2023 15:29:55 +0800
Message-Id: <1698996595-30813-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--7.997300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyNiKnsxFZrQHnv
	qbLkjGO6uUxcEq68iwPWUNVwlJwtjK+CQswOit7PCtzGvPCy/m7ai5i4sxSsjsj0QMA/92m2PLl
	DsnOgiHf+cXSCo26LfOXbZzu8Xg2bSCwqqqLJxbXZTwWjL067hsWaYx0jCOsOak4/nFu+TiD4UX
	4QTnNCnrwFpxLtsr4zPb1HNPK8sDrtWteqKqfAdfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkATn2
	mTiRxzlsX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+zcfwzuKfISWkfbDrvAzKS3UxNL
	aSnvhGsF4ClrsSRsGi6SNc0muFKr
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190126

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Add missing info in Submodule.remove docstring
Have init script clone submodules unconditionally
Add missing assert keywords
Make clear every test's status in every CI run
Fix new link to license in readme
Drop unneeded flake8 suppressions
Update instructions and test helpers for git-daemon
Fix Git.execute shell use and reporting bugs
No longer allow CI to select a prerelease for 3.12
Clarify Git.execute and Popen arguments
Ask git where its daemon is and use that
Fix bugs affecting exception wrapping in rmtree callback
Fix dynamically-set all variable
Fix small #1662 regression due to #1659
Drop obsolete info on yanking from security policy
Have Dependabot offer submodule updates
Bump git/ext/gitdb from 49c3178 to 8ec2390
Bump git/ext/gitdb from 8ec2390 to 6a22706
Update readme for milestone-less releasing
Run Cygwin CI workflow commands in login shells

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.37.bb => python3-git_3.1.40.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.37.bb => python3-git_3.1.40.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.37.bb b/meta/recipes-devtools/python/python3-git_3.1.40.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.37.bb
rename to meta/recipes-devtools/python/python3-git_3.1.40.bb
index 56a335a79e..47aa7f09ac 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.37.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.40.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
+SRC_URI[sha256sum] = "22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


