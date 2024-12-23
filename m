Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25356E7719C
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10446.1734945083259828013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EeljECXu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945083; x=1766481083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YE65bqMKe/HanZBtVFj4Z6g5O6nZvMljJZUvHhDnYMY=;
  b=EeljECXuDT8mD7RW1cWG2ACNA7aOCcwl540lFizDXSxuhepYA98u/zWo
   /qVtatlGGZ5C2mThjDKhaU2XHOnnsFfq3nxUdNLYkpkxZAq88tcXjuxjT
   7YicBsKNS7/7UwTINGQE1BaqQq8igcH/+QBrc7y7fDKMA1GgwJn4Msllw
   tBD4vjauLJEdsEDeXOm4+yd1+8bFu4fD3v6krbSswBXKSq3xS01V21Yt7
   yAI24k8xTPfND3tXjxUwSGnFwycRnrrxWvJ0YPrqbGarE1EkQ0cEC1sUA
   HsQ1aGhBPFc/fir5C2VbcGwZbn2pZ9cG/DQF9jQD2n+QJmJ+n0cuqq3sM
   g==;
X-CSE-ConnectionGUID: mD4np++uRt2INpMXNdCTMg==
X-CSE-MsgGUID: ylkQOvTvR4qYn4TtYTThvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184880555"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184880555"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:20 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 75988D4C44
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47A07D73BE
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9E8620076D2C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FA7C1A0071;
	Mon, 23 Dec 2024 17:11:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/22] meson: upgrade 1.6.0 -> 1.6.1
Date: Mon, 23 Dec 2024 17:10:48 +0800
Message-Id: <1734945065-4373-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--22.564900-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yR1kSRHxj+Z5nJdsOLB4zv79wRnyxuPjhLlW
	JB0VwMeDRRa406V/YwxrRfbE7c2kUYadzrWEfJJMRCKAykn3KrGBs03RHrzjM0z5vzLEGq8DUoJ
	JXv0NurAECycSLz9pMIXhgnMvWe8QvJ+06XVEG4evToW2jJ66NhniLo7qSg5v6Mw4RnkAvRKiif
	Mnl53xwPJkprz9EcS6WKg4NUDTDoE/VXLUB5a3vzzHAJTgtKqwuoYFb0nRiqMXY+gNTubOQHxzN
	O8jNav+1V0ZZg9Z+pN7L4dx4z+0QAorSvYb1VTuNT0Qrj4fxTVMkOX0UoduuWAN6i+va16u0yOP
	Bv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2VUcz8XpiS9Hi1fMiDr/7dehzeYsn44Go0F05
	EjNwjhr0YcZSP3ln0iBG7WL/69SosYUTfBC9ISp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyOk/y0
	w7JiZo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209022

From: Wang Mingyu <wangmy@fujitsu.com>

0001-python-module-do-not-manipulate-the-environment-when.patch
refreshed for 1.6.1

Changelog:
===========
- dependencies: support old vulkan SDK version
- Handle top level options set in subprojects. Closes #13847.
- ci: fix Ubuntu Bionic job
- modernize Rust template
- run_single_test.py: skip setup_symlinks() call on Windows
- tests: HDF5 no longer skips on MacOS
- mdevenv: exec directly into the program to run
- CMakeToolchain: Log output on compiler state failure
- msetup: Correction of the message text
- run_single_test.py: Fix for symlink changes
- libgcrypt-config is no more on ubuntu-rolling
- fix generate_gir with BothLibraries dependency
- env2mfile: add flag to use _FOR_BUILD envvars.
- environment: Never require an exe_wrapper for native builds
- rust: fix computation of library directory
- De-duplicate BuildTarget.sources
- Fix building on AIX when no project languages are used
- coverage.py: Guard use of --html-nested behind version check.
- Xcode backend: only use found appleframeworksn
- Enable GCC to find free-threaded python DLL library
- modules/rust: Add support for autolib field in the Cargo.toml
- env2mfile: Use a cross valac on Debian if possible
- env2mfile: Automatically set exe_wrapper on Debian if possible
- env2mfile: Use Debian cross-prefixed GObject-Introspection tools
- env2mfile: Generalize detection of pkg-config to have a list of tools
- Add GNU/Hurd kernel results

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on-module-do-not-manipulate-the-environment-when.patch | 8 ++++----
 .../meson/{meson_1.6.0.bb => meson_1.6.1.bb}              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.6.0.bb => meson_1.6.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 23f96f4788..84a9c18c51 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 4ff04d388baf9d31efa73a92c0124a8d45b65377 Mon Sep 17 00:00:00 2001
+From f264b7fd2c86edfd5db77da264e8bf05f5e2bfeb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index fff4aaa..1fde2f6 100644
+index 326e605..f5eb50f 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -400,9 +400,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -403,9 +403,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -24,7 +24,7 @@ index fff4aaa..1fde2f6 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -411,8 +408,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -414,8 +411,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson_1.6.0.bb b/meta/recipes-devtools/meson/meson_1.6.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.6.0.bb
rename to meta/recipes-devtools/meson/meson_1.6.1.bb
index 078e49e973..249a07c290 100644
--- a/meta/recipes-devtools/meson/meson_1.6.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.6.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-dependencies-dev-prepend-sysroot-when-searching-for-.patch \
            "
-SRC_URI[sha256sum] = "999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca61139f2eec09d5496"
+SRC_URI[sha256sum] = "1eca49eb6c26d58bbee67fd3337d8ef557c0804e30a6d16bfdf269db997464de"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0


