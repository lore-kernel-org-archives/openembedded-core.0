Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7719C71133
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.11660.1749026746197751398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DJGgdN/G;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026747; x=1780562747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=azUUb91TkFZ25JzXz9TUNSADWynb3VYozCWM+i9CAJ4=;
  b=DJGgdN/G5xXuIsLNHj91FdTeXOQiMNe/CT6ectty7XXfnLrZQM6HMYk+
   FIst/fBN1pgsaXQ60hLZvdO9v+Vuu1t8lBVGnqtesce98TxXSgob8cemA
   g+J2gxcsMSDlRLnFcBTzZ94uyKWs1rvCehHT6xU7KXQsUK6lT/DXUs9S1
   l9pK8AIiyepPMyyO7NVMXfj/gcXXTxv0qVIDiKgorboYmMdpFHxntt6L5
   moAaB+vCjT9ESTKW0wjsqB2Fhqh7RtYTcEvttvzNe7N8+k+IJCCd2FhS2
   ClyWipdOW2TtHDOVCyCIeMRu3OQ2APLSvSU26CP0ZhweMxFsW0/JztOox
   w==;
X-CSE-ConnectionGUID: V36MpXg1QAiNAte6ffxAPA==
X-CSE-MsgGUID: tO3OtkdqTcClK7Cnwyj9NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="189666640"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="189666640"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:46 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B7FE0ABE
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69ADAD4C19
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 196A91A0078;
	Wed,  4 Jun 2025 16:45:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/45] python3-setuptools: upgrade 80.8.0 -> 80.9.0
Date: Wed,  4 Jun 2025 16:45:20 +0800
Message-ID: <20250604084524.864-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217888

From: Wang Mingyu <wangmy@fujitsu.com>

0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
refreshed for 80.9.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tutils-sysconfig.py-make-it-possible-to-substite.patch | 8 ++++----
 ...-setuptools_80.8.0.bb => python3-setuptools_80.9.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_80.8.0.bb => python3-setuptools_80.9.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 8ccffeef1d..39153883b0 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From c3d2c40e10f24724ab2e3d5f236823f3076c7aec Mon Sep 17 00:00:00 2001
+From e2eab8c254f16c461de25123f6859b8a18db5cd8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index e5facae..0932f6f 100644
+index 7ddc869..01a06af 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool = False, prefix: str | None = None) -> st
@@ -32,7 +32,7 @@ index e5facae..0932f6f 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name != posix
      os_name = "posix" if is_mingw() else os.name
-@@ -256,7 +258,13 @@ def get_python_lib(
+@@ -246,7 +248,13 @@ def get_python_lib(
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index e5facae..0932f6f 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -271,7 +279,7 @@ def get_python_lib(
+@@ -261,7 +269,7 @@ def get_python_lib(
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_80.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
index 327eff5700..533d8ce3d4 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "49f7af965996f26d43c8ae34539c8d99c5042fbff34302ea151eaa9c207cd257"
+SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
 
 DEPENDS += "python3"
 
-- 
2.43.0


