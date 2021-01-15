Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.703.1610713823269131175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 06A4D38C1419
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libevdev: upgrading to 1.10.1 SUCCEEDED
Message-ID: <MADEUP.165A67B0CDCD2B77.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146815
Content-Type: multipart/mixed; boundary="===============6547693562954464581=="

--===============6547693562954464581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libevdev* to *1.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.10.0-1.10.1.patch
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

--===============6547693562954464581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.10.0-1.10.1.patch"

From 22e6f505f2ff6f22a92d010e453866fdab99f50e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 12:12:14 +0000
Subject: [PATCH] libevdev: upgrade 1.10.0 -> 1.10.1

---
 .../libevdev/{libevdev_1.10.0.bb => libevdev_1.10.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.10.0.bb => libevdev_1.10.1.bb} (85%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.10.0.bb b/meta/recipes-support/libevdev/libevdev_1.10.1.bb
similarity index 85%
rename from meta/recipes-support/libevdev/libevdev_1.10.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.10.1.bb
index 2620cbe9f7..353ded6f28 100644
--- a/meta/recipes-support/libevdev/libevdev_1.10.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.10.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
            file://determinism.patch"
-SRC_URI[sha256sum] = "3522c26e2c148be0ad68ce26fbced408a4185dea90bfe8079dc82b8ace962d4a"
+SRC_URI[sha256sum] = "0330fe8357ece915db9366c1b9a6648941aea6f724b73ad6e71401127aa08932"
 
 inherit autotools pkgconfig
 
-- 
2.27.0


--===============6547693562954464581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libevdev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.10.0.tar.xz file://determinism.patch" to "http://www.freedesktop.org/software/libevdev/libevdev-1.10.1.tar.xz file://determinism.patch"
packages/core2-32-poky-linux/libevdev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-dbg: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-dev: PKGSIZE changed from 97579 to 97536 (-0%)
packages/core2-32-poky-linux/libevdev/libevdev-dev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-doc: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-locale: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev-src: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 290688 to 291113 (+0%)
packages/core2-32-poky-linux/libevdev/libevdev-src: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.10.0" to "1.10.1"
packages/core2-32-poky-linux/libevdev/libevdev: PKGV changed from 1.10.0 [default] to 1.10.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev: PV changed from "1.10.0" to "1.10.1"

--===============6547693562954464581==--
