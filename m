Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.689.1610713822948664256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id E798138C140B
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 1.10 SUCCEEDED
Message-ID: <MADEUP.165A67B0C115156F.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146810
Content-Type: multipart/mixed; boundary="===============4302015613056681667=="

--===============4302015613056681667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *1.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-1.9-1.10.patch
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

--===============4302015613056681667==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-1.9-1.10.patch"

From d1046cf361f878a8b5fe6c35434d83b19547cb6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:38:32 +0000
Subject: [PATCH] hwlatdetect: upgrade 1.9 -> 1.10

---
 .../rt-tests/{hwlatdetect_1.9.bb => hwlatdetect_1.10.bb}        | 0
 meta/recipes-rt/rt-tests/rt-tests.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.9.bb => hwlatdetect_1.10.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.10.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_1.10.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 2dd890cf95..9358f13d06 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
 # Version 1.8
-SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
+SRCREV = "32819581cc0509c9d58c33c3061f57abe0c40c88"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
-- 
2.27.0


--===============4302015613056681667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 1.9 [default] to 1.10 [default]
packages/core2-32-poky-linux/hwlatdetect: PV changed from "1.9" to "1.10"
packages/core2-32-poky-linux/hwlatdetect: PKGV changed from 1.9 [default] to 1.10 [default]

--===============4302015613056681667==--
