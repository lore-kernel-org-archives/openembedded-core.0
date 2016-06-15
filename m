Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id AEB8C6018C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 09:54:48 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v199so155554609wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Jx2XezDuZE9zas1nmjvVUhPyqErIUM0RF4cKWUMugyQ=;
	b=Ytuo9y1vA49Bv7BZfFM4ZD/AvwBHSZpzl0bNIYij59/xGA5jVyKtG8v4sAJK8CNYi/
	B4Tg8XDnyv9ZD4XUrXKjwWnihVqYPXpEjb9kso6GMN7ejxWI6muYshTYMdUJsegjAJk7
	iGq8TAPTt69TxGuCXYsTRU/4dC/z9Z0tNxODwuZ/RPSnmngc/nKWiwSBAIDs2Qr8+rpt
	odInupix3xpjEu3VHiNdmB6dCcwTt/4t09ONbb4DYKoj8jjO7eyMvf05DX/qiXMRzfrJ
	ocepiiJcwHe5+cXAbmLkfCLwHJfamUbBqzvDfU6ykaSxiRN0Z187WLYN3wygghbi7X5X
	TLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Jx2XezDuZE9zas1nmjvVUhPyqErIUM0RF4cKWUMugyQ=;
	b=iKjeVFL2rk0FzjhaGpHoPzfO8yjjsII/nAZHbJfkzaq83i8CScyXzaAhzQfP+QaEY9
	wCwP10LjbGuHgPZvV0x2qClRKjmWkyDXzDy/VygcrwgPsLefaRCJZGjHQPhiIeubS42J
	Ur+cxZoQ5dTJSFgOgnEtFlNBGW9UidZxaCiHzy+I7/Jt1G80vO3wVPH7KKQVNs8IKBWG
	z+0h+xXaCUSmfzs+Ajmo5k3vGn5y36i+7e/lAPnBDrnzuCQUxZY6bzXOPOjAVv1A6C/f
	2qpRktBvyGs3KUqosTz4cjbg/ChXZZwl5pXleUYR1ZafSW2j50XNiltBcM6gW07Y6Fx7
	9IXA==
X-Gm-Message-State: ALyK8tL7t6Pz2VjFTmh/Y388WSiwnyseShHEKHpLu4XKpdYJZ/0NCBzByu3FCLXcidxoJBLe
X-Received: by 10.195.17.138 with SMTP id ge10mr11483515wjd.94.1465984488445; 
	Wed, 15 Jun 2016 02:54:48 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	j2sm29955763wjz.15.2016.06.15.02.54.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 02:54:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2016 10:54:43 +0100
Message-Id: <1465984483-1622-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] oprofileui: remove
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
X-List-Received-Date: Wed, 15 Jun 2016 09:54:50 -0000

oprofileui doesn't work anymore with not-so-recent changes to the oprofile
command line interface, and perf is becoming the expected profiling solution so
any future profiling tools should be using that instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  2 --
 .../packagegroup-core-device-devel.bb              |  1 -
 .../recipes-kernel/oprofile/oprofileui-server/init | 37 ----------------------
 .../oprofileui-server/oprofileui-server.service    |  6 ----
 .../oprofile/oprofileui-server_git.bb              | 34 --------------------
 meta/recipes-kernel/oprofile/oprofileui.inc        | 16 ----------
 meta/recipes-kernel/oprofile/oprofileui_git.bb     | 20 ------------
 7 files changed, 116 deletions(-)
 delete mode 100755 meta/recipes-kernel/oprofile/oprofileui-server/init
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui-server_git.bb
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui.inc
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui_git.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index f3315b4..d6ba66b 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -281,8 +281,6 @@ DISTRO_PN_ALIAS_pn-opkg-keyrings = "OSPDT upstream=git://git.yoctoproject.org/op
 DISTRO_PN_ALIAS_pn-opkg-nogpg = "OSPDT upstream=git://git.yoctoproject.org/opkg-utils"
 DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=git://git.yoctoproject.org/opkg-utils"
 DISTRO_PN_ALIAS_pn-oprofile = "Debian=oprofile Fedora=oprofile"
-DISTRO_PN_ALIAS_pn-oprofileui = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
-DISTRO_PN_ALIAS_pn-oprofileui-server = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
 DISTRO_PN_ALIAS_pn-os-release = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-base = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core = "OE-Core"
diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
index b037057..d20eae7 100644
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
@@ -10,7 +10,6 @@ RCONFLICTS_${PN} = "qemu-config"
 
 RDEPENDS_${PN} = "\
     distcc-config \
-    oprofileui-server \
     nfs-export-root \
     bash \
     "
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server/init b/meta/recipes-kernel/oprofile/oprofileui-server/init
deleted file mode 100755
index 2544ea4..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui-server/init
+++ /dev/null
@@ -1,37 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          oprofile-server
-# Required-Start:    $network
-# Required-Stop:     $network
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: OProfileUI server
-# Description:       
-### END INIT INFO
-
-. /etc/init.d/functions
-
-case "$1" in
-  start)
-        echo "Starting OProfileUI server"
-	. /etc/profile
-	/usr/bin/oprofile-server &
-  ;;
-
-  stop)
-        echo "Stopping OProfileUI server"
-        killproc oprofile-server
-  ;;
-
-  restart)
-	$0 stop
-        sleep 1
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service b/meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service
deleted file mode 100644
index 1a2cbe6..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui-server/oprofileui-server.service
+++ /dev/null
@@ -1,6 +0,0 @@
-[Unit]
-Description=OProfileUI Server
-After=network.target
-
-[Service]
-ExecStart=/bin/sh -c ". @SYSCONFDIR@/profile; @BINDIR@/oprofile-server"
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
deleted file mode 100644
index cc3477b..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-require oprofileui.inc
-
-SRCREV = "389e1875af4721d52c7e65cf9cfffb69b0ed6a59"
-PV = "0.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://git.yoctoproject.org/oprofileui \
-           file://init \
-           file://oprofileui-server.service "
-
-DEPENDS += "intltool-native gettext-native"
-
-EXTRA_OECONF += "--disable-client --enable-server"
-
-RDEPENDS_${PN} = "oprofile avahi-daemon"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/oprofileui-server
-
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/oprofileui-server.service ${D}${systemd_unitdir}/system/
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/oprofileui-server.service
-}
-
-inherit update-rc.d systemd
-
-INITSCRIPT_NAME = "oprofileui-server"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
-
-SYSTEMD_SERVICE_${PN} = "oprofileui-server.service"
-SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
deleted file mode 100644
index 8fcf014..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "User Interface for the System-Wide Profiler"
-DESCRIPTION = "User interface for the OProfile tool"
-HOMEPAGE = "http://labs.o-hand.com/oprofileui/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-SECTION = "x11"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "glib-2.0 avahi intltool-native"
-
-inherit autotools pkgconfig gettext
-
-EXTRA_OECONF = "--with-avahi"
-
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
deleted file mode 100644
index 86f3d8e..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require oprofileui.inc
-
-DEPENDS += "gtk+ libglade libxml2 avahi-ui gconf gettext-native"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-SRCREV = "389e1875af4721d52c7e65cf9cfffb69b0ed6a59"
-PV = "0.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://git.yoctoproject.org/oprofileui"
-
-EXTRA_OECONF += "--enable-client --disable-server"
-
-PACKAGES =+ "oprofileui-viewer"
-
-FILES_oprofileui-viewer = "${bindir}/oparchconv ${bindir}/oprofile-viewer ${datadir}/applications/ ${datadir}/oprofileui/ ${datadir}/icons"
-RDEPENDS_oprofileui-viewer = "oprofile"
-- 
2.8.0.rc3


