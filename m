Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5572C54734
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.12715.1724136737091045194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C77LYW0k;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136738; x=1755672738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pxx66EIFDjLzXh/hMCI4pYP7kzWNTh+hnrtHmB2nTvc=;
  b=C77LYW0k1L1JjRVlxkIqopXaXJnMr3ZLA6Mduja2GXUQMbYmGVGqBRya
   juSreTYqCdRxzS4UxpQsdf6kth34Yx1XTAeFxFG2RwINITSkW6hLVIz44
   qPr4l0PM206ShyRn9hr2EkszKDeWtQMfQ0RrwCV43s5N1YL7lzkLStop3
   Uxc5skXec1Lun+dwRSRdGTd1sTXtj6bzezv39Shz5xPq4Rl1fKMkejSSK
   +DpM3Ni7IFGOeUAXB8nCnprIdQLviZ4qwrlVk2L5Rt2Kk6kDuyHL55YlE
   M6bHdKc58qZWc1AFdLsJHZ5+A6NkTjRTtmxTcsZ3/ieZclq4239BP7/UV
   A==;
X-CSE-ConnectionGUID: AKGwOaRARUu1eOkmuyodew==
X-CSE-MsgGUID: G+BYUkV+RPilIBidpWbQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="159075232"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="159075232"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C8B1C2142
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 61EDED4C3B
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E887D20086124
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 929151A0002;
	Tue, 20 Aug 2024 14:52:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/24] pkgconf: upgrade 2.2.0 -> 2.3.0
Date: Tue, 20 Aug 2024 14:51:34 +0800
Message-Id: <1724136703-20023-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10--2.431400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvk6Qbi+9i6D5Ky
	Pf1j7t43XSoxY06waADDz1kU/es/5U5enoFAhOloxOIv4/oKgyCW0X7Fb7OFSAKJcjtscVQF1Um
	SNC+UEfGUkwju+dshtA90TS+Za1WoL7fGpDjikVapNvaxbMIbfnFd5+Cf9M1D7RNKDXYimCW+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtlu/VKvCjKPVLW9pVc+sJT++g5AIK77KNi4MPjSgrMEBOV0L7qjuScPncU/weYYGB/C1E
	+dOIJ3ZLtmMnBIFRnpjaM9tpYdxCutOTg47Y5FfyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203534

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix compile with Meson on Solaris by defining __EXTENSIONS__.
* Add support for the PKG_CONFIG_RELOCATE_PATHS environmental variable.
  When set, the program will act as if --define-prefix is always
  enabled.
* Color solution nodes that were part of the original query, and use
  that coloring to skip over dependencies when generating DocumentNames
  in bomtool.
* Enhance --env option to support variables with both --variable=varname
  and --print-variables.
* Add --exists-cflags option which creates synthetic preprocessor
  definition flags for every queried dependency when found.
* Document that Requires.private is always used for header paths.
* Fix minor documentation typos.
* Ensure string comparisons using <ctype.h> functions are done with
  unsigned bytes to avoid undefined behavior.
* Fix parsing edge-case bugs with dependency versions.
* Change PKG_PROG_PKG_CONFIG autoconf macro to add a customizable
  failure handler if pkg-config is not found.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_2.2.0.bb => pkgconf_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.2.0.bb => pkgconf_2.3.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
index 5f4ef73d43..c95ab74838 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "b06ff63a83536aa8c2f6422fa80ad45e4833f590266feb14eaddfe1d4c853c69"
+SRC_URI[sha256sum] = "3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b"
 
 inherit autotools
 
-- 
2.34.1


