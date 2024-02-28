Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4731FC54E67
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8420.1709105611380585283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R1LWclJj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105621; x=1740641621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zN96DDpB0XvPHJ/EghuL8iDz1BW9YU65hq0MZdXw2TU=;
  b=R1LWclJjMegkvMVapxJUm/nWRQanhhlrggnaGe3iRkL5VdfPqw6KQnPR
   YLC0/kZMr3BxBHeisAQ5m1+pporACaQ4mln4zGZmVLfesumhVF5fPY0zq
   u1NGZxDNicFFLfBeqDz75YsgWLClYkx81xQSoU50c3kXvDtVvq3GVGotj
   ONT/qmHIVa4JwvDIn1tzkKsnMJVh0jGu4jkQ+K6zpp+Kru1kpSlGvMPJz
   eUM28WDqdQtpVEgqlpU7en0WFcd3VVAAFUR3Voqw+TXCc/7J4GweYctKa
   Bkgc0BWIEqJBINjC1TkSCCpnrdeZgUr7NqitTRipeHHdybeNCOhUDvUjP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150945784"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150945784"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:39 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF1E2E8CD7
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DFC6D7B7A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9411041180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42AB61A006A;
	Wed, 28 Feb 2024 15:33:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/48] python3-setuptools: upgrade 69.0.3 -> 69.1.1
Date: Wed, 28 Feb 2024 15:32:46 +0800
Message-Id: <1709105575-24259-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--4.771000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yTo39wOA02LhpxAd6mi1Ga0gXZ/oRFIT4W8q
	nFk+BWUX1wEDP8XPkQSe6V/Q38YAYGdR1HJpsaceaDCzqDR7DPas4IQYg+G3CJjmdWmKHGLD/hB
	H/uhQMnLgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjtXl9IxEPXOorwt
	+LBYpjI4i4DWKFrRIOMIGZaAf0wbGtYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMObrTHuGp7o0lOEhtf2NXOLyMtZZUyUZkBCKowdCMrczqh7PxtH0Cc5u/YjbxVIlZcH+CX
	HimFpw9nAIT2S8hbQDBxlj+grLl7gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196363

From: Wang Mingyu <wangmy@fujitsu.com>

0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
0001-conditionally-do-not-fetch-code-by-easy_install.patch
refreshed for 69.1.1

Changelog:
==========
-Updated and removed obsolete Python < 3.8 code and comments.
-Updated Package Discovery and Resource Access using pkg_resources to use stdlib
 importlib.machinery instead of importlib_machinery
-In tests, rely on pytest-home for reusable fixture.
-Explicitely marked as Protocol and fixed missing self argument in interfaces
 pkg_resources.IMetadataProvider and pkg_resources.IResourceProvider
-Restored expectation that egg-link files would be named with dash separators
 for compatibility with pip prior to version 24.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...stutils-sysconfig.py-make-it-possible-to-substite.patch | 3 +--
 ...1-conditionally-do-not-fetch-code-by-easy_install.patch | 7 +++----
 ...3-setuptools_69.0.3.bb => python3-setuptools_69.1.1.bb} | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.0.3.bb => python3-setuptools_69.1.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 7cafde4d5d..fc0631ffd2 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From bfa655d63e79ba5a75441604ca14a70800794189 Mon Sep 17 00:00:00 2001
+From 85e65daf5e3ce4741e3653dc8912dc7555f84e78 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -15,7 +15,6 @@ would happen to this module in light of distutils deprecation.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  setuptools/_distutils/sysconfig.py | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 9b17dba178..71bb77227c 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 519e2845014f04b4c23b5cf8f92fc4e5dcf40f20 Mon Sep 17 00:00:00 2001
+From 6fe7afb3fd1612325f6dde94738adacc5d8d7659 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,16 +9,15 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 8ba4f09..8ea40c5 100644
+index cc0c409..948bcf2 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -676,6 +676,11 @@ class easy_install(Command):
+@@ -671,6 +671,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
rename to meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 715c89338f..77d4e0aa03 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78"
+SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
 
 DEPENDS += "python3"
 
-- 
2.34.1


