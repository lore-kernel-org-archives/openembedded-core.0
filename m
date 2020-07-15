Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.131.1594831466133806155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03422E01E93; Wed, 15 Jul 2020 09:44:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAA29E01EDC
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:02 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 151 SUCCEEDED
Message-Id: <20200715164426.03422E01E93@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:26 -0700 (PDT)
X-Groupsio-MsgNum: 140681
Content-Type: multipart/mixed; boundary="===============2466147160029415912=="

--===============2466147160029415912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *151* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-150-151.patch
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

--===============2466147160029415912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (0 cached, 778 parsed). 1339 targets, 44 skipped, 0 masked, 0 errors.
Removing 144 recipes from the core2-32 sysroot...done.
Removing 148 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2466147160029415912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 883149 to 883300 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 150 [default] to 151 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "150" to "151"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 150 [default] to 151 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.8/site-packages/diffoscope-150-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/diffoscope-151-py3.8.egg-info

--===============2466147160029415912==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-150-151.patch"

From 6b93ac8e8f9ca72be9eab1f32d268567df98f03d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 15:17:13 +0000
Subject: [PATCH] diffoscope: upgrade 150 -> 151

---
 .../diffoscope/{diffoscope_150.bb => diffoscope_151.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_150.bb => diffoscope_151.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_150.bb b/meta/recipes-support/diffoscope/diffoscope_151.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_150.bb
rename to meta/recipes-support/diffoscope/diffoscope_151.bb
index 58bd60a2c2..9b39b44350 100644
--- a/meta/recipes-support/diffoscope/diffoscope_150.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_151.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0b9e4ae401fe4cbb8ce89b0bcabe608581d0ed53b91a28f18337179c7494af57"
+SRC_URI[sha256sum] = "f15e04aa537f0a3d91c99bf631c604668f4eea8f6552c5f93ea9be2bf014df84"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1


--===============2466147160029415912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.8/site-packages/diffoscope-150-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/diffoscope-151-py3.8.egg-info

--===============2466147160029415912==--
