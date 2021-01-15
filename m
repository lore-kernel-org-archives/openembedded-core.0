Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.722.1610713822881228403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4470C38C13A5
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.01 SUCCEEDED
Message-ID: <MADEUP.165A67B051EB363D.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146770
Content-Type: multipart/mixed; boundary="===============0803664480741612270=="

--===============0803664480741612270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.01* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.00-0.12.01.patch
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

--===============0803664480741612270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.00-0.12.01.patch"

From 815a58bf47d6d907768c299498436428d3bf7e04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:51:40 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.00 -> 0.12.01

---
 .../stress-ng/{stress-ng_0.12.00.bb => stress-ng_0.12.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.00.bb => stress-ng_0.12.01.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
index 3b38b39893..79157c738b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "b2b738f574671926654b1623103a7aa58ee6911894ac78760ee188c4bfa96fe2"
+SRC_URI[sha256sum] = "d354bbbb1500cfe043c761014dc9c3f62779747fafea8a19af94402327f6d3fc"
 
 DEPENDS = "coreutils-native"
 
-- 
2.27.0


--===============0803664480741612270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.00.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.01.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5649060 to 5676956 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 49890 to 50109 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2787168 to 2797548 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.00 [default] to 0.12.01 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4089736 to 4093896 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.00" to "0.12.01"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.00 [default] to 0.12.01 [default]

--===============0803664480741612270==--
