Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.16423.1623585061547364899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7193A38C1402
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.10 SUCCEEDED
Message-ID: <MADEUP.1688220300126740.15968@lists.openembedded.org>
X-Groupsio-MsgNum: 152902
Content-Type: multipart/mixed; boundary="===============6049954075576448855=="

--===============6049954075576448855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.09-0.12.10.patch
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

--===============6049954075576448855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.09.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.10.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5533404 to 5551652 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 3005065 to 3020341 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.09" to "0.12.10"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4160232 to 4168424 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.09 [default] to 0.12.10 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.09" to "0.12.10"

--===============6049954075576448855==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.09-0.12.10.patch"

From d78bbffdd03816df948632977c388a294fd0bb75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 10:07:43 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.09 -> 0.12.10

---
 .../stress-ng/{stress-ng_0.12.09.bb => stress-ng_0.12.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.09.bb => stress-ng_0.12.10.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
index f7e5f03e78..7b06f00616 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.09.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "cffac091082c7adbfec649be3c66941c3d622f8b96795656bcce2e20d669cfeb"
+SRC_URI[sha256sum] = "bd167b6559fa8a28680371b1defd3ffe2344eb550129d58dd7d5e2d568f2786e"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1


--===============6049954075576448855==--
