Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12224.1602843683507617570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 94ECC38C17AA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 1.9 SUCCEEDED
Message-ID: <MADEUP.163E71D744AB9101.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143495
Content-Type: multipart/mixed; boundary="===============3575127800039287198=="

--===============3575127800039287198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *1.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-1.1-1.9.patch
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

--===============3575127800039287198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGSIZE changed from 1998 to 0 (-100%)
Changes to packages/core2-32-poky-linux/hwlatdetect (sysroot):
  /usr/share was removed

--===============3575127800039287198==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-1.1-1.9.patch"

From db9a17e376d48e4e67175c04eac6ffe4f5b8ea4b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:34:42 +0000
Subject: [PATCH] hwlatdetect: upgrade 1.1 -> 1.9

---
 .../rt-tests/{hwlatdetect_1.1.bb => hwlatdetect_1.9.bb}       | 0
 meta/recipes-rt/rt-tests/rt-tests.inc                         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.1.bb => hwlatdetect_1.9.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 6e3afafce4..5093211b1d 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,8 +1,8 @@
 # Version 1.1
-SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
+SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
 # 1.2 and up seem to be development versions
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-8])(\d+(\.\d+)+))"
 
-- 
2.18.4


--===============3575127800039287198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGSIZE changed from 1998 to 0 (-100%)
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PV changed from "1.1" to "1.9"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGSIZE changed from 19666 to 20499 (+4%)
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect: PKGV changed from 1.1 [default] to 1.9 [default]
packages/core2-32-poky-linux/hwlatdetect: PV changed from "1.1" to "1.9"
Changes to packages/core2-32-poky-linux/hwlatdetect (sysroot):
  /usr/share was removed

--===============3575127800039287198==--
