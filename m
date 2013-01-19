Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhT0-0007ea-4Z
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:52 +0100
Received: from mail-wg0-f71.google.com ([74.125.82.71])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:21 -0800
Received: by mail-wg0-f71.google.com with SMTP id dr13so5236311wgb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=bcY4Gh2r3C/ONhEKdUPsnsk+ElppAaJ5eRTtMwmZEXg=;
	b=cmPRtfBfZFuJTMhFrWbCIvaWk3XJ3lP/Y9E59HSIDTXovH8ovBcxcHf95L9YVdwL0A
	GwKabrkBNIZnF1Fwb5lU3FaGQfMX7hfoUkHtgRoPXVYxFX2SfuF0Z5dKUKIDiMoVjuiH
	b/lprNCaaeFEL3mtxtgZvVmLezoEqh6NPGx5wluYuMiobJWg6yNNDzDTjXdIxDocNB0J
	ez6BNwbD5dTKGgCkeFCb7lK7BjC98qUs86gCz1UEHW5l7sZrtDc7Jh5Xtc/T8Yxs01gN
	Kbmy6Y4nwWc1f+qx7EnLaBkCDXS89iDbISRLHdwIHObvZPmFflq75EPkikd3f1G6ulSp
	DZUw==
X-Received: by 10.180.85.165 with SMTP id i5mr9301365wiz.11.1358635758799;
	Sat, 19 Jan 2013 14:49:18 -0800 (PST)
X-Received: by 10.180.85.165 with SMTP id i5mr9301362wiz.11.1358635758672;
	Sat, 19 Jan 2013 14:49:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:07 +0000
Message-Id: <99d5574cd12a8ed68886120775aec583b2941684.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmhBxnXYZOhZTyi7uXJwxhH4pS8lPYRQr/WKBi0+EsrIP4ydylq+utgiHZB4lu8k2pvafBxZ+yXHDQnwrod1179le2FC6dg44xKEHfEVV1rLtuTEWxT8/+d0pnaOW568yWTzRvOK6bNIOeXmZmf8Uq3Vtl1zp6F5UKfVX1EkcczO72cQqNrT2VxkO4OMHFQqBup4Sq9
Subject: [PATCH 04/10] systemd: add systemd recipes
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Radu Moisan <radu.moisan@intel.com>

Add systemd recipes and associated support recipes.

Mostly based on meta-oe/meta-systemd, so almost all credit should go to:

Andreas Müller <schnitzeltony@googlemail.com>
Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Holger Hans Peter Freyther <holger@moiji-mobile.com>
Khem Raj <raj.khem@gmail.com>
Koen Kooi <koen@dominion.thruhere.net>
Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 .../systemd/systemd-systemctl-native.bb            |   15 +
 .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
 .../systemd/systemd/00-create-volatile.conf        |   10 +
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
 meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
 .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
 meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
 meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
 22 files changed, 1597 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
 create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
 create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 create mode 100644 meta/recipes-core/systemd/systemd_196.bb

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
new file mode 100644
index 0000000..a7bfee3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r18"
+
+inherit allarch
+
+SRC_URI = "file://*.service"
+
+do_install() {
+	install -d ${D}${systemd_unitdir}/system/basic.target.wants
+	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system
+	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.target.wants/
+	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
+
+	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/system
+	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.wants/
+
+	# hack to make old style sysvinit postinsts succeed
+	install -d ${D}${bindir}
+	echo "echo 1" > ${D}${bindir}/runlevel
+	chmod 0755 ${D}${bindir}/runlevel
+}
+
+SYSTEMD_DISABLED_SYSV_SERVICES = " \
+  busybox-udhcpc \
+  dnsmasq \
+  hwclock \
+  networking \
+  syslog.busybox \
+"
+
+pkg_postinst_${PN} () {
+	cd $D${sysconfdir}/init.d
+
+	echo "Disabling the following sysv scripts: "
+
+	OPTS=""
+
+	if [ -n "$D" ]; then
+		OPTS="--root=$D"
+	fi
+
+	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
+		if [ \( -e $i -o $i.sh \) -a ! -e $D${sysconfdir}/systemd/system/$i.service ] ; then
+			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
+		fi
+	done ; echo
+}
+
+FILES_${PN} = "${systemd_unitdir}/system ${bindir}"
+RDPEPENDS_${PN} = "systemd"
+
+
diff --git a/meta/recipes-core/systemd/systemd-compat-units/machineid.service b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
new file mode 100644
index 0000000..cab8f76
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=Machine ID first boot configure
+DefaultDependencies=no
+ConditionPathExists=|!/etc/machine-id
+After=remount-rootfs.service
+Before=sysinit.target
+
+[Service]
+ExecStart=/bin/systemd-machine-id-setup
+RemainAfterExit=No
+Type=oneshot
+StandardOutput=syslog
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
new file mode 100644
index 0000000..da6fe76
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=Run pending postinsts
+DefaultDependencies=no
+ConditionPathExists=|/etc/rcS.d/S98run-postinsts
+After=remount-rootfs.service tmp.mount
+Before=sysinit.target
+
+[Service]
+ExecStart=/etc/rcS.d/S98run-postinsts
+RemainAfterExit=No
+Type=oneshot
+StandardOutput=syslog
+TimeoutSec=0
+
+[Install]
+WantedBy=basic.target
+WantedBy=sysinit.target
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
new file mode 100644
index 0000000..7e7368b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Systemd serial config"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+PR = "r3"
+
+SERIAL_CONSOLE ?= "115200 ttyS0"
+
+SRC_URI = "file://serial-getty@.service"
+
+def get_serial_console_value(d, index):
+    c = d.getVar('SERIAL_CONSOLE', True)
+
+    if len(c):
+        return c.split()[index]
+
+    return ""
+
+def get_baudrate(d):
+    return get_serial_console_value(d, 0)
+
+def get_console(d):
+    return get_serial_console_value(d, 1)
+
+do_install() {
+	if [ ! ${@get_baudrate(d)} = "" ]; then
+		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(d)}/g ${WORKDIR}/serial-getty@.service
+		install -d ${D}${systemd_unitdir}/system/
+		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
+		install ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
+
+		# enable the service
+		ln -sf ${systemd_unitdir}/system/serial-getty@.service \
+			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(d)}.service
+	fi
+}
+
+PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-doc"
+
+RRECOMMENDS_${PN} = ""
+RDEPENDS_${PN} = "systemd"
+
+# This is a machine specific file
+FILES_${PN} = "${systemd_unitdir}/system/serial-getty@.service ${sysconfdir}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
new file mode 100644
index 0000000..8eeaab6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -0,0 +1,32 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+
+[Unit]
+Description=Serial Getty on %I
+BindTo=dev-%i.device
+After=dev-%i.device systemd-user-sessions.service
+
+# If additional gettys are spawned during boot then we should make
+# sure that this is synchronized before getty.target, even though
+# getty.target didn't actually pull it in.
+Before=getty.target
+
+[Service]
+Environment=TERM=vt100
+ExecStart=-/sbin/agetty -s %I @BAUDRATE@
+Restart=always
+RestartSec=0
+UtmpIdentifier=%I
+TTYPath=/dev/%I
+TTYReset=yes
+TTYVHangup=yes
+KillMode=process
+IgnoreSIGPIPE=no
+
+# Some login implementations ignore SIGTERM, so we send SIGHUP
+# instead, to ensure that login terminates cleanly.
+KillSignal=SIGHUP
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
new file mode 100644
index 0000000..5940584
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Wrapper to enable of systemd services"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r6"
+
+inherit native
+
+SRC_URI = "file://systemctl"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
+}
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
new file mode 100755
index 0000000..d71c7ed
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -0,0 +1,126 @@
+#!/bin/sh
+echo "Started $0 $*"
+
+ROOT=
+
+# parse command line params
+action=
+while [ $# != 0 ]; do
+	opt="$1"
+
+	case "$opt" in
+		enable)
+			shift
+
+			action="$opt"
+			services="$1"
+			cmd_args="1"
+			shift
+			;;
+		disable)
+			shift
+
+			action="$opt"
+			services="$1"
+			cmd_args="1"
+			shift
+			;;
+		mask)
+			shift
+
+			action="$opt"
+			services="$1"
+			cmd_args="1"
+			shift
+			;;
+		--root=*)
+			ROOT=${opt##--root=}
+			cmd_args="0"
+			shift
+			;;
+		*)
+			if [ "$cmd_args" = "1" ]; then
+				services="$services $opt" 
+				shift
+			else
+				echo "'$opt' is an unkown option; exiting with error"
+				exit 1
+			fi
+			;;
+	esac
+done
+
+for service in $services; do
+	if [ "$action" = "mask" ]; then
+		if [ ! -d $ROOT/etc/systemd/system/ ]; then
+			mkdir -p $ROOT/etc/systemd/system/
+		fi
+		cmd="ln -s /dev/null $ROOT/etc/systemd/system/$service"
+		echo "$cmd"
+		$cmd
+		exit 0
+	fi
+
+	echo "Try to find location of $service..."
+	# find service file
+	for p in $ROOT/etc/systemd/system \
+		 $ROOT/lib/systemd/system \
+		 $ROOT/usr/lib/systemd/system; do
+		if [ -e $p/$service ]; then
+			service_file=$p/$service
+			service_file=${service_file##$ROOT}
+		fi
+	done
+	if [ -z "$service_file" ]; then
+		echo "'$service' couldn't be found; exiting with error"
+		exit 1
+	fi
+	echo "Found $service in $service_file"
+
+	# create the required symbolic links
+	wanted_by=$(grep WantedBy $ROOT/$service_file \
+		        | sed 's,WantedBy=,,g' \
+		        | tr ',' '\n' \
+		        | grep '\(\.target$\)\|\(\.service$\)')
+
+	for r in $wanted_by; do
+		echo "WantedBy=$r found in $service"
+		if [ "$action" = "enable" ]; then
+			mkdir -p $ROOT/etc/systemd/system/$r.wants
+			ln -s $service_file $ROOT/etc/systemd/system/$r.wants
+			echo "Enabled $service for $wanted_by."
+		else
+			rm -f $ROOT/etc/systemd/system/$r.wants/$service
+			rmdir --ignore-fail-on-non-empty -p $ROOT/etc/systemd/system/$r.wants
+			echo "Disabled $service for $wanted_by."
+		fi
+	done
+
+	# create the required symbolic 'Alias' links
+	alias=$(grep Alias $ROOT/$service_file \
+		        | sed 's,Alias=,,g' \
+		        | tr ',' '\n' \
+		        | grep '\.service$')
+
+	for r in $alias; do
+		if [ "$action" = "enable" ]; then
+			mkdir -p $ROOT/etc/systemd/system
+			ln -s $service_file $ROOT/etc/systemd/system/$r
+			echo "Enabled $service for $alias."
+		else
+			rm -f $ROOT/etc/systemd/system/$r
+			echo "Disabled $service for $alias."
+		fi
+	done
+
+	# call us for the other required scripts
+	also=$(grep Also $ROOT/$service_file \
+		   | sed 's,Also=,,g' \
+		   | tr ',' '\n')
+	for a in $also; do
+		echo "Also=$a found in $service"
+		if [ "$action" = "enable" ]; then
+			$0 --root=$ROOT enable $a
+		fi
+	done
+done
diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
new file mode 100644
index 0000000..d160a9b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -0,0 +1,10 @@
+#This goes hand-in-hand with the base-files of OE-Core. The file must
+# be sorted before 'systemd.conf' becuase this attempts to create a file
+# inside /var/log.
+
+
+d		/var/volatile/cache	-	-	-	-
+d		/var/volatile/log		-	-	-	-
+d		/var/volatile/lock		-	-	-	-
+d		/var/volatile/run		-	-	-	-
+d		/var/volatile/tmp		-	-	-	-
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch b/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
new file mode 100644
index 0000000..7de2705
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
@@ -0,0 +1,103 @@
+From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 10 Dec 2012 12:24:32 +0100
+Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of getopt"
+
+This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
+
+Argparse is broken in current OE python
+---
+ src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++---------------
+ 1 files changed, 39 insertions(+), 21 deletions(-)
+
+diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
+index 88699d6..87a83dd 100755
+--- a/src/analyze/systemd-analyze
++++ b/src/analyze/systemd-analyze
+@@ -1,7 +1,6 @@
+ #!/usr/bin/python
+ 
+-import sys, os
+-import argparse
++import getopt, sys, os
+ from gi.repository import Gio
+ try:
+         import cairo
+@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size = 12, r = 0, g = 0, b = 0, vcenter = 0.5
+ 
+         context.restore()
+ 
++def usage():
++        sys.stdout.write("""systemd-analyze [--user] time
++systemd-analyze [--user] blame
++systemd-analyze [--user] plot
++
++Process systemd profiling information
++
++  -h --help         Show this help
++""")
++
++def help():
++        usage()
++        sys.exit()
++
+ def time():
+ 
+         initrd_time, start_time, finish_time = acquire_start_time()
+@@ -266,29 +279,34 @@ def plot():
+ 
+         surface.finish()
+ 
+-parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
+-                                 description='Process systemd profiling information',
+-                                 epilog='''\
+-time - print time spent in the kernel before reaching userspace
+-blame - print list of running units ordered by time to init
+-plot - output SVG graphic showing service initialization
+-''')
+-
+-parser.add_argument('action', choices=('time', 'blame', 'plot'),
+-                    default='time', nargs='?',
+-                    help='action to perform (default: time)')
+-parser.add_argument('--user', action='store_true',
+-                    help='use the session bus')
++def unknown_verb():
++        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
++        usage()
++        sys.exit(1)
+ 
+-args = parser.parse_args()
++bus = Gio.BusType.SYSTEM
+ 
+-if args.user:
+-        bus = Gio.BusType.SESSION
+-else:
+-        bus = Gio.BusType.SYSTEM
++try:
++        opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
++except getopt.GetoptError as err:
++        sys.stdout.write(str(err) + "\n")
++        usage()
++        sys.exit(2)
++for o, a in opts:
++        if o in ("-h", "--help"):
++                help()
++        elif o == '--user':
++                bus = Gio.BusType.SESSION
++        else:
++                assert False, "unhandled option"
+ 
+ verb = {'time' : time,
+ 	'blame': blame,
+ 	'plot' : plot,
++	'help' : help,
+ 	}
+-verb.get(args.action)()
++
++if len(args) == 0:
++        time()
++else:
++        verb.get(args[0], unknown_verb)()
+-- 
+1.7.7.6
+
diff --git a/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch b/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
new file mode 100644
index 0000000..e5e8d7d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
@@ -0,0 +1,91 @@
+From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 10 Dec 2012 12:25:00 +0100
+Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
+
+This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
+
+Python-gobject is too old in current OE
+---
+ src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
+ 1 files changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
+index 87a83dd..636fd74 100755
+--- a/src/analyze/systemd-analyze
++++ b/src/analyze/systemd-analyze
+@@ -1,15 +1,14 @@
+ #!/usr/bin/python
+ 
+-import getopt, sys, os
+-from gi.repository import Gio
++import getopt, dbus, sys, os
+ try:
+         import cairo
+ except ImportError:
+         cairo = None
+ 
+ def acquire_time_data():
+-        manager = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.systemd1.Manager', None)
++
++        manager = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
+         units = manager.ListUnits()
+ 
+         l = []
+@@ -18,25 +17,23 @@ def acquire_time_data():
+                 if i[5] != "":
+                         continue
+ 
+-                properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                        None, 'org.freedesktop.systemd1', i[6], 'org.freedesktop.DBus.Properties', None)
++                properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
+ 
+-                ixt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic')
+-                aet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic')
+-                axt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic')
+-                iet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic')
++                ixt = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic'))
++                aet = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic'))
++                axt = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic'))
++                iet = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic'))
+ 
+                 l.append((str(i[0]), ixt, aet, axt, iet))
+ 
+         return l
+ 
+ def acquire_start_time():
+-        properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.DBus.Properties', None)
++        properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
+ 
+-        initrd_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic')
+-        userspace_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic')
+-        finish_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic')
++        initrd_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic'))
++        userspace_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic'))
++        finish_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic'))
+ 
+         if finish_time == 0:
+                 sys.stderr.write("Bootup is not yet finished. Please try again later.\n")
+@@ -284,7 +281,7 @@ def unknown_verb():
+         usage()
+         sys.exit(1)
+ 
+-bus = Gio.BusType.SYSTEM
++bus = dbus.SystemBus()
+ 
+ try:
+         opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
+@@ -296,7 +293,7 @@ for o, a in opts:
+         if o in ("-h", "--help"):
+                 help()
+         elif o == '--user':
+-                bus = Gio.BusType.SESSION
++                bus = dbus.SessionBus()
+         else:
+                 assert False, "unhandled option"
+ 
+-- 
+1.7.7.6
+
diff --git a/meta/recipes-core/systemd/systemd/modprobe.rules b/meta/recipes-core/systemd/systemd/modprobe.rules
new file mode 100644
index 0000000..d4a096b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/modprobe.rules
@@ -0,0 +1,17 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Try and modprobe for drivers for new hardware
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
diff --git a/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
new file mode 100644
index 0000000..35f1467
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
@@ -0,0 +1,19 @@
+on uclibc secure_getenv is not available
+therefore default to using getenv instead
+
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: git/src/shared/missing.h
+===================================================================
+--- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
++++ git/src/shared/missing.h	2012-09-22 18:48:44.081276570 -0700
+@@ -233,6 +233,8 @@
+ #ifndef HAVE_SECURE_GETENV
+ #  ifdef HAVE___SECURE_GETENV
+ #    define secure_getenv __secure_getenv
++#  elif defined __UCLIBC__
++#    define secure_getenv getenv
+ #  else
+ #    error neither secure_getenv nor __secure_getenv are available
+ #  endif
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
new file mode 100644
index 0000000..1bfc3bd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
@@ -0,0 +1,26 @@
+--- systemd-185.orig/configure.ac	2012-06-04 14:15:16.000000000 -0400
++++ systemd-pam-185/configure.ac	2012-06-21 22:57:10.000000000 -0400
+@@ -63,6 +63,23 @@
+ 
+ AC_PATH_PROG([M4], [m4])
+ 
++# check for few functions not implemented in uClibc
++
++AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
++
++# check for %ms format support - assume always no if cross compiling
++
++AC_MSG_CHECKING([whether %ms format is supported by *scanf])
++
++AC_RUN_IFELSE(
++	[AC_LANG_PROGRAM([[ include <stdio.h> ]],
++			[[ char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
++			   int rc = sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
++			   return (rc==3)?0:1;]])],
++	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by *scanf.])],
++	[AC_MSG_RESULT([no])],
++	[AC_MSG_RESULT([no])])
++
+ # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
+ m4_ifdef([GTK_DOC_CHECK], [
+ GTK_DOC_CHECK([1.18],[--flavour no-tmpl])
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
new file mode 100644
index 0000000..449c27f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
@@ -0,0 +1,26 @@
+Index: git/src/nspawn/nspawn.c
+===================================================================
+--- git.orig/src/nspawn/nspawn.c	2012-09-22 17:57:05.000000000 -0700
++++ git/src/nspawn/nspawn.c	2012-09-22 18:01:41.541405768 -0700
+@@ -63,6 +63,8 @@
+         LINK_GUEST
+ } LinkJournal;
+ 
++#include "config.h"
++
+ static char *arg_directory = NULL;
+ static char *arg_user = NULL;
+ static char **arg_controllers = NULL;
+@@ -1373,7 +1375,12 @@
+                                 a[0] = (char*) "/sbin/init";
+                                 execve(a[0], a, (char**) envp);
+                         } else if (argc > optind)
++#ifdef HAVE_EXECVPE
+                                 execvpe(argv[optind], argv + optind, (char**) envp);
++#else
++                                environ = (char **)envp;
++                                execvp(argv[optind], argv + optind);
++#endif /* HAVE_EXECVPE */			
+                         else {
+                                 chdir(home ? home : "/root");
+                                 execle("/bin/bash", "-bash", NULL, (char**) envp);
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
new file mode 100644
index 0000000..089ba64
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -0,0 +1,82 @@
+Index: git/src/journal/journal-file.c
+===================================================================
+--- git.orig/src/journal/journal-file.c	2012-09-02 09:49:15.126089594 -0700
++++ git/src/journal/journal-file.c	2012-09-02 09:49:17.118089670 -0700
+@@ -34,6 +34,8 @@
+ #include "compress.h"
+ #include "fsprg.h"
+ 
++#include "config.h"
++
+ #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
+ #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
+ 
+@@ -262,7 +264,7 @@
+ 
+ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
+         uint64_t old_size, new_size;
+-        int r;
++        int r = 0;
+ 
+         assert(f);
+ 
+@@ -307,10 +309,25 @@
+         /* Note that the glibc fallocate() fallback is very
+            inefficient, hence we try to minimize the allocation area
+            as we can. */
++#ifdef HAVE_POSIX_ALLOCATE
+         r = posix_fallocate(f->fd, old_size, new_size - old_size);
+         if (r != 0)
+                 return -r;
+ 
++#else
++	/* Use good old method to write zeros into the journal file
++	   perhaps very inefficient yet working. */
++	if(new_size > old_size) {
++		char *buf = alloca(new_size - old_size);
++		off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
++		bzero(buf, new_size - old_size);
++		lseek(f->fd, old_size, SEEK_SET);
++		r = write(f->fd, buf, new_size - old_size);
++		lseek(f->fd, oldpos, SEEK_SET);
++	}
++	if (r < 0)
++		return -errno;
++#endif /* HAVE_POSIX_FALLOCATE */
+         if (fstat(f->fd, &f->last_stat) < 0)
+                 return -errno;
+ 
+Index: git/src/journal/journald-kmsg.c
+===================================================================
+--- git.orig/src/journal/journald-kmsg.c	2012-09-02 09:49:15.130089595 -0700
++++ git/src/journal/journald-kmsg.c	2012-09-02 12:26:17.326447895 -0700
+@@ -404,6 +404,7 @@
+ 
+ int server_open_kernel_seqnum(Server *s) {
+         int fd;
++	int r = 0;
+         uint64_t *p;
+ 
+         assert(s);
+@@ -417,8 +418,19 @@
+                 log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
+                 return 0;
+         }
+-
+-        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
++#ifdef HAVE_POSIX_ALLOCATE
++        r = posix_fallocate(fd, 0, sizeof(uint64_t));
++#else
++	/* Use good old method to write zeros into the journal file
++	   perhaps very inefficient yet working. */
++	char *buf = alloca(sizeof(uint64_t));
++	off_t oldpos = lseek(fd, 0, SEEK_CUR);
++	bzero(buf, sizeof(uint64_t));
++	lseek(fd, 0, SEEK_SET);
++	r = write(fd, buf, sizeof(uint64_t));
++	lseek(fd, oldpos, SEEK_SET);
++#endif /* HAVE_POSIX_FALLOCATE */
++	if (r < 0) {
+                 log_error("Failed to allocate sequential number file, ignoring: %m");
+                 close_nointr_nofail(fd);
+                 return 0;
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
new file mode 100644
index 0000000..3e5ea71
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -0,0 +1,35 @@
+Prefer getty to agetty in console setup systemd units
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ units/getty@.service.m4        |    2 +-
+ units/serial-getty@.service.m4 |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: systemd-37/units/getty@.service.m4
+===================================================================
+--- systemd-37.orig/units/getty@.service.m4
++++ systemd-37/units/getty@.service.m4
+@@ -41,7 +41,7 @@
+ 
+ [Service]
+ Environment=TERM=linux
+ # the VT is cleared by TTYVTDisallocate
+-ExecStart=-/sbin/agetty --noclear %I 38400
++ExecStart=-/sbin/getty -L %I 115200 linux
+ Type=idle
+ Restart=always
+ RestartSec=0
+Index: systemd-37/units/serial-getty@.service.m4
+===================================================================
+--- systemd-37.orig/units/serial-getty@.service.m4
++++ systemd-37/units/serial-getty@.service.m4
+@@ -37,7 +37,7 @@
+ 
+ [Service]
+ Environment=TERM=vt102
+-ExecStart=-/sbin/agetty -s %I 115200,38400,9600
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ RestartSec=0
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
new file mode 100644
index 0000000..8de9a3a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -0,0 +1,166 @@
+Index: git/src/journal/journal-send.c
+===================================================================
+--- git.orig/src/journal/journal-send.c	2012-09-02 00:10:08.748768268 -0700
++++ git/src/journal/journal-send.c	2012-09-02 00:10:10.508768335 -0700
+@@ -34,6 +34,8 @@
+ 
+ #define SNDBUF_SIZE (8*1024*1024)
+ 
++#include "config.h"
++
+ /* We open a single fd, and we'll share it with the current process,
+  * all its threads, and all its subprocesses. This means we need to
+  * initialize it atomically, and need to operate on it atomically
+@@ -293,7 +295,12 @@
+          * file and just pass a file descriptor of it to the other
+          * side */
+ 
++#ifdef HAVE_MKOSTEMP
+         buffer_fd = mkostemp(path, O_CLOEXEC|O_RDWR);
++#else
++	buffer_fd = mkstemp(path);
++	if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (buffer_fd < 0) {
+                 r = -errno;
+                 goto finish;
+Index: git/src/core/manager.c
+===================================================================
+--- git.orig/src/core/manager.c	2012-09-02 00:10:08.732768266 -0700
++++ git/src/core/manager.c	2012-09-02 00:10:10.512768334 -0700
+@@ -67,6 +67,8 @@
+ #include "cgroup-util.h"
+ #include "path-util.h"
+ 
++#include "config.h"
++
+ /* As soon as 16 units are in our GC queue, make sure to run a gc sweep */
+ #define GC_QUEUE_ENTRIES_MAX 16
+ 
+@@ -1701,7 +1703,12 @@
+                 return -ENOMEM;
+ 
+         saved_umask = umask(0077);
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(path, O_RDWR|O_CLOEXEC);
++#else
++	fd = mkstemp(path);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         umask(saved_umask);
+ 
+         if (fd < 0) {
+Index: git/src/shared/util.c
+===================================================================
+--- git.orig/src/shared/util.c	2012-09-02 00:10:08.784768269 -0700
++++ git/src/shared/util.c	2012-09-02 00:10:10.512768334 -0700
+@@ -68,6 +68,8 @@
+ #include "exit-status.h"
+ #include "hashmap.h"
+ 
++#include "config.h"
++
+ int saved_argc = 0;
+ char **saved_argv = NULL;
+ 
+@@ -4519,7 +4521,12 @@
+         t[k] = '.';
+         stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
+ 
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(t, O_WRONLY|O_CLOEXEC);
++#else
++	fd = mkstemp(t);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (fd < 0) {
+                 free(t);
+                 return -errno;
+Index: git/src/shared/ask-password-api.c
+===================================================================
+--- git.orig/src/shared/ask-password-api.c	2012-09-02 00:10:08.772768268 -0700
++++ git/src/shared/ask-password-api.c	2012-09-02 00:10:10.512768334 -0700
+@@ -37,6 +37,8 @@
+ 
+ #include "ask-password-api.h"
+ 
++#include "config.h"
++
+ static void backspace_chars(int ttyfd, size_t p) {
+ 
+         if (ttyfd < 0)
+@@ -326,7 +328,12 @@
+         mkdir_p_label("/run/systemd/ask-password", 0755);
+ 
+         u = umask(0022);
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
++#else
++	fd = mkstemp(temp);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         umask(u);
+ 
+         if (fd < 0) {
+Index: git/src/journal/journalctl.c
+===================================================================
+--- git.orig/src/journal/journalctl.c	2012-09-02 00:10:08.752768267 -0700
++++ git/src/journal/journalctl.c	2012-09-02 00:18:41.928787779 -0700
+@@ -540,7 +540,13 @@
+         n /= arg_interval;
+ 
+         close_nointr_nofail(fd);
++#ifdef HAVE_MKOSTEMP
+         fd = mkostemp(k, O_WRONLY|O_CLOEXEC|O_NOCTTY);
++#else
++	fd = mkstemp(k);
++	if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
++#endif /* HAVE_MKOSTEMP */
++
+         if (fd < 0) {
+                 log_error("Failed to open %s: %m", k);
+                 r = -errno;
+Index: git/src/journal/journal-verify.c
+===================================================================
+--- git.orig/src/journal/journal-verify.c	2012-09-02 00:10:08.752768267 -0700
++++ git/src/journal/journal-verify.c	2012-09-02 00:24:10.268800268 -0700
+@@ -693,8 +693,12 @@
+ #endif
+         } else if (f->seal)
+                 return -ENOKEY;
+-
++#ifdef HAVE_MKOSTEMP
+         data_fd = mkostemp(data_path, O_CLOEXEC);
++#else
++	data_fd = mkstemp(data_path);
++	if (data_fd >= 0) fcntl(data_fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (data_fd < 0) {
+                 log_error("Failed to create data file: %m");
+                 r = -errno;
+@@ -702,7 +706,12 @@
+         }
+         unlink(data_path);
+ 
++#ifdef HAVE_MKOSTEMP
+         entry_fd = mkostemp(entry_path, O_CLOEXEC);
++#else
++	entry_fd = mkstemp(entry_path);
++	if (entry_fd >= 0) fcntl(entry_fd, F_SETFD, FD_CLOEXEC);
++#endif	/* HAVE_MKOSTEMP */
+         if (entry_fd < 0) {
+                 log_error("Failed to create entry file: %m");
+                 r = -errno;
+@@ -710,7 +719,12 @@
+         }
+         unlink(entry_path);
+ 
++#ifdef HAVE_MKOSTEMP
+         entry_array_fd = mkostemp(entry_array_path, O_CLOEXEC);
++#else
++	entry_array_fd = mkstemp(entry_array_path);
++	if (entry_array_fd >= 0) fcntl(entry_array_fd, F_SETFD, FD_CLOEXEC);
++#endif  /* HAVE_MKOSTEMP */
+         if (entry_array_fd < 0) {
+                 log_error("Failed to create entry array file: %m");
+                 r = -errno;
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
new file mode 100644
index 0000000..ee63329
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
@@ -0,0 +1,335 @@
+--- systemd-pam-185/src/fsck/fsck.c.orig	2012-06-22 23:22:22.000000000 -0400
++++ systemd-pam-185/src/fsck/fsck.c	2012-06-22 21:15:56.000000000 -0400
+@@ -36,6 +36,8 @@
+ #include "bus-errors.h"
+ #include "virt.h"
+ 
++#include "config.h"
++
+ static bool arg_skip = false;
+ static bool arg_force = false;
+ static bool arg_show_progress = false;
+@@ -193,9 +195,16 @@
+                 char *device;
+                 double p;
+                 usec_t t;
+-
++#ifdef HAVE_MSFORMAT
+                 if (fscanf(f, "%i %lu %lu %ms", &pass, &cur, &max, &device) != 4)
+-                        break;
++#else
++		device = malloc(257);
++		if (fscanf(f, "%i %lu %lu %256s", &pass, &cur, &max, device) != 4) {
++			free(device);
++		}
++
++#endif /* HAVE_MSFORMAT */
++			break;
+ 
+                 /* Only show one progress counter at max */
+                 if (!locked) {
+--- systemd-pam-185/src/core/swap.c.orig	2012-06-22 23:22:55.000000000 -0400
++++ systemd-pam-185/src/core/swap.c	2012-06-22 21:17:10.000000000 -0400
+@@ -40,6 +40,8 @@
+ #include "def.h"
+ #include "path-util.h"
+ 
++#include "config.h"
++
+ static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
+         [SWAP_DEAD] = UNIT_INACTIVE,
+         [SWAP_ACTIVATING] = UNIT_ACTIVATING,
+@@ -1038,7 +1040,7 @@
+         for (i = 1;; i++) {
+                 char *dev = NULL, *d;
+                 int prio = 0, k;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(m->proc_swaps,
+                                 "%ms "  /* device/file */
+                                 "%*s "  /* type of swap */
+@@ -1046,10 +1048,18 @@
+                                 "%*s "  /* used */
+                                 "%i\n", /* priority */
+                                 &dev, &prio)) != 2) {
+-
++#else
++		dev = malloc(257);
++                if ((k = fscanf(m->proc_swaps,
++                                "%256s "   /* device/file */
++                                "%*s "  /* type of swap */
++                                "%*s "  /* swap size */
++                                "%*s "  /* used */
++                                "%i\n", /* priority */
++                                dev, &prio)) != 2) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+-
+                         log_warning("Failed to parse /proc/swaps:%u.", i);
+                         free(dev);
+                         continue;
+--- systemd-pam-185/src/core/mount-setup.c.orig	2012-06-22 23:23:41.000000000 -0400
++++ systemd-pam-185/src/core/mount-setup.c	2012-06-22 21:19:44.000000000 -0400
+@@ -28,6 +28,7 @@
+ #include <assert.h>
+ #include <unistd.h>
+ #include <ftw.h>
++#include <linux/fs.h>
+
+ #include "mount-setup.h"
+ #include "dev-setup.h"
+@@ -41,6 +41,8 @@
+ #include "path-util.h"
+ #include "missing.h"
+ 
++#include "config.h"
++
+ #ifndef TTY_GID
+ #define TTY_GID 5
+ #endif
+@@ -200,9 +202,12 @@
+         for (;;) {
+                 char *controller;
+                 int enabled = 0;
+-
++#ifdef HAVE_MSFORMAT
+                 if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2) {
+-
++#else
++		controller = malloc(257);
++                if (fscanf(f, "%256s %*i %*i %i", controller, &enabled) != 2) {
++#endif /* HAVE_MSFORMAT */
+                         if (feof(f))
+                                 break;
+ 
+--- systemd-pam-185/src/core/mount.c.orig	2012-06-22 23:24:17.000000000 -0400
++++ systemd-pam-185/src/core/mount.c	2012-06-22 22:51:21.000000000 -0400
+@@ -41,6 +41,8 @@
+ #include "exit-status.h"
+ #include "def.h"
+ 
++#include "config.h"
++
+ static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
+         [MOUNT_DEAD] = UNIT_INACTIVE,
+         [MOUNT_MOUNTING] = UNIT_ACTIVATING,
+@@ -1514,7 +1516,7 @@
+                 int k;
+ 
+                 device = path = options = options2 = fstype = d = p = o = NULL;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(m->proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+@@ -1533,7 +1535,31 @@
+                                 &fstype,
+                                 &device,
+                                 &options2)) != 5) {
+-
++#else
++		path = malloc(257);
++		options = malloc(257);
++		fstype = malloc(257);
++		device = malloc(257);
++		options2 = malloc(257);
++                if ((k = fscanf(m->proc_self_mountinfo,
++                                "%*s "       /* (1) mount id */
++                                "%*s "       /* (2) parent id */
++                                "%*s "       /* (3) major:minor */
++                                "%*s "       /* (4) root */
++                                "%256s "     /* (5) mount point */
++                                "%256s"      /* (6) mount options */
++                                "%*[^-]"     /* (7) optional fields */
++                                "- "         /* (8) separator */
++                                "%256s "     /* (9) file system type */
++                                "%256s"      /* (10) mount source */
++                                "%256s"      /* (11) mount options 2 */
++                                "%*[^\n]",   /* some rubbish at the end */
++                                path,
++                                options,
++                                fstype,
++                                device,
++                                options2)) != 5) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+ 
+--- systemd-pam-185/src/core/umount.c.orig	2012-06-22 23:24:37.000000000 -0400
++++ systemd-pam-185/src/core/umount.c	2012-06-22 22:56:15.000000000 -0400
+@@ -35,6 +35,8 @@
+ #include "path-util.h"
+ #include "util.h"
+ 
++#include "config.h"
++
+ typedef struct MountPoint {
+         char *path;
+         dev_t devnum;
+@@ -74,7 +76,7 @@
+                 MountPoint *m;
+ 
+                 path = p = NULL;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+@@ -89,6 +91,23 @@
+                                 "%*s"        /* (11) mount options 2 */
+                                 "%*[^\n]",   /* some rubbish at the end */
+                                 &path)) != 1) {
++#else
++		path = malloc(257);
++                if ((k = fscanf(proc_self_mountinfo,
++                                "%*s "       /* (1) mount id */
++                                "%*s "       /* (2) parent id */
++                                "%*s "       /* (3) major:minor */
++                                "%*s "       /* (4) root */
++                                "%256s "     /* (5) mount point */
++                                "%*s"        /* (6) mount options */
++                                "%*[^-]"     /* (7) optional fields */
++                                "- "         /* (8) separator */
++                                "%*s "       /* (9) file system type */
++                                "%*s"        /* (10) mount source */
++                                "%*s"        /* (11) mount options 2 */
++                                "%*[^\n]",   /* some rubbish at the end */
++                                path)) != 1) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+ 
+@@ -150,7 +169,7 @@
+                 MountPoint *swap;
+                 char *dev = NULL, *d;
+                 int k;
+-
++#ifdef HAVE_MSFORMAT
+                 if ((k = fscanf(proc_swaps,
+                                 "%ms " /* device/file */
+                                 "%*s " /* type of swap */
+@@ -158,7 +177,16 @@
+                                 "%*s " /* used */
+                                 "%*s\n", /* priority */
+                                 &dev)) != 1) {
+-
++#else
++		dev = malloc(257);
++                if ((k = fscanf(proc_swaps,
++                                "%256s " /* device/file */
++                                "%*s " /* type of swap */
++                                "%*s " /* swap size */
++                                "%*s " /* used */
++                                "%*s\n", /* priority */
++                                dev)) != 1) {
++#endif /* HAVE_MSFORMAT */
+                         if (k == EOF)
+                                 break;
+ 
+--- systemd-pam-185/src/shared/socket-util.c.orig	2012-06-22 23:25:00.000000000 -0400
++++ systemd-pam-185/src/shared/socket-util.c	2012-06-22 22:59:27.000000000 -0400
+@@ -39,6 +39,8 @@
+ #include "socket-util.h"
+ #include "missing.h"
+ 
++#include "config.h"
++
+ int socket_address_parse(SocketAddress *a, const char *s) {
+         int r;
+         char *e, *n;
+@@ -201,8 +203,16 @@
+         a->type = SOCK_RAW;
+ 
+         errno = 0;
+-        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
++#ifdef HAVE_MSFORMAT
++	if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
++                return errno ? -errno : -EINVAL;
++#else
++	sfamily = malloc(257);
++	if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
++		free(sfamily);
+                 return errno ? -errno : -EINVAL;
++	}
++#endif /* HAVE_MSFORMAT */
+ 
+         if ((family = netlink_family_from_string(sfamily)) < 0)
+                 if (safe_atoi(sfamily, &family) < 0) {
+--- systemd-pam-185/src/tmpfiles/tmpfiles.c.orig	2012-06-22 23:25:21.000000000 -0400
++++ systemd-pam-185/src/tmpfiles/tmpfiles.c	2012-06-22 23:13:49.000000000 -0400
+@@ -48,6 +48,8 @@
+ #include "set.h"
+ #include "conf-files.h"
+ 
++#include "config.h"
++
+ /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
+  * them in the file system. This is intended to be used to create
+  * properly owned directories beneath /tmp, /var/tmp, /run, which are
+@@ -970,7 +972,7 @@
+         i = new0(Item, 1);
+         if (!i)
+                 return log_oom();
+-
++#ifdef HAVE_MSFORMAT
+         if (sscanf(buffer,
+                    "%c "
+                    "%ms "
+@@ -986,6 +988,28 @@
+                    &group,
+                    &age,
+                    &n) < 2) {
++#else
++	i->path = malloc(257);
++	mode = malloc(257);
++	user = malloc(257);
++	group = malloc(257);
++	age = malloc(257);
++        if (sscanf(buffer,
++                   "%c "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%n",
++                   &type,
++                   i->path,
++                   mode,
++                   user,
++                   group,
++                   age,
++                   &n) < 2) {
++#endif /* HAVE_MSFORMAT */
+                 log_error("[%s:%u] Syntax error.", fname, line);
+                 r = -EIO;
+                 goto finish;
+--- systemd-pam-185/src/cryptsetup/cryptsetup-generator.c.orig	2012-06-22 23:25:47.000000000 -0400
++++ systemd-pam-185/src/cryptsetup/cryptsetup-generator.c	2012-06-22 23:16:35.000000000 -0400
+@@ -30,6 +30,8 @@
+ #include "virt.h"
+ #include "strv.h"
+ 
++#include "config.h"
++
+ static const char *arg_dest = "/tmp";
+ static bool arg_enabled = true;
+ static bool arg_read_crypttab = true;
+@@ -421,8 +423,15 @@
+                 l = strstrip(line);
+                 if (*l == '#' || *l == 0)
+                         continue;
+-
++#ifdef HAVE_MSFORMAT
+                 k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options);
++#else
++		name = malloc(257);
++		device = malloc(257);
++		password = malloc(257);
++		options = malloc(257);
++                k = sscanf(l, "%256s %256s %256s %256s", name, device, password, options);
++#endif /* HAVE_MSFORMAT */
+                 if (k < 2 || k > 4) {
+                         log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
+                         r = EXIT_FAILURE;
diff --git a/meta/recipes-core/systemd/systemd/touchscreen.rules b/meta/recipes-core/systemd/systemd/touchscreen.rules
new file mode 100644
index 0000000..d83fd16
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/touchscreen.rules
@@ -0,0 +1,18 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Create a symlink to any touchscreen input device
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846", SYMLINK+="input/touchscreen0"
diff --git a/meta/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta/recipes-core/systemd/systemd/use-rootlibdir.patch
new file mode 100644
index 0000000..4c471b6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/use-rootlibdir.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Undecided
+
+This patch removes some of hardcoded references to /lib
+and /usr/lib since on some architectures it should be
+/lib64 and /usr/lib64 atleast in OE
+
+I am not sure about the intention of hardcoded values
+thats why status is undecided
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am	2012-09-22 11:07:58.811981199 -0700
++++ git/Makefile.am	2012-09-22 11:09:11.267983956 -0700
+@@ -64,25 +64,25 @@
+ 
+ # Our own, non-special dirs
+ pkgsysconfdir=$(sysconfdir)/systemd
+-userunitdir=$(prefix)/lib/systemd/user
+-userpresetdir=$(prefix)/lib/systemd/user-preset
+-tmpfilesdir=$(prefix)/lib/tmpfiles.d
+-sysctldir=$(prefix)/lib/sysctl.d
+-usergeneratordir=$(prefix)/lib/systemd/user-generators
++userunitdir=$(prefix)/$(rootlibdir)/systemd/user
++userpresetdir=$(prefix)/$(rootlibdir)/systemd/user-preset
++tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
++sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
++usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
+ pkgincludedir=$(includedir)/systemd
+ systemgeneratordir=$(rootlibexecdir)/system-generators
+ systemshutdowndir=$(rootlibexecdir)/system-shutdown
+ systemsleepdir=$(rootlibexecdir)/system-sleep
+-systemunitdir=$(rootprefix)/lib/systemd/system
+-systempresetdir=$(rootprefix)/lib/systemd/system-preset
+-udevlibexecdir=$(rootprefix)/lib/udev
++systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
++systempresetdir=$(rootprefix)/$(rootlibdir)/systemd/system-preset
++udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
+ udevhomedir = $(udevlibexecdir)
+ udevrulesdir = $(udevlibexecdir)/rules.d
+ 
+ # And these are the special ones for /
+ rootprefix=@rootprefix@
+ rootbindir=$(rootprefix)/bin
+-rootlibexecdir=$(rootprefix)/lib/systemd
++rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
+ 
+ CLEANFILES = $(BUILT_SOURCES)
+ EXTRA_DIST =
+@@ -132,7 +132,7 @@
+ 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
+ 	-DROOTPREFIX=\"$(rootprefix)\" \
+ 	-DRUNTIME_DIR=\"/run\" \
+-	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
++	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/random-seed\" \
+ 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
+ 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
+ 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
+@@ -2692,7 +2692,7 @@
+ 
+ binfmt-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/binfmt.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
+ 		$(DESTDIR)$(sysconfdir)/binfmt.d \
+ 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
+ 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
+@@ -3107,7 +3107,7 @@
+ 
+ timedated-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/systemd/ntp-units.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/systemd/ntp-units.d \
+ 		$(DESTDIR)$(sysconfdir)/systemd/ntp-units.d
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.timedate1.service  && \
+@@ -3337,7 +3337,7 @@
+ logind-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
+-		$(DESTDIR)$(localstatedir)/lib/systemd
++		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.login1.service && \
+ 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
+@@ -3494,7 +3494,7 @@
+ 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
+ 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
+ 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
+-		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
++		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
+ 		-e 's,@prefix\@,$(prefix),g' \
+ 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
+ 		-e 's,@libdir\@,$(libdir),g' \
+@@ -3619,9 +3619,9 @@
+ 	$(MKDIR_P) -m 0755 \
+ 		$(DESTDIR)$(tmpfilesdir) \
+ 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
+-		$(DESTDIR)$(prefix)/lib/modules-load.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
+ 		$(DESTDIR)$(sysconfdir)/modules-load.d \
+-		$(DESTDIR)$(prefix)/lib/sysctl.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
+ 		$(DESTDIR)$(sysconfdir)/sysctl.d \
+ 		$(DESTDIR)$(systemshutdowndir) \
+ 		$(DESTDIR)$(systemsleepdir) \
diff --git a/meta/recipes-core/systemd/systemd/var-run.conf b/meta/recipes-core/systemd/systemd/var-run.conf
new file mode 100644
index 0000000..c2c18e2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/var-run.conf
@@ -0,0 +1,4 @@
+# empty /var/run
+R	/var/run/*	-	-	-	-	-
+# systemd-update-utmp-runlevel.service fails to start without this
+f /var/run/utmp 0644 root root - -
diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
new file mode 100644
index 0000000..1861437
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -0,0 +1,249 @@
+DESCRIPTION = "Systemd a init replacement"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+DEPENDS = "xz kmod gtk-doc-stub-native docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
+
+SECTION = "base/shell"
+
+inherit useradd pkgconfig autotools perlnative
+
+SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
+           file://0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch \
+           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch \
+           file://touchscreen.rules \
+           file://modprobe.rules \
+           file://var-run.conf \
+           ${UCLIBCPATCHES} \
+           file://00-create-volatile.conf \
+          "
+SRC_URI[md5sum] = "05ebd7f108e420e2b4e4810ea4b3c810"
+SRC_URI[sha256sum] = "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcffdfc6f058b55e4bf"
+
+UCLIBCPATCHES = ""
+UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
+                             file://systemd-pam-fix-execvpe.patch \
+                             file://systemd-pam-fix-fallocate.patch \
+                             file://systemd-pam-fix-getty-unit.patch \
+                             file://systemd-pam-fix-mkostemp.patch \
+                             file://systemd-pam-fix-msformat.patch \
+                             file://optional_secure_getenv.patch \
+                            "
+LDFLAGS_libc-uclibc_append = " -lrt"
+
+# This will disappear with systemd 197
+SYSTEMDDISTRO ?= "debian"
+
+CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
+                        ac_cv_file__usr_share_hwdata_pci_ids=no \
+                        ac_cv_file__usr_share_misc_pci_ids=yes"
+
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
+                 --with-rootprefix=${base_prefix} \
+                 --with-rootlibdir=${base_libdir} \
+                 --sbindir=${base_sbindir} \
+                 --libexecdir=${base_libdir} \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 --enable-xz \
+                 --disable-manpages \
+                 --disable-coredump \
+                 --disable-introspection \
+                 --with-pci-ids-path=/usr/share/misc \
+                 --disable-gtk-doc-html \
+                 --disable-tcpwrap \
+                 --enable-split-usr \
+                 --disable-microhttpd \
+                 --without-python \
+               "
+
+# There's no docbook-xsl-native, so for the xsltproc check to false
+do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+	sed -i /xsltproc/d configure.ac
+
+	# we only have /home/root, not /root
+	sed -i -e 's:=/root:=/home/root:g' units/*.service*
+
+	gtkdocize --docdir ${S}/docs/
+}
+
+do_install() {
+	autotools_do_install
+	install -d ${D}/${base_sbindir}
+	# provided by a seperate recipe
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+
+	# provide support for initramfs
+	ln -s ${systemd_unitdir}/systemd ${D}/init
+	ln -s ${systemd_unitdir}/systemd-udevd ${D}/${base_sbindir}/udevd
+
+	# create dir for journal
+	install -d ${D}${localstatedir}/log/journal
+
+	# create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
+	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+}
+
+python populate_packages_prepend (){
+    systemdlibdir = d.getVar("base_libdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
+
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r lock"
+
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+RDEPENDS_${PN}-analyze = "python-dbus python-argparse python-textutils"
+RRECOMMENDS_${PN}-analyze = "python-pycairo"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
+
+FILES_${PN}-gui = "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
+
+CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+                ${sysconfdir}/systemd/logind.conf \
+                ${sysconfdir}/systemd/system.conf \
+                ${sysconfdir}/systemd/user.conf"
+
+FILES_${PN} = " ${base_bindir}/* \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${PN} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/binfmt.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
+                ${sysconfdir}/init.d/README \
+                ${systemd_unitdir}/* \
+                ${systemd_unitdir}/system/* \
+                /lib/udev/rules.d/99-systemd.rules \
+                ${base_libdir}/security/*.so \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${bindir}/localectl \
+                ${bindir}/hostnamectl \
+                ${bindir}/timedatectl \
+                ${exec_prefix}/lib/tmpfiles.d/*.conf \
+                ${exec_prefix}/lib/systemd \
+                ${exec_prefix}/lib/binfmt.d \
+                ${exec_prefix}/lib/modules-load.d \
+                ${exec_prefix}/lib/sysctl.d \
+                ${localstatedir} \
+                ${libexecdir} \
+                /lib/udev/rules.d/70-uaccess.rules \
+                /lib/udev/rules.d/71-seat.rules \
+                /lib/udev/rules.d/73-seat-late.rules \
+                /lib/udev/rules.d/99-systemd.rules \
+               "
+
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+
+RDEPENDS_${PN} += "dbus udev-systemd"
+
+# kbd -> loadkeys,setfont
+# systemd calls 'modprobe -sab --', which busybox doesn't support due to lack
+# of blacklist support, so use proper modprobe from module-init-tools
+# And pull in the kernel modules mentioned in INSTALL
+# swapon -p is also not supported by busybox
+# busybox mount is broken
+RRECOMMENDS_${PN} += "systemd-serialgetty \
+                      util-linux-agetty \
+                      util-linux-swaponoff \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      module-init-tools \
+                      util-linux-mount util-linux-umount \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+"
+
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+
+FILES_udev-dbg += "/lib/udev/.debug"
+
+RDEPENDS_udev += "udev-utils"
+RPROVIDES_udev = "hotplug"
+
+FILES_udev += "${base_sbindir}/udevd \
+               /libstemd-udevd \
+               /lib/udev/accelerometer \
+               /lib/udev/ata_id \
+               /lib/udev/cdrom_id \
+               /lib/udev/collect \
+               /lib/udev/findkeyboards \
+               /lib/udev/keyboard-force-release.sh \
+               /lib/udev/keymap \
+               /lib/udev/mtd_probe \
+               /lib/udev/scsi_id \
+               /lib/udev/v4l_id \
+               /lib/udev/keymaps \
+               /lib/udev/rules.d/4*.rules \
+               /lib/udev/rules.d/5*.rules \
+               /lib/udev/rules.d/6*.rules \
+               /lib/udev/rules.d/70-power-switch.rules \
+               /lib/udev/rules.d/75*.rules \
+               /lib/udev/rules.d/78*.rules \
+               /lib/udev/rules.d/8*.rules \
+               /lib/udev/rules.d/95*.rules \
+               ${base_libdir}/udev/hwdb.d \
+               ${sysconfdir}/udev \
+              "
+
+FILES_udev-consolekit += "/lib/ConsoleKit"
+RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
+
+FILES_udev-utils = "${bindir}/udevadm"
+
+FILES_udev-systemd = "${systemd_unitdir}/system/*udev* ${systemd_unitdir}/system/*.wants/*udev*"
+RDEPENDS_udev-systemd = "udev"
+
+# TODO:
+# u-a for runlevel and telinit
+
+pkg_postinst_systemd () {
+update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
+update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
+update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
+}
+
+pkg_prerm_systemd () {
+update-alternatives --remove init ${systemd_unitdir}/systemd
+update-alternatives --remove halt ${base_bindir}/systemctl
+update-alternatives --remove reboot ${base_bindir}/systemctl
+update-alternatives --remove shutdown ${base_bindir}/systemctl
+update-alternatives --remove poweroff ${base_bindir}/systemctl
+}
-- 
1.7.10.4



