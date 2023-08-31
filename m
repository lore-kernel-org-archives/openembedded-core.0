Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0084C83F1B
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:37:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8545.1693449466291244017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109548026"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109548026"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:37:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EEE07CD6C2
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:37:31 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 309E4D3F34
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:37:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4770E86C8D;
	Thu, 31 Aug 2023 11:37:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpfr: upgrade 4.2.0 -> 4.2.1
Date: Thu, 31 Aug 2023 10:37:03 +0800
Message-Id: <1693449423-28042-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-2.608100-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrWq/snXbxpCDgm7lSO4VWy3uL
	dMlaRil5e3M/yhx36J8ep5R/z/M+R1aBvJpACoM8wDUOOiiKagzKrKWVfpQki1gLks93sG9t7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+ARCE2NlBjIjcUJ52LFhfM6vw0z
	afNNap1NKsinCoAKl+rzprBEsYaL2tYv/FAmebjp4CIKY/Hg3AaZGo0EeYG954UhBPLRlvht9pj
	zubZ2rHJ0RPnyOnrZLo5upgNAVQTUuWLY+bUizaKGtXAwe0YvioagUUmX9g+MqBxAc9mz3GXtaU
	UpWaYkKshFrNqArUo2CYr3f031EkQacR2SF4cTFLv5Eyr/YIrqsDhztRXZ9Cm+LY9A78UVCLPa6
	Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186944

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bug fixes (see <https://www.mpfr.org/mpfr-4.2.0/#fixed> and/or the
  ChangeLog file).
- Improved MPFR manual.
- Configure tests: replaced the test of the link with GMP, in order to
  avoid the use of a function without a prototype (Autoconf issue), as
  this is obsolescent in ISO C. The new test should be more robust.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/mpfr/{mpfr_4.2.0.bb => mpfr_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/mpfr/{mpfr_4.2.0.bb => mpfr_4.2.1.bb} (91%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.2.0.bb b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
similarity index 91%
rename from meta/recipes-support/mpfr/mpfr_4.2.0.bb
rename to meta/recipes-support/mpfr/mpfr_4.2.1.bb
index 31804382e0..a2067e1036 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive-native"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[sha256sum] = "06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993"
+SRC_URI[sha256sum] = "277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.34.1


