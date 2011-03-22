Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29lx-0005bX-QD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:09:54 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q29kD-0003CG-2G from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:08:05 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:08:04 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:08:03 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:36 -0700
Message-Id: <d6b1a8c06749a3ca4ab2989c80fe183c0807d74e.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 22:08:03.0950 (UTC)
	FILETIME=[9D9698E0:01CBE8DD]
Subject: [PATCH 4/7] Various: Switch to KERNELORG_MIRROR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 22:09:54 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.82.bb     |    2 +-
 .../connman/connman-gnome_0.5.bb                   |    2 +-
 meta/recipes-connectivity/connman/connman_0.65.bb  |    2 +-
 meta/recipes-connectivity/ofono/ofono_0.37.bb      |    2 +-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-devtools/git/git.inc                  |    2 +-
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    2 +-
 meta/recipes-extended/man-pages/man-pages_3.32.bb  |    2 +-
 meta/recipes-extended/pam/libpam_1.1.3.bb          |    2 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          |    2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
index 6f13ada..8c14ef4 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 RDEPENDS_${PN} = "${PN}-ids"
 PR = "r1"
 
-SRC_URI = "ftp://ftp.kernel.org/pub/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/pub/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
            file://pcimodules-pciutils.diff \
            file://lib-build-fix.patch \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.82.bb b/meta/recipes-connectivity/bluez/bluez4_4.82.bb
index 9189a58..d10220c 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.82.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.82.bb
@@ -19,7 +19,7 @@ ASNEEDED = ""
 PR = "r0"
 
 SRC_URI = "\
-  http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
   file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
   file://sbc-thumb.patch;patch=1 \
   file://bluetooth.conf \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index dc5527b..beeab5c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -10,7 +10,7 @@ PR = "r4"
 
 RRECOMMENDS_${PN} = "python python-dbus connman connman-plugin-ethernet connman-plugin-loopback connman-plugin-udhcp connman-plugin-wifi connman-plugin-fake connman-plugin-bluetooth connman-plugin-dnsproxy"
 
-SRC_URI = "http://www.kernel.org/pub/linux/network/connman/connman-gnome-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/network/connman/connman-gnome-${PV}.tar.gz \
            file://connman-gnome.patch \
            file://remove-connman-property-desktop-file.patch \
            file://service_name_update.patch \
diff --git a/meta/recipes-connectivity/connman/connman_0.65.bb b/meta/recipes-connectivity/connman/connman_0.65.bb
index 8bb84a1..6addc95 100644
--- a/meta/recipes-connectivity/connman/connman_0.65.bb
+++ b/meta/recipes-connectivity/connman/connman_0.65.bb
@@ -19,7 +19,7 @@ EXTRA_OECONF += "\
   --prefix=/usr --sysconfdir=/etc --localstatedir=/var"
 
 SRC_URI  = "\
-  http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
+  ${KERNELORG_MIRROR}/pub/linux/network/connman/connman-${PV}.tar.gz \
   file://fix-shutdown-ap-disconnect.patch \
   file://add_xuser_dbus_permission.patch \
   file://connman \
diff --git a/meta/recipes-connectivity/ofono/ofono_0.37.bb b/meta/recipes-connectivity/ofono/ofono_0.37.bb
index 1c1c501..7d50c9d 100644
--- a/meta/recipes-connectivity/ofono/ofono_0.37.bb
+++ b/meta/recipes-connectivity/ofono/ofono_0.37.bb
@@ -2,7 +2,7 @@ require ofono.inc
 
 PR = "r0"
 
-SRC_URI  = "http://www.kernel.org/pub/linux/network/ofono/${P}.tar.bz2 \
+SRC_URI  = "${KERNELORG_MIRROR}/pub/linux/network/ofono/${P}.tar.bz2 \
 	          file://ofono"
 
 SRC_URI[md5sum] = "fa9a6f91506db2ac5bf313ff0bde65f3"
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 9fcf86a..3b0368a 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -15,7 +15,7 @@ RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
 RDEPENDS_libudev = "${PN} (= ${EXTENDPV})"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://run.rules \
            file://udev.rules \
            file://devfs-udev.rules \
diff --git a/meta/recipes-core/udev/udev_145.bb b/meta/recipes-core/udev/udev_145.bb
index e26660b..6345ab0 100644
--- a/meta/recipes-core/udev/udev_145.bb
+++ b/meta/recipes-core/udev/udev_145.bb
@@ -2,7 +2,7 @@ RPROVIDES_${PN} = "hotplug"
 
 PR = "r10"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://enable-gudev.patch;patch=1 \
 	   file://run.rules \
 	   "
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index da4541d..543d33e 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "perl-native openssl curl zlib expat"
 
-SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/pub/software/scm/git/git-${PV}.tar.bz2 \
            file://autotools.patch;patch=1"
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index fad0340..37bca28 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -8,7 +8,7 @@ PV = "0.33"
 
 inherit native
 
-SRC_URI = "http://www.kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.gz\
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.gz\
            file://guilt-push.patch \
 	   file://guilt-pop.patch \
 	   file://guilt.patch \
diff --git a/meta/recipes-extended/man-pages/man-pages_3.32.bb b/meta/recipes-extended/man-pages/man-pages_3.32.bb
index 3c069f2..03c057c 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.32.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.32.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL"
 PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
-SRC_URI = "http://www.kernel.org/pub/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "cc6c2d4d4eb364fd8da718c412db09d4"
 SRC_URI[sha256sum] = "61ef2fc36421e72eb92d1f533576a439a2fcdae20269393f740dd98abd8be519"
diff --git a/meta/recipes-extended/pam/libpam_1.1.3.bb b/meta/recipes-extended/pam/libpam_1.1.3.bb
index 7a8b29a..d5b4877 100644
--- a/meta/recipes-extended/pam/libpam_1.1.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.3.bb
@@ -15,7 +15,7 @@ DEPENDS = "bison flex"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
 RRECOMMENDS_${PN} = "libpam-runtime"
 
-SRC_URI = "http://www.kernel.org/pub/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
            file://pam.d/*"
 
diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index bbe5107..742fc2f 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "virtual/kernel zlib"
 
-SRC_URI = "http://kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
 
 inherit autotools
 
-- 
1.7.0.4



