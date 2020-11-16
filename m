Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.39235.1605551304141925008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 53E7738C13AC
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.11.24 SUCCEEDED
Message-ID: <MADEUP.1648106797DC7032.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144649
Content-Type: multipart/mixed; boundary="===============6491087324121825971=="

--===============6491087324121825971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.11.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.11.23-0.11.24.patch
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

--===============6491087324121825971==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.11.23-0.11.24.patch"

From 77b6ce1181fbe3bd857c88c67cf7402a204e773b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 15:09:29 +0000
Subject: [PATCH] stress-ng: upgrade 0.11.23 -> 0.11.24

---
 .../stress-ng/{stress-ng_0.11.23.bb => stress-ng_0.11.24.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.23.bb => stress-ng_0.11.24.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
index f09bb24737..3516c15451 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "c0a76147a02f4c31af1fb4b9b7e0b90ac8bbd8590ccb54264d5cbe046c769cd2"
+SRC_URI[sha256sum] = "5b3a724a85eed48743dedf37eab851b617ecf921b7fff427c6d0bbf405534671"
 
 DEPENDS = "coreutils-native"
 
-- 
2.20.1


--===============6491087324121825971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.11.23.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.11.24.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5598668 to 5618672 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2716457 to 2733182 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.11.23" to "0.11.24"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.11.23 [default] to 0.11.24 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4073352 to 4081544 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.11.23" to "0.11.24"

--===============6491087324121825971==--
