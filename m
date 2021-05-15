Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4568.1621074783566007917
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 33A6738C140D
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.9.3 SUCCEEDED
Message-ID: <MADEUP.167F36EDE5D121D2.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151849
Content-Type: multipart/mixed; boundary="===============5094518011598897958=="

--===============5094518011598897958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgcrypt* to *1.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.9.2-1.9.3.patch
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

--===============5094518011598897958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgcrypt/dumpsexp-dev: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dev: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-doc: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-locale: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-staticdev: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
Changes to packages/core2-32-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so.20.3.2 moved to /usr/lib/libgcrypt.so.20.3.3
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so.20.3.2 moved to /usr/lib/libgcrypt.so.20.3.3

--===============5094518011598897958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.9.2-1.9.3.patch"

From 54f1c82772c51afd95bbbd45bdc6becfc76a98e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 10:08:40 +0000
Subject: [PATCH] libgcrypt: upgrade 1.9.2 -> 1.9.3

---
 ...{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb} | 74 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb} (43%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
similarity index 43%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
index 34735ea5d7..0227fa0a5e 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
@@ -1,3 +1,73 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSES
+# +++ LICENSES
+# @@ -54,7 +54,6 @@
+#    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+#    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+#  #+end_quote
+# -
+#  
+#    For files:
+#    - random/jitterentropy-base.c
+# @@ -100,6 +99,48 @@
+#   * DAMAGE.
+#  #+end_quote
+#  
+# +  For files:
+# +  - cipher/cipher-gcm-ppc.c
+# +
+# +#+begin_quote
+# + Copyright (c) 2006, CRYPTOGAMS by <appro@openssl.org>
+# + All rights reserved.
+# +
+# + Redistribution and use in source and binary forms, with or without
+# + modification, are permitted provided that the following conditions
+# + are met:
+# +
+# +       * Redistributions of source code must retain copyright notices,
+# +         this list of conditions and the following disclaimer.
+# +
+# +       * Redistributions in binary form must reproduce the above
+# +         copyright notice, this list of conditions and the following
+# +         disclaimer in the documentation and/or other materials
+# +         provided with the distribution.
+# +
+# +       * Neither the name of the CRYPTOGAMS nor the names of its
+# +         copyright holder and contributors may be used to endorse or
+# +         promote products derived from this software without specific
+# +         prior written permission.
+# +
+# + ALTERNATIVELY, provided that this notice is retained in full, this
+# + product may be distributed under the terms of the GNU General Public
+# + License (GPL), in which case the provisions of the GPL apply INSTEAD OF
+# + those given above.
+# +
+# + THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
+# + "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# + LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# + A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# + OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# + SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# + LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# + DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# + THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# + (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# + OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +#+end_quote
+# +
+#  * X License
+#  
+#    For files:
+# 
+#
+
 SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
 DESCRIPTION = "A cryptography library developed as a separated module of GnuPG. \
 It can also be used independently of GnuPG, but depends on its error-reporting \
@@ -14,7 +84,7 @@ LICENSE_dumpsexp-dev = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://LICENSES;md5=2dae15d91a37cfde72fe9eae75f8ea14 \
+                    file://LICENSES;md5=42fa35a25e138166cc40588387f9159d \
                     "
 
 DEPENDS = "libgpg-error"
@@ -27,7 +97,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0001-Makefile.am-add-a-missing-space.patch \
            "
-SRC_URI[sha256sum] = "b2c10d091513b271e47177274607b1ffba3d95b188bbfa8797f948aec9053c5a"
+SRC_URI[sha256sum] = "97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
-- 
2.27.0


--===============5094518011598897958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgcrypt/dumpsexp-dev: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/dumpsexp-dev: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/dumpsexp-dev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.2.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-Makefile.am-add-a-missing-space.patch" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.3.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-Makefile.am-add-a-missing-space.patch"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 3621848 to 3625580 (+0%)
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dev: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt-dev: PKGSIZE changed from 94331 to 94330 (-0%)
packages/core2-32-poky-linux/libgcrypt/libgcrypt-doc: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt-doc: PKGSIZE changed from 338689 to 338799 (+0%)
packages/core2-32-poky-linux/libgcrypt/libgcrypt-locale: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt-src: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 2949996 to 2962527 (+0%)
packages/core2-32-poky-linux/libgcrypt/libgcrypt-staticdev: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.3.2", added "/usr/lib/libgcrypt.so.20.3.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/libgcrypt/libgcrypt: PKGSIZE changed from 1019143 to 1019207 (+0%)
Changes to packages/core2-32-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so.20.3.2 moved to /usr/lib/libgcrypt.so.20.3.3
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.3.2 to libgcrypt.so.20.3.3
  /usr/lib/libgcrypt.so.20.3.2 moved to /usr/lib/libgcrypt.so.20.3.3

--===============5094518011598897958==--
