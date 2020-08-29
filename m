Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.16480.1598724169140302000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0786AE020D0; Sat, 29 Aug 2020 11:02:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5C97E0210A
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:02:00 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 4.11.1 SUCCEEDED
Message-Id: <20200829180249.0786AE020D0@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:49 -0700 (PDT)
X-Groupsio-MsgNum: 141972
Content-Type: multipart/mixed; boundary="===============6251164859156274999=="

--===============6251164859156274999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *4.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-4.11-4.11.1.patch
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

--===============6251164859156274999==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-4.11-4.11.1.patch"

From 2e00dd9366b16d8e92e955ec7f2b1f5e5683e4cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 16:14:36 +0000
Subject: [PATCH] debianutils: upgrade 4.11 -> 4.11.1

---
 .../debianutils/{debianutils_4.11.bb => debianutils_4.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_4.11.bb => debianutils_4.11.1.bb} (95%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.bb b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
similarity index 95%
rename from meta/recipes-support/debianutils/debianutils_4.11.bb
rename to meta/recipes-support/debianutils/debianutils_4.11.1.bb
index ac3d5b0267..71fc99e29b 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[sha256sum] = "bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151"
+SRC_URI[sha256sum] = "8be869f19c55c18d53d9f0414b68bb966a068b2154e9fbbfc6193827d6af983c"
 
 inherit autotools update-alternatives
 
-- 
2.17.1


--===============6251164859156274999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 71516 to 71796 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-dev: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dev: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-doc: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils-locale: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-locale: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-src: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 29557 to 29549 (-0%)
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils/debianutils: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils/debianutils: PV changed from "4.11" to "4.11.1"
packages/core2-32-poky-linux/debianutils: PKGV changed from 4.11 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/debianutils: PV changed from "4.11" to "4.11.1"

--===============6251164859156274999==--
