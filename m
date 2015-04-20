Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2CE573D6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:31:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 20 Apr 2015 08:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="712247979"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2015 08:31:50 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 18:31:45 +0300
Message-Id: <92d6a03bcc3f21748fae87cb340a74d922097b61.1429543826.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429543826.git.cristian.iorga@intel.com>
References: <cover.1429543826.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429543826.git.cristian.iorga@intel.com>
References: <cover.1429543826.git.cristian.iorga@intel.com>
Subject: [PATCH v4 3/4] bluez: remove recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Apr 2015 15:31:51 -0000

BlueZ 4.x and associated recipes
are now obsolete.
(bluez4,bluez-hcidump, gst-plugin-bluetooth).
Will be moved into recipes-connectivity
collection of meta-openembedded.
BlueZ 4.x is still usable in poky/YP.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../obsolete_automake_macros.patch                 |  14 ---
 .../bluez/bluez-hcidump_2.5.bb                     |  22 -----
 .../bluez/bluez4-4.101/bluetooth.conf              |  16 ---
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 -------
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 ---------------------
 .../bluez/bluez4-4.101/install-test-script.patch   |  26 -----
 ...ork-fix-network-Connect-method-parameters.patch |  30 ------
 .../bluez4-4.101/obsolete_automake_macros.patch    |  14 ---
 .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 -----
 ...pygobject-instead-ofgobject-introspection.patch |  27 -----
 meta/recipes-connectivity/bluez/bluez4.inc         |  46 ---------
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  47 ---------
 .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 --------
 13 files changed, 452 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4_4.101.bb
 delete mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch b/meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
deleted file mode 100644
index 0c77f1a..0000000
--- a/meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending [package obsolete/not maintained by upstream]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd bluez-hcidump-2.5/configure.ac bluez-hcidump-2.5/configure.ac
---- bluez-hcidump-2.5/configure.ac	2012-11-30 10:29:41.000000000 +0200
-+++ bluez-hcidump-2.5/configure.ac	2013-01-12 10:02:10.609511463 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(bluez-hcidump, 2.5)
-
- AM_INIT_AUTOMAKE([foreign subdir-objects])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
deleted file mode 100644
index 3950630..0000000
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool"
-DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
-and displays the commands, events and data in a human-readable form."
-
-SECTION = "console"
-# hcidump was integrated into bluez5
-DEPENDS = "bluez4"
-RCONFLICTS_${PN} = "bluez5"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
-PR = "r1"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz \
-           file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "2eab54bbd2b59a2ed4274ebb9390cf18"
-SRC_URI[sha256sum] = "9b7c52b375081883738cf049ecabc103b97d094b19c6544fb241267905d88881"
-S = "${WORKDIR}/bluez-hcidump-${PV}"
-
-inherit autotools
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
deleted file mode 100644
index ca5e9e4..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-<!-- This configuration file specifies the required security policies
-     for Bluetooth core daemon to work. -->
-
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-
-  <!-- ../system.conf have denied everything, so we just punch some holes -->
-
-  <policy context="default">
-    <allow own="org.bluez"/>
-    <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent"/>
-  </policy>
-
-</busconfig>
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
deleted file mode 100644
index 8089914..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Add udevdir/udevrulesdir options
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: bluez-4.101/Makefile.am
-===================================================================
---- bluez-4.101.orig/Makefile.am
-+++ bluez-4.101/Makefile.am
-@@ -395,7 +395,7 @@ EXTRA_DIST += audio/bluetooth.conf
- include Makefile.tools
- 
- if DATAFILES
--rulesdir = @UDEV_DIR@/rules.d
-+rulesdir = @UDEV_RULES_DIR@
- 
- udev_files =
- 
-Index: bluez-4.101/configure.ac
-===================================================================
---- bluez-4.101.orig/configure.ac
-+++ bluez-4.101/configure.ac
-@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then
- fi
- AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
- 
-+AC_ARG_WITH([udevdir],
-+    AS_HELP_STRING([--with-udevdir=DIR], [udev directory]),
-+    [], [with_udevdir=/lib/udev/])
-+AC_SUBST([UDEV_DIR], [$with_udevdir])
-+
-+AC_ARG_WITH([udevrulesdir],
-+    AS_HELP_STRING([--with-udevrulesdir=DIR], [udev rules directory]),
-+    [], [with_udevrulesdir=/lib/udev/rules.d])
-+AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
-+
- AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8 src/bluetooth.service bluez.pc)
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
deleted file mode 100644
index 1bc390f..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-Avoid namepspace collision with encrypt function from libc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: bluez-4.101/test/l2test.c
-===================================================================
---- bluez-4.101.orig/test/l2test.c
-+++ bluez-4.101/test/l2test.c
-@@ -107,7 +107,7 @@ static char *filename = NULL;
- static int rfcmode = 0;
- static int master = 0;
- static int auth = 0;
--static int encrypt = 0;
-+static int encryption_request = 0;
- static int secure = 0;
- static int socktype = SOCK_SEQPACKET;
- static int linger = 0;
-@@ -340,7 +340,7 @@ static int do_connect(char *svr)
- 		opt |= L2CAP_LM_MASTER;
- 	if (auth)
- 		opt |= L2CAP_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= L2CAP_LM_ENCRYPT;
- 	if (secure)
- 		opt |= L2CAP_LM_SECURE;
-@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
- 		opt |= L2CAP_LM_MASTER;
- 	if (auth)
- 		opt |= L2CAP_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= L2CAP_LM_ENCRYPT;
- 	if (secure)
- 		opt |= L2CAP_LM_SECURE;
-@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
- 			break;
- 
- 		case 'E':
--			encrypt = 1;
-+			encryption_request = 1;
- 			break;
- 
- 		case 'S':
-Index: bluez-4.101/test/rctest.c
-===================================================================
---- bluez-4.101.orig/test/rctest.c
-+++ bluez-4.101/test/rctest.c
-@@ -79,7 +79,7 @@ static char *filename = NULL;
- 
- static int master = 0;
- static int auth = 0;
--static int encrypt = 0;
-+static int encryption_request = 0;
- static int secure = 0;
- static int socktype = SOCK_STREAM;
- static int linger = 0;
-@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
- 		opt |= RFCOMM_LM_MASTER;
- 	if (auth)
- 		opt |= RFCOMM_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= RFCOMM_LM_ENCRYPT;
- 	if (secure)
- 		opt |= RFCOMM_LM_SECURE;
-@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
- 		opt |= RFCOMM_LM_MASTER;
- 	if (auth)
- 		opt |= RFCOMM_LM_AUTH;
--	if (encrypt)
-+	if (encryption_request)
- 		opt |= RFCOMM_LM_ENCRYPT;
- 	if (secure)
- 		opt |= RFCOMM_LM_SECURE;
-@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
- 			break;
- 
- 		case 'E':
--			encrypt = 1;
-+			encryption_request = 1;
- 			break;
- 
- 		case 'S':
-Index: bluez-4.101/src/textfile.h
-===================================================================
---- bluez-4.101.orig/src/textfile.h
-+++ bluez-4.101/src/textfile.h
-@@ -24,6 +24,8 @@
- #ifndef __TEXTFILE_H
- #define __TEXTFILE_H
- 
-+#include <sys/types.h>
-+
- int create_dirs(const char *filename, const mode_t mode);
- int create_file(const char *filename, const mode_t mode);
- int create_name(char *buf, size_t size, const char *path,
-Index: bluez-4.101/test/attest.c
-===================================================================
---- bluez-4.101.orig/test/attest.c
-+++ bluez-4.101/test/attest.c
-@@ -34,6 +34,7 @@
- #include <termios.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
-+#include <sys/select.h>
- 
- #include <bluetooth/bluetooth.h>
- #include <bluetooth/rfcomm.h>
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
deleted file mode 100644
index 23f7d99..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate
-
-Install the bluez's test scripts
-
-Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
-diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
---- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
-+++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
-@@ -227,6 +227,17 @@
- 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
- 		test/simple-player test/test-nap
- 
-+bluez4_testdir = $(libdir)/bluez4/test/
-+dist_bluez4_test_SCRIPTS = test/sap-client test/hsplay test/hsmicro \
-+		test/monitor-bluetooth test/list-devices \
-+		test/test-discovery test/test-manager test/test-adapter \
-+		test/test-device test/test-service test/test-serial \
-+		test/test-telephony test/test-network test/simple-agent \
-+		test/simple-service test/simple-endpoint test/test-audio \
-+		test/test-input test/test-sap-server test/test-oob \
-+		test/test-attrib test/test-proximity test/test-thermometer \
-+		test/test-serial-proxy test/test-health test/test-health-sink \
-+		test/simple-player test/test-nap
- if HIDD
- bin_PROGRAMS += compat/hidd
- 
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
deleted file mode 100644
index 37f9199..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
-
-From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
-From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
-Date: Sat, 30 Jun 2012 00:39:05 -0300
-Subject: [PATCH] network: fix network Connect() method parameters
-
----
- network/connection.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/network/connection.c b/network/connection.c
-index 544ec3a..59423a9 100644
---- a/network/connection.c
-+++ b/network/connection.c
-@@ -554,7 +554,9 @@ static void path_unregister(void *data)
- 
- static const GDBusMethodTable connection_methods[] = {
- 	{ GDBUS_ASYNC_METHOD("Connect",
--			NULL, NULL, connection_connect) },
-+				GDBUS_ARGS({"uuid", "s"}),
-+				GDBUS_ARGS({"interface", "s"}),
-+				connection_connect) },
- 	{ GDBUS_METHOD("Disconnect",
- 			NULL, NULL, connection_disconnect) },
- 	{ GDBUS_METHOD("GetProperties",
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
deleted file mode 100644
index 1068f24..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd bluez-4.101/configure.ac bluez-4.101/configure.ac
---- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
-+++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
-@@ -2,7 +2,7 @@
- AC_INIT(bluez, 4.101)
-
- AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
deleted file mode 100644
index 98fab45..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-on x86 and x86_64 gcc 4.7 complains
-
-sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
-sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't match constraints [enabled by default]
-sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
-
-This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: bluez-4.98/sbc/sbc_primitives_mmx.c
-===================================================================
---- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000 -0800
-+++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0800
-@@ -318,7 +318,7 @@
- 				"movl          %k0, 4(%3)\n"
- 			: "+r" (blk)
- 			: "r" (&sb_sample_f[0][ch][sb]),
--				"i" ((char *) &sb_sample_f[1][0][0] -
-+				"r" ((char *) &sb_sample_f[1][0][0] -
- 					(char *) &sb_sample_f[0][0][0]),
- 				"r" (&scale_factor[ch][sb]),
- 				"r" (&consts),
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
deleted file mode 100644
index 37037f5..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate
-
-use legacy pygobject instead of gobject-introspection
-
-Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
----
-diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-agent
---- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +0800
-+++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
-@@ -2,7 +2,7 @@
- 
- from __future__ import absolute_import, print_function, unicode_literals
- 
--from gi.repository import GObject
-+import gobject
- 
- import sys
- import dbus
-@@ -122,7 +122,7 @@
- 	path = "/test/agent"
- 	agent = Agent(bus, path)
- 
--	mainloop = GObject.MainLoop()
-+	mainloop = gobject.MainLoop()
- 
- 	if len(args) > 1:
- 		if len(args) > 2:
diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
deleted file mode 100644
index 11c9616..0000000
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "Linux Bluetooth Stack Userland V4"
-DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
-HOMEPAGE = "http://www.bluez.org"
-SECTION = "libs"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
-                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-
-PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
-"
-PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
-
-ASNEEDED = ""
-
-SRC_URI = "\
-  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
-"
-S = "${WORKDIR}/bluez-${PV}"
-
-inherit autotools-brokensep pkgconfig
-
-EXTRA_OECONF = "\
-  --disable-gstreamer \
-  --enable-usb \
-  --enable-tools \
-  --enable-bccmd \
-  --enable-hid2hci \
-  --enable-dfutool \
-  --disable-hidd \
-  --disable-pand \
-  --disable-dund \
-  --disable-cups \
-  --enable-test \
-  --enable-datafiles \
-  --with-udevdir=`pkg-config --variable=udevdir udev` \
-  --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
-"
-
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
deleted file mode 100644
index f900c7c..0000000
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-require bluez4.inc
-
-PR = "r11"
-
-SRC_URI += "file://bluetooth.conf \
-            file://sbc_mmx.patch \
-            file://fix-udev-paths.patch \
-            file://obsolete_automake_macros.patch \
-            file://network-fix-network-Connect-method-parameters.patch \
-            file://install-test-script.patch \
-            file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
-            file://fix_encrypt_collision.patch \
-"
-
-SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
-
-RCONFLICTS_${PN} = "bluez5"
-
-do_install_append() {
-	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
-	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
-}
-
-RDEPENDS_${PN}-dev = "bluez-hcidump"
-RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
-
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools"
-
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
-FILES_${PN}-dev += "\
-  ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
-"
-
-FILES_${PN}-testtools = "${libdir}/bluez4/test/*"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/bluetooth/plugins/.debug \
-  ${libdir}/*/.debug \
-  */udev/.debug \
-  "
diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
deleted file mode 100644
index c71d612..0000000
--- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-require bluez4.inc
-require recipes-multimedia/gstreamer/gst-plugins-package.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
-
-DEPENDS = "bluez4 gst-plugins-base"
-
-EXTRA_OECONF = "\
-  --enable-gstreamer \
-"
-
-# clean unwanted files
-do_install_append() {
-	rm -rf ${D}${bindir}
-	rm -rf ${D}${sbindir}
-	rm -f  ${D}${libdir}/lib*
-	rm -rf ${D}${libdir}/pkgconfig
-	rm -rf ${D}${sysconfdir}
-	rm -rf ${D}${base_libdir}
-	rm -rf ${D}${libdir}/bluetooth
-	rm -rf ${D}${localstatedir}
-  	rm -rf ${D}${libdir}/alsa-lib
-  	rm -rf ${D}${datadir}
-	rm -rf ${D}${includedir}
-	rm -rf ${D}${nonarch_base_libdir}
-}
-
-FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_${PN}-dev += "\
-  ${libdir}/gstreamer-0.10/*.la \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/*/.debug \
-"
-
-- 
2.1.0


