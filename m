Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5911.1626056248346640616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 35FCA38C1178
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 5.13.0 SUCCEEDED
Message-ID: <MADEUP.1690E98AF2FC8735.2174@lists.openembedded.org>
X-Groupsio-MsgNum: 153735
Content-Type: multipart/mixed; boundary="===============1660115967190657652=="

--===============1660115967190657652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *5.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-5.12.0-5.13.0.patch
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

--===============1660115967190657652==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-5.12.0-5.13.0.patch"

From 2f2799d16e32fb371e6bc1e159581d184a221c8f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 19:04:43 +0000
Subject: [PATCH] iproute2: upgrade 5.12.0 -> 5.13.0

---
 .../iproute2/{iproute2_5.12.0.bb => iproute2_5.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.12.0.bb => iproute2_5.13.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
index 3631123374..b117637e36 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "9d268db98a36ee2a0e3ff3b92b2efff66fc1138a51e409bdef6ab3cfe15f326f"
+SRC_URI[sha256sum] = "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.20.1


--===============1660115967190657652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6183916 to 6221204 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGSIZE changed from 95672 to 99768 (+4%)
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 771547 to 779748 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3316960 to 3370588 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGSIZE changed from 193488 to 197584 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGSIZE changed from 148920 to 157192 (+6%)
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 5.12.0 [default] to 5.13.0 [default]
packages/core2-32-poky-linux/iproute2: PV changed from "5.12.0" to "5.13.0"
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.12.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.13.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"
packages/core2-32-poky-linux/iproute2: PKGV changed from 5.12.0 [default] to 5.13.0 [default]

--===============1660115967190657652==--
