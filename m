Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3837C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:20:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.24506.1704180029397301788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="133448522"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="133448522"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:20:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AA54D6189
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:20:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B7A73D9681
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:20:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3960D2008E696
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:20:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA8E91A0070;
	Tue,  2 Jan 2024 15:20:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] meson: upgrade 1.3.0 -> 1.3.1
Date: Tue,  2 Jan 2024 15:20:08 +0800
Message-Id: <1704180008-8420-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--7.693400-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yWQYj6+BFPEw2I8NUKi360YPdZmyx8xAa2ZY
	/RdXrUKNhgSBV7oGS48SuJRtSU84o39JXYBaBfzu/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2g3t
	R/CCSnu4DCvV3UwP6eJRBa3u5J+EMmN+8M+MuN+iU6d4lyugDFI02EUfj36OoaHvr9sOkYSs0F0
	5EjNwjhlM61RJhww1RgNg+EAaq9DlO8fMZwaqIgp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkjOFoRUysMuWcXhjjr/OWOEB2VASMlJzvOO0b/Ehj4lt+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193208

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-CPU-family-warnings-fatal.patch
0001-python-module-do-not-manipulate-the-environment-when.patch
0002-Support-building-allarch-recipes-again.patch
refreshed for 1.3.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch  | 10 +++++-----
 ...dule-do-not-manipulate-the-environment-when.patch |  8 ++++----
 ...0002-Support-building-allarch-recipes-again.patch | 12 +++++-------
 .../meson/{meson_1.3.0.bb => meson_1.3.1.bb}         |  2 +-
 4 files changed, 15 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.3.0.bb => meson_1.3.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 8fbcb5a0a2..8ea7c35950 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From fcd3260c03f313676720e6219c5953d412fb0a2c Mon Sep 17 00:00:00 2001
+From b77cbe67df5fa0998946503f207c256ee740bb5f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 7e0c567..a180065 100644
+index 07f1229..a35c356 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -284,8 +284,8 @@ class MachineInfo(HoldableObject):
+@@ -285,8 +285,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -27,10 +27,10 @@ index 7e0c567..a180065 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index e212c7a..9d2bff3 100644
+index 2ba2054..d798e3b 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -345,10 +345,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -359,10 +359,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 19502fa9cd..2e0a4b1bbe 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From a97dba12cff6c4c9181909141a1a9f38d7c900bf Mon Sep 17 00:00:00 2001
+From e85683698aa3556bf14fc6d35f2c067f16af520b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 14386f9..118a15f 100644
+index 9aea6bd..8c13ede 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -354,9 +354,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -380,9 +380,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -25,7 +25,7 @@ index 14386f9..118a15f 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -365,8 +362,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -391,8 +388,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index dcc1ce9c27..a8396f30bb 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,21 +1,22 @@
-From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00 2001
+From 6fb8db54929b40e1fd7ac949ef44f0d37df0bae9 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
-Subject: [PATCH 2/2] Support building allarch recipes again
+Subject: [PATCH] Support building allarch recipes again
 
 This registers "allarch" as a known CPU family.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
 ---
  mesonbuild/envconfig.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 4d58c91..ff01ad1 100644
+index a35c356..436355f 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -36,6 +36,7 @@ from pathlib import Path
+@@ -38,6 +38,7 @@ from pathlib import Path
  
  
  known_cpu_families = (
@@ -23,6 +24,3 @@ index 4d58c91..ff01ad1 100644
      'aarch64',
      'alpha',
      'arc',
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/meson/meson_1.3.0.bb b/meta/recipes-devtools/meson/meson_1.3.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.3.0.bb
rename to meta/recipes-devtools/meson/meson_1.3.1.bb
index e794bb28a5..3a4bb14f09 100644
--- a/meta/recipes-devtools/meson/meson_1.3.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "4ba253ef60e454e23234696119cbafa082a0aead0bd3bbf6991295054795f5dc"
+SRC_URI[sha256sum] = "6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.34.1


