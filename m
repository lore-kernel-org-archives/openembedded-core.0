Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.26024.1623000257626763452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 868B438C126E
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.18.0 SUCCEEDED
Message-ID: <MADEUP.16860E22C322FFBB.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152719
Content-Type: multipart/mixed; boundary="===============1294765846505284787=="

--===============1294765846505284787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.17.3-1.18.0.patch
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

--===============1294765846505284787==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.17.3-1.18.0.patch"

From ccac9240d6c1a7407e49a1ddf513c4a328a75890 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 14:14:18 +0000
Subject: [PATCH] libinput: upgrade 1.17.3 -> 1.18.0

---
 ...{libinput_1.17.3.bb => libinput_1.18.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.17.3.bb => libinput_1.18.0.bb} (66%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.17.3.bb b/meta/recipes-graphics/wayland/libinput_1.18.0.bb
similarity index 66%
rename from meta/recipes-graphics/wayland/libinput_1.17.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.18.0.bb
index ef19146f79..d1dbace93b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.17.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.18.0.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -31,4 +31,4 @@
+#  version libinput is compiled against. The header is used during compilation
+#  only, libinput does not link against GPL libraries.
+#  
+# -[1] https://gitlab.freedesktop.org/libinput/libinput/blob/master/include/linux/input.h
+# +[1] https://gitlab.freedesktop.org/libinput/libinput/blob/main/include/linux/input.h
+# 
+#
+
 SUMMARY = "Library to handle input devices in Wayland compositors"
 DESCRIPTION = "libinput is a library to handle input devices in Wayland \
 compositors and to provide a generic X.Org input driver. It provides \
@@ -8,7 +27,7 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev libcheck"
 
@@ -16,7 +35,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac"
+SRC_URI[sha256sum] = "18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


--===============1294765846505284787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: SRC_URI changed from "http://www.freedesktop.org/software/libinput/libinput-1.17.3.tar.xz file://run-ptest file://determinism.patch" to "http://www.freedesktop.org/software/libinput/libinput-1.18.0.tar.xz file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4334092 to 4358256 (+1%)
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGSIZE changed from 41407 to 42556 (+3%)
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1191414 to 1195766 (+0%)
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3224521 to 3239478 (+0%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.17.3 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.17.3" to "1.18.0"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1053188 to 1071074 (+2%)
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.17.3 [default] to 1.18.0 [default]

--===============1294765846505284787==--
