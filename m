Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73740C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:05:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8888.1706763940366915495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sOrbbMLp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706763942; x=1738299942;
  h=from:to:cc:subject:date:message-id;
  bh=zNE2pqUkFOa6acxRm/zNqhP7WU/aZQSmRGH5Ohx7Zfg=;
  b=sOrbbMLpXQGOuRKdjYSSKmfZvwrXVIcBAjGLtoyKzw33mmmrONyCjo34
   otZ3T+XqExjEhDlqX0E3h34CF56t3q8DRFDvovD0vatR9kK7V6x6/pvmA
   rOpP/OTs6f+3H2VouD8v2O7xMLjp+TOy6pG/hgySCVXNfuOe7iYSD5ewH
   G5zaTlWkBRoToeFchVmsEgMXds+LUCUkobYQgR+YbWt1dhF/jwZ68BY3Z
   qVHwCmQqhi1xQkevwpyuWsxxUb7PY155m6U02Hzjq1xEU0Ad+duqi9HIr
   f90voBGieIVavkYdZSiSDrb6jTf+6rtt6ur4MMcbzN4d9ug0ATQadV85U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127394773"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127394773"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:05:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B79E22B523
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:05:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D7F22667A
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:05:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2908065FEA
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:05:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB2E71A006A;
	Thu,  1 Feb 2024 13:05:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffstat: upgrade 1.65 -> 1.66
Date: Thu,  1 Feb 2024 13:04:03 +0800
Message-Id: <1706763843-12307-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--2.959100-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUhwlOfYeSqxjkDrBOJwwnRXGTbsQqHbkun7
	ya/+V5vjmrS/IzG3CN1rW/tgjC4+AfFRbCRQuTS5A9lly13c/gEQhNjZQYyI3AfxTM57BPHD7v0
	MlFSLfmkJ4C/z1Ugb0Zh3ANfpkSSuzCsOCBxDp3Uqy6shOlK/45OOVzRd/XVOysjSs34OntZnqD
	vgi8nF5P8pW19mJIOm9rm+L2YNiKzpZnwb/PFSE+UwVfQtlDNxtKDKpGPfdckPa94jf+HCb9ftC
	rF2sVs+4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpIG4YlbCDECseyhETYMxMRkbpK4i1NSIY6IUE
	RZhK6LVaOqz1eougHfh38XgHaVpp9qrneaLI4IgsN4DpqbeI3DwC6GlAiueiuqUwXLVF3A3XxsH
	ISJK0L4geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194561

From: Wang Mingyu <wangmy@fujitsu.com>

avoid-check-user-break-cc.patch
refreshed for 1.66

License-Update: Copyright year updated to 2024.

Changelog:
==========
-improve handling of git diff's
-update install-sh
-improve configure script checks, reducing compiler warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffstat/diffstat/avoid-check-user-break-cc.patch       | 6 +++---
 .../diffstat/{diffstat_1.65.bb => diffstat_1.66.bb}         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.65.bb => diffstat_1.66.bb} (81%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
index 811faa48da..46f1cfabcf 100644
--- a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -1,4 +1,4 @@
-From 1046593aacb74ff888a0d68c0ff89b20c4bc9ed4 Mon Sep 17 00:00:00 2001
+From 708c765ffb41ecc734316f69043583312fe444bd Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 15 May 2018 17:17:01 +0800
 Subject: [PATCH] diffstat: fix wrong evaluation of CC
@@ -18,10 +18,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 9281aa8..dd57b7a 100644
+index d4bd283..1b653c4 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1239,7 +1239,7 @@ CF_GCC_VERSION
+@@ -1522,7 +1522,7 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.65.bb b/meta/recipes-devtools/diffstat/diffstat_1.66.bb
similarity index 81%
rename from meta/recipes-devtools/diffstat/diffstat_1.65.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.66.bb
index 59db7b1d78..d59379fd2b 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.65.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.66.bb
@@ -5,14 +5,14 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6450594049f0eed1052e634ddcbeec28"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5713b4719a66a6527e6301e8f8745877"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "8cf27424926debcd85921755c3915559288244bd103f62d740dc6b83b557a28a"
+SRC_URI[sha256sum] = "f54531bbe32e8e0fa461f018b41e3af516b632080172f361f05e50367ecbb69e"
 
 inherit autotools gettext ptest
 
-- 
2.34.1


