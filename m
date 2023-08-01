Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF12C3DA40
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7617.1690875711602295069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613489"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613489"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:54 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 36B21D3EB2
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:51 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7993FCFBBD
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C07D2FC86F7;
	Tue,  1 Aug 2023 16:41:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] re2c: upgrade 3.0 -> 3.1
Date: Tue,  1 Aug 2023 15:41:25 +0800
Message-Id: <1690875687-21573-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--3.197800-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrVjYedleNPbWBAXl9LkPp6ZU8
	xJRxYi7KOXp+f0vwelAwoZt8+P4+1kp90WJ4hxKI93bduyx/IZzmw+pxCQjym3v3ioAd9KrSjdx
	5FdhImgMSnsBpULHZy6NYj4CoIiwdCN0DFn2JwuOXVXMu1aPavGv34qCfZeB42i1l1WDBq01jFr
	zDFNuGe/ChFWUGCEyxO5EEHIi+rqX75cEN6/qvTO6bo2/Lq3c2Xef5t6q8RczfghYDxv+lXSmFO
	YJJbPqp3Mb6qXoihXAuXIORNsT1z1pCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVU2d8m
	tRIRsUOBkESMI05d4t07ucKqtUSvs11Uem18eXrqcdt4G7kueVXgGeVUh3WdmyiLZetSf8lBgw5
	G4NYCZN9pjzubZ2rHJ0RPnyOnrZKxzSHE2XqzyqoO2ImfFX8vj08JNDLuRK2CKXYNvH06NOwtYk
	N32P8wvK9Zk0X/5GjP53Hn0GuCylNJjSm7VJS7OoY/xb6c9T1Lv5Eyr/YIrqsDhztRXZ9Cm+LY9
	A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185207

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added capturing groups with leftmost greedy semantics:
- Added non-capturing groups:
- Regenerated Unicode include header to support a newer standard
- Published TDFA paper: https://arxiv.org/abs/2206.01398, co-authored with
  Angelo Borsotti
- Removed experimental algorithms that are superseded by TDFA(1) and
  generally less efficient:
- Fixed parsing of raw UTF-8 characters in Flex compatibility mode
- Added header file to the dependencies generated with "--depfile" option
- Fixed stack overflow on large regular expressions by rewriting recursive
    functions in iterative form and limited stack to 256K on GithubActions CI
- Added minimal http://bazel.build integration
- Added configure option "--enable-parsers" that regenerates bison parsers
- Added CMake option "RE2C_REBUILD_PARSERS"
- Moved the entire codebase to C++11.
- Added uniform error handling (return codes are now properly checked and
 returned to the caller).
- Reorganized codegen subsystem in four well-defined phases (analyze,
 generate, fixup, render) and separated codegen from parsing phase.
- Improved memory allocation by using slab allocators instead of global free
 lists.
- Moved to pure API for bison parsers.
- Unified code style.
- Added "--verbose" flag to run_tests.py and suppressed verbose output by
 default.
- Multiple improvements of continuous testing with GithubActions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_3.0.bb => re2c_3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_3.0.bb => re2c_3.1.bb} (91%)

diff --git a/meta/recipes-support/re2c/re2c_3.0.bb b/meta/recipes-support/re2c/re2c_3.1.bb
similarity index 91%
rename from meta/recipes-support/re2c/re2c_3.0.bb
rename to meta/recipes-support/re2c/re2c_3.1.bb
index f8f85125a3..25ec47519a 100644
--- a/meta/recipes-support/re2c/re2c_3.0.bb
+++ b/meta/recipes-support/re2c/re2c_3.1.bb
@@ -8,7 +8,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b3babbbb1461e13fe22c630a40c43885efcfbbbb585830c6f4c0d791cf82ba0b"
+SRC_URI[sha256sum] = "0ac299ad359e3f512b06a99397d025cfff81d3be34464ded0656f8a96676c029"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


