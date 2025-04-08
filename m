Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D65BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:18:19 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.70649.1744103888267296038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mxWQjHMG;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744103888; x=1775639888;
  h=from:to:cc:subject:date:message-id;
  bh=veRPhzsXOauidJg1HCDkyamWFtl4renowrl9+inmIos=;
  b=mxWQjHMG8rhihIBWY2oe3YKFYKuu2/cPKesRiGS5miDiPlkFbHD2nZQU
   2LhIefGnmpMM+DEguEw/0U/redn71Ea3P1f67IunP8CO2KZkeFppEG53p
   7s5NQBbAlX+MX36hjaW/a/+ColhAErb5YP448aAm0tOek1x+u/6sPed7l
   aURclR27VLqkk+0u3bj4gE85I6VMAHjNaLc9ZzfTPKrGsSJdn8iBwho5q
   BgNFOXsdopdM6aObsvul/d2WQGbvQLwTM1HPdAHlkWCf0VPI5zZjpB6/6
   rdcIiURhjhMJx4tTNc5exVJzydUgRVvbqjoZ9Qm+V5ZIc89gnAqRT7Yyb
   A==;
X-CSE-ConnectionGUID: cSDiUAIYQ9eL8sI9UrCCNg==
X-CSE-MsgGUID: ifS1vP3VQyqE+Jfw4W42fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="174683293"
X-IronPort-AV: E=Sophos;i="6.15,197,1739804400"; 
   d="scan'208";a="174683293"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 18:18:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 937B4D6EA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 18:18:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 49C30CF7DC
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 18:18:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 93A1D1A0078;
	Tue,  8 Apr 2025 17:18:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libsolv: upgrade 0.7.31 -> 0.7.32
Date: Tue,  8 Apr 2025 17:17:56 +0800
Message-Id: <1744103876-30713-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 09:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214515

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- build both static and dynamic libraries on new suse distros
- require cmake >= 3.5
- new features:
  * support the apk package and repository format (both v2 and v3)
  * new dataiterator_final_{repo,solvable} functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.31.bb => libsolv_0.7.32.bb} (93%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
similarity index 93%
rename from meta/recipes-extended/libsolv/libsolv_0.7.31.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.32.bb
index b395ff972d..c74836419c 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.32.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib zstd"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "95aef5cc57d0f51782e55b6903b30ec93afbfa15"
+SRCREV = "95f64952e3270deb6be30ae4b786cae5c114c807"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


