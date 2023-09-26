Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6872AE7D264
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:36:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.14305.1695717378493454459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121939649"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="121939649"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:36:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38846C68E1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:36:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E5D1F98A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:36:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51AB16B4CA;
	Tue, 26 Sep 2023 17:36:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-typing-extensions: upgrade 4.7.1 -> 4.8.0
Date: Tue, 26 Sep 2023 16:35:33 +0800
Message-Id: <1695717333-12999-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10-2.057100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwKz90vj69pJOaG
	g/Bit59tTaUInxWhjs3fQQLUEQSyKXp8rxom0SB2JmbrB1j4XwolJy85NfiMc7dqbJDpRLdq2d8
	mtRIRsUMY6gAyWpgR1wXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq4Gp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLM8jlRB5cL399yXP
	Jbjt4VqjO23fxMsbSuGlplVJCF3826+y9MmsdTanY7/GcmiKl4JfGgHIMTioL0gxvm+dHzto4oo
	Ehg+RQ2IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188237

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add typing_extensions.Doc, as proposed by PEP 727.
-Drop support for Python 3.7 (including PyPy-3.7).
-Fix bug where get_original_bases() would return incorrect results when called
 on a concrete subclass of a generic class.
-Fix bug where ParamSpec(default=...) would raise a TypeError on Python versions <3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...g-extensions_4.7.1.bb => python3-typing-extensions_4.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.7.1.bb => python3-typing-extensions_4.8.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb
index 8ff77ba4fd..33749a9f0f 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2"
+SRC_URI[sha256sum] = "df8e4339e9cb77357558cbdbceca33c303714cf861d1eef15e1070055ae8b7ef"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


