Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.721.1610713822698984232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 339C338C1362
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20210105 SUCCEEDED
Message-ID: <MADEUP.165A67B039C95D35.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146764
Content-Type: multipart/mixed; boundary="===============2063608043617214021=="

--===============2063608043617214021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20210105* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20201217-20210105.patch
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

--===============2063608043617214021==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20201217-20210105.patch"

From 20be451bffbd45f9e8a1a4eaeea6b2fdfaa6df79 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:15:51 +0000
Subject: [PATCH] acpica: upgrade 20201217 -> 20210105

---
 ...{acpica_20201217.bb => acpica_20210105.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20201217.bb => acpica_20210105.bb} (63%)

diff --git a/meta/recipes-extended/acpica/acpica_20201217.bb b/meta/recipes-extended/acpica/acpica_20210105.bb
similarity index 63%
rename from meta/recipes-extended/acpica/acpica_20201217.bb
rename to meta/recipes-extended/acpica/acpica_20210105.bb
index 91bcd8a46d..273bb14088 100644
--- a/meta/recipes-extended/acpica/acpica_20201217.bb
+++ b/meta/recipes-extended/acpica/acpica_20210105.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- source/compiler/aslcompile.c
+# +++ source/compiler/aslcompile.c
+# @@ -2,7 +2,7 @@
+#   *
+#   * 1. Copyright Notice
+#   *
+# - * Some or all of this work - Copyright (c) 1999 - 2020, Intel Corp.
+# + * Some or all of this work - Copyright (c) 1999 - 2021, Intel Corp.
+#   * All rights reserved.
+#   *
+#   * 2. License
+# 
+#
+
 SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
 OS-independent reference implementation of the Advanced Configuration and \
@@ -10,14 +32,14 @@ HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=6adbcb81e9ee6ae50c569b94fe12f7c5"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=c33ce358fdcd142684e41e336b7992e8"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "df6bb667c60577c89df5abe3270539c1b9716b69409d1074d6a7fc5c2fea087b"
+SRC_URI[sha256sum] = "a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0c9b0f6049f996dbb1ff8"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.27.0


--===============2063608043617214021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2063608043617214021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 59 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2063608043617214021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 9047620 to 9045376 (-0%)
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10255707 to 10246726 (-0%)
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica/acpica: PKGSIZE changed from 2598460 to 2598300 (-0%)
packages/core2-32-poky-linux/acpica: PV changed from "20201217" to "20210105"
packages/core2-32-poky-linux/acpica: PKGV changed from 20201217 [default] to 20210105 [default]
packages/core2-32-poky-linux/acpica: SRC_URI changed from "https://acpica.org/sites/acpica/files/acpica-unix-20201217.tar.gz" to "https://acpica.org/sites/acpica/files/acpica-unix-20210105.tar.gz"

--===============2063608043617214021==--
