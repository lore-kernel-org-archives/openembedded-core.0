Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F294C001B3
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7540.1687850376721960804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="123548515"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="123548515"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F878CA1F1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D631D531C
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7B6E6C833;
	Tue, 27 Jun 2023 16:19:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.17.0 -> 1.18.0
Date: Tue, 27 Jun 2023 15:17:17 +0800
Message-Id: <1687850250-20040-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--1.625400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yeQoIU4rAATMrOCEGIPhtwh4YeSlHZYFotPQ
	+kcNsyKzU3iq9NYEMHRYpzPYxTjsZlOivO1ffApEuce7gFxhKa0BqNb4Qv6VozhqSCE7t/G0vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgDFcf92WG8u/yeuKmpofsO6em2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkrlByYne0VR+eaCzq9idbm+zICzkv7bs8tgdc
	NQwGPR6F8Xze+CdkZk5tWN5CNL0ZsmfkllcChx60JmC2E5/h1lAfwoztF9BH0u/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183462

From: Wang Mingyu <wangmy@fujitsu.com>

Changed:
--------
  Drop support for Python 3.7

Added:
--------
  Update the list of directories that are always excluded for builds

Fixed:
-------
  Fix dev mode when the project has symlinks and file inclusion is defined with the packages or only-include options
  Change the name of generated PTH files for dev mode so they come first lexicographically and therefore load first

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.17.0.bb => python3-hatchling_1.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.17.0.bb => python3-hatchling_1.18.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.17.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
index 05a86f0efb..c94e49dab3 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "b1244db3f45b4ef5a00106a46612da107cdfaf85f1580b8e1c059fefc98b0930"
+SRC_URI[sha256sum] = "50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


