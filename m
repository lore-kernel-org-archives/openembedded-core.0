Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AABD1170A
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.5575.1729834798493709269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bZRx6AQy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wLE0WHnPGByHTVNiyLIAWD6+1/BzVDBCgYwl3HeDMVs=;
  b=bZRx6AQycFIrazxMRYZYfKtL18V8d7YLSQJdzf4bKOA4rUYIqKrj+m7H
   L0tlsUJPfjYSfEIasfUCr6r2WOR6sqCvZKoFiK7Um7KBf2+YFIo1bE2RD
   58WvPnzxOyeoGOfYqoFEe8Oh8DkPVA+FyUECN5rOsJVKuv6HAfo+uiDqR
   Uj4wHNMCRWd0BmIWcbfweuaZB7M3kKulv/BRZdj6fizuLw+uFSO6XUmDt
   D8r/EpnFlXMweL1zc5u/u/kadwa3op06pK3gCqykYoFpB/jsDeUb64uLc
   dg7FizJaziy5euWf+3Wiza46weQWOBHf8gpAd8Y8E3YYpMO/QV9sh0vzo
   Q==;
X-CSE-ConnectionGUID: wZE3VWB5RPGE2/ISn7UlNg==
X-CSE-MsgGUID: d8phRZYWRni70U5aGWZ/Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="166312872"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="166312872"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CC29E752C
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A90EBF49D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 099CB20071A0D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC69B1A000B;
	Fri, 25 Oct 2024 13:39:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/22] meson: upgrade 1.5.2 -> 1.6.0
Date: Fri, 25 Oct 2024 13:39:19 +0800
Message-Id: <1729834769-4717-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--2.586500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yWQYj6+BFPEw2I8NUKi360YPdZmyx8xAayxX
	wd9S2XGhKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2g3t
	R/CCSnu4mMc/M70VW8u1lP/1FdTRqMcVlkMzMPEnjpxdo/JwVmxzSjqs2IoGK1bSmSk9HUNprYH
	JBlx9pJ6xSVmN1+Aa8gDLqnrRlXrZ8nn9tnqel2OJGF26G8SWybcMfqeX8eudXJd72/BFnIkha3
	nardG6C6bx2gTZRGpZZdkPk5fSUYRK2l+hKpA7jokYIVPVXHVqBq9qvKOe0sl+cV4cOsSf4WSl4
	SRK4qDTsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206320

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-CPU-family-warnings-fatal.patch
0001-python-module-do-not-manipulate-the-environment-when.patch
refreshed for 1.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 6 +++---
 ...on-module-do-not-manipulate-the-environment-when.patch | 8 ++++----
 .../meson/{meson_1.5.2.bb => meson_1.6.0.bb}              | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.5.2.bb => meson_1.6.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index b272fd45b0..85f8a81cf4 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 13e05ca933a572c1caf93372df808a30976f99cd Mon Sep 17 00:00:00 2001
+From 57ab007ab3d510292d7ce7e8929eaaa93d169c51 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 86bad9b..9703315 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 484ef45..cf4a3ba 100644
+index 71a2f3a..4cbeabe 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -389,10 +389,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -416,10 +416,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index b4671f591f..d570cb01a0 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 66e350bbbd65e56a0d19c75710f61503e15e24a2 Mon Sep 17 00:00:00 2001
+From 17e9d8cefe934346b21333241446373868d2cdb0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 883a29a..52bfbf3 100644
+index fff4aaa..1fde2f6 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -399,9 +399,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -400,9 +400,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -24,7 +24,7 @@ index 883a29a..52bfbf3 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -410,8 +407,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -411,8 +408,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson_1.5.2.bb b/meta/recipes-devtools/meson/meson_1.6.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.5.2.bb
rename to meta/recipes-devtools/meson/meson_1.6.0.bb
index beb1751e6f..46127b7a9b 100644
--- a/meta/recipes-devtools/meson/meson_1.5.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.6.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "f955e09ab0d71ef180ae85df65991d58ed8430323de7d77a37e11c9ea630910b"
+SRC_URI[sha256sum] = "999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca61139f2eec09d5496"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.34.1


