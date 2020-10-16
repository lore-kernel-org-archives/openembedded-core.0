Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12527.1602843683710868102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 85D3038C1790
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] orc: upgrading to 0.4.32 SUCCEEDED
Message-ID: <MADEUP.163E71D6B15CE16F.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143444
Content-Type: multipart/mixed; boundary="===============5531232314624576081=="

--===============5531232314624576081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *orc* to *0.4.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.31-0.4.32.patch
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

--===============5531232314624576081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-dev: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-doc: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-examples: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-locale: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-staticdev: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
Changes to packages/core2-32-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.31.0 to liborc-0.4.so.0.32.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.31.0 to liborc-test-0.4.so.0.32.0
  /usr/lib/liborc-0.4.so.0.31.0 moved to /usr/lib/liborc-0.4.so.0.32.0
  /usr/lib/liborc-test-0.4.so.0.31.0 moved to /usr/lib/liborc-test-0.4.so.0.32.0

--===============5531232314624576081==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.31-0.4.32.patch"

From d7361d0f38a688045eb8253fb475bd78c8177997 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:52:30 +0000
Subject: [PATCH] orc: upgrade 0.4.31 -> 0.4.32

---
 meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.31.bb b/meta/recipes-devtools/orc/orc_0.4.32.bb
similarity index 86%
rename from meta/recipes-devtools/orc/orc_0.4.31.bb
rename to meta/recipes-devtools/orc/orc_0.4.32.bb
index cd4dc31d70..a55b43b8ef 100644
--- a/meta/recipes-devtools/orc/orc_0.4.31.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.32.bb
@@ -4,8 +4,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[md5sum] = "b6b95a47eff713e91873e2c2b1a5b3ad"
-SRC_URI[sha256sum] = "a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075"
+SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.18.4


--===============5531232314624576081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/orc: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/liborc-0.4: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/liborc-0.4: FILES: removed "/usr/lib/liborc-0.4.so.0.31.0", added "/usr/lib/liborc-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/liborc-0.4: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/liborc-test-0.4: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/liborc-test-0.4: FILES: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/liborc-test-0.4: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-dbg: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-dbg: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-dbg: PKGSIZE changed from 1278276 to 1277020 (-0%)
packages/core2-32-poky-linux/orc/orc-dbg: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-dev: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-dev: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-dev: PKGSIZE changed from 164170 to 164215 (+0%)
packages/core2-32-poky-linux/orc/orc-dev: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-doc: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-doc: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-doc: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-examples: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-examples: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-examples: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-locale: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-locale: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-locale: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-src: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-src: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-src: PKGSIZE changed from 1266867 to 1270822 (+0%)
packages/core2-32-poky-linux/orc/orc-src: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc-staticdev: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc-staticdev: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc-staticdev: PKGSIZE changed from 86290 to 86266 (-0%)
packages/core2-32-poky-linux/orc/orc-staticdev: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
packages/core2-32-poky-linux/orc/orc: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.31.0", added "/usr/lib/liborc-test-0.4.so.0.32.0"
packages/core2-32-poky-linux/orc/orc: PV changed from "0.4.31" to "0.4.32"
packages/core2-32-poky-linux/orc/orc: PKGV changed from 0.4.31 [default] to 0.4.32 [default]
Changes to packages/core2-32-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.31.0 to liborc-0.4.so.0.32.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.31.0 to liborc-test-0.4.so.0.32.0
  /usr/lib/liborc-0.4.so.0.31.0 moved to /usr/lib/liborc-0.4.so.0.32.0
  /usr/lib/liborc-test-0.4.so.0.31.0 moved to /usr/lib/liborc-test-0.4.so.0.32.0

--===============5531232314624576081==--
