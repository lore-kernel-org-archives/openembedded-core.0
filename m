Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B92CA5520
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:30:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7609.1694597421605032445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="111288014"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="111288014"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:30:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09A42DDC61
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:30:17 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04C43BF4B0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:30:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1948B2FC71E7;
	Wed, 13 Sep 2023 18:30:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] debianutils: upgrade 5.8 -> 5.12
Date: Wed, 13 Sep 2023 17:30:07 +0800
Message-Id: <1694597407-21303-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10--1.582900-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy9tYH9JM4nFTfS
	SGIpEgMpX9t4w91/vrapRRFTDpT6hdBrVXTZqL7rPKN38CLPK0H/1JLsM3tGxnB7S+fVnZIvLVY
	Y83vl20ituu6YxSgT/6uVCdsHobg30nl1nsNjR7gSEYfcJF0pRRkUbyhq3ey+gQF5fS5D6emewR
	Hil2dvgk+9l9kcZ4FyDVWd7qu4idJDxWS+7n7SHcb6dLbgzMd5VBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsNVHotTvuv6w9r3iN/4cJv1+0K
	sXaxWz7i8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZLZcxMiLxditkGE4fopAhuQlB1e+dthYzxK+iu
	noZ4o0F9itHt8vLmp4aFZ2uljcR1/JE6lyPJysLe85BzQJxRypj5skJ6xHdNLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187561

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * d/control:
    - Add myself as maintainer and Niels Thykier as uploader
    - Bump standards version from 4.6.0 to 4.6.2.
  * d/prerm: Make script executable.
  * d/postinst: Use 'set -e' in the body of the script.
  * d/tests/smoke: Use 'set -e' in the body of the script.
  * d/source/lintian-overrides: Ignore upstream metadata warning for Debian
    native package.
  * ischroot.c: Add missing newline in version output.
  * ischroot.1: Fix to say detection is possible for exit status 0.
  * postinst: Remove the bogus links that were created in 5.9 and 5.10
  * On non-usrmerged systems, correct run-parts/tmpfile links
  * ischroot: Do not claim it does not run as non-root
  * Align the cron file regex with the documentation
  * debian/postinst: add DPKG_ROOT prefix to paths in usrmerge()
  * Partial translation of which(1) into hungarian
  * Run autoreconf during the build
  * Drop obsolete dpkg-gencontrol flag -isp
  * Drop unnecessary CI config file
  * Revert the package to be format 3.0 (native)
  * Update /etc/shells micropolicy to recommend declarative use
  * Correct manpage macros
  * Update German manpage translation
  * Update Portuguese manpage translation
  * Modify post{inst,rm} in order to comply with UsrMerge

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.8.bb => debianutils_5.12.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.8.bb => debianutils_5.12.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.8.bb b/meta/recipes-support/debianutils/debianutils_5.12.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.8.bb
rename to meta/recipes-support/debianutils/debianutils_5.12.bb
index fb17d2d24f..4002a44cdb 100644
--- a/meta/recipes-support/debianutils/debianutils_5.8.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "69116b856177ceb270908103b5776f897d2863c3"
+SRCREV = "78bdc9165504b61ff4ea25a95d9865c45bfe7520"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


