Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1292.1618510600131742405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A0FF238C1423
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.06 SUCCEEDED
Message-ID: <MADEUP.16761AD129CFBEAA.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150531
Content-Type: multipart/mixed; boundary="===============7295878854630540513=="

--===============7295878854630540513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.06* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.05-0.12.06.patch
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

--===============7295878854630540513==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.05-0.12.06.patch"

From 7908b96184dd560ffc066c84c04b7946fe21e3bc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 09:23:44 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.05 -> 0.12.06

---
 .../stress-ng/{stress-ng_0.12.05.bb => stress-ng_0.12.06.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.05.bb => stress-ng_0.12.06.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
index eb6bdb4a81..7e9135ad01 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
+SRC_URI[sha256sum] = "75eb340266b1bbae944d8f9281af978bd5bc2c8085df97a098d5500d6f177296"
 
 DEPENDS = "coreutils-native"
 
-- 
2.27.0


--===============7295878854630540513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.05.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.06.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5830636 to 5810744 (-0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 51286 to 51425 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2910603 to 2911237 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.05 [default] to 0.12.06 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4139368 to 4131176 (-0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.05" to "0.12.06"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.05 [default] to 0.12.06 [default]

--===============7295878854630540513==--
