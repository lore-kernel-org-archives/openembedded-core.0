Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5880.1626056248727241533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 779E138C127B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.13 SUCCEEDED
Message-ID: <MADEUP.1690E98B0ABA0178.2174@lists.openembedded.org>
X-Groupsio-MsgNum: 153744
Content-Type: multipart/mixed; boundary="===============0691133369763476320=="

--===============0691133369763476320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.12-5.13.patch
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

--===============0691133369763476320==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-5.12-5.13.patch"

From 905960f4fd0217bc93b98168d2e421a2d4adce21 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 20:10:16 +0000
Subject: [PATCH] ethtool: upgrade 5.12 -> 5.13

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.12.bb => ethtool_5.13.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.12.bb => ethtool_5.13.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index b3f3de4a16..3b639ebb67 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From b493e2fb472307997576eef33cce784594070f44 Mon Sep 17 00:00:00 2001
+From e652ccd8965895087887c270fc0d380b61f96b11 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 13c2bc0..0b6ca1d 100644
+index 6b620bf..ff62b2a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.12, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.13, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.12.bb b/meta/recipes-extended/ethtool/ethtool_5.13.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.12.bb
rename to meta/recipes-extended/ethtool/ethtool_5.13.bb
index df7dd47748..8f6a7904a2 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.12.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.13.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "7ca623cc1dd25ba66531573da6a11f1ecde9b62b00742d9ba54f9ba983439bfa"
+SRC_URI[sha256sum] = "e66ab0d74d2a888fd64a0053290dbea66ddc9b75b3d21d117b7edd9576b9db60"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.20.1


--===============0691133369763476320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3153940 to 3318280 (+5%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 37567 to 38463 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1390973 to 1433439 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1202432 to 1243902 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 539208 to 555600 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.12.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.13.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PV changed from "5.12" to "5.13"

--===============0691133369763476320==--
