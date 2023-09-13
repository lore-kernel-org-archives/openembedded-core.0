Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA82CA552F
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:42:33 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.7768.1694598148465861274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="132061702"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="132061702"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:42:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CF69C68E5
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:42:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B6FD4CF7C0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:42:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3B4470B10;
	Wed, 13 Sep 2023 18:42:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 68.1.2 -> 68.2.1
Date: Wed, 13 Sep 2023 17:41:57 +0800
Message-Id: <1694598117-21915-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10-3.021200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrUuVVTCQr62qQc9WQFO7fU5Yv
	gWqjMEza6LmRq4bR/xeKggr79PUAVNhS2igvyocpC8FMH3T6F74YFQt+VRO1dBzlIYo2TUIbr3p
	JWfbGunHC6WewxLMF+KC33GyXduU3okSrpvzPhqny3h9RQZ4StME5XPQnBzGXvpLsd+70hTFmeC
	LE2iu14OmwUlQphlkneTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBRmGnnLqpGSoFDpr
	VJcjKLD9vaAHbdnleF/3XHu42xL2inR7lt8ZZ2ywknF/zCG7+YWhn4vglSd4sIUXgWwDbVUX4gZ
	P+pNb5fsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187576

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features
----------
-Rework how setuptools internally handles dependencies/install_requires and
 optional-dependencies/extras_require. (#3903)
-Improve the generated PKG-INFO files, by adding Requires-Dist fields.
-Improve atomicity when writing PKG-INFO files to avoid race conditions with
 importlib.metadata. (#3904)

Bugfixes
----------
-Fix the name given to the *-nspkg.pth files in editable installs, ensuring
 they are unique per distribution. (#4041)
-Workaround some limitations on pkg_resources-style legacy namespaces in the
 meta path finder for editable installations. (#4041)
-Avoid using caching attributes in Distribution.metadata for requirements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_68.1.2.bb => python3-setuptools_68.2.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.1.2.bb => python3-setuptools_68.2.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 84a9492caf..6b467184d7 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From c90cc4a07ce6d2b7128e37d811d0c6bbc4b905a6 Mon Sep 17 00:00:00 2001
+From c4a48e6a75a5865a7c8d61a0f060aca9ba92477b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_68.1.2.bb b/meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
index a1e84b635c..e4aaa914a3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "3d4dfa6d95f1b101d695a6160a7626e15583af71a5f52176efa5d39a054d475d"
+SRC_URI[sha256sum] = "56ee14884fd8d0cd015411f4a13f40b4356775a0aefd9ebc1d3bfb9a1acb32f1"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


