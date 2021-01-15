Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.717.1610713822295015794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id D4E0B38C11BE
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] resolvconf: upgrading to 1.87 SUCCEEDED
Message-ID: <MADEUP.165A67B00391EC3A.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146743
Content-Type: multipart/mixed; boundary="===============0514809631554105638=="

--===============0514809631554105638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *resolvconf* to *1.87* has Succeeded.

Next steps:
    - apply the patch: git am 0001-resolvconf-upgrade-1.83-1.87.patch
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

--===============0514809631554105638==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-resolvconf-upgrade-1.83-1.87.patch"

From 682a35f5430c90d7c05965417bf6e1c6d187b6b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 03:32:43 +0000
Subject: [PATCH] resolvconf: upgrade 1.83 -> 1.87

---
 .../resolvconf/{resolvconf_1.83.bb => resolvconf_1.87.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.83.bb => resolvconf_1.87.bb} (96%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
similarity index 96%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
index 33ee553d19..6df96b699c 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
@@ -11,12 +11,12 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
-          "
+           "
 
-SRCREV = "d001dd2b7ce4c854eaa29e46b9640ab66c6e70bb"
+SRCREV = "1dda36d8465e335c60190c41e7185d782da1bd7b"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============0514809631554105638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/resolvconf: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf: SRC_URI changed from "git://salsa.debian.org/debian/resolvconf.git;protocol=https file://fix-path-for-busybox.patch file://99_resolvconf" to "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable file://fix-path-for-busybox.patch file://99_resolvconf"
packages/all-poky-linux/resolvconf: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf-dbg: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf-dbg: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf-dev: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf-dev: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf-doc: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf-doc: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf-locale: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf-locale: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf-src: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf-src: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf-staticdev: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf-staticdev: PKGV changed from 1.83 [default] to 1.87 [default]
packages/all-poky-linux/resolvconf/resolvconf: PKGSIZE changed from 15061 to 15055 (-0%)
packages/all-poky-linux/resolvconf/resolvconf: PV changed from "1.83" to "1.87"
packages/all-poky-linux/resolvconf/resolvconf: PKGV changed from 1.83 [default] to 1.87 [default]

--===============0514809631554105638==--
