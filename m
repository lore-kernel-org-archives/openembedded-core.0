Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29m1-0005c5-T7
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:09:58 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q29kF-0003CQ-AC from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:08:07 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:07:14 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:08:05 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:41 -0700
Message-Id: <5516860fc7e6d3d35f42bfcf6b32b0f278382bd3.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 22:08:05.0918 (UTC)
	FILETIME=[9EC2E3E0:01CBE8DD]
Subject: [PATCH 5/7] Various: Update KERNELORG_MIRROR for consistency
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
X-List-Received-Date: Tue, 22 Mar 2011 22:09:58 -0000

In mirrors.bbclass we point into /pub but we don't in bitbake.conf.
All uses of KERNELORG_MIRROR look into /pub anyhow, so lets make
use of that.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../recipes-support/openobex/openobex_1.5.bb       |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    2 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.82.bb     |    2 +-
 .../connman/connman-gnome_0.5.bb                   |    2 +-
 meta/recipes-connectivity/connman/connman_0.65.bb  |    2 +-
 meta/recipes-connectivity/ofono/ofono_0.37.bb      |    2 +-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-devtools/git/git.inc                  |    2 +-
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    2 +-
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    2 +-
 meta/recipes-extended/man-pages/man-pages_3.32.bb  |    2 +-
 meta/recipes-extended/mdadm/mdadm_3.1.4.bb         |    2 +-
 meta/recipes-extended/pam/libpam_1.1.3.bb          |    2 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |    2 +-
 .../module-init-tools/module-init-tools.inc        |    2 +-
 meta/recipes-kernel/modutils/modutils_2.4.27.bb    |    2 +-
 meta/recipes-support/libcap/libcap.inc             |    2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-demoapps/recipes-support/openobex/openobex_1.5.bb b/meta-demoapps/recipes-support/openobex/openobex_1.5.bb
index dc07ae1..397c932 100644
--- a/meta-demoapps/recipes-support/openobex/openobex_1.5.bb
+++ b/meta-demoapps/recipes-support/openobex/openobex_1.5.bb
@@ -7,7 +7,7 @@ DEPENDS = "libusb bluez4"
 LICENSE = "GPL"
 PR = "r4"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/bluetooth/openobex-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch;patch=1 \
 	   file://libusb_crosscompile_check.patch;patch=1"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d5f1fc5..74f3ccb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -540,7 +540,7 @@ GPE_SVN = "svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=${PN}"
 GPEPHONE_MIRROR = "http://gpephone.linuxtogo.org/download/gpephone"
 GPEPHONE_SVN = "svn://projects.linuxtogo.org/svn/gpephone/trunk/source;module=${PN}"
 HANDHELDS_CVS = "cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs"
-KERNELORG_MIRROR = "http://kernel.org"
+KERNELORG_MIRROR = "http://kernel.org/pub"
 SOURCEFORGE_MIRROR = "http://downloads.sourceforge.net"
 XLIBS_MIRROR = "http://xlibs.freedesktop.org/release"
 XORG_MIRROR = "http://xorg.freedesktop.org/releases"
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
index 8c14ef4..4e6d4e1 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 RDEPENDS_${PN} = "${PN}-ids"
 PR = "r1"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
            file://pcimodules-pciutils.diff \
            file://lib-build-fix.patch \
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 750a2cf..260cccb 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -10,7 +10,7 @@ DEPENDS = "sysfsutils flex-native"
 RDEPENDS_${PN} = "udev module-init-tools"
 RCONFLICTS_${PN} += "pcmcia-cs"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/pcmcia/pcmciautils-${PV}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/pcmciautils-${PV}.tar.bz2"
 
 S = "${WORKDIR}/pcmciautils-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.82.bb b/meta/recipes-connectivity/bluez/bluez4_4.82.bb
index d10220c..b1c5fd4 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.82.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.82.bb
@@ -19,7 +19,7 @@ ASNEEDED = ""
 PR = "r0"
 
 SRC_URI = "\
-  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
+  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
   file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
   file://sbc-thumb.patch;patch=1 \
   file://bluetooth.conf \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index beeab5c..4fcdfaf 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -10,7 +10,7 @@ PR = "r4"
 
 RRECOMMENDS_${PN} = "python python-dbus connman connman-plugin-ethernet connman-plugin-loopback connman-plugin-udhcp connman-plugin-wifi connman-plugin-fake connman-plugin-bluetooth connman-plugin-dnsproxy"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/network/connman/connman-gnome-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/network/connman/connman-gnome-${PV}.tar.gz \
            file://connman-gnome.patch \
            file://remove-connman-property-desktop-file.patch \
            file://service_name_update.patch \
diff --git a/meta/recipes-connectivity/connman/connman_0.65.bb b/meta/recipes-connectivity/connman/connman_0.65.bb
index 6addc95..852f8dc 100644
--- a/meta/recipes-connectivity/connman/connman_0.65.bb
+++ b/meta/recipes-connectivity/connman/connman_0.65.bb
@@ -19,7 +19,7 @@ EXTRA_OECONF += "\
   --prefix=/usr --sysconfdir=/etc --localstatedir=/var"
 
 SRC_URI  = "\
-  ${KERNELORG_MIRROR}/pub/linux/network/connman/connman-${PV}.tar.gz \
+  ${KERNELORG_MIRROR}/linux/network/connman/connman-${PV}.tar.gz \
   file://fix-shutdown-ap-disconnect.patch \
   file://add_xuser_dbus_permission.patch \
   file://connman \
diff --git a/meta/recipes-connectivity/ofono/ofono_0.37.bb b/meta/recipes-connectivity/ofono/ofono_0.37.bb
index 7d50c9d..aea4e98 100644
--- a/meta/recipes-connectivity/ofono/ofono_0.37.bb
+++ b/meta/recipes-connectivity/ofono/ofono_0.37.bb
@@ -2,7 +2,7 @@ require ofono.inc
 
 PR = "r0"
 
-SRC_URI  = "${KERNELORG_MIRROR}/pub/linux/network/ofono/${P}.tar.bz2 \
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
 	          file://ofono"
 
 SRC_URI[md5sum] = "fa9a6f91506db2ac5bf313ff0bde65f3"
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 3b0368a..4faaae1 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -15,7 +15,7 @@ RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
 RDEPENDS_libudev = "${PN} (= ${EXTENDPV})"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://run.rules \
            file://udev.rules \
            file://devfs-udev.rules \
diff --git a/meta/recipes-core/udev/udev_145.bb b/meta/recipes-core/udev/udev_145.bb
index 6345ab0..fde5050 100644
--- a/meta/recipes-core/udev/udev_145.bb
+++ b/meta/recipes-core/udev/udev_145.bb
@@ -2,7 +2,7 @@ RPROVIDES_${PN} = "hotplug"
 
 PR = "r10"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://enable-gudev.patch;patch=1 \
 	   file://run.rules \
 	   "
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 861747d..913bb1b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -18,7 +18,7 @@ DEPENDS_virtclass-native = "zlib-native ncurses-native lzo-native gettext-native
 
 inherit autotools gettext
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
            file://MCONFIG \
            file://swapargs.h \
            file://defines.h \
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 543d33e..e1d1c71 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "perl-native openssl curl zlib expat"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/software/scm/git/git-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 \
            file://autotools.patch;patch=1"
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 37bca28..6261330 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -8,7 +8,7 @@ PV = "0.33"
 
 inherit native
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.gz\
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.gz\
            file://guilt-push.patch \
 	   file://guilt-pop.patch \
 	   file://guilt.patch \
diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 1fa318b..05bcb21 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 DEPENDS = "nasm-native"
 PR = "r0"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
 
 SRC_URI[md5sum] = "a7ca38a0a5786b6efae8fb01a1ae8070"
diff --git a/meta/recipes-extended/man-pages/man-pages_3.32.bb b/meta/recipes-extended/man-pages/man-pages_3.32.bb
index 03c057c..b96d1ce 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.32.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.32.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL"
 PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "cc6c2d4d4eb364fd8da718c412db09d4"
 SRC_URI[sha256sum] = "61ef2fc36421e72eb92d1f533576a439a2fcdae20269393f740dd98abd8be519"
diff --git a/meta/recipes-extended/mdadm/mdadm_3.1.4.bb b/meta/recipes-extended/mdadm/mdadm_3.1.4.bb
index 8c13b93..ef62a3f 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.1.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.1.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 PR = "r1"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	   file://fix-z-now.patch;striplevel=0"
 
 SRC_URI[md5sum] = "0e7dcb5cc4192ae3abd9956bac475576"
diff --git a/meta/recipes-extended/pam/libpam_1.1.3.bb b/meta/recipes-extended/pam/libpam_1.1.3.bb
index d5b4877..9d6c317 100644
--- a/meta/recipes-extended/pam/libpam_1.1.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.3.bb
@@ -15,7 +15,7 @@ DEPENDS = "bison flex"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
 RRECOMMENDS_${PN} = "libpam-runtime"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
            file://pam.d/*"
 
diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 742fc2f..30c6291 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "virtual/kernel zlib"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
 
 inherit autotools
 
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index f25aed4..8c5dc76 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -3,7 +3,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7" 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2"
 
 #DEPENDS = "cross-linkage"
 RDEPENDS_${PN}-dev = ""
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools.inc b/meta/recipes-kernel/module-init-tools/module-init-tools.inc
index 49522c7..4d96d16 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools.inc
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools.inc
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += "module-init-tools-depmod"
 FILES_module-init-tools-depmod = "${sbindir}/depmod.26"
 FILES_module-init-tools-insmod-static = "${sbindir}/insmod.static"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
            file://ignore_arch_directory.patch \
            file://modutils_extension.patch \
            file://disable_man.patch \
diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
index 54e3a73..1ebc90c 100644
--- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
+++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "bison-native"
 PR = "r9"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.bz2 \
            file://lex.l.diff;patch=1 \
            file://modutils-notest.patch;patch=1 \
            file://configure.patch;patch=1 \
diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 16eaae6..66730b8 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://License;md5=731de803c1ccbcb05a9b3523279c8d7f"
 
 DEPENDS = "libpam attr perl-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/security/linux-privs/libcap2/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/libcap2/${BPN}-${PV}.tar.bz2"
 
 inherit lib_package
 
-- 
1.7.0.4



