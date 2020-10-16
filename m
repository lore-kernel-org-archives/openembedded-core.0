Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12218.1602843682764510359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CB5B938C162D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:21 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2020.10 FAILED
Message-ID: <MADEUP.163E71D65E732D19.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143410
Content-Type: multipart/mixed; boundary="===============8077875097792666761=="

--===============8077875097792666761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2020.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-u-boot-upgrade-2020.07-2020.10.patch
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

--===============8077875097792666761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86-poky-linux/u-boot/u-boot-dev: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-doc: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-locale: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"

--===============8077875097792666761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1353 entries from dependency cache.
Parsing recipes...done.
Parsing of 784 .bb files complete (782 cached, 2 parsed). 1353 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc machine configuration.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8077875097792666761==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2020.07-2020.10.patch"

From d26cbd27da1a394dab0d6d9fe8b0354c0c98683b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Oct 2020 22:35:13 +0000
Subject: [PATCH] u-boot: upgrade 2020.07 -> 2020.10

---
 meta/recipes-bsp/u-boot/u-boot-common.inc |  4 ++--
 meta/recipes-bsp/u-boot/u-boot_2020.07.bb |  4 ----
 meta/recipes-bsp/u-boot/u-boot_2020.10.bb | 25 +++++++++++++++++++++++
 3 files changed, 27 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2020.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2020.10.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 9199bbfe0b..cbce408a28 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -7,12 +7,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
+SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
deleted file mode 100644
index 02d67c0db2..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require u-boot-common.inc
-require u-boot.inc
-
-DEPENDS += "bc-native dtc-native"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.10.bb b/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
new file mode 100644
index 0000000000..0883bf259d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2020.10.bb
@@ -0,0 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Licenses/README
+# +++ Licenses/README
+# @@ -149,5 +149,6 @@
+#  IBM PIBS (PowerPC Initialization and		IBM-pibs			ibm-pibs.txt
+#  	Boot Software) license
+#  ISC License					ISC		Y		isc.txt			https://spdx.org/licenses/ISC
+# +MIT License					MIT		Y		mit.txt			https://spdx.org/licenses/MIT.html
+#  SIL OPEN FONT LICENSE (OFL-1.1)			OFL-1.1		Y		OFL.txt			https://spdx.org/licenses/OFL-1.1.html
+#  X11 License					X11				x11.txt			https://spdx.org/licenses/X11.html
+# 
+#
+
+require u-boot-common.inc
+require u-boot.inc
+
+DEPENDS += "bc-native dtc-native"
+
-- 
2.18.4


--===============8077875097792666761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86-poky-linux/u-boot: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dbg: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-dev: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dev: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-dev: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-doc: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-doc: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-doc: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-env: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-locale: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-locale: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-locale: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-src: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-src: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-src: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot: PKGV changed from 2020.07 [default] to 2020.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2020.07-r0.bin", added "/boot/u-boot-qemux86-2020.10-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot: PV changed from "2020.07" to "2020.10"
packages/qemux86-poky-linux/u-boot/u-boot: PKGSIZE changed from 668301 to 677225 (+1%)

--===============8077875097792666761==--
