Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDA6C54E60
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8426.1709105619869024469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Izp6+fT1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105620; x=1740641620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dYTH/CAlRoU91zkRP1/I4vt37HAyAzYsExXGjuOFtlQ=;
  b=Izp6+fT1gr2Nc9zuOCxS96xxW5N7TD4odM789b5UY3dcyMrXySydlTla
   ZsxSfwsV4yfgj9Lox/V0/4dbFgLpRN7y+U8noJMJnHWdO8TtxKINZsZbf
   8ALb6jlLA0GKk3CHMCNbVCyw13JK748m1gzWuFT55viDiPMC2GDIdlVV5
   yiYAsTScAErjZShZJ7Yqgn3Aj33LA7WAYj3PI2qN2qvb8EOOfgysAa/e+
   B9p/1n3L4JtAKfdBUnxn6u4kz1ynqWJbeCaICA64xZlQjEkU3Q/3EjUmU
   +cDAMV6Hko1J7ffZer71Od4haeTs8M4eMdDPsHoMYHftDsAA6R4MzJh2K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129959043"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129959043"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50B3A12E22A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7834DFD86C
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FE572008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B287F1A006A;
	Wed, 28 Feb 2024 15:33:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/48] python3-pip: upgrade 23.3.2 -> 24.0
Date: Wed, 28 Feb 2024 15:32:41 +0800
Message-Id: <1709105575-24259-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--4.312600-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yTo39wOA02LhpxAd6mi1Ga25sqk1xxsSyJsk
	4sUwox/ChWltyk0NCjBI+K/b43na4lQ5QLKesrOJA9lly13c/gEQhNjZQYyI3AfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmizCsOCBxDp3U4hD0Y/Y/a7+jn9ktmCjIvKBz74e5r45aBrr
	geRm5pjP8pW19mJIOmhzcCPRbiasJhaj10i6TXQN0KiTeJteVBTnSpwnlY4yGbKItl61J/yUGDD
	kbg1gJk32mPO5tnascnRE+fI6etkj/qHe5pQWsPXc6ILd3ddY3BrsEcSXiNQsSIk1RTpcw/Hl82
	nMpcW1zAVsbNrjzPkzgl6+/hbfVtoNmWnLaYBMjRbr83TAUxL0u/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196360

From: Wang Mingyu <wangmy@fujitsu.com>

no_shebang_mangling.patch
refreshed for 24.0

Changelog:
===========
-Retry on HTTP status code 502
-Automatically use the setuptools PEP 517 build backend when --config-settings
 is used for projects without pyproject.toml.
-Make pip freeze and pip uninstall of legacy editable installs of packages
 whose name contains _ compatible with setuptools>=69.0.3.
-Support per requirement --config-settings for editable installs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pip/no_shebang_mangling.patch         | 9 ++++-----
 .../{python3-pip_23.3.2.bb => python3-pip_24.0.bb}       | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_23.3.2.bb => python3-pip_24.0.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index b59f4888da..99fa14ee03 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 915bf32cd117cd86cc0d4b96bc9490b1c7119ffd Mon Sep 17 00:00:00 2001
+From 2aa82aeb0783c5fa7777b32bfe1dd3da9ae8fc6e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -8,16 +8,15 @@ to be python3 from the environment when building anything for the target
 (or nativesdk). This avoids incorrect interpreter paths in the target scripts.
 
 Upstream-Status: Inappropriate [OE specific config]
-
 ---
  src/pip/_vendor/distlib/scripts.py | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index d270624..42c0d10 100644
+index cfa45d2..313f499 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -137,6 +137,8 @@ class ScriptMaker(object):
+@@ -144,6 +144,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -26,7 +25,7 @@ index d270624..42c0d10 100644
          if os.name != 'posix':
              simple_shebang = True
          else:
-@@ -348,7 +350,7 @@ class ScriptMaker(object):
+@@ -362,7 +364,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_23.3.2.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_23.3.2.bb
rename to meta/recipes-devtools/python/python3-pip_24.0.bb
index 0f2ab9288b..be4a29500a 100644
--- a/meta/recipes-devtools/python/python3-pip_23.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149"
+SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


