Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12223.1602843683395098785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id BEBB638C17AC
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.9 SUCCEEDED
Message-ID: <MADEUP.163E71D6BC671F6D.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143446
Content-Type: multipart/mixed; boundary="===============4827737934246491367=="

--===============4827737934246491367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.8-5.9.patch
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

--===============4827737934246491367==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-ethtool-upgrade-5.8-5.9.patch"

From fc7b93b7bfc9f795b0a0b4268e1a96702815552c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 05:49:12 +0000
Subject: [PATCH] ethtool: upgrade 5.8 -> 5.9

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.8.bb => ethtool_5.9.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.8.bb => ethtool_5.9.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 75a3841f2d..673b35033f 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From afecc8791f904dc1893858d68a642b491356c74b Mon Sep 17 00:00:00 2001
+From 538bd5ec36d88f17803cb848cbbfe62ad51fc2f4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 19223f7..8a58d15 100644
+index 0162155..6866e72 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.8, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.9, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.8.bb b/meta/recipes-extended/ethtool/ethtool_5.9.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.8.bb
rename to meta/recipes-extended/ethtool/ethtool_5.9.bb
index 0403f0e3a9..2d2f9b77f0 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.8.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "91e8bbda48a7fd5d374efacca542364ceb3a6c1f286f024b64ec40ccc799e125"
+SRC_URI[sha256sum] = "f934a830554c46d7d60b1a9147f4cab15589b7e09344c4b79b1948b740f0a725"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.18.4


--===============4827737934246491367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3465312 to 3581792 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 36135 to 37297 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1341611 to 1374084 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1135319 to 1185109 (+4%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 518576 to 530864 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/ethtool: PV changed from "5.8" to "5.9"

--===============4827737934246491367==--
