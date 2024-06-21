Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0EFC41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.64099.1718936229470512381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cZdnQ0eh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936230; x=1750472230;
  h=from:to:cc:subject:date:message-id;
  bh=afNxbcVqC70NC9Mf48jCqQavmXu9PoAka9GptpS3wxs=;
  b=cZdnQ0ehQ6pAYELB6Am+rMcQjuXyX11oWOb2LWMl4XQRTuT9dv8EoeeA
   TAmoslzQiKjXalzKRb4E5D2DX1D4FlsrHPkLbwsRgcX7ZxbijnEfvHhTB
   AfqaSsyuf2agXTGLEa7xJ2UuMbtiiVjNaB6i1jkTNfedV3Ma/QIgwvdf3
   pCAX7YjF1xlpY01F3rRZL7PbpTPXp1BsnnVPVyO7Pln18DCKpmfEkuuOg
   Q+fov9klpxypOgd6Fmsot6aYFTC2e8/dAqkO23DhigrKrWdOG+xvLMFV3
   dpHvhnom+R+HIytPAlpHGF4QgLCEth3INtGVPXAQZpagIy5mEANY4WlHh
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="163680854"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="163680854"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:07 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88E46C9443
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C507DF87F
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A91A20086E93
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D9BF81A0002;
	Fri, 21 Jun 2024 10:17:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/22] alsa-lib: upgrade 1.2.11 -> 1.2.12
Date: Fri, 21 Jun 2024 10:16:25 +0800
Message-Id: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10-1.866700-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yXzmmMD/HXF+kdS3kPlaZyXkABvhO7aBvq4r
	mQIDoB6SpPkgFEQ0YZkSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9Ei8rgutezVpmbc4hVJ/g/mqB2
	Ej9kXDtKdx4snLk8Kgjfytuxt8u4zsAGjS6lxxKtN9TX8X49szG24YVeuZGmMGKrU/PL/UzOGMn
	KDaQSVgmuyFTRySne6JIG0pP8yLBh8TzIzimOwP8dA3q/uj/L/EQdG7H66TyHEqm8QYBtMOZQWj
	G3uii5bpJYEwBGtwv0iyEJSFn0E9FP4LNalSnu1EG34HZsOj/Hm0CfNkXOnIjOWH1OgGsQsqcp7
	F0sj0HMmYSCmJWrSegr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200968

From: Wang Mingyu <wangmy@fujitsu.com>

0001-topology-correct-version-script-path.patch
removed since it's included in 1.2.12.

Changelog:
- GitHub Actions: Use actions/checkout@v4
- pcm: plug - add automatic conversion for iec958 subframe samples

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...topology-correct-version-script-path.patch | 38 -------------------
 ...{alsa-lib_1.2.11.bb => alsa-lib_1.2.12.bb} |  6 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.11.bb => alsa-lib_1.2.12.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
deleted file mode 100644
index 30aeef5817..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-correct-version-script-path.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2a736a0d2543f206fd2653aaae8a08a4c42eb917 Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@bootlin.com>
-Date: Tue, 30 Jan 2024 14:24:25 +0100
-Subject: [PATCH] topology: correct version script path
-
-From: Jan Palus <jpalus@fastmail.com>
-
-contrary to libasound, version script for libatopology is a regular
-source file. while it's often the case that $(builddir) and $(srcdir)
-point to the same directory, they don't always have to. therefore path
-needs to point explicitly to $(srcdir) for Versions script in topology
-
-Closes: https://github.com/alsa-project/alsa-lib/pull/383
-Fixes: GH-382
-Fixes: dc7da761f3a2 ("topology: separate Versions linker script")
-Signed-off-by: Jan Palus <jpalus@fastmail.com>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=2a736a0d2543f206fd2653aaae8a08a4c42eb917]
----
- src/topology/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/topology/Makefile.am b/src/topology/Makefile.am
-index 04299588..e0b78373 100644
---- a/src/topology/Makefile.am
-+++ b/src/topology/Makefile.am
-@@ -2,7 +2,7 @@ EXTRA_DIST = Versions
- COMPATNUM=@LIBTOOL_VERSION_INFO@
- 
- if VERSIONED_SYMBOLS
--VSYMS = -Wl,--version-script=Versions
-+VSYMS = -Wl,--version-script=$(srcdir)/Versions
- else
- VSYMS =
- endif
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
index c212b17aa3..d9136052b7 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb
@@ -9,10 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
-           file://0001-topology-correct-version-script-path.patch \
-           "
-SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


