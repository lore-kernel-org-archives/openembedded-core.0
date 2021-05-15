Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4463.1621074783402865640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 93D1238C13E2
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 2.1.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED92C147F1.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151810
Content-Type: multipart/mixed; boundary="===============8998987704029656152=="

--===============8998987704029656152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjpeg-turbo* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjpeg-turbo-upgrade-2.0.6-2.1.0.patch
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

--===============8998987704029656152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 213592 to 238168 (+12%)
Changes to packages/core2-32-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/cmake was added
  /usr/lib/cmake/libjpeg-turbo was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboConfig.cmake was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboConfigVersion.cmake was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboTargets.cmake was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboTargets-release.cmake was added

--===============8998987704029656152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-2.0.6-2.1.0.patch"

From 683abecf937a52d4a6646a996e1eb74197d46e7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 06:52:32 +0000
Subject: [PATCH] libjpeg-turbo: upgrade 2.0.6 -> 2.1.0

---
 ...-turbo_2.0.6.bb => libjpeg-turbo_2.1.0.bb} | 50 +++++++++++++++++--
 1 file changed, 45 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.6.bb => libjpeg-turbo_2.1.0.bb} (59%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
similarity index 59%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
index 0bd6af8db9..e422ee50c6 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
@@ -1,12 +1,53 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- cdjpeg.h
+# +++ cdjpeg.h
+# @@ -3,11 +3,11 @@
+#   *
+#   * This file was part of the Independent JPEG Group's software:
+#   * Copyright (C) 1994-1997, Thomas G. Lane.
+# + * Modified 2019 by Guido Vollbeding.
+#   * libjpeg-turbo Modifications:
+# - * Copyright (C) 2017, D. R. Commander.
+# + * Copyright (C) 2017, 2019, 2021, D. R. Commander.
+#   * For conditions of distribution and use, see the accompanying README.ijg
+#   * file.
+#   *
+#   * This file contains common declarations for the sample applications
+#   * cjpeg and djpeg.  It is NOT used by the core JPEG library.
+# - */
+# --- djpeg.c
+# +++ djpeg.c
+# @@ -3,9 +3,9 @@
+#   *
+#   * This file was part of the Independent JPEG Group's software:
+#   * Copyright (C) 1991-1997, Thomas G. Lane.
+# - * Modified 2013 by Guido Vollbeding.
+# + * Modified 2013-2019 by Guido Vollbeding.
+#   * libjpeg-turbo Modifications:
+# - * Copyright (C) 2010-2011, 2013-2017, 2020, D. R. Commander.
+# + * Copyright (C) 2010-2011, 2013-2017, 2019-2020, D. R. Commander.
+#   * Copyright (C) 2015, Google, Inc.
+#   * For conditions of distribution and use, see the accompanying README.ijg
+#   * file.
+# 
+#
+
 SUMMARY = "Hardware accelerated JPEG compression/decompression library"
 DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8a61af33cc1c681cd5cc297150bbb5bd \
                     file://jpeglib.h;endline=16;md5=52b5eaade8d5b6a452a7693dfe52c084 \
-                    file://djpeg.c;endline=11;md5=302e980133b5c0c7f4dcb4ca0df41090 \
-"
+                    file://djpeg.c;endline=11;md5=b61f01ad6aff437b34d1f9e8004280a4 \
+                    "
 DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target = " nasm-native"
 
@@ -14,8 +55,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "4cada3f0bdc93d826fa31bf9e4469ef6"
-SRC_URI[sha256sum] = "d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb"
+SRC_URI[sha256sum] = "bef89803e506f27715c5627b1e3219c95b80fc31465d4452de2a909d382e4444"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.27.0


--===============8998987704029656152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 213592 to 238168 (+12%)
packages/core2-32-poky-linux/libjpeg-turbo: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo: SRC_URI changed from "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-2.0.6.tar.gz file://0001-libjpeg-turbo-fix-package_qa-error.patch" to "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-2.1.0.tar.gz file://0001-libjpeg-turbo-fix-package_qa-error.patch"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 2929112 to 2891256 (-1%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 157253 to 166094 (+6%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 375080 to 380020 (+1%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2048225 to 2132473 (+4%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 566629 to 583013 (+3%)
packages/core2-32-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "2.0.6" to "2.1.0"
packages/core2-32-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 2.0.6 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 644645 to 669221 (+4%)
Changes to packages/core2-32-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/cmake was added
  /usr/lib/cmake/libjpeg-turbo was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboConfig.cmake was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboConfigVersion.cmake was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboTargets.cmake was added
  /usr/lib/cmake/libjpeg-turbo/libjpeg-turboTargets-release.cmake was added

--===============8998987704029656152==--
