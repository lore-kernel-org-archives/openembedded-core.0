Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.716.1610713822294061518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id BCD5A38C1169
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 5.10.0 SUCCEEDED
Message-ID: <MADEUP.165A67B003996CA0.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146742
Content-Type: multipart/mixed; boundary="===============1385803774815118262=="

--===============1385803774815118262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *5.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-5.9.0-5.10.0.patch
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

--===============1385803774815118262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-5.9.0-5.10.0.patch"

From 040fdb63bbe8b13a38adf6ec5bda2b992c39d961 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 03:07:14 +0000
Subject: [PATCH] iproute2: upgrade 5.9.0 -> 5.10.0

---
 .../iproute2/{iproute2_5.9.0.bb => iproute2_5.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.9.0.bb => iproute2_5.10.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
index 0e6a53e6a4..4be9c82474 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "a25dac94bcdcf2f73316c7f812115ea7a5710580bad892b08a83d00c6b33dacf"
+SRC_URI[sha256sum] = "a54a34ae309c0406b2d1fb3a46158613ffb83d33fefd5d4a27f0010237ac53e9"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.27.0


--===============1385803774815118262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGSIZE changed from 51381 to 51386 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6694680 to 6799920 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGSIZE changed from 194068 to 202260 (+4%)
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGSIZE changed from 91516 to 95612 (+4%)
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3197625 to 3254439 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGSIZE changed from 185236 to 189332 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGSIZE changed from 685015 to 693207 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGSIZE changed from 140668 to 144764 (+3%)
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGSIZE changed from 216823 to 236387 (+9%)
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/iproute2: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.9.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.10.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"

--===============1385803774815118262==--
