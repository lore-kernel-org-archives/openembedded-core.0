Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1m9x-00042U-Hf
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 23:01:37 +0100
Received: by eekc1 with SMTP id c1so210436eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 13:53:12 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.114.7 as permitted sender) client-ip=10.213.114.7; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.114.7 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.114.7])
	by 10.213.114.7 with SMTP id c7mr1797010ebq.144.1330293192433 (num_hops
	= 1); Sun, 26 Feb 2012 13:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tQ/xTljfmr8997VHJAXieNe3EfC2eFZmCV2H6bUGKnA=;
	b=h2M+NwnpbHz0Te27785+aQs+1gatzDF0h224Jrb4h5ktJJiSImGkalIjSRo/FeVNJX
	Da+a/wLnahUzFp5rD/VAz65T+p2fIzNQvs2GIqWSAgdQrOdmjclFvKxZghB7m2W0jcG2
	+rf2aCR4MnZ7ouBcl/HjvoIA2iv4Ej3lD0hY4=
Received: by 10.213.114.7 with SMTP id c7mr1352862ebq.144.1330293191298;
	Sun, 26 Feb 2012 13:53:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm49990516eei.3.2012.02.26.13.53.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 13:53:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:53:02 +0100
Message-Id: <1330293182-4178-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] More quoting fixes
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
X-List-Received-Date: Sun, 26 Feb 2012 22:01:37 -0000

* We have various variables which are either not quoted at all or are half
  quoted. This patch fixes the bad exmaples so everything is consistent.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image.bbclass                         |    4 ++--
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    2 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
 meta/recipes-core/busybox/busybox.inc              |    4 ++--
 meta/recipes-core/eglibc/eglibc.inc                |    2 +-
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    2 +-
 .../installer/adt-installer_1.0.bb                 |    2 +-
 .../python/python-argparse_1.2.1.bb                |    2 +-
 meta/recipes-devtools/python/python-dbus_1.0.0.bb  |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    4 ++--
 .../cwautomacros/cwautomacros_20110201.bb          |    2 +-
 .../ghostscript/ghostscript_9.04.bb                |    2 +-
 meta/recipes-extended/lsb/lsb_1.4.bb               |    2 +-
 meta/recipes-extended/lsb/lsbsetup_1.0.bb          |    2 +-
 meta/recipes-extended/quota/quota_4.00.bb          |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    2 +-
 meta/recipes-graphics/drm/libdrm_git.bb            |    2 +-
 .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    2 +-
 .../x11-common/xserver-nodm-init.bb                |    2 +-
 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb     |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../linux-libc-headers-yocto_git.bb                |    2 +-
 meta/recipes-kernel/linux/linux-tools.inc          |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |    4 ++--
 meta/recipes-kernel/linux/linux-yocto.inc          |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   10 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   10 +++++-----
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |    2 +-
 .../systemtap/systemtap-uprobes_git.bb             |    2 +-
 meta/recipes-multimedia/lame/lame_3.99.3.bb        |    3 ++-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-support/nspr/nspr_4.8.9.bb            |    2 +-
 meta/recipes-support/vte/vte.inc                   |    2 +-
 38 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c6a7319..54ab157 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -70,7 +70,7 @@ LDCONFIGDEPEND_libc-uclibc = ""
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 
-IMAGE_TYPE = ${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}
+IMAGE_TYPE = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
 inherit image-${IMAGE_TYPE}
 
 python () {
@@ -130,7 +130,7 @@ do_build[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate
 # task, so that we have a single fakeroot context for the whole process.
-do_rootfs[umask] = 022
+do_rootfs[umask] = "022"
 
 fakeroot do_rootfs () {
 	#set -x
diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 9bcc1cb..c951152 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -34,7 +34,7 @@ S = "${WORKDIR}/grub-${PV}"
 
 # Determine the target arch for the grub modules before the native class
 # clobbers TARGET_ARCH.
-ORIG_TARGET_ARCH := ${TARGET_ARCH}
+ORIG_TARGET_ARCH := "${TARGET_ARCH}"
 python __anonymous () {
     import re
     target = d.getVar('ORIG_TARGET_ARCH', True)
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index e65f607..c0c1d0c 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -21,7 +21,7 @@ export udevrulesdir = "${sysconfdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
-CFLAGS =+ -DPCMCIAUTILS_VERSION=\'${PV}\'
+CFLAGS =+ "-DPCMCIAUTILS_VERSION=\'${PV}\'"
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3cee1a4..5e29b9c 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -95,7 +95,7 @@ RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
 RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
 RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
 
-RRECOMMENDS_avahi-dev[nodeprrecs] = 1
+RRECOMMENDS_avahi-dev[nodeprrecs] = "1"
 
 CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index ccdc4c3..99317e4 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -22,7 +22,7 @@ S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${sbindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += " ${datadir}/dbus-1/system-services/*
+FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index fc69d65..7aa131c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -73,8 +73,8 @@ configmangle = '/CROSS_COMPILER_PREFIX/d; \
 		'
 OE_FEATURES := "${@features_to_busybox_conf(d)}"
 OE_DEL      := "${@features_to_busybox_del(d)}"
-DO_IPv4 := ${@base_contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}
-DO_IPv6 := ${@base_contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}
+DO_IPv4 := "${@base_contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}"
+DO_IPv6 := "${@base_contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}"
 
 python () {
   if "${OE_DEL}":
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 64694a0..da5c187 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -42,7 +42,7 @@ ARM_INSTRUCTION_SET = "arm"
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
 EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
 EXTRA_OEMAKE[vardepsexclude] += "EGLIBCPARALLELISM"
-EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
+EXTRA_OEMAKE += "${EGLIBCPARALLELISM}"
 PARALLEL_MAKE = ""
 
 OE_FEATURES = "${@features_to_eglibc_settings(d)}"
diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 54b1b90..03763f7 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 
 PV = "0.33"
-PR = r1
+PR = "r1"
 
 inherit native
 
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 5e76067..340349d 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -53,7 +53,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 
 ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
 
-do_populate_adt[umask] = 022
+do_populate_adt[umask] = "022"
 
 fakeroot do_populate_adt () {
 	cd ${WORKDIR}
diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
index 76d89a1..789cee1 100644
--- a/meta/recipes-devtools/python/python-argparse_1.2.1.bb
+++ b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python command-line parsing library"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
-SRCNAME = argparse
+SRCNAME = "argparse"
 PR = "r1"
 
 SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
diff --git a/meta/recipes-devtools/python/python-dbus_1.0.0.bb b/meta/recipes-devtools/python/python-dbus_1.0.0.bb
index a977e8d..1b174eb 100644
--- a/meta/recipes-devtools/python/python-dbus_1.0.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.0.0.bb
@@ -22,4 +22,4 @@ export STAGING_INCDIR
 
 RDEPENDS_${PN} = "python-io python-logging python-stringold python-threading python-xml"
 
-FILES_${PN}-dev += "${libdir}/pkgconfig 
+FILES_${PN}-dev += "${libdir}/pkgconfig"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index c9ac396..55bed76 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -30,8 +30,8 @@ INITSCRIPT_NAME = "tcf-agent"
 INITSCRIPT_PARAMS = "start 999 3 5 . stop 20 0 1 2 6 ."
 
 # mangling needed for make
-MAKE_ARCH = `echo ${TARGET_ARCH} | sed s,i.86,i686,`
-MAKE_OS = `echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`
+MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686,`"
+MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
 
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 18efced..41713b3 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cwautomacros.berlios.de/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = http://download.berlios.de/cwautomacros/cwautomacros-${PV}.tar.bz2
+SRC_URI = "http://download.berlios.de/cwautomacros/cwautomacros-${PV}.tar.bz2"
 
 PR = "r0"
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
index 80d363f..3f9d7b5 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
@@ -113,4 +113,4 @@ FILES_${PN}-cups += "${exec_prefix}/lib/cups/filter/gstoraster \
                      ${sysconfdir}/cups \
                      "
 
-RDEPENDS_${PN}-cups = ${PN}
+RDEPENDS_${PN}-cups = "${PN}"
diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
index 7cecdf2..f2f25ba 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_1.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
-S = ${WORKDIR}/lsb-release-${PV}
+S = "${WORKDIR}/lsb-release-${PV}"
 
 do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D} 
diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
index 03f8012..9172ee3 100644
--- a/meta/recipes-extended/lsb/lsbsetup_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786c
 
 SRC_URI = "file://LSB_Setup.sh"
 
-S=${WORKDIR}
+S = "${WORKDIR}"
 
 do_install() {
     # Only install file if it has a contents
diff --git a/meta/recipes-extended/quota/quota_4.00.bb b/meta/recipes-extended/quota/quota_4.00.bb
index 6b04fd9..5fef9cb 100644
--- a/meta/recipes-extended/quota/quota_4.00.bb
+++ b/meta/recipes-extended/quota/quota_4.00.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV
 SRC_URI[md5sum] = "975f587ff761a60ac25dbe6c00865925"
 SRC_URI[sha256sum] = "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51fb409ba"
 
-S = ${WORKDIR}/quota-tools
+S = "${WORKDIR}/quota-tools"
 
 inherit autotools
 
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 8ee5616..60408e3 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/texinfo-${PV}.tar.gz \
 SRC_URI[md5sum] = "71ba711519209b5fb583fed2b3d86fcb"
 SRC_URI[sha256sum] = "1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68"
 
-S = ${WORKDIR}/texinfo-4.13
+S = "${WORKDIR}/texinfo-4.13"
 tex_texinfo = "texmf/tex/texinfo"
 
 inherit gettext autotools
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index 85bd4fb..c2f9855 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -2,7 +2,7 @@ require libdrm.inc
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm;protocol=git"
 
-S = ${WORKDIR}/git
+S = "${WORKDIR}/git"
 
 SRCREV = "3f3c5be6f908272199ccf53f108b1124bfe0a00e"
 PV = "2.4.15+git${SRCPV}"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
index 5193fda..0ac4deb 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
@@ -16,7 +16,7 @@ FONTREV = "0.20100721"
 SRC_URI = "https://fedorahosted.org/releases/l/i/${BPN}/${BPN}-${PV}.${FONTREV}.tar.gz \
            file://30-liberation-aliases.conf"
 
-S = ${WORKDIR}/${BPN}-${PV}.${FONTREV}
+S = "${WORKDIR}/${BPN}-${PV}.${FONTREV}"
 
 inherit allarch
 
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index b6bd61a..ddb3a1d 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -7,7 +7,7 @@ PR = "r44"
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
 
-S = ${WORKDIR}
+S = "${WORKDIR}"
 
 inherit allarch
 
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 99ef72e..1b95261 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://xserver-nodm \
            file://Xusername \
            file://gplv2-license.patch"
 
-S = ${WORKDIR}
+S = "${WORKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta/recipes-kernel/hello-mod/hello-mod_0.1.bb
index bbd4984..64a6dda 100644
--- a/meta/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 inherit module
 
-PR = r0
+PR = "r0"
 PV = "0.1"
 
 SRC_URI = "file://Makefile \
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 14ec9e9..b28402a 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 DEPENDS = "git-native guilt-native"
 
 SRCREV = "91c2b184be90d6654996887203efdd7f1727a19a"
-PR = r12
+PR = "r12"
 PV = "0.1+git${SRCPV}"
 
 inherit native
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
index 1c709cb..734170f 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout
 
 # force this to empty to prevent installation failures, we aren't
 # building a device tree as part of kern headers
-KERNEL_DEVICETREE=
+KERNEL_DEVICETREE = ""
 
 set_arch() {
 	case ${TARGET_ARCH} in
diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index b667421..3b03c05 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -29,8 +29,8 @@ fakeroot do_install_perf () {
 addtask compile_perf after do_compile before do_install
 addtask install_perf after do_install before do_package
 
-do_compile_perf[umask] = 022
-do_install_perf[umask] = 022
+do_compile_perf[umask] = "022"
+do_install_perf[umask] = "022"
 
 PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
 PERFDEPENDS_libc-uclibc = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index b947a48..3d4a1d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -29,9 +29,9 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckou
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES=features/netfilter
-KERNEL_FEATURES_append=" features/taskstats"
-KERNEL_FEATURES_append_qemux86=" cfg/sound"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/taskstats"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
 
 require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 9b0c1bf..329527f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -29,9 +29,9 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;nocheckou
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES=features/netfilter
-KERNEL_FEATURES_append=" features/taskstats"
-KERNEL_FEATURES_append_qemux86=" cfg/sound"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/taskstats"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
 
 require recipes-kernel/linux/linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index c5855a3..061476c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -3,7 +3,7 @@ require recipes-kernel/linux/linux-yocto.inc
 
 #KMACHINE = "yocto/standard/tiny/base"
 KMACHINE = "yocto/standard/base"
-KBRANCH = ${KMACHINE}
+KBRANCH = "${KMACHINE}"
 
 LINUX_VERSION ?= "3.0.12"
 
@@ -33,4 +33,4 @@ SRC_URI_append_qemux86 = " file://defconfig file://ata.cfg file://e1000.cfg"
 COMPATIBLE_MACHINE = "(qemux86)"
 
 # Functionality flags
-KERNEL_FEATURES=""
+KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 09433fa..2b61b7e 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 # KMACHINE = "UNDEFINED"
 
 # Set this to 'preempt_rt' in the local.conf if you want a real time kernel
-LINUX_KERNEL_TYPE ?= standard
+LINUX_KERNEL_TYPE ?= "standard"
 
-KMETA ?= meta
+KMETA ?= "meta"
 SRCREV_FORMAT ?= "meta_machine" 
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 KERNEL_REVISION_CHECKING ?= "t"
-YOCTO_KERNEL_META_DATA ?= t
+YOCTO_KERNEL_META_DATA ?= "t"
 
 do_patch[depends] = "kern-tools-native:do_populate_sysroot"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index ce71393..27c7558 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -8,7 +8,7 @@ KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
 KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
 KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
-KBRANCH = ${KMACHINE}
+KBRANCH = "${KMACHINE}"
 
 LINUX_VERSION ?= "2.6.37"
 
@@ -28,9 +28,9 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags
-KERNEL_FEATURES="features/netfilter"
-KERNEL_FEATURES_append=" features/taskstats"
-KERNEL_FEATURES_append_qemux86=" cfg/sound"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/taskstats"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
 
 require linux-tools.inc
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 75d0a62..752b953 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,7 +10,7 @@ KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
 KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
 KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
-KBRANCH = ${KMACHINE}
+KBRANCH = "${KMACHINE}"
 
 LINUX_VERSION ?= "3.0.18"
 
@@ -32,9 +32,9 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
 # Functionality flags
-KERNEL_FEATURES="features/netfilter"
-KERNEL_FEATURES_append=" features/taskstats"
-KERNEL_FEATURES_append_qemux86=" cfg/sound"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/taskstats"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
 
 require linux-tools.inc
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
index 5d34c41..4d2f62b 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
                     file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
                     file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-DEPENDS = virtual/kernel
+DEPENDS = "virtual/kernel"
 
 inherit module
 
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index 7fa6748..b328e6b 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "systemtap virtual/kernel"
 PR = "r0"
 
 # On systems without CONFIG_UTRACE, this package is empty.
-ALLOW_EMPTY_${PN} = 1
+ALLOW_EMPTY_${PN} = "1"
 
 inherit module-base gettext
 
diff --git a/meta/recipes-multimedia/lame/lame_3.99.3.bb b/meta/recipes-multimedia/lame/lame_3.99.3.bb
index 4dc4e0a..9248202 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.3.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.3.bb
@@ -6,7 +6,8 @@ LICENSE = "LGPLv2+"
 LICENSE_FLAGS = "commercial"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
-                    file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b
+                    file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
+"
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index c2e7622..a23c4ac 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -51,7 +51,7 @@ STOP
     done
 }
 
-PACKAGES += ${PN}-extra
+PACKAGES += "${PN}-extra"
 RDEPENDS_${PN}-extra += "oh-puzzles"
 
 FILES_${PN} = "/usr/share/pixmaps /usr/share/oh-puzzles/"
diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index 0607c32..8b840d9 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -160,6 +160,6 @@ do_install_append() {
     install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
 }
 
-FILES_${PN} = ${bindir}/*
+FILES_${PN} = "${bindir}/*"
 FILES_${PN}-dev += "${libdir}/nspr/tests/*"
 FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 54bd8ae..7971673 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -12,5 +12,5 @@ EXTRA_OECONF = "--disable-gtk-doc --disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
-FILES_vte-dbg =+ ${libexecdir}/.debug"
+FILES_vte-dbg =+ "${libexecdir}/.debug"
 FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
-- 
1.7.8.4



