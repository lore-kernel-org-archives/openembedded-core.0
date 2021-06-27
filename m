Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5827.1624805202599634219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id DECA538C127E
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.11 SUCCEEDED
Message-ID: <MADEUP.168C77B92978FBFD.17375@lists.openembedded.org>
X-Groupsio-MsgNum: 153304
Content-Type: multipart/mixed; boundary="===============6450763051723554572=="

--===============6450763051723554572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.10-0.12.11.patch
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

--===============6450763051723554572==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.10-0.12.11.patch"

From dfbb8efcb3ff7bd595d9444cf8833b0fb33acffd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 12:24:40 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.10 -> 0.12.11

---
 .../stress-ng/{stress-ng_0.12.10.bb => stress-ng_0.12.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.10.bb => stress-ng_0.12.11.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
index 7b06f00616..d0cf45f42d 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.10.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "bd167b6559fa8a28680371b1defd3ffe2344eb550129d58dd7d5e2d568f2786e"
+SRC_URI[sha256sum] = "971393075321c24c3d5769acfabb705911d1f411ced5937b7cfea58528c1b4e6"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1


--===============6450763051723554572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.10.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.11.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5541580 to 5566620 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 52438 to 52596 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 3020341 to 3044022 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.10" to "0.12.11"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4164296 to 4168968 (+0%)

--===============6450763051723554572==--
