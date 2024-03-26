Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B369FCD1280
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7881.1711413457301266588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NkIuwNOs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413462; x=1742949462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XhsVw+3alSpb/WsYu2DF2hZ1tlpjK1f9xXT/46mz0sQ=;
  b=NkIuwNOsFTp7CB1wFVDOvBFenwCSvHMg7zRVw7miwx/we5xlZCLIfuOw
   h2A0u10tWi+u6D5YgMPuVcABiRWILZ9n65gsgecyljaW2Mj407O4EdO/c
   jB1YQpBAAWD25tUuDxyUcG0hhMRRAB2B8GTVi3uFjavhTFK1czORHMcj2
   8j/EM7tYvW2tcsSevtivH7P3e0E4lLOqn22TqLNYihnojZ+hq3PMpYk2l
   bCPZx2ZVnOjybeTkWu3mcBdDwS2/mF/24B6dCZfMrTlVnZcxaz0ODrKcr
   sM2jIEPBEyQeodgwSpv7X5EaiNPlxcOPQXCpxse+amti1w0VDgsvEfv/i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="155200325"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="155200325"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:40 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42E76E0AA5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75959D949D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E906411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ABC3E1A006D;
	Tue, 26 Mar 2024 08:37:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 27/34] python3-setuptools: upgrade 69.1.1 -> 69.2.0
Date: Tue, 26 Mar 2024 08:34:45 +0800
Message-Id: <1711413292-3025-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--2.023200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yTo39wOA02LhZmzTxEWv4NsjG1murPz/2Ctw
	uFOs6nVl06x9Kpu1VRUO2BpaBXjBDha79mAscGMWA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYrVnVnu9zwYNJsWlerhlF9WzRPQ8T4oe5a4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2xx4cAk6VDi1s8jwbDuya2uSxPs9vKMaDdMbCgTk1TeaapC
	dgxHYk07QT5AcEgl2vJEA163YeVhNwGN8LaZ6JvI+N4QTK+H/YdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197515

From: Wang Mingyu <wangmy@fujitsu.com>

0001-conditionally-do-not-fetch-code-by-easy_install.patch
refreshed for 69.2.0

Changelog:
==========
-Explicitly use encoding="locale" for .pth files whenever possible, to reduce
 EncodingWarnings. This avoid errors with UTF-8
-Clarify some Package Discovery and Resource Access using pkg_resources methods
 return bytes, not str. Also return an empty bytes in EmptyProvider._get
-Return an empty list by default in pkg_resources.ResourceManager.cleanup_resources
-Made pkg_resoursces.NullProvider's has_metadata and metadata_isdir methods
 return actual booleans like all other Providers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_69.1.1.bb => python3-setuptools_69.2.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.1.1.bb => python3-setuptools_69.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 2a3c71fb62..e227c2889c 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 40648dfa770f9f7b9b9efa501c9ef7af96be9f2d Mon Sep 17 00:00:00 2001
+From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 5d6fd5c..377e575 100644
+index 858fb20..62bd853 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -676,6 +676,11 @@ class easy_install(Command):
+@@ -672,6 +672,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_69.2.0.bb
index 77d4e0aa03..897398afc5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
+SRC_URI[sha256sum] = "0ff4183f8f42cd8fa3acea16c45205521a4ef28f73c6391d8a25e92893134f2e"
 
 DEPENDS += "python3"
 
-- 
2.34.1


