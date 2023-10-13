Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FA0CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:02:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.34369.1697187746181012624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="137480333"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="137480333"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:02:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0CC0CD6E3
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:02:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36758D968E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:02:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7686C20050192;
	Fri, 13 Oct 2023 18:02:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.36 -> 3.1.37
Date: Fri, 13 Oct 2023 17:02:00 +0800
Message-Id: <1697187720-4402-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--0.514000-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yRIRh9wkXSlFpxAd6mi1Ga2AI7Mvq/sL5y4X
	epmu1hPLWX/b7eE68AiPbKzOPDQ+aTMuI1Y2xbgzbb4JyMK+kzAbbhhV65kaY69HqKgFlQDKli+
	BaqMwTNrW8jT0Tj+HBLywRGST/SIKgYJEozq8lXVSAphtkUXoaH83UQpos0eS9zBz5fVJTYYEBU
	y515u8mOArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtmHKpjHFOy3QQ6xt
	0NTyE+opyZRx/nMA04ojn9TQ5wiPuVHGbcDbAq6FEUknJ/kEl7+VmoNXJ/8FPc8OJc7+0VJjocz
	muoPCq0QxjoSuMokQtVGQONiwsGpH+I0FnbuL840bCSqLZbkbEpgae7/r8B4Cwg2FhipMrRxLzw
	VOtL/N1qQ4IF9RfugpuD8fTwqvJ4dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYwC
	lu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189043

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: remove excess whitespace

Changelog:
==========
-Improve Python version and OS compatibility, fixing deprecations
-Better document env_case test/fixture and cwd
-Remove spurious executable permissions
-Fix up checks in Makefile and make them portable
-Fix URLs that were redirecting to another license
-Assorted small fixes/improvements to root dir docs
-Use venv instead of virtualenv in test_installation
-Omit py_modules in setup
-Don't track code coverage temporary files
-Configure tox
-Format tests with black and auto-exclude untracked paths
-Upgrade and broaden flake8, fixing style problems and bugs
-Fix rollback bug in SymbolicReference.set_reference
-Remove @NoEffect annotations
-Add more checks for the validity of refnames

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.36.bb => python3-git_3.1.37.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.36.bb => python3-git_3.1.37.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.36.bb b/meta/recipes-devtools/python/python3-git_3.1.37.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-git_3.1.36.bb
rename to meta/recipes-devtools/python/python3-git_3.1.37.bb
index ab1b0f2353..56a335a79e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.36.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.37.bb
@@ -6,13 +6,13 @@ access with big-files support."
 HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4bb0c2a6995e85064140d31a33289aa5dce80133a23d36fcd372d716c54d3ebf"
+SRC_URI[sha256sum] = "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


