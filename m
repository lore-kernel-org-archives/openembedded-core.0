Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.24431.1608473714742252705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3F7EA38C14CD
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.00 SUCCEEDED
Message-ID: <MADEUP.165272527966EB4D.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145955
Content-Type: multipart/mixed; boundary="===============4555590784842721394=="

--===============4555590784842721394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.00* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.11.24-0.12.00.patch
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

--===============4555590784842721394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.11.24.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.00.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5618672 to 5657732 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 49701 to 49890 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2733182 to 2787168 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4081544 to 4097928 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.11.24 [default] to 0.12.00 [default]

--===============4555590784842721394==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.11.24-0.12.00.patch"

From 6757abf3512711ffead8c63c74595f8bec41340c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 03:58:36 +0000
Subject: [PATCH] stress-ng: upgrade 0.11.24 -> 0.12.00

---
 .../stress-ng/{stress-ng_0.11.24.bb => stress-ng_0.12.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.24.bb => stress-ng_0.12.00.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
index 3516c15451..3b38b39893 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "5b3a724a85eed48743dedf37eab851b617ecf921b7fff427c6d0bbf405534671"
+SRC_URI[sha256sum] = "b2b738f574671926654b1623103a7aa58ee6911894ac78760ee188c4bfa96fe2"
 
 DEPENDS = "coreutils-native"
 
-- 
2.20.1


--===============4555590784842721394==--
