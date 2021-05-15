Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4462.1621074783108728069
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 371AF38C1283
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 5.12.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED2FAD7E3B.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151774
Content-Type: multipart/mixed; boundary="===============8524177377403707943=="

--===============8524177377403707943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *5.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-5.11.0-5.12.0.patch
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

--===============8524177377403707943==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-5.11.0-5.12.0.patch"

From ec5e8688a7c0b2f8b45348764c389e2341bf9275 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 03:12:39 +0000
Subject: [PATCH] iproute2: upgrade 5.11.0 -> 5.12.0

---
 .../iproute2/{iproute2_5.11.0.bb => iproute2_5.12.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.11.0.bb => iproute2_5.12.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
index e27b42d232..3631123374 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "c5e2ea108212b3445051b35953ec267f9f3469e1d5c67ac034ab559849505c54"
+SRC_URI[sha256sum] = "9d268db98a36ee2a0e3ff3b92b2efff66fc1138a51e409bdef6ab3cfe15f326f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.27.0


--===============8524177377403707943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGSIZE changed from 51386 to 52569 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6124932 to 6183156 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGSIZE changed from 206408 to 218856 (+6%)
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 763355 to 771547 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3287144 to 3316960 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGSIZE changed from 693323 to 701515 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGSIZE changed from 244699 to 248795 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2: PV changed from "5.11.0" to "5.12.0"
packages/core2-32-poky-linux/iproute2: PKGV changed from 5.11.0 [default] to 5.12.0 [default]
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.11.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.12.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"

--===============8524177377403707943==--
