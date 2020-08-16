Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19882.1597558950522354215
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62D24E0203D; Sat, 15 Aug 2020 23:22:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC03EE02088
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:44 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 156 SUCCEEDED
Message-Id: <20200816062230.62D24E0203D@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:30 -0700 (PDT)
X-Groupsio-MsgNum: 141520
Content-Type: multipart/mixed; boundary="===============8390081908078672333=="

--===============8390081908078672333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *156* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-153-156.patch
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

--===============8390081908078672333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (0 cached, 778 parsed). 1342 targets, 44 skipped, 0 masked, 0 errors.
Removing 146 recipes from the core2-32 sysroot...done.
Removing 150 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8390081908078672333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 153 [default] to 156 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 885091 to 886881 (+0%)
packages/core2-32-poky-linux/diffoscope: PV changed from "153" to "156"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 153 [default] to 156 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.8/site-packages/diffoscope-153-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/diffoscope-156-py3.8.egg-info

--===============8390081908078672333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.8/site-packages/diffoscope-153-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/diffoscope-156-py3.8.egg-info

--===============8390081908078672333==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-153-156.patch"

From c2e6c3f186cddd42f76959f06018d10a85d22c02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 05:44:47 +0000
Subject: [PATCH] diffoscope: upgrade 153 -> 156

---
 .../diffoscope/{diffoscope_153.bb => diffoscope_156.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_153.bb => diffoscope_156.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_153.bb b/meta/recipes-support/diffoscope/diffoscope_156.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_153.bb
rename to meta/recipes-support/diffoscope/diffoscope_156.bb
index 77f5254aec..94e6e56d41 100644
--- a/meta/recipes-support/diffoscope/diffoscope_153.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_156.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b5104b5e72252df45ba6b7cbb0169e2e3407715b6b063fa5b38a2649b0d719a2"
+SRC_URI[sha256sum] = "428f5d75197c3d9449ffbac52f8d79dd782a7ed67aba759e0452515b2d8e1441"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1


--===============8390081908078672333==--
