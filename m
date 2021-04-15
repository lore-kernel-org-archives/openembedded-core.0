Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1328.1618510599548439712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8343C38C118E
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus-glib: upgrading to 0.112 SUCCEEDED
Message-ID: <MADEUP.16761AD0AE2FD8DF.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150485
Content-Type: multipart/mixed; boundary="===============1292268314234769724=="

--===============1292268314234769724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus-glib* to *0.112* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-glib-upgrade-0.110-0.112.patch
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

--===============1292268314234769724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/dbus-glib (sysroot):
  /usr/lib/libdbus-glib-1.so.2 changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so.2.3.4 moved to /usr/lib/libdbus-glib-1.so.2.3.5
Changes to packages/x86_64-linux/dbus-glib-native (sysroot):
  /usr/lib/libdbus-glib-1.so.2 changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so.2.3.4 moved to /usr/lib/libdbus-glib-1.so.2.3.5

--===============1292268314234769724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dbus-glib-upgrade-0.110-0.112.patch"

From 00a3914e46643a7c81ff0fe740d32d02315aa07d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:02:56 +0000
Subject: [PATCH] dbus-glib: upgrade 0.110 -> 0.112

---
 ...{dbus-glib_0.110.bb => dbus-glib_0.112.bb} | 73 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 4 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib_0.110.bb => dbus-glib_0.112.bb} (34%)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
similarity index 34%
rename from meta/recipes-core/dbus/dbus-glib_0.110.bb
rename to meta/recipes-core/dbus/dbus-glib_0.112.bb
index 0b45805cf4..ce76133ffb 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -1,10 +1,76 @@
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
+# @@ -1,10 +1,22 @@
+#  The D-Bus glib bindings are licensed to you under your choice of the Academic
+#  Free License version 2.1, or the GNU General Public License version 2.  Both
+# -licenses are included here. Some of the standalone binaries are under the GPL
+# -only; in particular, but not limted to, tests/decode-gcov.c. Each source code
+# -file is marked with the proper copyright information.
+# -
+# -
+# +licenses are included here.
+# +
+# +In SPDX terms, this is:
+# +
+# +SPDX-License-Identifier: AFL-2.1 OR GPL-2.0-or-later
+# +
+# +Exceptions are noted in individual source files. In particular:
+# +
+# +* dbus/dbus-bash-completion-helper.c is licensed more restrictively:
+# +  it is under GPL-2.0-or-later, without the AFL-2.1 dual-license option.
+# +  See that file for details.
+# +
+# +* Some source files are more permissively licensed, with a
+# +  LGPL-2.1-or-later or MIT option, or under the MIT license only.
+# +  See individual source files for details.
+# +
+# +-----------------------------------------------------------------------
+#  
+#  The Academic Free License
+#  v. 2.1
+# @@ -203,6 +215,9 @@
+#  without modification). This ensures that the owner of the copyright to the 
+#  license will control changes. The Apache license contains a copyright notice, 
+#  but the BSD, MIT and UoI/NCSA licenses do not. 
+# +
+# +-----------------------------------------------------------------------
+# +
+#  --
+#  START OF GNU GENERAL PUBLIC LICENSE
+#  --
+# --- dbus/dbus-glib.h
+# +++ dbus/dbus-glib.h
+# @@ -1,3 +1,5 @@
+# + * SPDX-License-Identifier: AFL-2.1 OR GPL-2.0-or-later
+# + *
+#   * Licensed under the Academic Free License version 2.1
+#   * 
+#   * This program is free software; you can redistribute it and/or modify
+# @@ -11,5 +13,3 @@
+#   * GNU General Public License for more details.
+#   * 
+#   * You should have received a copy of the GNU General Public License
+# - * along with this program; if not, write to the Free Software
+# - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# 
+#
+
 SUMMARY = "High level language (GLib) binding for D-Bus"
 DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
 HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
 LICENSE = "AFL-2.1 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
-                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c31c73c1d8f5d06784b2ccd22e42d641 \
+                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=c374833bd817988323f3a8fda0dc7f48 \
+                    "
 SECTION = "base"
 
 DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
@@ -14,8 +80,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.g
            file://no-examples.patch \
            file://test-install-makefile.patch \
 "
-SRC_URI[md5sum] = "d7cebf1d69445cbd28b4983392145192"
-SRC_URI[sha256sum] = "7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825"
+SRC_URI[sha256sum] = "7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a"
 
 inherit autotools pkgconfig gettext bash-completion gtk-doc
 
-- 
2.27.0


--===============1292268314234769724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dbus-glib/dbus-glib-bash-completion: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-bash-completion: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-dbg: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-dbg: PKGSIZE changed from 677392 to 678300 (+0%)
packages/core2-32-poky-linux/dbus-glib/dbus-glib-dbg: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-dev: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-dev: PKGSIZE changed from 157861 to 158118 (+0%)
packages/core2-32-poky-linux/dbus-glib/dbus-glib-dev: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-doc: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-doc: PKGSIZE changed from 7910 to 8129 (+3%)
packages/core2-32-poky-linux/dbus-glib/dbus-glib-doc: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-locale: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-locale: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-src: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-src: PKGSIZE changed from 588485 to 594154 (+1%)
packages/core2-32-poky-linux/dbus-glib/dbus-glib-src: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-staticdev: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-staticdev: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib-tests: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib-tests: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib/dbus-glib: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib/dbus-glib: PKGSIZE changed from 177527 to 181623 (+2%)
packages/core2-32-poky-linux/dbus-glib/dbus-glib: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib: PKGV changed from 0.110 [default] to 0.112 [default]
packages/core2-32-poky-linux/dbus-glib: PV changed from "0.110" to "0.112"
packages/core2-32-poky-linux/dbus-glib: SRC_URI changed from "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.110.tar.gz file://no-examples.patch file://test-install-makefile.patch" to "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.112.tar.gz file://no-examples.patch file://test-install-makefile.patch"
Changes to packages/core2-32-poky-linux/dbus-glib (sysroot):
  /usr/lib/libdbus-glib-1.so.2 changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so.2.3.4 moved to /usr/lib/libdbus-glib-1.so.2.3.5
Changes to packages/x86_64-linux/dbus-glib-native (sysroot):
  /usr/lib/libdbus-glib-1.so.2 changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so changed symlink target from libdbus-glib-1.so.2.3.4 to libdbus-glib-1.so.2.3.5
  /usr/lib/libdbus-glib-1.so.2.3.4 moved to /usr/lib/libdbus-glib-1.so.2.3.5

--===============1292268314234769724==--
