Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.723.1610713823240905993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3821138C1377
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libarchive: upgrading to 3.5.1 SUCCEEDED
Message-ID: <MADEUP.165A67B03AA42E47.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146772
Content-Type: multipart/mixed; boundary="===============8756046296973651089=="

--===============8756046296973651089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libarchive* to *3.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libarchive-upgrade-3.4.3-3.5.1.patch
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

--===============8756046296973651089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libarchive/bsdcpio: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/bsdtar: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-dev: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-doc: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-locale: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-staticdev: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
Changes to packages/core2-32-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.4.3 to libarchive.so.13.5.1
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.4.3 to libarchive.so.13.5.1
  /usr/lib/libarchive.so.13.4.3 moved to /usr/lib/libarchive.so.13.5.1

--===============8756046296973651089==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libarchive-upgrade-3.4.3-3.5.1.patch"

From 07d9e448b271ed0352d8adba8ca5f76415088030 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:27:38 +0000
Subject: [PATCH] libarchive: upgrade 3.4.3 -> 3.5.1

---
 ...ibarchive_3.4.3.bb => libarchive_3.5.1.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.4.3.bb => libarchive_3.5.1.bb} (70%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.3.bb b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
similarity index 70%
rename from meta/recipes-extended/libarchive/libarchive_3.4.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.1.bb
index dbfc067b93..c0258a91ef 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
@@ -1,9 +1,30 @@
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
+# @@ -15,7 +15,6 @@
+#  * The following source files are also subject in whole or in part to
+#    a 3-clause UC Regents copyright; please read the individual source
+#    files for details:
+# -   libarchive/archive_entry.c
+#     libarchive/archive_read_support_filter_compress.c
+#     libarchive/archive_write_add_filter_compress.c
+#     libarchive/mtree.5
+# 
+#
+
 SUMMARY = "Support for reading various archive formats"
 DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fe01f5e02b1f0cc934d593a7b0ddceb6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -34,7 +55,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ee1e749213c108cb60d53147f18c31a73d6717d7e3d2481c157e1b34c881ea39"
+SRC_URI[sha256sum] = "9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.27.0


--===============8756046296973651089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libarchive/bsdcpio: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/bsdcpio: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/bsdcpio: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/bsdtar: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/bsdtar: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/bsdtar: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive: SRC_URI changed from "http://libarchive.org/downloads/libarchive-3.4.3.tar.gz" to "http://libarchive.org/downloads/libarchive-3.5.1.tar.gz"
packages/core2-32-poky-linux/libarchive/libarchive-dbg: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive-dbg: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-dbg: PKGSIZE changed from 2664768 to 2681024 (+1%)
packages/core2-32-poky-linux/libarchive/libarchive-dbg: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-dev: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive-dev: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-dev: PKGSIZE changed from 86300 to 87251 (+1%)
packages/core2-32-poky-linux/libarchive/libarchive-dev: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-doc: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive-doc: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-doc: PKGSIZE changed from 359190 to 360394 (+0%)
packages/core2-32-poky-linux/libarchive/libarchive-doc: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-locale: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive-locale: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-locale: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-src: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive-src: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-src: PKGSIZE changed from 3452003 to 3470278 (+1%)
packages/core2-32-poky-linux/libarchive/libarchive-src: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-staticdev: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive-staticdev: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive-staticdev: PV changed from "3.4.3" to "3.5.1"
packages/core2-32-poky-linux/libarchive/libarchive: PKGV changed from 3.4.3 [default] to 3.5.1 [default]
packages/core2-32-poky-linux/libarchive/libarchive: FILELIST: removed "/usr/lib/libarchive.so.13.4.3", added "/usr/lib/libarchive.so.13.5.1"
packages/core2-32-poky-linux/libarchive/libarchive: PKGSIZE changed from 871088 to 875184 (+0%)
packages/core2-32-poky-linux/libarchive/libarchive: PV changed from "3.4.3" to "3.5.1"
Changes to packages/core2-32-poky-linux/libarchive (sysroot):
  /usr/lib/libarchive.so.13 changed symlink target from libarchive.so.13.4.3 to libarchive.so.13.5.1
  /usr/lib/libarchive.so changed symlink target from libarchive.so.13.4.3 to libarchive.so.13.5.1
  /usr/lib/libarchive.so.13.4.3 moved to /usr/lib/libarchive.so.13.5.1

--===============8756046296973651089==--
