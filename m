Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C132CC3DA4A
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.18208.1741079374328368469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eFp7dQ2l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079375; x=1772615375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vUWN4PBBZkY7Mlh+5ykV69vQX+VTTvyJ661j39TDBBQ=;
  b=eFp7dQ2lVHI2fSAohld/v+i+CswIrAy+U+Koek65XfubGFDQYGU4lcB9
   xGRkcQa5W3xlm8NwF2xWi6iRYDkSfAx6ryBgW+IYDpJHTXNTqQkF3ON1j
   CgRZ5LcVJfi+pMuYvZ7XDmNyncSu3BSNqqyKxHIiZtsdNR7Cilca7tGph
   KjqsvhpEi5Zwp2Ell19lkjf09/8N3bDIUTDUL3e9DhxpSKhBN+hQI8k87
   5Z0ywMqE84AlRuZwHvkWx1ekg1bpBOizc/RyRJ9rR900+GPNvcQ3UdAyR
   IutVEC9FyZVeIeckKMHjvmztkYvWX/vqjqa8IgqfQBmezhUc9PgXn9eRS
   w==;
X-CSE-ConnectionGUID: jFVfCQw6RJWuKgfsy3FDlg==
X-CSE-MsgGUID: /p1ABjASSvu9wnSo9Q7f6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191060467"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191060467"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D945D480A
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D444D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1D5C1A00A1;
	Tue,  4 Mar 2025 17:09:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/31] python3-setuptools: upgrade 75.8.0 -> 75.8.2
Date: Tue,  4 Mar 2025 17:09:08 +0800
Message-Id: <1741079356-13445-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212254

From: Wang Mingyu <wangmy@fujitsu.com>

0001-conditionally-do-not-fetch-code-by-easy_install.patch
refreshed for 75.8.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_75.8.0.bb => python3-setuptools_75.8.2.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_75.8.0.bb => python3-setuptools_75.8.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index f320bf4e6f..83fcb27f2d 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 9441848a121912b6627c7188ab95595684c8306b Mon Sep 17 00:00:00 2001
+From 88df88cfa90281468114efb368bd37213f2b0fb7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -20,10 +20,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 66fe68f..8647c20 100644
+index eb1b4c1..4fd8d14 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -673,6 +673,11 @@ class easy_install(Command):
+@@ -672,6 +672,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps: bool = False) -> Distribution | None:
diff --git a/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
index 02e299d0be..e9e6e9b2b6 100644
--- a/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "c5afc8f407c626b8313a86e10311dd3f661c6cd9c09d4bf8c15c0e11f9f2b0e6"
+SRC_URI[sha256sum] = "4880473a969e5f23f2a2be3646b2dfd84af9028716d398e46192f84bc36900d2"
 
 DEPENDS += "python3"
 
-- 
2.43.0


