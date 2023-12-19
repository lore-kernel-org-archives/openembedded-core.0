Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D6CC46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:58:48 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8984.1702979918412874806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123235732"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123235732"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:58:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6F31C148F
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:58:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 23F07D6144
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:58:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D1FB6B670
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:58:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 488981A006F;
	Tue, 19 Dec 2023 17:58:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 23.3.1 -> 23.3.2
Date: Tue, 19 Dec 2023 17:58:27 +0800
Message-Id: <1702979907-8398-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-3.495700-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yTo39wOA02LhpxAd6mi1Ga14YeSlHZYFop0+
	obfADoH/KqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxZng
	ixNorteBdtIPJf+pR/MAcUQXqK8A7OinETurQWAgdZEkR8Y/meejn9ktmCjIvKBz74e5r45aBrr
	geRm5pjP8pW19mJIOmhzcCPRbiasJhaj10i6TXQN0KiTeJteVBfS0Ip2eEHnyFh/DzryTTlvc8O
	Jc7+0VJjoczmuoPCq1GeMZru80lQCQ+WunzeHwt9uj9ZYievCvs4v8jx5lV5/Rg15AR9bEcIBaT
	hZb8mc6IH97P0Cse+UfiG/1njAMkGgfSHTmjq70dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192715

From: Wang Mingyu <wangmy@fujitsu.com>

no_shebang_mangling.patch
refreshed for 23.3.2

Changelog:
==========
-Fix a bug in extras handling for link requirements
-Fix mercurial revision "parse error": use --rev={ref} instead of -r={ref}

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-pip/no_shebang_mangling.patch     | 21 +++++++++++++------
 ...n3-pip_23.3.1.bb => python3-pip_23.3.2.bb} |  2 +-
 2 files changed, 16 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_23.3.1.bb => python3-pip_23.3.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 920e22bc02..b59f4888da 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,14 +1,23 @@
+From 915bf32cd117cd86cc0d4b96bc9490b1c7119ffd Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 23 Feb 2022 12:27:06 +0000
+Subject: [PATCH] python3-pip: Don't change shebang
+
 Patch pip to disable shebang mangling and also force the python executable
 to be python3 from the environment when building anything for the target
 (or nativesdk). This avoids incorrect interpreter paths in the target scripts.
 
 Upstream-Status: Inappropriate [OE specific config]
 
-Index: pip-22.0.3/src/pip/_vendor/distlib/scripts.py
-===================================================================
---- pip-22.0.3.orig/src/pip/_vendor/distlib/scripts.py
-+++ pip-22.0.3/src/pip/_vendor/distlib/scripts.py
-@@ -135,6 +135,8 @@ class ScriptMaker(object):
+---
+ src/pip/_vendor/distlib/scripts.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
+index d270624..42c0d10 100644
+--- a/src/pip/_vendor/distlib/scripts.py
++++ b/src/pip/_vendor/distlib/scripts.py
+@@ -137,6 +137,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -17,7 +26,7 @@ Index: pip-22.0.3/src/pip/_vendor/distlib/scripts.py
          if os.name != 'posix':
              simple_shebang = True
          else:
-@@ -340,7 +342,7 @@ class ScriptMaker(object):
+@@ -348,7 +350,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_23.3.1.bb b/meta/recipes-devtools/python/python3-pip_23.3.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_23.3.1.bb
rename to meta/recipes-devtools/python/python3-pip_23.3.2.bb
index 3699bdf515..475cc12984 100644
--- a/meta/recipes-devtools/python/python3-pip_23.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.3.2.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174"
+SRC_URI[sha256sum] = "7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


