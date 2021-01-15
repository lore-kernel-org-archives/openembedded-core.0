Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.720.1610713822581751963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3F4B938C139D
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.22 SUCCEEDED
Message-ID: <MADEUP.165A67B03EDDEF6B.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146778
Content-Type: multipart/mixed; boundary="===============5972130180735257097=="

--===============5972130180735257097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lzip* to *1.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzip-upgrade-1.21-1.22.patch
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

--===============5972130180735257097==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-lzip-upgrade-1.21-1.22.patch"

From e6b9ed25b91fd7b7acc0606c22de7948c0bc5d43 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:41:27 +0000
Subject: [PATCH] lzip: upgrade 1.21 -> 1.22

---
 .../lzip/{lzip_1.21.bb => lzip_1.22.bb}       | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.21.bb => lzip_1.22.bb} (35%)

diff --git a/meta/recipes-extended/lzip/lzip_1.21.bb b/meta/recipes-extended/lzip/lzip_1.22.bb
similarity index 35%
rename from meta/recipes-extended/lzip/lzip_1.21.bb
rename to meta/recipes-extended/lzip/lzip_1.22.bb
index bb3d2a6fe3..05bfb6956a 100644
--- a/meta/recipes-extended/lzip/lzip_1.21.bb
+++ b/meta/recipes-extended/lzip/lzip_1.22.bb
@@ -1,13 +1,51 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- decoder.cc
+# +++ decoder.cc
+# @@ -1,14 +1,14 @@
+#  
+# -    This program is free software: you can redistribute it and/or modify
+# -    it under the terms of the GNU General Public License as published by
+# -    the Free Software Foundation, either version 2 of the License, or
+# -    (at your option) any later version.
+# +   This program is free software: you can redistribute it and/or modify
+# +   it under the terms of the GNU General Public License as published by
+# +   the Free Software Foundation, either version 2 of the License, or
+# +   (at your option) any later version.
+#  
+# -    This program is distributed in the hope that it will be useful,
+# -    but WITHOUT ANY WARRANTY; without even the implied warranty of
+# -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# -    GNU General Public License for more details.
+# +   This program is distributed in the hope that it will be useful,
+# +   but WITHOUT ANY WARRANTY; without even the implied warranty of
+# +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# +   GNU General Public License for more details.
+#  
+# -    You should have received a copy of the GNU General Public License
+# -    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+# +   You should have received a copy of the GNU General Public License
+# +   along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#  */
+# 
+#
+
 SUMMARY = "Lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://decoder.cc;beginline=3;endline=16;md5=db09fe3f9573f94d0076f7f07959e6e1"
+                    file://decoder.cc;beginline=3;endline=16;md5=18c279060cd0be128188404b45837f88 \
+                    "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[md5sum] = "c0061730d017ea593a09308edc547128"
-SRC_URI[sha256sum] = "e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b"
+SRC_URI[sha256sum] = "c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.27.0


--===============5972130180735257097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.21.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.22.tar.gz"
packages/core2-32-poky-linux/lzip: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1085032 to 1097160 (+1%)
packages/core2-32-poky-linux/lzip/lzip-dbg: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip-dbg: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip-dev: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip-dev: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip-doc: PKGSIZE changed from 65677 to 70680 (+8%)
packages/core2-32-poky-linux/lzip/lzip-doc: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip-doc: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip-locale: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip-locale: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip-src: PKGSIZE changed from 145017 to 146842 (+1%)
packages/core2-32-poky-linux/lzip/lzip-src: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip-src: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip-staticdev: PV changed from "1.21" to "1.22"
packages/core2-32-poky-linux/lzip/lzip: PKGSIZE changed from 132928 to 137028 (+3%)
packages/core2-32-poky-linux/lzip/lzip: PKGV changed from 1.21 [default] to 1.22 [default]
packages/core2-32-poky-linux/lzip/lzip: PV changed from "1.21" to "1.22"

--===============5972130180735257097==--
