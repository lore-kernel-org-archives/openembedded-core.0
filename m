Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.5212.1613463848681847767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6EB7D38C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.03 SUCCEEDED
Message-ID: <MADEUP.16642CD3150CC558.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148131
Content-Type: multipart/mixed; boundary="===============1708694027646917804=="

--===============1708694027646917804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.02-0.12.03.patch
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

--===============1708694027646917804==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.02-0.12.03.patch"

From 81e8e3b103dab48078baf53c4609a33f094dbf3a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:37:28 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.02 -> 0.12.03

---
 .../stress-ng/{stress-ng_0.12.02.bb => stress-ng_0.12.03.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.02.bb => stress-ng_0.12.03.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
index a5851b43f2..73539c9268 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "f847be115f60d3ad7d37c806fd1bfb1412aa3c631fca581d6dc233322f50d6a5"
+SRC_URI[sha256sum] = "f27ff439b76a17641291d4234c73655cddcb0a5a588441d6ade290b06ca4b805"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1


--===============1708694027646917804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.02.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.03.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5708280 to 5791652 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 50725 to 51000 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2824847 to 2882940 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.02" to "0.12.03"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4106372 to 4135332 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.02 [default] to 0.12.03 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.02" to "0.12.03"

--===============1708694027646917804==--
