Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5904.1626056248794635610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7EC7638C1283
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.12 SUCCEEDED
Message-ID: <MADEUP.1690E98B0E0CB8B6.27803@lists.openembedded.org>
X-Groupsio-MsgNum: 153747
Content-Type: multipart/mixed; boundary="===============7249317942564673401=="

--===============7249317942564673401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.11-0.12.12.patch
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

--===============7249317942564673401==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.11-0.12.12.patch"

From edcfa2bcc2b36e52a01002360e8b211f8fe0b774 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 20:22:46 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.11 -> 0.12.12

---
 .../stress-ng/{stress-ng_0.12.11.bb => stress-ng_0.12.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.11.bb => stress-ng_0.12.12.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
index d0cf45f42d..97eaa75d18 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "971393075321c24c3d5769acfabb705911d1f411ced5937b7cfea58528c1b4e6"
+SRC_URI[sha256sum] = "f27af50f6f2308e707fef927674bdd209a046b116734281b792aeca35a4e4499"
 
 DEPENDS = "coreutils-native"
 
-- 
2.20.1


--===============7249317942564673401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.11.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.12.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5588268 to 5635980 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 52596 to 53420 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 3044022 to 3085586 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.11" to "0.12.12"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.11 [default] to 0.12.12 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4181288 to 4197832 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.11" to "0.12.12"

--===============7249317942564673401==--
