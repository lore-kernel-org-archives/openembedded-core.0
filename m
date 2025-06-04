Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DC9C71134
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RzrT6y8V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026743; x=1780562743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jN15J3nIMZTzLVwdUNbU2jgfSZZwaEpAo+bgD5SrbUs=;
  b=RzrT6y8VP9pbVOUJZx/CAQLFRHSx9WYQqIZZBgmaC8zIxIsuGKjoxUzC
   sH3x/Ocf4c8xA/ilmkUK2APnQcpDwPhNbNWZB+1NZ3TM11BUUxY3I0NDc
   08BYOo7uvFLDhBlk7Ztj3cFHoEcgdnqGHXd15+BcBs6DuSCAK60mT6jWH
   tupafnT3jj3kX8M5y1oglhSYBSWhmtMf13qMSs6BDKKRdzd0CKXu+ve4s
   UJ5Atjga8wX8+cd7RUOPDOTtoNewf99D0t+aEXQ+bqT94HJFTSyY668XM
   nTD8BNA0QTY3yLW5Um+mXWeVvGB1K6HzZtm8F3uKI3XH7tFy3p4SJvxvt
   w==;
X-CSE-ConnectionGUID: AU9+XOwLRo6QAQmL9Ky6pw==
X-CSE-MsgGUID: JebUPx71RxKNnNUzdfMCkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182746"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182746"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A6B9D4C2B
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F0DFFD746A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:38 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1C241A0078;
	Wed,  4 Jun 2025 16:45:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/45] meson: upgrade 1.8.0 -> 1.8.1
Date: Wed,  4 Jun 2025 16:45:08 +0800
Message-ID: <20250604084524.864-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217876

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-CPU-family-warnings-fatal.patch
0001-python-module-do-not-manipulate-the-environment-when.patch
refreshed for 1.8.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 6 +++---
 ...on-module-do-not-manipulate-the-environment-when.patch | 8 ++++----
 .../meson/{meson_1.8.0.bb => meson_1.8.1.bb}              | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.8.0.bb => meson_1.8.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index b5d0546967..98ca08c2ca 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From a503c007d3db87acf711d110c01e11c2d087f99c Mon Sep 17 00:00:00 2001
+From c01e5e29953e0302988f2d60adc50ebfa0e5d670 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 43fad0c..27be871 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index f322cda..53a0ac0 100644
+index 2a9cf16..6b2bd6b 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -429,10 +429,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -436,10 +436,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 85a93c8e7a..f654447013 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 859711f99ea9b183a1dffb9b97de09ad0fe9803b Mon Sep 17 00:00:00 2001
+From 6c3734f533ee7ad493188c8fc17bb1c65b65f0bd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 3dab31c..b9307fc 100644
+index ab040b5..a34b271 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -410,9 +410,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -412,9 +412,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -25,7 +25,7 @@ index 3dab31c..b9307fc 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -421,8 +418,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -423,8 +420,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson_1.8.0.bb b/meta/recipes-devtools/meson/meson_1.8.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.0.bb
rename to meta/recipes-devtools/meson/meson_1.8.1.bb
index 78e0a0ed80..af4bc9fecd 100644
--- a/meta/recipes-devtools/meson/meson_1.8.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "0a9b23311271519bd03dca12d7d8b0eab582c3a2c5da433d465b6e519dc88e2f"
+SRC_URI[sha256sum] = "b4e3b80e8fa633555abf447a95a700aba1585419467b2710d5e5bf88df0a7011"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0


