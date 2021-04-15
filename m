Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1289.1618510599557339342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 86CCD38C11C9
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.39 SUCCEEDED
Message-ID: <MADEUP.16761AD0AD541E73.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150484
Content-Type: multipart/mixed; boundary="===============4545102384130855841=="

--===============4545102384130855841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.39* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.38-0.39.patch
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

--===============4545102384130855841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/ell (sysroot):
  /usr/include/ell/tester.h was added

--===============4545102384130855841==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-ell-upgrade-0.38-0.39.patch"

From 0dc4b98635c7db09b49b6a47cd19111ffee83f75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:07:07 +0000
Subject: [PATCH] ell: upgrade 0.38 -> 0.39

---
 meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.38.bb
rename to meta/recipes-core/ell/ell_0.39.bb
index 7d3a339978..68ec4cb4a4 100644
--- a/meta/recipes-core/ell/ell_0.38.bb
+++ b/meta/recipes-core/ell/ell_0.39.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
+SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.27.0


--===============4545102384130855841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1395964 to 1413104 (+1%)
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 133528 to 136465 (+2%)
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1261723 to 1284473 (+2%)
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.38 [default] to 0.39 [default]
packages/core2-32-poky-linux/ell/ell: PKGSIZE changed from 507051 to 519339 (+2%)
packages/core2-32-poky-linux/ell: PV changed from "0.38" to "0.39"
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.38.tar.xz file://0001-pem.c-do-not-use-rawmemchr.patch" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.39.tar.xz file://0001-pem.c-do-not-use-rawmemchr.patch"
packages/core2-32-poky-linux/ell: PKGV changed from 0.38 [default] to 0.39 [default]
Changes to packages/core2-32-poky-linux/ell (sysroot):
  /usr/include/ell/tester.h was added

--===============4545102384130855841==--
