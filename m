Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1308E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.77562.1734425903308092721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oo/zI1sL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425904; x=1765961904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B498YLo6OaQ+rrAOcBxEK05BezCAA3xtlTzj2gS5mIU=;
  b=oo/zI1sL9aW/YDRvap2j5jrw+/DqGGNcqbDb5xXpiBls839l+PWanbk4
   ojuhn2LUi8waMWkAI2Yq1fGxSqGzwKSarZGGzV7Onqyn/BDdLhimnuf7+
   Xwe3UTI6F793jeSgC+sT3qHBoabS/7/9a7m4FAa5QHu/IcmSGJUtVnCq2
   EKVYeMEgB1H8GtJ31Opj1j78ytMOp4ILzBA/Oh7bxuTIp8sPH7E66GvVC
   Rps0fTwNta1CLAG0d9SKAEpMAIL9S0B005yvjkM2Dx8TGxQNbk6zhvpNr
   0f//V60nTTG2hTYjwww643dSvSLSaRO2iKG4GcSgyZi3tefoITQypc3Di
   g==;
X-CSE-ConnectionGUID: GOhSyWs6SdOh+Xn5jQROPw==
X-CSE-MsgGUID: o7tvXOdgTSWSQazP4Ac6HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="186395087"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="186395087"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B7508C2262
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 85959BF4B5
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 214D96B9B4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE7E11A000B;
	Tue, 17 Dec 2024 16:58:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 03/21] boost: upgrade 1.86.0 -> 1.87.0
Date: Tue, 17 Dec 2024 16:57:49 +0800
Message-Id: <1734425887-18069-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-5.808300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yX84FZpy/6JVkdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7Vd6KzZKXMR2ETuctSpiuWyWY5v+NllnxQpU0v9mwIFt+2c5
	16rvzqrtYzJcD0gVKSpu91RWVjlmQtR3ZHtcq+ffvVbHa5Rs8t8TGavmGo0vWNxLN8dnZPdXO/T
	5SZgJlw9+RhPMsqBuAgDLqnrRlXra/ZOFeDeXHgN0H8LFZNFG7hqz53n/yPnrF6W2KK++iB917T
	NbiEL8hen72wm/A5wtO1m0/3jXbHXW83xjabA56Dd41uEPSz2dhcukHjdgxy3a2dhfDdwGFz++Z
	NFENx7M=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208806

From: Wang Mingyu <wangmy@cn.fujitsu.com>

boost-math-disable-pch-for-gcc.patch
refreshed for 1.87.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../boost/{boost-1.86.0.inc => boost-1.87.0.inc}          | 2 +-
 ...uild-native_1.86.0.bb => boost-build-native_1.87.0.bb} | 0
 .../boost/boost/boost-math-disable-pch-for-gcc.patch      | 8 ++++----
 .../boost/{boost_1.86.0.bb => boost_1.87.0.bb}            | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/boost/{boost-1.86.0.inc => boost-1.87.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.86.0.bb => boost-build-native_1.87.0.bb} (100%)
 rename meta/recipes-support/boost/{boost_1.86.0.bb => boost_1.87.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.86.0.inc b/meta/recipes-support/boost/boost-1.87.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.86.0.inc
rename to meta/recipes-support/boost/boost-1.87.0.inc
index 2378b27575..320ec51e36 100644
--- a/meta/recipes-support/boost/boost-1.86.0.inc
+++ b/meta/recipes-support/boost/boost-1.87.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
+SRC_URI[sha256sum] = "af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.86.0.bb b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.86.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.87.0.bb
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index dde21fa076..d658b40187 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From c6009cdc1fe76db0092443593396e4d5f0eaa86b Mon Sep 17 00:00:00 2001
+From efd23e59dd09c911990ea4a6f48afed1ac56904b Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
@@ -14,11 +14,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
-index 6549e06b7..342cbf0b1 100644
+index 500c77363..504d7d8c6 100644
 --- a/libs/math/build/Jamfile.v2
 +++ b/libs/math/build/Jamfile.v2
-@@ -13,7 +13,7 @@ project
-       <toolset>intel-win:<linkflags>-nologo 
+@@ -15,7 +15,7 @@ project
+       <toolset>intel-win:<linkflags>-nologo
        #<toolset>intel-linux:<pch>off
        <toolset>intel-darwin:<pch>off
 -      <toolset>gcc,<target-os>windows:<pch>off
diff --git a/meta/recipes-support/boost/boost_1.86.0.bb b/meta/recipes-support/boost/boost_1.87.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.86.0.bb
rename to meta/recipes-support/boost/boost_1.87.0.bb
-- 
2.43.0


