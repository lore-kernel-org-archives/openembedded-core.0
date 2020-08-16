Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.19678.1597558967170985422
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BEC5E0203F; Sat, 15 Aug 2020 23:22:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2E55E0208C
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:44 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcheck: upgrading to 0.15.2 SUCCEEDED
Message-Id: <20200816062247.0BEC5E0203F@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:47 -0700 (PDT)
X-Groupsio-MsgNum: 141524
Content-Type: multipart/mixed; boundary="===============4619511877024509677=="

--===============4619511877024509677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcheck* to *0.15.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcheck-upgrade-0.15.0-0.15.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4619511877024509677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcheck/checkmk: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/checkmk: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck-dbg: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck-dbg: PKGSIZE changed from 113200 to 113216 (+0%)
packages/core2-32-poky-linux/libcheck/libcheck-dbg: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck-dev: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck-dev: PKGSIZE changed from 77335 to 77684 (+0%)
packages/core2-32-poky-linux/libcheck/libcheck-dev: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck-doc: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck-doc: PKGSIZE changed from 276470 to 277124 (+0%)
packages/core2-32-poky-linux/libcheck/libcheck-doc: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck-locale: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck-locale: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck-src: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck-src: PKGSIZE changed from 255750 to 256430 (+0%)
packages/core2-32-poky-linux/libcheck/libcheck-src: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck-staticdev: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck-staticdev: PKGV changed from 0.15.0 [default] to 0.15.2 [default]
packages/core2-32-poky-linux/libcheck/libcheck: PV changed from "0.15.0" to "0.15.2"
packages/core2-32-poky-linux/libcheck/libcheck: PKGSIZE changed from 50485 to 50489 (+0%)
packages/core2-32-poky-linux/libcheck/libcheck: PKGV changed from 0.15.0 [default] to 0.15.2 [default]

--===============4619511877024509677==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libcheck-upgrade-0.15.0-0.15.2.patch"

From 708de8019813d150c414cfd3b9acc113a5fdecd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 05:53:55 +0000
Subject: [PATCH] libcheck: upgrade 0.15.0 -> 0.15.2

---
 .../libcheck/{libcheck_0.15.0.bb => libcheck_0.15.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcheck/{libcheck_0.15.0.bb => libcheck_0.15.2.bb} (89%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.0.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
similarity index 89%
rename from meta/recipes-support/libcheck/libcheck_0.15.0.bb
rename to meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 177c0edc8f..33e07db93c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
-SRC_URI[sha256sum] = "aea2e3c68fa6e1e92378e744b1c0db350ccda4b6bd0d19530d0ae185b3d1ac60"
+SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
 UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
-- 
2.17.1


--===============4619511877024509677==--
