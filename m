Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16632.1598724169452542854
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53B71E020D0; Sat, 29 Aug 2020 11:02:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D53CEE0210C
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:02:00 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 158 SUCCEEDED
Message-Id: <20200829180249.53B71E020D0@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:49 -0700 (PDT)
X-Groupsio-MsgNum: 141973
Content-Type: multipart/mixed; boundary="===============1533043952656763506=="

--===============1533043952656763506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *158* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-156-158.patch
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

--===============1533043952656763506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (0 cached, 779 parsed). 1341 targets, 46 skipped, 0 masked, 0 errors.
Removing 144 recipes from the core2-32 sysroot...done.
Removing 148 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1533043952656763506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.8/site-packages/diffoscope-156-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/diffoscope-158-py3.8.egg-info

--===============1533043952656763506==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-156-158.patch"

From e8fbe38af003d0f8cfe8a5a7cc1893f6c4805398 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 29 Aug 2020 16:25:45 +0000
Subject: [PATCH] diffoscope: upgrade 156 -> 158

---
 .../diffoscope/{diffoscope_156.bb => diffoscope_158.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_156.bb => diffoscope_158.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_156.bb b/meta/recipes-support/diffoscope/diffoscope_158.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_156.bb
rename to meta/recipes-support/diffoscope/diffoscope_158.bb
index 94e6e56d41..9b00e22e23 100644
--- a/meta/recipes-support/diffoscope/diffoscope_156.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_158.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "428f5d75197c3d9449ffbac52f8d79dd782a7ed67aba759e0452515b2d8e1441"
+SRC_URI[sha256sum] = "54e6d074a783c742b18b18a63328ac6821f4bedbb3d721a5d6af6ccb5d4fe6b2"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1


--===============1533043952656763506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "156" to "158"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 886881 to 891407 (+1%)
packages/core2-32-poky-linux/diffoscope: PKGV changed from 156 [default] to 158 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "156" to "158"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.8/site-packages/diffoscope-156-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/diffoscope-158-py3.8.egg-info

--===============1533043952656763506==--
