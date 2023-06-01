Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF8BC83003
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26244.1685610240244105072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118599332"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118599332"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ED9A57C016
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:55 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F18FCD561C
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2861288864;
	Thu,  1 Jun 2023 18:03:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxpm: upgrade 3.5.15 -> 3.5.16
Date: Thu,  1 Jun 2023 17:03:15 +0800
Message-Id: <1685610221-29015-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-0.138300-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mra9qiaDSLgo0T4iDztnfIOf/q
	b9sK3pliD/OFpcSAvwvMau1T20usrnbcXxbRn8zhYPyK201ebhtITEcvqjcF4OjMOEZ5AL0Sd9z
	LBU1f8+5UBApVCHbUye4UL2DTQdBzVoG8mkAKgzw/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlk9TrG26QmGzHlRxm3A2wKuhRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07UXA0
	ioI+iBt+tBnInkg/az5jX7YoW8OjBKhyKBXwk+5N0n+kkTYjABGsJxA6nQB0E8w/SAk6HEYRM7x
	5bhRb0XmuUU0DV2iAMv2jG1C/zLP8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182065

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
test: skip compressed file tests when --disable-open-zfile is used
itlab CI: build with each of --enable-open-zfile & --disable-open-zfile
configure: correct error message to suggest --disable-open-zfile
Fix a memleak in ParsePixels error code path
Fix CVE-2022-44617: Runaway loop with width of 0 and enormous height
open-zfile: Make compress & uncompress commands optional
Require LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
test: Use PACKAGE_BUGREPORT instead of hard-coded URL's
test: Add simple test cases for functions in src/rgb.c
xpmReadRgbNames: constify filename argument
XpmCreateDataFromXpmImage: Fix misleading indentation
parse.c: Wrap FREE_CIDX definition in do { ... } while(0)
parse.c: remove unused function xstrlcpy()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
index 32a2b35356..c3d01f1bb3 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1"
+SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


