Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.24165.1608473714355701775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 20DFB38C14A7
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.10 SUCCEEDED
Message-ID: <MADEUP.1652725272C94654.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145949
Content-Type: multipart/mixed; boundary="===============3035904887661000225=="

--===============3035904887661000225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.9-5.10.patch
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

--===============3035904887661000225==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-5.9-5.10.patch"

From 9254ba5d709c90563d53a589857d8492357589da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 03:34:10 +0000
Subject: [PATCH] ethtool: upgrade 5.9 -> 5.10

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.9.bb => ethtool_5.10.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.9.bb => ethtool_5.10.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 673b35033f..54aec01284 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 538bd5ec36d88f17803cb848cbbfe62ad51fc2f4 Mon Sep 17 00:00:00 2001
+From b493e2fb472307997576eef33cce784594070f44 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0162155..6866e72 100644
+index 13c2bc0..0b6ca1d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.9, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.10, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.9.bb b/meta/recipes-extended/ethtool/ethtool_5.10.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.9.bb
rename to meta/recipes-extended/ethtool/ethtool_5.10.bb
index 2d2f9b77f0..5c0df3acbc 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.9.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "f934a830554c46d7d60b1a9147f4cab15589b7e09344c4b79b1948b740f0a725"
+SRC_URI[sha256sum] = "4b86adb3ed913c1ef14a276301981f696ab4ec360c19f0a5b68235c4756abae5"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.20.1


--===============3035904887661000225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3581792 to 3649540 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 37297 to 37518 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1374084 to 1394764 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1185109 to 1200868 (+1%)
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.9 [default] to 5.10 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 530864 to 543244 (+2%)
packages/core2-32-poky-linux/ethtool: PV changed from "5.9" to "5.10"
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.9.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.10.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.9 [default] to 5.10 [default]

--===============3035904887661000225==--
