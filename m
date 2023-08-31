Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36582C83F25
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:51:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8768.1693450278454312064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109550075"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109550075"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:51:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 081EDF0763
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:51:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C6DCBF4BA
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:51:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B51A62007471D;
	Thu, 31 Aug 2023 11:51:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 68.1.0 -> 68.1.2
Date: Thu, 31 Aug 2023 10:47:06 +0800
Message-Id: <1693450026-28398-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--6.374800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yTo39wOA02LhKQNhMboqZlq/KKbZKt0GTqTz
	q4wH3yI2OuzeNmOGKnPZ5nzC46YpxYgrKnsJ1GRgP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7rCDPw9MoAWPSukMc7yu8PunaUukMXEFuzRPQ8T4oe5QM1pfahlvmagW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3b7X7pTyigpK10SwVIJUJ3ywUsrnm1iAHexyv94cfYg8E0v
	lt97QyH
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186952

From: Wang Mingyu <wangmy@fujitsu.com>

0001-conditionally-do-not-fetch-code-by-easy_install.patch
refreshed for new version.

Changelog:
-Fix editable install finder handling of nested packages, by only handling 1
 level of nesting and relying on importlib.machinery to find the remaining
 modules based on the parent package path. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nditionally-do-not-fetch-code-by-easy_install.patch | 10 ++++------
 ...tuptools_68.1.0.bb => python3-setuptools_68.1.2.bb} |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.1.0.bb => python3-setuptools_68.1.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 1e5ab498a4..84a9492caf 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 5e603da9c01ccb828a03ea3e82d15599971f794f Mon Sep 17 00:00:00 2001
+From c90cc4a07ce6d2b7128e37d811d0c6bbc4b905a6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,15 +9,16 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 0b8d1159..93308060 100644
+index 8ba4f09..8ea40c5 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -644,6 +644,11 @@ class easy_install(Command):
+@@ -676,6 +676,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
@@ -29,6 +30,3 @@ index 0b8d1159..93308060 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
index e04cd1dcd0..a1e84b635c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "d59c97e7b774979a5ccb96388efc9eb65518004537e85d52e81eaee89ab6dd91"
+SRC_URI[sha256sum] = "3d4dfa6d95f1b101d695a6160a7626e15583af71a5f52176efa5d39a054d475d"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


