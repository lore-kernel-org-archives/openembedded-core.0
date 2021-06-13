Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.16437.1623585061528874541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id DD5DF38C13CB
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.41 SUCCEEDED
Message-ID: <MADEUP.16882202ED28B710.15968@lists.openembedded.org>
X-Groupsio-MsgNum: 152888
Content-Type: multipart/mixed; boundary="===============0532186437888325371=="

--===============0532186437888325371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.40-0.41.patch
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

--===============0532186437888325371==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-ell-upgrade-0.40-0.41.patch"

From 64682bd2691be8a87b6c8c959a63a2732635f8a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 09:12:14 +0000
Subject: [PATCH] ell: upgrade 0.40 -> 0.41

---
 meta/recipes-core/ell/{ell_0.40.bb => ell_0.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.40.bb => ell_0.41.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.40.bb b/meta/recipes-core/ell/ell_0.41.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.40.bb
rename to meta/recipes-core/ell/ell_0.41.bb
index d088676221..5fd3077bc3 100644
--- a/meta/recipes-core/ell/ell_0.40.bb
+++ b/meta/recipes-core/ell/ell_0.41.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "b9bf5c14f2963591ea1372049c05646919a9ed46fcee5cd11ede1022c99ffbbd"
+SRC_URI[sha256sum] = "4e8dba6c53cf152dbd0fd1dc3d4c7b04abf79e20a948895f85943e586870505c"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1


--===============0532186437888325371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1226112 to 1229848 (+0%)
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 136643 to 136835 (+0%)
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1286950 to 1289246 (+0%)
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell/ell: PKGSIZE changed from 519339 to 523435 (+1%)
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell/ell: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell: PKGV changed from 0.40 [default] to 0.41 [default]
packages/core2-32-poky-linux/ell: PV changed from "0.40" to "0.41"
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.40.tar.xz file://0001-pem.c-do-not-use-rawmemchr.patch" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.41.tar.xz file://0001-pem.c-do-not-use-rawmemchr.patch"

--===============0532186437888325371==--
