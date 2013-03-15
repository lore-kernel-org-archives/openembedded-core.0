Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UGaya-0006sZ-Vg
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 21:11:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Mar 2013 12:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,853,1355126400"; d="scan'208";a="271459771"
Received: from unknown (HELO localhost.localdomain) ([10.255.13.115])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2013 12:54:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2013 12:54:40 -0700
Message-Id: <1363377280-14797-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] util-linux: Update License Information (remove GPLv3 Licnese)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2013 20:11:43 -0000

The upstream authors have updated the licenses of a couple subcomponents,
these were GPLv3, but updated to be either GPLv2 or LGPLv2.1 accordingly.
These changes make the util-linux package become completely non-GPLv3.

Cleaned up some white space issue also

[YOCTO #4014]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  2 +-
 .../util-linux/util-linux/mbsalign-license.patch   | 78 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.22.2.bb  | 32 +--------
 3 files changed, 82 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/mbsalign-license.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 149cdc5..ecc0c26 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -7,7 +7,7 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=679af3e410ee112a5ec94de6501bf5c3 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta/recipes-core/util-linux/util-linux/mbsalign-license.patch b/meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
new file mode 100644
index 0000000..b2c3652
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
@@ -0,0 +1,78 @@
+
+Upstream-Status: Backport
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Notes from Pdraig (via email) :
+
+Actually LGPLv2+ is most appropriate for that.
+The intent is that it's licensed under the LGPL anyway:
+
+$ gnulib/gnulib-tool --local-dir gl --extract-license mbsalign
+LGPL
+
+When extracting this to util-linux I should have adjusted
+the boilerplate default license in the file (which gnulib-tool
+can do on import).
+
+
+From 16d8546964db1f6a27ae0f1d1cd24ce42704111d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Fri, 15 Mar 2013 09:48:37 +0000
+Subject: [PATCH] lib/mbsalign: correct license header from GPLv[23] to
+ LGPLv2+
+
+* lib/mbsalign.c: s/GPLv3/LGPLv2+/
+* include/mbsalign.h: s/GPLv2/LGPLv2+/
+* README.licensing: Remove mention GPLv3 as it's not actually used.
+---
+ README.licensing   |    2 --
+ include/mbsalign.h |    4 ++--
+ lib/mbsalign.c     |    4 ++--
+ 3 files changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/README.licensing b/README.licensing
+index b29883c..ab60004 100644
+--- a/README.licensing
++++ b/README.licensing
+@@ -2,8 +2,6 @@
+ The project util-linux doesn't use the same license for all of the code.
+ There is code under:
+ 
+-   * GPLv3+ (GNU General Public License version 3, or any later version)
+-
+    * GPLv2+ (GNU General Public License version 2, or any later version)
+ 
+    * GPLv2 (GNU General Public License version 2)
+diff --git a/include/mbsalign.h b/include/mbsalign.h
+index fd957b3..8c9f2db 100644
+--- a/include/mbsalign.h
++++ b/include/mbsalign.h
+@@ -2,8 +2,8 @@
+    Copyright (C) 2009-2010 Free Software Foundation, Inc.
+ 
+    This program is free software: you can redistribute it and/or modify
+-   it under the terms of the GNU General Public License as published by
+-   the Free Software Foundation, either version 2 of the License, or
++   it under the terms of the GNU Lesser General Public License as published by
++   the Free Software Foundation, either version 2.1 of the License, or
+    (at your option) any later version.
+ 
+    This program is distributed in the hope that it will be useful,
+diff --git a/lib/mbsalign.c b/lib/mbsalign.c
+index d97bbd5..05c4650 100644
+--- a/lib/mbsalign.c
++++ b/lib/mbsalign.c
+@@ -2,8 +2,8 @@
+    Copyright (C) 2009-2010 Free Software Foundation, Inc.
+ 
+    This program is free software: you can redistribute it and/or modify
+-   it under the terms of the GNU General Public License as published by
+-   the Free Software Foundation, either version 3 of the License, or
++   it under the terms of the GNU Lesser General Public License as published by
++   the Free Software Foundation, either version 2.1 of the License, or
+    (at your option) any later version.
+ 
+    This program is distributed in the hope that it will be useful,
+-- 
+1.7.7.6
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index 2f48e0b..9b94a47 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -2,42 +2,16 @@ MAJOR_VERSION = "2.22"
 PR = "r2"
 require util-linux.inc
 
-# note that `lscpu' is under GPLv3+
-LICENSE_${PN}-lscpu = "GPLv3+"
-
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
-	    file://configure-sbindir.patch \
-	    file://fix-configure.patch \
+            file://configure-sbindir.patch \
+            file://fix-configure.patch \
+            file://mbsalign-license.patch \
 "
 
 SRC_URI[md5sum] = "3e379b4d8b9693948d751c154614c73e"
 SRC_URI[sha256sum] = "7463a17a01a77cee36d8ce845d8148208f553c9abdd67b446324bf42968bc36d"
 
-# Only lscpu part is gplv3; rest of the code is not, 
-# so take out the lscpu parts while running non-gplv3 build.
-# The removal of the package should now occur during
-# the build if INCOMPATIBLE_LICENSE is set to GPLv3
-
-python () {
-    d.setVar("REMOVELSCPU", "no")
-    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
-        # avoid GPLv3
-        d.setVar("REMOVELSCPU", "yes")
-        src_uri = (d.getVar("SRC_URI", False) or "").split()
-        src_uri.append("file://remove-lscpu.patch")
-        d.setVar("SRC_URI", " ".join(src_uri))
-}       
-
-do_remove_lscpu() {
-    if [ "x${REMOVELSCPU}" = "xyes" ]; then
-         rm -f sys-utils/lscpu.c sys-utils/lscpu.1
-         rm -rf tests/ts/lscpu tests/expected/lscpu
-    fi
-}
-
-addtask remove_lscpu before do_configure after do_patch
-
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-- 
1.8.0.2



