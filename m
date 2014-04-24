Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 088F365D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:59:24 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so2649147yho.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:organization; bh=1QahNaYq6J2XKCgu/at2kLcd36bDkvziWiFr6Tkpo9g=;
	b=ST5LpS1HBzCAXubQ0lOIv0DFBdON4lSj44iYvdKAELKtYS+vQvBOkwMuAarpvzfkqm
	TAudKLXI/ZaWnQYtU1xjg0BjE2RjZqmO5yWCYBjwjADI0wiEKpteRG1seMNZDnt6CJBT
	fNdz3FURwTUSTrj0usrBqQtKErhCPApaNealuLhsg7HPYmYRDdhKWUyRjYHA097W9KMa
	Mjz71kgxCZqk8xL5S+mrkk/zaCJ6Dmq8oElO6Hhl5sDV+8v0GUoL0x04yh3fp2fGtK1N
	/xyVMgGF1VRaYQH5G4+b1qlEvkiOW8oZ6RAXDkQtpPRlEMsJEZhDUBm6fdRVQLddmF+w
	Ay4A==
X-Received: by 10.236.127.68 with SMTP id c44mr4990992yhi.1.1398365965549;
	Thu, 24 Apr 2014 11:59:25 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f2sm9057222yhc.41.2014.04.24.11.59.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 11:59:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 379791A5B49DD; Thu, 24 Apr 2014 15:59:20 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 15:59:20 -0300
Message-Id: <1398365960-30797-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc0
In-Reply-To: <1398365960-30797-1-git-send-email-otavio@ossystems.com.br>
References: <1398365960-30797-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 2/2] Globally replace 'base_contains' calls with 'bb.utils.contains'
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
X-List-Received-Date: Thu, 24 Apr 2014 18:59:25 -0000

The base_contains is kept as a compatibility method and we ought to
not use it in OE-Core so we can remove it from base metadata in
future.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 documentation/ref-manual/ref-classes.xml           |   2 +-
 meta-yocto/conf/distro/poky.conf                   |   2 +-
 meta/classes/boot-directdisk.bbclass               |  10 +-
 meta/classes/bootimg.bbclass                       |   8 +-
 meta/classes/buildhistory.bbclass                  |   8 +-
 meta/classes/core-image.bbclass                    |   4 +-
 meta/classes/image.bbclass                         |  20 ++--
 meta/classes/packagegroup.bbclass                  |   2 +-
 meta/classes/ptest.bbclass                         |   4 +-
 meta/classes/rootfs_rpm.bbclass                    |   2 +-
 meta/conf/distro/include/default-providers.inc     |   2 +-
 meta/conf/machine/include/qemu.inc                 |   2 +-
 meta/conf/machine/include/x86-base.inc             |   6 +-
 meta/conf/machine/qemux86-64.conf                  |   2 +-
 meta/conf/machine/qemux86.conf                     |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   4 +-
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   2 +-
 meta/recipes-connectivity/bluez/bluez4.inc         |   4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |   4 +-
 meta/recipes-connectivity/connman/connman.inc      |  30 ++---
 meta/recipes-connectivity/libpcap/libpcap.inc      |   2 +-
 meta/recipes-connectivity/neard/neard.inc          |   8 +-
 meta/recipes-connectivity/ofono/ofono.inc          |   6 +-
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb |  10 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   4 +-
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |   2 +-
 .../resolvconf/resolvconf_1.74.bb                  |   2 +-
 .../wpa-supplicant/wpa-supplicant.inc              |   2 +-
 meta/recipes-core/busybox/busybox.inc              |  26 ++---
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   2 +-
 meta/recipes-core/coreutils/coreutils_8.22.bb      |   2 +-
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb        |   2 +-
 meta/recipes-core/dbus/dbus.inc                    |  10 +-
 meta/recipes-core/dropbear/dropbear.inc            |   8 +-
 meta/recipes-core/eglibc/eglibc-options.inc        |  74 ++++++-------
 meta/recipes-core/eglibc/eglibc.inc                |   2 +-
 meta/recipes-core/glib-2.0/glib.inc                |   4 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   4 +-
 meta/recipes-core/kbd/kbd_2.0.1.bb                 |   2 +-
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |   4 +-
 .../packagegroups/packagegroup-base.bb             | 122 ++++++++++-----------
 .../packagegroups/packagegroup-core-boot.bb        |   6 +-
 .../packagegroup-core-tools-profile.bb             |   4 +-
 .../packagegroup-core-tools-testapps.bb            |   6 +-
 meta/recipes-core/systemd/systemd_211.bb           |   8 +-
 meta/recipes-core/util-linux/util-linux.inc        |   4 +-
 meta/recipes-devtools/binutils/binutils.inc        |   6 +-
 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb      |   2 +-
 meta/recipes-devtools/distcc/distcc_3.1.bb         |   2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   2 +-
 meta/recipes-devtools/gdb/gdb_7.6.2.bb             |   2 +-
 meta/recipes-devtools/opkg/opkg.inc                |   2 +-
 meta/recipes-devtools/patch/patch_2.7.1.bb         |   2 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   2 +-
 .../python/python-imaging_1.1.7.bb                 |   4 +-
 .../python/python-smartpm_1.4.1.bb                 |  12 +-
 meta/recipes-devtools/python/python.inc            |   2 +-
 meta/recipes-devtools/qemu/qemu.inc                |   4 +-
 meta/recipes-devtools/strace/strace_4.8.bb         |   2 +-
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |   2 +-
 meta/recipes-extended/at/at_3.1.14.bb              |  10 +-
 meta/recipes-extended/cronie/cronie_1.4.11.bb      |   4 +-
 meta/recipes-extended/cups/cups.inc                |   4 +-
 meta/recipes-extended/findutils/findutils_4.4.2.bb |   2 +-
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |   2 +-
 .../libarchive/libarchive_3.1.2.bb                 |   6 +-
 .../packagegroup-core-full-cmdline.bb              |   2 +-
 .../packagegroups/packagegroup-core-lsb.bb         |   2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   4 +-
 meta/recipes-extended/screen/screen_4.0.3.bb       |   8 +-
 meta/recipes-extended/shadow/shadow.inc            |   4 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   2 +-
 meta/recipes-extended/sudo/sudo_1.8.9p5.bb         |  10 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |   2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb |   4 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   2 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   4 +-
 meta/recipes-graphics/cairo/cairo.inc              |   4 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   4 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   4 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  16 +--
 meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb     |  16 +--
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb     |   4 +-
 meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb        |   2 +-
 meta/recipes-graphics/mesa/mesa.inc                |  14 +--
 meta/recipes-graphics/mesa/mesa_9.2.5.bb           |   4 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   4 +-
 .../packagegroups/packagegroup-core-directfb.bb    |   2 +-
 meta/recipes-graphics/pango/pango.inc              |   2 +-
 meta/recipes-graphics/wayland/weston_1.4.0.bb      |   8 +-
 .../x11-common/xserver-nodm-init.bb                |   4 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |   2 +-
 .../xorg-driver/xf86-video-intel_2.21.15.bb        |   2 +-
 .../xorg-driver/xf86-video-intel_2.99.910.bb       |   2 +-
 .../xorg-lib/libxkbcommon_0.4.1.bb                 |   2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +-
 meta/recipes-kernel/kmod/kmod_git.bb               |   2 +-
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |   4 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   2 +-
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb  |   4 +-
 .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |   2 +-
 .../gstreamer/gst-meta-base_0.10.bb                |   2 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   2 +-
 .../gstreamer/gst-plugins-base_0.10.36.bb          |   2 +-
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   2 +-
 .../gstreamer/gstreamer1.0-meta-base.bb            |   2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   8 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   6 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   4 +-
 meta/recipes-multimedia/libav/libav.inc            |   2 +-
 .../libsndfile/libsndfile1_1.0.25.bb               |   2 +-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |   2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  12 +-
 .../packagegroups/packagegroup-core-qt4e.bb        |   2 +-
 .../packagegroup-qt-toolchain-target.bb            |   4 +-
 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   8 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   4 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |   2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |   8 +-
 .../matchbox-theme-sato/matchbox-theme-sato_git.bb |   2 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   4 +-
 meta/recipes-support/boost/boost.inc               |   2 +-
 .../recipes-support/consolekit/consolekit_0.4.6.bb |   6 +-
 meta/recipes-support/libcap/libcap.inc             |   4 +-
 meta/recipes-support/libproxy/libproxy_0.4.11.bb   |   2 +-
 .../arch/qemu/conf/machine/{{=machine}}.conf       |   2 +-
 134 files changed, 394 insertions(+), 394 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index da54608..7331867 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -3211,7 +3211,7 @@
         The <filename>utils</filename> class provides some useful Python
         functions that are typically used in inline Python expressions
         (e.g. <filename>${@...}</filename>).
-        One example use is for <filename>base_contains()</filename>.
+        One example use is for <filename>bb.utils.contains()</filename>.
     </para>
 
     <para>
diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index 062530d..ab01bbb 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -35,7 +35,7 @@ EXTRAOPKGCONFIG = "poky-feed-config-opkg"
 DISTRO_EXTRA_RDEPENDS += " ${POKY_DEFAULT_EXTRA_RDEPENDS}"
 DISTRO_EXTRA_RRECOMMENDS += " ${POKY_DEFAULT_EXTRA_RRECOMMENDS}"
 
-POKYQEMUDEPS = "${@base_contains("INCOMPATIBLE_LICENSE", "GPLv3", "", "qemu-config",d)}"
+POKYQEMUDEPS = "${@bb.utils.contains("INCOMPATIBLE_LICENSE", "GPLv3", "", "qemu-config",d)}"
 DISTRO_EXTRA_RDEPENDS_append_qemuarm = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemumips = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemuppc = " ${POKYQEMUDEPS}"
diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 88e5c52..0da9932 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -31,17 +31,17 @@ EXCLUDE_FROM_WORLD = "1"
 BOOTDD_VOLUME_ID   ?= "boot"
 BOOTDD_EXTRA_SPACE ?= "16384"
 
-EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
 EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
 # specified, maintaining the original behavior.
 def pcbios(d):
-    pcbios = base_contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
     if pcbios == "0":
-        pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
+        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
     return pcbios
 
 def pcbios_class(d):
@@ -62,7 +62,7 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
-IS_VMDK = '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
+IS_VMDK = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
 
 boot_direct_populate() {
 	dest=$1
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index b13eef9..7678567 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -41,17 +41,17 @@ COMPRESSISO ?= "0"
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
-EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
+EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
 EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
 # specified, maintaining the original behavior.
 def pcbios(d):
-    pcbios = base_contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+    pcbios = bb.utils.contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
     if pcbios == "0":
-        pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
+        pcbios = bb.utils.contains("MACHINE_FEATURES", "efi", "0", "1", d)
     return pcbios
 
 PCBIOS = "${@pcbios(d)}"
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 262095f..d75e7e6 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -403,7 +403,7 @@ buildhistory_get_image_installed() {
 	# Anything requiring the use of the packaging system should be done in here
 	# in case the packaging files are going to be removed for this image
 
-	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
 		return
 	fi
 
@@ -414,7 +414,7 @@ buildhistory_get_sdk_installed() {
 	# Anything requiring the use of the packaging system should be done in here
 	# in case the packaging files are going to be removed for this SDK
 
-	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'sdk', '1', '0', d)}" = "0" ] ; then
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'sdk', '1', '0', d)}" = "0" ] ; then
 		return
 	fi
 
@@ -437,7 +437,7 @@ buildhistory_list_files() {
 
 
 buildhistory_get_imageinfo() {
-	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
 		return
 	fi
 
@@ -469,7 +469,7 @@ END
 }
 
 buildhistory_get_sdkinfo() {
-	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'sdk', '1', '0', d)}" = "0" ] ; then
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'sdk', '1', '0', d)}" = "0" ] ; then
 		return
 	fi
 
diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 7475d7d..1b36cba 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -73,7 +73,7 @@ inherit image
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_empty_root_password ; ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_empty_root_password ; ",d)}'
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 79de5a2..ceee848 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -25,7 +25,7 @@ IMAGE_FEATURES[type] = "list"
 IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
 
 # rootfs bootstrap install
-ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
+ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
@@ -79,9 +79,9 @@ do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
 do_build[depends] += "virtual/kernel:do_deploy"
 
 def build_live(d):
-    if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
-        d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))
-        d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
+    if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
+        d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
+        d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
         if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
             return "image-live"
         return ""
@@ -90,7 +90,7 @@ def build_live(d):
 IMAGE_TYPE_live = "${@build_live(d)}"
 
 inherit ${IMAGE_TYPE_live}
-IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
+IMAGE_TYPE_vmdk = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
 inherit ${IMAGE_TYPE_vmdk}
 
 python () {
@@ -143,17 +143,17 @@ inherit ${IMAGE_CLASSES}
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
 # Enable postinst logging if debug-tweaks is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
 # Write manifest
 IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
-SYSTEMD_DEFAULT_TARGET ?= '${@base_contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
+SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
 
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
@@ -173,7 +173,7 @@ do_rootfs[umask] = "022"
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 # Currently, it only supports sysvinit system.
 read_only_rootfs_hook () {
-	if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
+	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 	        # Tweak the mount option and fs_passno for rootfs in fstab
 		sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 	        # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 9bc9cc2..6606bc6 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -41,7 +41,7 @@ do_populate_sysroot[noexec] = "1"
 
 python () {
     initman = d.getVar("VIRTUAL-RUNTIME_init_manager", True)
-    if initman and initman in ['sysvinit', 'systemd'] and not base_contains('DISTRO_FEATURES', initman, True, False, d):
+    if initman and initman in ['sysvinit', 'systemd'] and not bb.utils.contains('DISTRO_FEATURES', initman, True, False, d):
         bb.fatal("Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (%s) matches the entries enabled in DISTRO_FEATURES" % initman)
 }
 
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 5c5505d..c96e74f 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -6,14 +6,14 @@ PTEST_PATH ?= "${libdir}/${PN}/ptest"
 FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
-PTEST_ENABLED = "${@base_contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
+PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 PTEST_ENABLED_class-native = ""
 PTEST_ENABLED_class-nativesdk = ""
 PTEST_ENABLED_class-cross-canadian = ""
 RDEPENDS_${PN}-ptest_class-native = ""
 RDEPENDS_${PN}-ptest_class-nativesdk = ""
 
-PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 
 do_configure_ptest() {
     :
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 4b02247..9e97d34 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -6,7 +6,7 @@ ROOTFS_PKGMANAGE = "rpm smartpm"
 ROOTFS_PKGMANAGE_BOOTSTRAP = "run-postinsts"
 
 # Add 50Meg of extra space for Smart
-IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "smartpm", " + 51200", "" ,d)}"
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smartpm", " + 51200", "" ,d)}"
 
 # Smart is python based, so be sure python-native is available to us.
 EXTRANATIVEPATH += "python-native"
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 419ffcd..a1167fd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -39,7 +39,7 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
-PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
+PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
 PREFERRED_PROVIDER_bluez4 ?= "bluez4"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 591f6b4..a5fc88a 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
-            ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
             xf86-input-evdev \
             xf86-input-mouse \
             xf86-video-fbdev \
diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index d6c4d60..f7c8a45 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -33,16 +33,16 @@ XSERVER_X86_BASE = "xserver-xorg \
            "
 
 XSERVER_X86_EXT = " \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
            xserver-xorg-module-libint10 \
            "
 
 XSERVER_X86_I915 = "xf86-video-intel \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i915', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i915', '', d)} \
            "
 
 XSERVER_X86_I965 = "xf86-video-intel \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i965', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i965', '', d)} \
            "
 
 XSERVER_X86_VESA = "xf86-video-vesa"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 6533e56..642a2d9 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -16,7 +16,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER = "xserver-xorg \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 94ee573..ebc27db 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER = "xserver-xorg \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f49bb5d..cb50949 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -29,7 +29,7 @@ SPL_IMAGE ?= "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
 
 do_compile () {
-	if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
 		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
 	fi
 
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 6f89441..3318f40 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -58,8 +58,8 @@ EXTRA_OECONF = "--disable-introspection \
            "
 
 # The distro choice determines what init scripts are installed
-EXTRA_OECONF_SYSVINIT = "${@base_contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
-EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
+EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
+EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
 AVAHI_GTK ?= "--disable-gtk --disable-gtk3"
 
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 053c352..65ec232 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -21,7 +21,7 @@ SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
 SRC_URI[sha256sum] = "d4b64c1dde442145a316679acff2df4008aa117ae52dfa3a6bc69efecc7840d1"
 
 # --enable-exportlib is necessary for building dhcp
-ENABLE_IPV6 = "--enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
+ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --disable-devpoll --disable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes \
diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 0827005..321fddb 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -11,8 +11,8 @@ DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 PACKAGECONFIG ??= "\
-    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
-    ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
 "
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 2b832ef..fa6f08b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -10,7 +10,7 @@ DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} obex-profiles"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} obex-profiles"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 
 SRC_URI = "\
@@ -26,7 +26,7 @@ EXTRA_OECONF = "\
   --disable-cups \
   --enable-test \
   --enable-datafiles \
-  ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \
   --enable-library \
 "
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b3147c9..0948934 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -27,13 +27,13 @@ EXTRA_OECONF += "\
     --enable-test \
     --disable-polkit \
     --enable-client \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
 PACKAGECONFIG ??= "wispr \
-                   ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', '3g','3g', '', d)} \
 "
 
 # If you want ConnMan to support VPN, add following statement into
@@ -81,7 +81,7 @@ do_compile_append() {
 }
 
 do_install_append() {
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
 		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
@@ -106,16 +106,16 @@ do_install_append() {
 RPROVIDES_${PN} = "\
 	connman-plugin-loopback \
 	connman-plugin-ethernet \
-	${@base_contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
-	${@base_contains('PACKAGECONFIG', 'wifi','connman-plugin-wifi', '', d)} \
-	${@base_contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'wifi','connman-plugin-wifi', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)} \
 	"
 
 RDEPENDS_${PN} = "\
 	dbus \
-	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
-	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
-	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', '3g','ofono', '', d)} \
 	xuser-account \
 	"
 
@@ -188,7 +188,7 @@ to create a VPN connection to OpenVPN server."
 FILES_${PN}-plugin-vpn-openvpn += "${libdir}/connman/scripts/openvpn-script \
                                    ${libdir}/connman/plugins-vpn/openvpn.so"
 RDEPENDS_${PN}-plugin-vpn-openvpn += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','openvpn','${PN}-plugin-vpn-openvpn', '', d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','openvpn','${PN}-plugin-vpn-openvpn', '', d)}"
 
 SUMMARY_${PN}-plugin-vpn-vpnc = "A vpnc plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-vpnc = "The ConnMan vpnc plugin uses vpnc client \
@@ -196,7 +196,7 @@ to create a VPN connection to Cisco3000 VPN Concentrator."
 FILES_${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script \
                                 ${libdir}/connman/plugins-vpn/vpnc.so"
 RDEPENDS_${PN}-plugin-vpn-vpnc += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
 
 SUMMARY_${PN}-plugin-vpn-l2tp = "A L2TP plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-l2tp = "The ConnMan L2TP plugin uses xl2tpd daemon \
@@ -204,7 +204,7 @@ to create a VPN connection to L2TP server."
 FILES_${PN}-plugin-vpn-l2tp += "${libdir}/connman/scripts/libppp-plugin.so* \
                                 ${libdir}/connman/plugins-vpn/l2tp.so"
 RDEPENDS_${PN}-plugin-vpn-l2tp += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','l2tp','${PN}-plugin-vpn-l2tp', '', d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','l2tp','${PN}-plugin-vpn-l2tp', '', d)}"
 
 SUMMARY_${PN}-plugin-vpn-pptp = "A PPTP plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-pptp = "The ConnMan PPTP plugin uses pptp-linux client \
@@ -212,4 +212,4 @@ to create a VPN connection to PPTP server."
 FILES_${PN}-plugin-vpn-pptp += "${libdir}/connman/scripts/libppp-plugin.so* \
                                 ${libdir}/connman/plugins-vpn/pptp.so"
 RDEPENDS_${PN}-plugin-vpn-pptp += "${PN}-vpn"
-RRECOMMENDS_${PN} += "${@base_contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index a984e05..177b70f 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
 DEPENDS = "flex-native bison-native libnl"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 PACKAGECONFIG[canusb] = "--enable-canusb,--enable-canusb=no,libusb"
 PACKAGECONFIG[libnl1] = "--with-libnl,--without-libnl,libnl1,libnl1"
diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 1dde1da..e714cad 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -19,14 +19,14 @@ do_install() {
 
 # This would copy neard start-stop shell and test scripts
 do_install_append() {
-	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
 		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
 		  > ${D}${sysconfdir}/init.d/neard
 		chmod 0755 ${D}${sysconfdir}/init.d/neard
 	fi
 
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_unitdir}/system
 		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
 		  > ${D}${systemd_unitdir}/system/neard.service
@@ -47,8 +47,8 @@ RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS_${PN} = "\
-                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
-                     ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
                     "
 
 RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 3972e06..9f65f4f 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 inherit autotools pkgconfig update-rc.d systemd
 
-DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
+DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
 
 EXTRA_OECONF += "\
-    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
     --enable-test \
 "
 SYSTEMD_SERVICE_${PN} = "ofono.service"
diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index d19cc5a..aae6e11 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
 DEPENDS = "zlib openssl"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
@@ -23,7 +23,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
            file://openssh-CVE-2011-4327.patch \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://sshd.socket \
            file://sshd@.service \
            file://sshdgenkeys.service \
@@ -56,7 +56,7 @@ export LD = "${CC}"
 
 # login path is hardcoded in sshd
 EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
                 --with-privsep-path=/var/run/sshd \
                 --sysconfdir=${sysconfdir}/ssh \
@@ -88,7 +88,7 @@ do_compile_append () {
 }
 
 do_install_append () {
-	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
 		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config
 	fi
@@ -131,7 +131,7 @@ FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
-RDEPENDS_${PN}-sshd += "${PN}-keygen ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index ee02fb7..229ec87 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -37,7 +37,7 @@ FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
-RDEPENDS_${PN}-misc = "${@base_contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
+RDEPENDS_${PN}-misc = "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
 FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
@@ -157,7 +157,7 @@ do_install () {
 	cp --dereference -R include/openssl ${D}${includedir}
 
 	oe_multilib_header openssl/opensslconf.h
-	if [ "${@base_contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" = "perl" ]; then
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" = "perl" ]; then
 		install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
 		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/c_rehash
 		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index 68dd796..b0a9454 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
 
 CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS -DHOSTS_ACCESS"
 CFLAGS += "-Wall -Wstrict-prototypes -fPIC"
-EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@base_contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
+EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
 
 fakeroot do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
index 5897e40..68bd515 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
@@ -26,7 +26,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/default/volatiles
 	echo "d root root 0755 ${localstatedir}/run/${BPN}/interface none" \
 	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/${BPN}/interface - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 11e8287..6eb3d2d 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -73,7 +73,7 @@ do_install () {
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}/${systemd_unitdir}/system
 		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
 	fi
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index e59afe6..0c1969c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -60,14 +60,14 @@ def busybox_cfg(feature, tokens, cnf, rem):
 # Map distro features to config settings
 def features_to_busybox_settings(d):
 	cnf, rem = ([], [])
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IPV6', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_LFS', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
-	busybox_cfg(base_contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IPV6', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_LFS', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'largefile', True, False, d), 'CONFIG_FDISK_SUPPORT_LARGE_DISKS', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'nls', True, False, d), 'CONFIG_LOCALE_SUPPORT', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
@@ -84,8 +84,8 @@ configmangle = '/CROSS_COMPILER_PREFIX/d; \
 		'
 OE_FEATURES := "${@features_to_busybox_conf(d)}"
 OE_DEL      := "${@features_to_busybox_del(d)}"
-DO_IPv4 := "${@base_contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}"
-DO_IPv6 := "${@base_contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}"
+DO_IPv4 := "${@bb.utils.contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}"
+DO_IPv6 := "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}"
 
 python () {
   if "${OE_DEL}":
@@ -270,7 +270,7 @@ do_install () {
                fi
 	fi
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
             > ${D}${systemd_unitdir}/system/busybox-syslog.service
@@ -286,7 +286,7 @@ do_install () {
     fi
 
     # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
-    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
 	rm -f ${D}${sysconfdir}/syslog-startup.conf.${BPN}
     fi
 }
@@ -299,7 +299,7 @@ ALTERNATIVE_${PN}-syslog += "syslog-conf"
 ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 
 python () {
-    if base_contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         pn = d.getVar('PN', True)
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir', True)))
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 338aae3..b924914 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -36,7 +36,7 @@ SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e3
 
 # acl is not a default feature
 #
-PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_class-target ??= "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
 PACKAGECONFIG_class-native ??= ""
 
 # with, without, depends, rdepends
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index ba3a0a0..8f37814 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir
 
 # acl is not a default feature
 #
-PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_class-target ??= "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
 PACKAGECONFIG_class-native ??= ""
 
 # with, without, depends, rdepends
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index bc260de..9ea0f4d 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -27,7 +27,7 @@ FILESPATH = "${FILE_DIRNAME}/dbus"
 
 inherit autotools pkgconfig gettext ptest
 
-EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 EXTRA_OECONF_X_class-native = "--without-x"
 
 EXTRA_OECONF = "--enable-tests \
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8d348f8..44ee5a6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -6,7 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 DEPENDS = "expat virtual/libintl"
-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
+RDEPENDS_dbus = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
 
@@ -66,7 +66,7 @@ FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
 	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
-        if ${@base_contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
@@ -85,8 +85,8 @@ EXTRA_OECONF = "--disable-tests \
                 --with-xml=expat \
                 --disable-systemd"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
@@ -98,7 +98,7 @@ PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11
 do_install() {
 	autotools_do_install
 
-	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 40ed9d2..5a7be49 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d290ce0ac102c828dfc9ce836784688"
 DEPENDS = "zlib"
 RPROVIDES_${PN} = "ssh sshd" 
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
@@ -21,7 +21,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbearkey.service \
            file://dropbear@.service \
            file://dropbear.socket \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
@@ -41,7 +41,7 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 EXTRA_OECONF += "\
- ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+ ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 CFLAGS += "-DSFTPSERVER_PATH=\\"${libdir}/openssh/sftp-server\\""
 
 do_install() {
@@ -66,7 +66,7 @@ do_install() {
 				  -e 's,/usr/bin,${bindir},g' \
 				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
 	chmod 755 ${D}${sysconfdir}/init.d/dropbear
-	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -d ${D}${sysconfdir}/pam.d
 		install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/
 	fi
diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
index 0432758..259e752 100644
--- a/meta/recipes-core/eglibc/eglibc-options.inc
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -14,43 +14,43 @@ def eglibc_cfg(feature, tokens, cnf):
 def features_to_eglibc_settings(d):
     cnf = ([])
 
-    ipv4 = base_contains('DISTRO_FEATURES', 'ipv4', True, False, d)
-    ipv6 = base_contains('DISTRO_FEATURES', 'ipv6', True, False, d)
-    libc_backtrace = base_contains('DISTRO_FEATURES', 'libc-backtrace', True, False, d) 
-    libc_big_macros = base_contains('DISTRO_FEATURES', 'libc-big-macros', True, False, d)
-    libc_bsd = base_contains('DISTRO_FEATURES', 'libc-bsd', True, False, d)
-    libc_cxx_tests = base_contains('DISTRO_FEATURES', 'libc-cxx-tests', True, False, d)
-    libc_catgets = base_contains('DISTRO_FEATURES', 'libc-catgets', True, False, d)
-    libc_charsets = base_contains('DISTRO_FEATURES', 'libc-charsets', True, False, d)
-    libc_crypt = base_contains('DISTRO_FEATURES', 'libc-crypt', True, False, d)
-    libc_crypt_ufc = base_contains('DISTRO_FEATURES', 'libc-crypt-ufc', True, False, d)
-    libc_db_aliases = base_contains('DISTRO_FEATURES', 'libc-db-aliases', True, False, d)
-    libc_envz = base_contains('DISTRO_FEATURES', 'libc-envz', True, False, d)
-    libc_fcvt = base_contains('DISTRO_FEATURES', 'libc-fcvt', True, False, d)
-    libc_fmtmsg = base_contains('DISTRO_FEATURES', 'libc-fmtmsg', True, False, d)
-    libc_fstab = base_contains('DISTRO_FEATURES', 'libc-fstab', True, False, d)
-    libc_ftraverse = base_contains('DISTRO_FEATURES', 'libc-ftraverse', True, False, d)
-    libc_getlogin = base_contains('DISTRO_FEATURES', 'libc-getlogin', True, False, d)
-    libc_idn = base_contains('DISTRO_FEATURES', 'libc-idn', True, False, d)
-    libc_inet_anl = base_contains('DISTRO_FEATURES', 'libc-inet-anl', True, False, d)
-    libc_libm = base_contains('DISTRO_FEATURES', 'libc-libm', True, False, d)
-    libc_locales = base_contains('DISTRO_FEATURES', 'libc-locales', True, False, d)
-    libc_locale_code = base_contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d)
-    libc_memusage = base_contains('DISTRO_FEATURES', 'libc-memusage', True, False, d)
-    libc_nis = base_contains('DISTRO_FEATURES', 'libc-nis', True, False, d)
-    libc_nsswitch = base_contains('DISTRO_FEATURES', 'libc-nsswitch', True, False, d)
-    libc_rcmd = base_contains('DISTRO_FEATURES', 'libc-rcmd', True, False, d)
-    libc_rtld_debug = base_contains('DISTRO_FEATURES', 'libc-rtld-debug', True, False, d)
-    libc_spawn = base_contains('DISTRO_FEATURES', 'libc-spawn', True, False, d)
-    libc_streams = base_contains('DISTRO_FEATURES', 'libc-streams', True, False, d)
-    libc_sunrpc = base_contains('DISTRO_FEATURES', 'libc-sunrpc', True, False, d)
-    libc_utmp = base_contains('DISTRO_FEATURES', 'libc-utmp', True, False, d)
-    libc_utmpx = base_contains('DISTRO_FEATURES', 'libc-utmpx', True, False, d)
-    libc_wordexp = base_contains('DISTRO_FEATURES', 'libc-wordexp', True, False, d)
-    libc_posix_clang_wchar = base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', True, False, d)
-    libc_posix_regexp = base_contains('DISTRO_FEATURES', 'libc-posix-regexp', True, False, d)
-    libc_posix_regexp_glibc = base_contains('DISTRO_FEATURES', 'libc-posix-regexp-glibc', True, False, d)
-    libc_posix_wchar_io = base_contains('DISTRO_FEATURES', 'libc-posix-wchar-io', True, False, d)
+    ipv4 = bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d)
+    ipv6 = bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d)
+    libc_backtrace = bb.utils.contains('DISTRO_FEATURES', 'libc-backtrace', True, False, d) 
+    libc_big_macros = bb.utils.contains('DISTRO_FEATURES', 'libc-big-macros', True, False, d)
+    libc_bsd = bb.utils.contains('DISTRO_FEATURES', 'libc-bsd', True, False, d)
+    libc_cxx_tests = bb.utils.contains('DISTRO_FEATURES', 'libc-cxx-tests', True, False, d)
+    libc_catgets = bb.utils.contains('DISTRO_FEATURES', 'libc-catgets', True, False, d)
+    libc_charsets = bb.utils.contains('DISTRO_FEATURES', 'libc-charsets', True, False, d)
+    libc_crypt = bb.utils.contains('DISTRO_FEATURES', 'libc-crypt', True, False, d)
+    libc_crypt_ufc = bb.utils.contains('DISTRO_FEATURES', 'libc-crypt-ufc', True, False, d)
+    libc_db_aliases = bb.utils.contains('DISTRO_FEATURES', 'libc-db-aliases', True, False, d)
+    libc_envz = bb.utils.contains('DISTRO_FEATURES', 'libc-envz', True, False, d)
+    libc_fcvt = bb.utils.contains('DISTRO_FEATURES', 'libc-fcvt', True, False, d)
+    libc_fmtmsg = bb.utils.contains('DISTRO_FEATURES', 'libc-fmtmsg', True, False, d)
+    libc_fstab = bb.utils.contains('DISTRO_FEATURES', 'libc-fstab', True, False, d)
+    libc_ftraverse = bb.utils.contains('DISTRO_FEATURES', 'libc-ftraverse', True, False, d)
+    libc_getlogin = bb.utils.contains('DISTRO_FEATURES', 'libc-getlogin', True, False, d)
+    libc_idn = bb.utils.contains('DISTRO_FEATURES', 'libc-idn', True, False, d)
+    libc_inet_anl = bb.utils.contains('DISTRO_FEATURES', 'libc-inet-anl', True, False, d)
+    libc_libm = bb.utils.contains('DISTRO_FEATURES', 'libc-libm', True, False, d)
+    libc_locales = bb.utils.contains('DISTRO_FEATURES', 'libc-locales', True, False, d)
+    libc_locale_code = bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code', True, False, d)
+    libc_memusage = bb.utils.contains('DISTRO_FEATURES', 'libc-memusage', True, False, d)
+    libc_nis = bb.utils.contains('DISTRO_FEATURES', 'libc-nis', True, False, d)
+    libc_nsswitch = bb.utils.contains('DISTRO_FEATURES', 'libc-nsswitch', True, False, d)
+    libc_rcmd = bb.utils.contains('DISTRO_FEATURES', 'libc-rcmd', True, False, d)
+    libc_rtld_debug = bb.utils.contains('DISTRO_FEATURES', 'libc-rtld-debug', True, False, d)
+    libc_spawn = bb.utils.contains('DISTRO_FEATURES', 'libc-spawn', True, False, d)
+    libc_streams = bb.utils.contains('DISTRO_FEATURES', 'libc-streams', True, False, d)
+    libc_sunrpc = bb.utils.contains('DISTRO_FEATURES', 'libc-sunrpc', True, False, d)
+    libc_utmp = bb.utils.contains('DISTRO_FEATURES', 'libc-utmp', True, False, d)
+    libc_utmpx = bb.utils.contains('DISTRO_FEATURES', 'libc-utmpx', True, False, d)
+    libc_wordexp = bb.utils.contains('DISTRO_FEATURES', 'libc-wordexp', True, False, d)
+    libc_posix_clang_wchar = bb.utils.contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', True, False, d)
+    libc_posix_regexp = bb.utils.contains('DISTRO_FEATURES', 'libc-posix-regexp', True, False, d)
+    libc_posix_regexp_glibc = bb.utils.contains('DISTRO_FEATURES', 'libc-posix-regexp-glibc', True, False, d)
+    libc_posix_wchar_io = bb.utils.contains('DISTRO_FEATURES', 'libc-posix-wchar-io', True, False, d)
 
     # arrange the dependencies among eglibc configuable options according to file option-groups.def from eglibc source code
     new_dep = True
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 375b9bc..8caae50 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -12,7 +12,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 # entire image as -O0, we override it with -O2 here and give a note about it.
 def get_optimization(d):
     selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
-    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
         bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
         return selected_optimization.replace("-O0", "-O2")
     return selected_optimization
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cb07665..4d27262 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -16,7 +16,7 @@ SECTION = "libs"
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
-DEPENDS_append_class-target = "${@base_contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
+DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-libffi nativesdk-zlib ${BPN}-native"
 
@@ -31,7 +31,7 @@ S = "${WORKDIR}/glib-${PV}"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
-PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)}"
+PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)}"
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e8a5b78..5e0d377 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -41,7 +41,7 @@ KERNEL_VERSION = ""
 
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
-DEPENDS_append = " ${@base_contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
 PACKAGES =+ "${PN}-functions"
 RDEPENDS_${PN} = "${PN}-functions"
@@ -149,7 +149,7 @@ MASKED_SCRIPTS = " \
   urandom"
 
 pkg_postinst_${PN} () {
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
diff --git a/meta/recipes-core/kbd/kbd_2.0.1.bb b/meta/recipes-core/kbd/kbd_2.0.1.bb
index 998a2d3..265b906 100644
--- a/meta/recipes-core/kbd/kbd_2.0.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "f80b93a6abddb6cc2a3652daaf7562ba"
 SRC_URI[sha256sum] = "223d60bb6882323cca161aeb5965590768b2f590fd7cddbf27511ad0ba7a429e"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
 
 PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 76b0b58..69f8566 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 inherit autotools pkgconfig
 
-DEPENDS = "bison-native flex-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "bison-native flex-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "3dea9d50b8a5b73ff0bf1cdcb210f63f"
 SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51"
 
-EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
+EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
 # http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg21444.html
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 368c318..16f3a51 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -11,31 +11,31 @@ PACKAGES = ' \
             packagegroup-distro-base \
             packagegroup-machine-base \
             \
-            ${@base_contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
+            ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
             \
-            ${@base_contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "nfc", "packagegroup-base-nfc", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "cramfs", "packagegroup-base-cramfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "ipsec", "packagegroup-base-ipsec", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "ipv6", "packagegroup-base-ipv6", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "nfc", "packagegroup-base-nfc", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "cramfs", "packagegroup-base-cramfs", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "ipsec", "packagegroup-base-ipsec", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "packagegroup-base-ipv6", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nfs", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
+            ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
             \
             '
 
@@ -56,31 +56,31 @@ RDEPENDS_packagegroup-base = "\
     \
     sysfsutils \
     module-init-tools \
-    ${@base_contains('MACHINE_FEATURES', 'apm', 'packagegroup-base-apm', '',d)} \
-    ${@base_contains('MACHINE_FEATURES', 'acpi', 'packagegroup-base-acpi', '',d)} \
-    ${@base_contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
-    ${@base_contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'apm', 'packagegroup-base-apm', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'packagegroup-base-acpi', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
     \
-    ${@base_contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'irda', 'packagegroup-base-irda', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'wifi', 'packagegroup-base-wifi', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', '3g', 'packagegroup-base-3g', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'nfc', 'packagegroup-base-nfc', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'irda', 'packagegroup-base-irda', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'wifi', 'packagegroup-base-wifi', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', '3g', 'packagegroup-base-3g', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'nfc', 'packagegroup-base-nfc', '',d)} \
     \
-    ${@base_contains('DISTRO_FEATURES', 'nfs', 'packagegroup-base-nfs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'cramfs', 'packagegroup-base-cramfs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'smbfs', 'packagegroup-base-smbfs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ipv6', 'packagegroup-base-ipv6', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'nfs', 'packagegroup-base-nfs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'cramfs', 'packagegroup-base-cramfs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'smbfs', 'packagegroup-base-smbfs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'packagegroup-base-ipv6', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
     "
 
 
@@ -204,14 +204,14 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
     kernel-module-serial-cs \
     kernel-module-ide-cs \
     kernel-module-ide-disk \
-    ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hostap-cs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hostap-cs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
 
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
     bluez4 \
-    ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
     "
 
 RRECOMMENDS_packagegroup-base-bluetooth = "\
@@ -223,11 +223,11 @@ RRECOMMENDS_packagegroup-base-bluetooth = "\
     kernel-module-hidp \
     kernel-module-hci-uart \
     kernel-module-sco \
-    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
     "
 
 SUMMARY_packagegroup-base-irda = "IrDA support"
@@ -240,12 +240,12 @@ RRECOMMENDS_packagegroup-base-irda = "\
     kernel-module-ircomm \
     kernel-module-ircomm-tty \
     kernel-module-irlan \
-    ${@base_contains('DISTRO_FEATURES', 'ppp', 'kernel-module-irnet', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'kernel-module-irnet', '',d)} \
     kernel-module-irport \
     kernel-module-irtty \
     kernel-module-irtty-sir \
     kernel-module-sir-dev \
-    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
 
 SUMMARY_packagegroup-base-usbgadget = "USB gadget support"
 RRECOMMENDS_packagegroup-base-usbgadget = "\
@@ -299,12 +299,12 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
     wireless-tools \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
     wpa-supplicant"
 
 RRECOMMENDS_packagegroup-base-wifi = "\
-    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
     kernel-module-ieee80211-crypt \
     kernel-module-ieee80211-crypt-ccmp \
     kernel-module-ieee80211-crypt-tkip \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 1154bc0..c8bc362 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -29,7 +29,7 @@ VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
-SYSVINIT_SCRIPTS = "${@base_contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
                    "
@@ -38,8 +38,8 @@ RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
     busybox \
-    ${@base_contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
-    ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 80f3031..7832c89 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -16,8 +16,8 @@ RPROVIDES_${PN} = "task-core-tools-profile"
 RREPLACES_${PN} = "task-core-tools-profile"
 RCONFLICTS_${PN} = "task-core-tools-profile"
 
-PROFILE_TOOLS_X = "${@base_contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
-PROFILE_TOOLS_SYSTEMD = "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
+PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
+PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
 RRECOMMENDS_${PN} = "\
     perf \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 952fbd0..c766754 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -57,7 +57,7 @@ RDEPENDS_${PN} = "\
     connman-tools \
     connman-tests \
     connman-client \
-    ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
-    ${@base_contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
-    ${@base_contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
     "
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 278de9f..ec595be 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -11,7 +11,7 @@ PROVIDES = "udev"
 PE = "1"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
@@ -71,7 +71,7 @@ rootlibexecdir = "${rootprefix}/lib"
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
-                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
                  --enable-xz \
                  --disable-manpages \
                  --disable-coredump \
@@ -117,7 +117,7 @@ do_install() {
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
@@ -235,7 +235,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/71-seat.rules \
                 /lib/udev/rules.d/73-seat-late.rules \
                 /lib/udev/rules.d/99-systemd.rules \
-                ${@base_contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
                "
 
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ad7aac7..c2a3cf7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -50,8 +50,8 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
 
 EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
 
-PACKAGECONFIG_class-target ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                                ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
+PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
 # Respect the systemd feature for uuidd
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 7f084b5..5ab2b92 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -41,7 +41,7 @@ USE_ALTERNATIVES_FOR = " \
 	gprof \
 	ld \
 	ld.bfd \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld.gold dwp', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld.gold dwp', '', d)} \
 	nm \
 	objcopy \
 	objdump \
@@ -69,11 +69,11 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
                 --enable-plugins \
                 ${LDGOLD} \
-                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
+                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
-LDGOLD ?= "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '', d)}"
+LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '', d)}"
 
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
index 30ae61e..de2ac6b 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
@@ -29,7 +29,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
-    ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
 "
 
 FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index c69643c..ad0e94f 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "avahi"
 GTKCONFIG = "gtk"
 GTKCONFIG_libc-uclibc = ""
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)} popt"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)} popt"
 PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
 # use system popt by default
 PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index ca44e98..929906d 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -53,7 +53,7 @@ do_install_append () {
 		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
 	fi
 
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system/
 		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index dc44cc9..3cc5efa 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -19,7 +19,7 @@ LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
 # when linking shared libraries further in the build like (gnutls)
 
 SPECIAL_ARCH_LIST = "powerpc"
-OPTSPACE = '${@base_contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}'
+OPTSPACE = '${@bb.utils.contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}'
 
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 8184538..c4c353a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -21,7 +21,7 @@ EXTRA_OECONF = "--with-newlib \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
 		${EXTRA_OECONF_INITIAL} \
-		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
+		${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
 		${EXTRA_OECONF_FPU}"
 
 EXTRA_OECONF += " --with-native-system-header-dir=${SYSTEMHEADERS} "
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 211a574..60f03e7 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -40,7 +40,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
                 --without-lzma \
                 ${GDBPROPREFIX} ${EXPAT} \
-                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                 --disable-rpath \
                "
 
diff --git a/meta/recipes-devtools/gdb/gdb_7.6.2.bb b/meta/recipes-devtools/gdb/gdb_7.6.2.bb
index e864471..c7ca26b 100644
--- a/meta/recipes-devtools/gdb/gdb_7.6.2.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.6.2.bb
@@ -7,7 +7,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
 
 do_configure_prepend() {
-	if [ -n "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
+	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
 		cat > ${WORKDIR}/python << EOF
 #!/bin/sh
 case "\$2" in
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 198e500..ba21d84 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -54,7 +54,7 @@ do_install_append() {
 	# We need to create the lock directory
 	install -d ${D}${OPKGLIBDIR}/opkg
 
-	if ${@base_contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
 		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
diff --git a/meta/recipes-devtools/patch/patch_2.7.1.bb b/meta/recipes-devtools/patch/patch_2.7.1.bb
index 7d009fe..3db318a 100644
--- a/meta/recipes-devtools/patch/patch_2.7.1.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.1.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 acpaths = "-I ${S}/m4 "
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr," 
 
diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 09a3f3b..c307b99 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -144,7 +144,7 @@ do_configure() {
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
-	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
+	${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
 
         # Update some paths in the configuration
         sed -i -e 's,@ARCH@-thread-multi,,g' \
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 9f6e315..3288822 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -63,7 +63,7 @@ pkg_postinst_prelink() {
 #!/bin/sh
 
 if [ "x$D" != "x" ]; then
-  ${@base_contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
+  ${@bb.utils.contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
 fi
 
 prelink -a
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index ed8cfcc..a678328 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -25,14 +25,14 @@ inherit distutils
 do_compile() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
-    export LCMS_ENABLED=${@base_contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
+    export LCMS_ENABLED=${@bb.utils.contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
     distutils_do_compile
 }
 
 do_install() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
-    export LCMS_ENABLED=${@base_contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
+    export LCMS_ENABLED=${@bb.utils.contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
     distutils_do_install
     install -d ${D}${datadir}/doc/${BPN}/html/
     install -m 0644 ${S}/README ${D}${datadir}/doc/${BPN}/
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 464c5c5..0971579 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -85,16 +85,16 @@ do_install_append() {
    # Disable zypper channel support
    rm -f ${D}${libdir}/python*/site-packages/smart/plugins/zyppchannelsync.py*
 
-   if [ -z "${@base_contains('PACKAGECONFIG', 'rpm', 'rpm', '', d)}" ]; then
+   if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'rpm', 'rpm', '', d)}" ]; then
       rm -f ${D}${libdir}/python*/site-packages/smart/plugins/rpmdir.py*
       rm -rf ${D}${libdir}/python*/site-packages/smart/backends/rpm
    fi
 
-   if [ -z "${@base_contains('PACKAGECONFIG', 'qt4', 'qt4', '', d)}" ]; then
+   if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'qt4', 'qt4', '', d)}" ]; then
       rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/qt4
    fi
 
-   if [ -z "${@base_contains('PACKAGECONFIG', 'gtk+', 'gtk', '', d)}" ]; then
+   if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'gtk', '', d)}" ]; then
       rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/gtk
    fi
 }
@@ -115,9 +115,9 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc smartpm \
-            ${@base_contains('PACKAGECONFIG', 'rpm', '${PN}-backend-rpm', '', d)} \
-            ${@base_contains('PACKAGECONFIG', 'qt4', '${PN}-interface-qt4', '', d)} \
-            ${@base_contains('PACKAGECONFIG', 'gtk', '${PN}-interface-gtk', '', d)} \
+            ${@bb.utils.contains('PACKAGECONFIG', 'rpm', '${PN}-backend-rpm', '', d)} \
+            ${@bb.utils.contains('PACKAGECONFIG', 'qt4', '${PN}-interface-qt4', '', d)} \
+            ${@bb.utils.contains('PACKAGECONFIG', 'gtk', '${PN}-interface-gtk', '', d)} \
             ${PN}-interface-images ${PN}"
 
 RDEPENDS_smartpm = "${PN}"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 90079a2..19942ba 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -25,7 +25,7 @@ EXTRA_OECONF = "\
   --without-cxx-main \
   --with-signal-module \
   --enable-shared \
-  --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
+  --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
   ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
   ${PYTHONLSBOPTS} \
 "
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7eef705..26b0c93 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -2,7 +2,7 @@ SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib alsa-lib pixman dtc libsdl \
-           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
@@ -38,7 +38,7 @@ do_configure_prepend_class-native() {
 }
 
 do_configure_prepend_class-nativesdk() {
-	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
 		# Undo the -lX11 added by linker-flags.patch
 		sed -i 's/-lX11//g' Makefile.target
 	fi
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index 2482745..71563d4 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
 
-PACKAGECONFIG_class-target ?= "libaio ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+PACKAGECONFIG_class-target ?= "libaio ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
 
 PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index 163367c..3c6aa13 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 
 X11DEPENDS = "virtual/libx11"
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 PR = "r8"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.14.bb
index 1b87d4a..68a24b8 100644
--- a/meta/recipes-extended/at/at_3.1.14.bb
+++ b/meta/recipes-extended/at/at_3.1.14.bb
@@ -5,10 +5,10 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 DEPENDS = "flex flex-native \
-           ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"                                                                                                                 
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
+RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
                   ${VIRTUAL-RUNTIME_initscripts} \
 "
 
@@ -24,7 +24,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://file_replacement_with_gplv2.patch \
     file://S99at \
     file://atd.service \
-    ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
@@ -37,7 +37,7 @@ EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_groupname=root \
                  --with-jobdir=/var/spool/at/jobs \
                  --with-atspool=/var/spool/at/spool \
-                 ac_cv_header_security_pam_appl_h=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} "
+                 ac_cv_header_security_pam_appl_h=${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} "
 
 inherit autotools-brokensep systemd
 
@@ -62,7 +62,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/atd.service
 
-	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
 	fi
 }
diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
index 2a932e0..02234f6 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f98
 inherit autotools update-rc.d useradd systemd
 
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e4771f7..fd88552 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -14,8 +14,8 @@ LEAD_SONAME = "libcupsdriver.so"
 
 inherit autotools-brokensep binconfig
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index ee91945..faf2ebe 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -20,6 +20,6 @@ SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd7
 DEPENDS = "bison-native"
 
 # http://savannah.gnu.org/bugs/?27299
-CACHED_CONFIGUREVARS += "${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
+CACHED_CONFIGUREVARS += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
 
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index 166457d..02bb843 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -31,7 +31,7 @@ inherit autotools
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
                "
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
                  "
 
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index f90dc02..eedbaa7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
-	${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-	${@base_contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
-	${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
 "
 
 PACKAGECONFIG_append_class-nativesdk = " largefile"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index b87213c..ad3f240 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -133,7 +133,7 @@ RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
 RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
     cracklib \
     gzip \
-    ${@base_contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
     shadow \
     sudo \
     "
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 914a7a9..553befd 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -209,7 +209,7 @@ QT4PKGS = " \
     libqtxml4 \
     libqtnetwork4 \
     qt4-plugin-sqldriver-sqlite \
-    ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
     "
 QT4PKGS_mips64 = ""
 
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 7c0111f..7e55adf 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -131,13 +131,13 @@ do_install() {
 	# The lsb requires unix_chkpwd has setuid permission
 	chmod 4755 ${D}${sbindir}/unix_chkpwd
 
-	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
 	fi
 }
 
 python do_pam_sanity () {
-    if not base_contains('DISTRO_FEATURES', 'pam', True, False, d):
+    if not bb.utils.contains('DISTRO_FEATURES', 'pam', True, False, d):
         bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly")
 }
 addtask pam_sanity before do_configure
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index d83dda0..6fd02a0 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
 
 SECTION = "console/utils"
 DEPENDS = "ncurses \
-          ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+          ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "base-files"
 
 PR = "r4"
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-14.diff.gz;name=patch \
            file://configure.patch \
            file://fix-parallel-make.patch \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://screen.pam"
 
@@ -33,10 +33,10 @@ SRC_URI[patch.sha256sum] = "10acb274b2fb0bb7137a0d66e52fa0f18125bc5198c7a8d5af38
 inherit autotools
 
 EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
-               ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+               ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 do_install_append () {
-	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
 	fi
 }
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index a4e9634..6848e05 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -15,7 +15,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow_fix_for_automake-1.12.patch \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
-           ${@base_contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
 SRC_URI_append_class-target = " \
@@ -81,7 +81,7 @@ PAM_PLUGINS = "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"
 
-PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 43e578f..5675cb8 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -2,7 +2,7 @@ require shadow.inc
 
 # Build falsely assumes that if --enable-libpam is set, we don't need to link against
 # libcrypt. This breaks chsh.
-BUILD_LDFLAGS_append_class-target = " ${@base_contains('DISTRO_FEATURES', 'pam', base_contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
+BUILD_LDFLAGS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', bb.utils.contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '', d)}"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb b/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
index b4d18e8..7851473 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
@@ -1,20 +1,20 @@
 require sudo.inc
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sudo.pam"
 
 SRC_URI[md5sum] = "d3f1f1cfca6b2b06b048e1abb7d0227e"
 SRC_URI[sha256sum] = "bc9d5c96de5f8b4d2b014f87a37870aef60d2891c869202454069150a21a5c21"
 
-DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
-EXTRA_OECONF += " ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
+EXTRA_OECONF += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
 
 do_install_append () {
-	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 664 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 	fi
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 3a51810..bcf8aa7 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -40,7 +40,7 @@ do_install () {
 
 # sysklogd package has no internal systemd support, so we weigh busybox's
 # sysklogd utility over it in case of systemd
-ALTERNATIVE_PRIORITY = "${@base_contains('DISTRO_FEATURES','systemd','10','100',d)}"
+ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd','10','100',d)}"
 
 ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
 
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
index 50e54d8..19848b5 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
@@ -31,7 +31,7 @@ LIBV = "2.10.0"
 GDK_PIXBUF_LOADERS ?= "png jpeg"
 
 PACKAGECONFIG ??= "${GDK_PIXBUF_LOADERS}"
-PACKAGECONFIG_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} ${GDK_PIXBUF_LOADERS}"
+PACKAGECONFIG_linuxstdbase = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} ${GDK_PIXBUF_LOADERS}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
 PACKAGECONFIG[png] = "--with-libpng,--without-libpng,libpng"
@@ -45,7 +45,7 @@ PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
 EXTRA_OECONF = "\
   --disable-introspection \
-  ${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)} \
 "
 
 PACKAGES =+ "${PN}-xlib"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index e081ec3..17fdafa 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -45,7 +45,7 @@ do_install_append_class-native() {
 }
 
 # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
-RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
 RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN} += "${libdir}/GConf/* \
diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 73d624c..dd1fa1b 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -14,7 +14,7 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  cairo gdk-pixbuf"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index e769ca5..9e96275 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -33,8 +33,8 @@ EXTRA_OECONF += " \
                  --disable-introspection \
 "
 
-PACKAGECONFIG ??= "${@base_contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
-                   ${@base_contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
 
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon"
diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index b15fbc9..c0af1e3 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -13,8 +13,8 @@ LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
 PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 3ca19b3..77035d7 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -33,8 +33,8 @@ PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,${E
 PACKAGECONFIG[wayland-compositor] = "--enable-wayland-compositor,--disable-wayland-compositor,wayland"
 
 # Default configuration, distros might want to override
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
 
 FILES_${PN}-dbg += "${libdir}/clutter/examples/.debug"
 FILES_${PN}-examples = "${libdir}/clutter/examples"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 15bfea2..a4a8550 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -53,8 +53,8 @@ PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
 # Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate by
 # default.
 PACKAGECONFIG ??= "cogl-pango gles2 \
-                   ${@base_contains('DISTRO_FEATURES', 'wayland', 'egl-wayland', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'egl-wayland', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
 FILES_libcogl = "${libdir}/libcogl${SOLIBS}"
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e19c388..4a77121 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PROVIDES = "virtual/libsdl"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
+DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
-DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
+DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r3"
 
@@ -39,15 +39,15 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
                 --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
                 --disable-xbios --disable-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
-                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-pulseaudio"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
index 7958f7b..fa19566 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0605ca7e995ab1217e0bb988731a87fe"
 
 PROVIDES = "virtual/libsdl2"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
+DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
-DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
+DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
        "
@@ -32,14 +32,14 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-video-dummy \
                 --enable-input-tslib --enable-pthreads \
-                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-pulseaudio"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 4bb92f4..d6e6fbc 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -22,10 +22,10 @@ SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a
 inherit autotools pkgconfig
 
 PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
-                  ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 # The Wayland code doesn't work with Wayland 1.0, so disable it for now
-#${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+#${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
 
 PACKAGECONFIG[drm] = "--enable-libdrm,--disable-libdrm,libdrm"
 PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
index 21f6151..8c7d8e8 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
@@ -6,6 +6,6 @@ FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/mesa-${PV}", "${FILE_DIRNAM
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-PACKAGECONFIG ??= "dri ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 96313b5..a33b7b5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -26,8 +26,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 EXTRA_OECONF = "--enable-shared-glapi"
 
 PACKAGECONFIG ??= "egl gles dri \
-		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
-		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
+		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
+		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
@@ -45,18 +45,18 @@ EXTRA_OECONF += "--enable-gbm"
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
 EGL_PLATFORMS  = "drm"
-EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
-EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
+EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
+EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
 PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
 
 GALLIUMDRIVERS = "swrast"
-GALLIUMDRIVERS_LLVM33 = "${@base_contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
+GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
 GALLIUMDRIVERS_LLVM33_ENABLED = "${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
 GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
-GALLIUMDRIVERS_append_x86 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS_append_x86-64 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
diff --git a/meta/recipes-graphics/mesa/mesa_9.2.5.bb b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
index 737ed1a..02ecd46 100644
--- a/meta/recipes-graphics/mesa/mesa_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.2.5.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/Mesa-${PV}"
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-    if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 0abedbc..1e6fdb5 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
-    if ${@base_contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@base_contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 334a17e..7786133 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
-TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN} = " \
 		directfb \
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 4a20d20..4f79315 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -12,7 +12,7 @@ LICENSE = "LGPLv2.0+"
 X11DEPENDS = "virtual/libx11 libxft"
 DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz qemu-native"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
index 5213166..afdc49c 100644
--- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
@@ -28,9 +28,9 @@ EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor"
 
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                   "
 #
 # Compositor choices
@@ -59,7 +59,7 @@ do_install_append() {
 	rm -f ${D}/${libdir}/weston/*.la
 
 	# If X11, ship a desktop file to launch it
-	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
 		install -d ${D}${datadir}/applications
 		install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
 
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index e4508a9..0a16ff5 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -22,7 +22,7 @@ do_install() {
     install -d ${D}${sysconfdir}/init.d
     install xserver-nodm ${D}${sysconfdir}/init.d
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${sysconfdir}/default
         install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
         install -d ${D}${systemd_unitdir}/system
@@ -36,7 +36,7 @@ do_install() {
         fi
     fi
 
-    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
         if [ "${ROOTLESS_X}" = "1" ] ; then
             install -d ${D}${sysconfdir}/X11
             install Xusername ${D}${sysconfdir}/X11
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 9785a16..3d98172 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -18,6 +18,6 @@ DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdama
 
 inherit autotools-brokensep
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
 PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
index 78edd5a..cd8fd63 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
@@ -15,7 +15,7 @@ SRC_URI += "file://disable-dri2-tests.patch \
             file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
            "
 
-PACKAGECONFIG ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
+PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
index b74d174..60eace4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
@@ -14,7 +14,7 @@ DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 SRC_URI += "file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
            "
 
-PACKAGECONFIG ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
+PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
index 1a687c8..cf5dfeb 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
@@ -16,5 +16,5 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-docs"
 
-PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxcb"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 2bacbe5..2e83d53 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -116,7 +116,7 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
+PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index c55cbd3..d4c21a4 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -44,7 +44,7 @@ do_compile_ptest () {
         oe_runmake buildtest-TESTS rootfs
 }
 
-INHIBIT_PACKAGE_STRIP = "${@base_contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
+INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
 INSANE_SKIP_${PN}-ptest = "arch"
 
 inherit update-alternatives
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index af44eb6..516e2c5 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.latencytop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
 
-DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+DEPENDS = "virtual/libintl ncurses glib-2.0  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 
 PR = "r3"
 
@@ -15,7 +15,7 @@ SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
 SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
 
-EXTRA_OEMAKE_X = "${@base_contains('DISTRO_FEATURES', 'x11', 'HAS_GTK_GUI=1', '', d)}"
+EXTRA_OEMAKE_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'HAS_GTK_GUI=1', '', d)}"
 
 CFLAGS += "${LDFLAGS}"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index db9d910..c280313 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 # entire image as -O0, we override it with -O2 here and give a note about it.
 def get_optimization(d):
     selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
-    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
         bb.note("systemtap can't be built with -O0, -O2 will be used instead.")
         return selected_optimization.replace("-O0", "-O2")
     return selected_optimization
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index 4f64a38..dfa9b97 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
            file://autotools.patch \
-           ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
 
 SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
 SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
@@ -20,7 +20,7 @@ inherit autotools-brokensep
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 056fca2..2edacc1 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -86,7 +86,7 @@ do_install() {
 	# See alsa-utils-alsaconf_${PV}.bb
 	rm ${D}${sbindir}/alsaconf
 
-	if ${@base_contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
 	   # This is where alsa-utils will install its rules if we don't tell it anything else.
 	   rm -rf ${D}/lib/udev
 	   rmdir --ignore-fail-on-non-empty ${D}/lib
diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 9fb2f8f..518ab72 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -21,7 +21,7 @@ ALLOW_EMPTY_gst-meta-debug = "1"
 ALLOW_EMPTY_gst-meta-video = "1"
 
 RDEPENDS_gst-meta-base = "\
-    ${@base_contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', '', d)} \
     gstreamer \
     gst-plugins-base-playbin \
     gst-plugins-base-decodebin \
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index dceb12c..a26acef 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -17,7 +17,7 @@ EXTRA_OECONF += "--disable-experimental \
                  --disable-vdpau --disable-apexsink"
 
 PACKAGECONFIG ??= "bzip curl \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'rsvg', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'rsvg', '', d)}"
 
 PACKAGECONFIG[bzip] = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 53cc55c..83b856b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -20,7 +20,7 @@ inherit gettext
 
 EXTRA_OECONF += "--disable-freetypetest"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 PACKAGECONFIG[gnomevfs] = "--enable-gnome_vfs,--disable-gnome_vfs,gnome-vfs"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e044340..c87e018 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 PR = "r8"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} jpeg"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} jpeg"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index cb8dd1a..a703d9b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -19,7 +19,7 @@ ALLOW_EMPTY_gstreamer1.0-meta-debug = "1"
 ALLOW_EMPTY_gstreamer1.0-meta-video = "1"
 
 RDEPENDS_gstreamer1.0-meta-base = "\
-    ${@base_contains('DISTRO_FEATURES', 'x11', 'gstreamer1.0-meta-x11-base', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gstreamer1.0-meta-x11-base', '', d)} \
     gstreamer1.0 \
     gstreamer1.0-plugins-base-playback \
     gstreamer1.0-plugins-base-gio \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 08440a2..ceb2de1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -10,10 +10,10 @@ inherit gettext
 
 
 PACKAGECONFIG ??= " \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'eglgles', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'eglgles', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     orc curl uvch264 neon \
     hls sbc dash bz2 smoothstreaming \
     "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index b56c506..eb13277 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -2,7 +2,7 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
 
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
 DEPENDS += "freetype liboil util-linux"
 
 inherit gettext
@@ -10,8 +10,8 @@ inherit gettext
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
 PACKAGECONFIG ??= " \
-    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
     orc ivorbis ogg theora vorbis \
     "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 06de4da..5e313ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -9,8 +9,8 @@ inherit gettext
 
 
 PACKAGECONFIG ??= " \
-    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
     orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
     "
 
diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 2152936..a05a2a6 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -23,7 +23,7 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
-PACKAGECONFIG ??= "bzip2 x264 ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "bzip2 x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
 PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index fe0e397..9246298 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
 S = "${WORKDIR}/libsndfile-${PV}"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 
 EXTRA_OECONF = "--disable-external-libs"
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index aee2f3b..1211284 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -6,7 +6,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 
 PR = "r2"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2176731..195a982 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -31,10 +31,10 @@ EXTRA_OECONF = "\
                 ac_cv_header_valgrind_memcheck_h=no \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
@@ -74,7 +74,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
 PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc ${@base_contains('PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
+             pulseaudio-server pulseaudio-misc ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
@@ -148,4 +148,4 @@ FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
 
 RDEPENDS_pulseaudio-server += "\
-        ${@base_contains('DISTRO_FEATURES', 'x11', 'pulseaudio-module-console-kit', '', d)}"
+        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'pulseaudio-module-console-kit', '', d)}"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index 6ef844f..02a649b 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -12,7 +12,7 @@ RPROVIDES_${PN} = "task-qt4e-base"
 RREPLACES_${PN} = "task-qt4e-base"
 RCONFLICTS_${PN} = "task-qt4e-base"
 
-TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN} = " \
 	qt4-embedded \
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
index c6aa753..0e7c800 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
@@ -6,6 +6,6 @@ require packagegroup-qt-toolchain-target.inc
 
 RDEPENDS_${PN} += " \
         qt4-x11-free-dev \
-        ${@base_contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev', '', d)} \
-        ${@base_contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-dev', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-dev', '', d)} \
         "
diff --git a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
index 5fe7bc9..e7e4b3c 100644
--- a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
+++ b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
@@ -3,7 +3,7 @@ DEPENDS = "qt4-x11-free"
 SECTION = "x11/libs"
 qtm_embedded := ""
 qtm_dir = "qt4"
-qtm_glflags := "${@base_contains('DISTRO_FEATURES', 'opengl', '+=opengl', '-=opengl', d)} "
+qtm_glflags := "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '+=opengl', '-=opengl', d)} "
 qtm_extra_config := ""
 
 inherit qt4x11
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index ff63d2b..d46acb9 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,8 +1,8 @@
 HOMEPAGE = "http://qt-project.org/"
 DEPENDS = "gstreamer util-linux"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = ",,bluez4"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
@@ -65,12 +65,12 @@ maemo5-contacts_enabled = no
 maemo5-calendar_enabled = no
 maemo6-landmarks_enabled = no
 bme_enabled = no
-bluez_enabled = ${@base_contains('PACKAGECONFIG', 'bluetooth', 'yes', 'no', d)}
+bluez_enabled = ${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', 'yes', 'no', d)}
 proj_enabled = no
 gstreamer-photography_enabled = no
 gstreamer-appsrc_enabled = yes
 blkid_enabled = yes
-pulseaudio_enabled = ${@base_contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}
+pulseaudio_enabled = ${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}
 udev_enabled = yes
 iphb_enabled = no
 nfc_symbian_enabled = no
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 73ed2bc..3b1e0fe 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -10,7 +10,7 @@ QT4DEPENDS = ""
 
 INC_PR = "r50"
 
-QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
+QT_GLFLAGS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
 QT_GLFLAGS_qemuppc = "-opengl"
 QT_X11_FLAGS ?= "-no-xinerama -no-xkb -no-gtkstyle"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 9a10138..0023f16 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -1,7 +1,7 @@
 inherit qmake_base
 
 DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff icu"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 
 require qt4_arch.inc
 
@@ -18,7 +18,7 @@ QT_XML ?= "-xmlpatterns"
 QT_WEBKIT ?= "-webkit"
 QT_PHONON ?= "-phonon"
 QT_DBUS ?= "-qdbus"
-QT_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', '-pulseaudio', '-no-pulseaudio', d)}"
+QT_MULTIMEDIA ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', '-pulseaudio', '-no-pulseaudio', d)}"
  
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
index 8d43785..da4d98a 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
@@ -11,4 +11,4 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "${@base_contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
+EXTRA_OECONF += "${@bb.utils.contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 31d32c6..490e2bc 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://applets/startup/startup.c;endline=22;md5=b0a64fbef3097d79f8264e6907a98f03"
 
 DEPENDS = "gnome-common gtk+ startup-notification dbus dbus-glib"
-DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
-DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
+DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
+DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "26a3a67b41c50e0ae163d8fe86ccf7a0f0a671ae"
 PV = "2.0+git${SRCPV}"
@@ -22,8 +22,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://silence-warnings.patch"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
-EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
-EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "apm", "--with-battery=apm", "",d)}"
+EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
+EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "--with-battery=apm", "",d)}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
index 23dc043..0d3569d 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
@@ -7,6 +7,6 @@ DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
 
-EXTRA_OECONF += "${@base_contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
+EXTRA_OECONF += "${@bb.utils.contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 3db8e6d..29f8a79 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -15,7 +15,7 @@ ICU_LIB_powerpc = "pango"
 
 DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
            gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
-DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
 SRC_URI = "\
   http://www.webkitgtk.org/releases/webkit-${PV}.tar.xz \
@@ -47,7 +47,7 @@ EXTRA_OECONF = "\
                 --enable-link-prefetch \
                 --with-gtk=2.0 \
                 --disable-geolocation \
-                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 356ca22..0a44d79 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -21,7 +21,7 @@ BOOST_LIBS = "\
 # optional boost-python library
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = ",,python"
-BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}"
+BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 inherit python-dir
 PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index c97b449..9851616 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -19,8 +19,8 @@ SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf9751464
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
 # No option to turn it on or off, so rely on the build dependency for now.
@@ -37,7 +37,7 @@ FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
 RDEPENDS_pam-plugin-ck-connector += "${PN}"
 
 do_install_append() {
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d ${localstatedir}/log/ConsoleKit - - - -" \
 			> ${D}${sysconfdir}/tmpfiles.d/consolekit.conf
diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index fef700a..08f4cfe 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -6,7 +6,7 @@ LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "attr perl-native-runtime"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 # attr and pam are disabled by EXTRA_OEMAKE_class-native
 DEPENDS_class-native = "perl-native-runtime"
 
@@ -31,7 +31,7 @@ do_configure() {
 
 EXTRA_OEMAKE = " \
   LIBATTR=yes \
-  PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
+  PAM_CAP=${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
   INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no \
   lib=${@os.path.basename('${libdir}')} \
 "
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index aecb7b5..a53a197 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -29,7 +29,7 @@ do_configure_prepend() {
 }
 
 python() {
-    if base_contains("INCOMPATIBLE_LICENSE", "GPLv3", "x", "", d) == "x" or base_contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
+    if bb.utils.contains("INCOMPATIBLE_LICENSE", "GPLv3", "x", "", d) == "x" or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
         d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
         d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS").split() if i != "gconf"))
 }
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
index 782ac21..0f7ff62 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
@@ -47,7 +47,7 @@ MACHINE_FEATURES += "x86"
 KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 XSERVER = "xserver-xorg \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
-- 
2.0.0.rc0


