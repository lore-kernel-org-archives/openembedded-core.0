Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 1805A6E760
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 15:19:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,506,1389740400"; d="scan'208";a="41432470"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 19 Feb 2014 16:19:05 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 19 Feb 2014 16:19:05 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Wed, 19 Feb 2014 16:19:05 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2014 16:13:54 +0100
Message-ID: <1392822834-585-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
X-OriginalArrivalTime: 19 Feb 2014 15:19:05.0269 (UTC)
	FILETIME=[ED54C650:01CF2D85]
MIME-Version: 1.0
Subject: [PATCH] recipes: convert remaining SUMMARY/DESCRIPTION cosmetic issues (part 2)
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
X-List-Received-Date: Wed, 19 Feb 2014 15:19:06 -0000
Content-Type: text/plain

Completes previous commit b5292d4115a4555a66b5e35acdc67dd71fb8577f.
Updates SUMMARY[doc] (meta/conf/documentation.conf).

Changes:
- rename DESCRIPTION with length < 80 to (non present tag) SUMMARY
- drop final point character at the end of SUMMARY string
- remove trailing whitespace of SUMMARY line

Note: don't bump PR

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-hob/recipes-core/meta/hob-toolchain.bb                  |  2 +-
 meta-skeleton/recipes-skeleton/service/service_0.1.bb        |  2 +-
 meta/conf/documentation.conf                                 |  2 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb                    |  2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb                      |  2 +-
 meta/recipes-bsp/usbutils/usbutils_007.bb                    |  2 +-
 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb         |  2 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb            |  2 +-
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb          |  2 +-
 meta/recipes-core/busybox/busybox.inc                        |  2 +-
 meta/recipes-core/console-tools/console-tools_0.3.2.bb       |  2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb                 |  2 +-
 meta/recipes-core/coreutils/coreutils_8.22.bb                |  2 +-
 meta/recipes-core/eglibc/eglibc-package.inc                  |  2 +-
 meta/recipes-core/expat/expat.inc                            |  2 +-
 meta/recipes-core/images/core-image-base.bb                  |  2 +-
 meta/recipes-core/images/core-image-minimal.bb               |  2 +-
 meta/recipes-core/jpeg/jpeg_8d.bb                            |  2 +-
 meta/recipes-core/packagegroups/packagegroup-base.bb         |  4 ++--
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb     |  2 +-
 meta/recipes-core/psplash/psplash_git.bb                     |  2 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb             |  2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb             |  2 +-
 meta/recipes-core/util-linux/util-linux.inc                  |  2 +-
 meta/recipes-devtools/autoconf/autoconf.inc                  |  2 +-
 meta/recipes-devtools/automake/automake.inc                  |  2 +-
 meta/recipes-devtools/bison/bison_2.3.bb                     |  2 +-
 meta/recipes-devtools/bison/bison_2.7.1.bb                   |  2 +-
 meta/recipes-devtools/guile/guile_2.0.9.bb                   |  2 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb           |  2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb               |  2 +-
 meta/recipes-devtools/python/python-distribute_0.6.32.bb     |  2 +-
 meta/recipes-devtools/python/python-mako_0.9.1.bb            |  2 +-
 meta/recipes-devtools/python/python-numpy_1.7.0.bb           |  2 +-
 meta/recipes-devtools/python/python3-distribute_0.6.32.bb    |  2 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb                       | 12 ++++++------
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb             |  2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb                   |  2 +-
 meta/recipes-extended/diffutils/diffutils.inc                |  2 +-
 meta/recipes-extended/findutils/findutils.inc                |  2 +-
 meta/recipes-extended/mailx/mailx_12.5.bb                    |  2 +-
 meta/recipes-extended/msmtp/msmtp_1.4.31.bb                  |  2 +-
 .../packagegroups/packagegroup-core-basic.bb                 |  2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb           |  2 +-
 meta/recipes-extended/wget/wget.inc                          |  2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc                 |  2 +-
 meta/recipes-gnome/json-glib/json-glib_0.16.2.bb             |  2 +-
 .../packagegroups/packagegroup-toolset-native.bb             |  2 +-
 meta/recipes-graphics/images/core-image-directfb.bb          |  2 +-
 meta/recipes-graphics/images/core-image-weston.bb            |  2 +-
 meta/recipes-graphics/images/core-image-x11.bb               |  2 +-
 meta/recipes-graphics/tslib/tslib_1.1.bb                     |  2 +-
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb            |  2 +-
 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb             |  2 +-
 meta/recipes-lsb4/perl/libenv-perl_1.04.bb                   |  2 +-
 meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb           |  2 +-
 meta/recipes-multimedia/libav/libav.inc                      |  2 +-
 .../nativesdk-packagegroup-qt-toolchain-host.bb              |  2 +-
 .../nativesdk-packagegroup-qte-toolchain-host.bb             |  2 +-
 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb        |  2 +-
 .../packagegroups/packagegroup-qt-toolchain-target.bb        |  2 +-
 .../packagegroups/packagegroup-qte-toolchain-target.bb       |  2 +-
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb                 |  2 +-
 63 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/meta-hob/recipes-core/meta/hob-toolchain.bb b/meta-hob/recipes-core/meta/hob-toolchain.bb
index 69cc0f7..5565273 100644
--- a/meta-hob/recipes-core/meta/hob-toolchain.bb
+++ b/meta-hob/recipes-core/meta/hob-toolchain.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "dummy toolchain"
+SUMMARY = "dummy toolchain"
 LICENSE = "MIT"
 
 PR = "r0"
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index 22137a5..a3ad6cc 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The canonical example of init scripts"
+SUMMARY = "The canonical example of init scripts"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index a1d421c..d1f491d 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -298,7 +298,7 @@ SSTATE_DIR[doc] = "The directory for the shared state cache."
 SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other mirror locations for prebuilt cache data objects before building out the data. You can specify a filesystem directory or a remote URL such as HTTP or FTP."
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
-SUMMARY[doc] = "The short (72 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
+SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
 SVNDIR[doc] = "The directory where Subversion checkouts will be stored."
 SYSROOT_PREPROCESS_FUNCS[doc] = "A list of functions to execute after files are staged into the sysroot. These functions are usually used to apply additional processing on the staged files, or to stage additional files."
 SYSVINIT_ENABLED_GETTYS[doc] = "Specifies which virtual terminals should be running a getty, the default is '1'."
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 552fcfc..c996cd9 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -4,7 +4,7 @@
 #
 # Filename: alsa-state.bb
 
-SUMMARY = "Alsa scenario files to enable alsa state restoration."
+SUMMARY = "Alsa scenario files to enable alsa state restoration"
 DESCRIPTION = "Alsa Scenario Files - an init script and state files to restore \
 sound state at system boot and save it at system shut down."
 LICENSE = "MIT"
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 2d222e7..bf302f3 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "ACPI data gathering library."
+SUMMARY = "ACPI data gathering library"
 DESCRIPTION = "General purpose shared library for programs gathering ACPI data on Linux. \
 Thermal zones, battery infomration, fan information and AC states are implemented."
 SECTION = "base"
diff --git a/meta/recipes-bsp/usbutils/usbutils_007.bb b/meta/recipes-bsp/usbutils/usbutils_007.bb
index 3cb19c9..a65672e 100644
--- a/meta/recipes-bsp/usbutils/usbutils_007.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_007.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Host side USB console utilities."
+SUMMARY = "Host side USB console utilities"
 DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected to the USB bus."
 HOMEPAGE = "http://www.linux-usb.org"
 SECTION = "base"
diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
index 8af5c6b..5c1f476 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool."
+SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool"
 DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
 and displays the commands, events and data in a human-readable form."
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index be3921a..726e0d5 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Miscellaneous files for the base system."
+SUMMARY = "Miscellaneous files for the base system"
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
 PR = "r73"
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index befef41..0205f2e 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Base system master password/group files."
+SUMMARY = "Base system master password/group files"
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0c84c1f..69b9b0c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Tiny versions of many common UNIX utilities in a single small executable."
+SUMMARY = "Tiny versions of many common UNIX utilities in a single small executable"
 DESCRIPTION = "BusyBox combines tiny versions of many common UNIX utilities into a single small executable. It provides minimalist replacements for most of the utilities you usually find in GNU fileutils, shellutils, etc. The utilities in BusyBox generally have fewer options than their full-featured GNU cousins; however, the options that are included provide the expected functionality and behave very much like their GNU counterparts. BusyBox provides a fairly complete POSIX environment for any small or embedded system."
 HOMEPAGE = "http://www.busybox.net"
 BUGTRACKER = "https://bugs.busybox.net/"
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 8f2f116..80fab55 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
-SUMMARY = "Allows you to set-up and manipulate the Linux console."
+SUMMARY = "Allows you to set-up and manipulate the Linux console"
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
 PR = "r8"
 
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 5a16872..338aae3 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -1,4 +1,4 @@
-SUMMARY = "The basic file, shell and text manipulation utilities."
+SUMMARY = "The basic file, shell and text manipulation utilities"
 DESCRIPTION = "The GNU Core Utilities provide the basic file, shell and text \
 manipulation utilities. These are the core utilities which are expected to exist on \
 every system."
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index f88373f..a26aa02 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -1,4 +1,4 @@
-SUMMARY = "The basic file, shell and text manipulation utilities."
+SUMMARY = "The basic file, shell and text manipulation utilities"
 DESCRIPTION = "The GNU Core Utilities provide the basic file, shell and text \
 manipulation utilities. These are the core utilities which are expected to exist on \
 every system."
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 3adf1a9..6721819 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -56,7 +56,7 @@ FILES_eglibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthr
 RPROVIDES_${PN}-dev += "libc-dev"
 RPROVIDES_${PN}-staticdev += "libc-staticdev"
 
-SUMMARY_sln = "The static ln."
+SUMMARY_sln = "The static ln"
 DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
 SUMMARY_nscd = "Name service cache daemon"
 DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups for the passwd, group and hosts information.  It can damatically improvide performance with remote, such as NIS or NIS+, name services."
diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index 459ccb3..6dfafe9 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A stream-oriented XML parser library."
+SUMMARY = "A stream-oriented XML parser library"
 DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
 HOMEPAGE = "http://expat.sourceforge.net/"
 SECTION = "libs"
diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
index 8ef3376..75a08cf 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A console-only image that fully supports the target device \
+SUMMARY = "A console-only image that fully supports the target device \
 hardware."
 
 IMAGE_FEATURES += "splash"
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 0b56cc8..b82ca46 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A small image just capable of allowing a device to boot."
+SUMMARY = "A small image just capable of allowing a device to boot."
 
 IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
 
diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
index b1247df..da23302 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -1,4 +1,4 @@
-SUMMARY = "libjpeg is a library for handling the JPEG (JFIF) image format."
+SUMMARY = "libjpeg is a library for handling the JPEG (JFIF) image format"
 DESCRIPTION = "libjpeg contains a library for handling the JPEG (JFIF) image format, as well as related programs for accessing the libjpeg functions."
 HOMEPAGE = "http://www.ijg.org/"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index eee8bd9..e39ccd7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
+SUMMARY = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
 PR = "r76"
 
@@ -145,7 +145,7 @@ RRECOMMENDS_packagegroup-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 # packages added by machine config
 #
 SUMMARY_packagegroup-machine-base = "${MACHINE} extras"
-DESCRIPTION_packagegroup-machine-base = "Extra packages required to fully support ${MACHINE} hardware"
+SUMMARY_packagegroup-machine-base = "Extra packages required to fully support ${MACHINE} hardware"
 RDEPENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
 RRECOMMENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 531eceb..24c98c4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "NFS package groups"
+SUMMARY = "NFS package groups"
 LICENSE = "MIT"
 PR = "r2"
 
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 1cab296..628ced4 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Userspace framebuffer boot logo based on usplash."
+SUMMARY = "Userspace framebuffer boot logo based on usplash"
 DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly embedded Linux devices supporting a 16bpp or 32bpp framebuffer. It has few dependencies (just libc), supports basic images and text and handles rotation. Its visual look is configurable by basic source changes. Also included is a 'client' command utility for sending information to psplash such as boot progress information."
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index d7b461e..1d9c476 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Tools for working with sysfs."
+SUMMARY = "Tools for working with sysfs"
 DESCRIPTION = "Tools for working with the sysfs virtual filesystem.  The tool 'systool' can query devices by bus, class and topology."
 HOMEPAGE = "http://linux-diag.sourceforge.net/Sysfsutils.html"
 
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index add8234..50dcaa2 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -1,4 +1,4 @@
-SUMMARY = "manage symlinks in /etc/rcN.d."
+SUMMARY = "manage symlinks in /etc/rcN.d"
 DESCRIPTION = "update-rc.d is a utilities that allows the management of symlinks to the initscripts in the /etc/rcN.d directory structure."
 SECTION = "base"
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 15ccc95..4c80bf2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A suite of basic system administration utilities."
+SUMMARY = "A suite of basic system administration utilities"
 DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
 commonly found on most Linux systems.  Some of the more important utilities include \
 disk partitioning, kernel message management, filesystem creation, and system login."
diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 2fde9d4..222106a 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A GNU tool that procude shell scripts to automatically configure software."
+SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
 DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 507c062..b73cdeb 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A GNU tool for automatically generating Makefiles."
+SUMMARY = "A GNU tool for automatically generating Makefiles"
 DESCRIPTION = "Automake is a tool for automatically generating `Makefile.in' files compliant with the GNU Coding \
 Standards. Automake requires the use of Autoconf."
 LICENSE = "GPLv2"
diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index 027782c..a135451 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -1,4 +1,4 @@
-SUMMARY = "GNU Project parser generator (yacc replacement)."
+SUMMARY = "GNU Project parser generator (yacc replacement)"
 DESCRIPTION = "Bison is a general-purpose parser generator that converts an annotated context-free grammar into \
 an LALR(1) or GLR parser for that grammar.  Bison is upward compatible with Yacc: all properly-written Yacc \
 grammars ought to work with Bison with no change. Anyone familiar with Yacc should be able to use Bison with \
diff --git a/meta/recipes-devtools/bison/bison_2.7.1.bb b/meta/recipes-devtools/bison/bison_2.7.1.bb
index 10bd8e3..1df750a 100644
--- a/meta/recipes-devtools/bison/bison_2.7.1.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.1.bb
@@ -1,4 +1,4 @@
-SUMMARY = "GNU Project parser generator (yacc replacement)."
+SUMMARY = "GNU Project parser generator (yacc replacement)"
 DESCRIPTION = "Bison is a general-purpose parser generator that converts an annotated context-free grammar into \
 an LALR(1) or GLR parser for that grammar.  Bison is upward compatible with Yacc: all properly-written Yacc \
 grammars ought to work with Bison with no change. Anyone familiar with Yacc should be able to use Bison with \
diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index e1504bb..60318e7 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for Extensions."
+SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for Extensions"
 DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
  the official extension language for the GNU operating system.\
  Guile is a library designed to help programmers create flexible applications.\
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index d336a88..f524854 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Universally Unique Identifier (UUID) library" 
+SUMMARY = "Universally Unique Identifier (UUID) library"
 DESCRIPTION = "OSSP uuid is a ISO-C:1999 application programming interface \
 (API) and corresponding command line interface (CLI) for the generation of \
 DCE 1.1, ISO/IEC 11578:1996 and RFC 4122 compliant Universally Unique \
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 163dc76..2c01976 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libxml-perl is a collection of smaller Perl modules, scripts, and
 documents for working with XML in Perl.  libxml-perl software \
 works in combination with XML::Parser, PerlSAX, XML::DOM, \
 XML::Grove and others."
-SUMMARY = "Collection of Perl modules for working with XML."
+SUMMARY = "Collection of Perl modules for working with XML"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 PR = "r3"
diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
index 2925114..58bb8b4 100644
--- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "http://packages.python.org/distribute"
 SECTION = "devel/python"
 LICENSE = "PSF"
diff --git a/meta/recipes-devtools/python/python-mako_0.9.1.bb b/meta/recipes-devtools/python/python-mako_0.9.1.bb
index 84071c8..57d4220 100644
--- a/meta/recipes-devtools/python/python-mako_0.9.1.bb
+++ b/meta/recipes-devtools/python/python-mako_0.9.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Templating library for Python"
+SUMMARY = "Templating library for Python"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da2a9d126b93cab0996a8287dacc480b"
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
index c91cdf6..3fa485e 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
+SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f87832d854acbade6e9f5c601c8b30b1"
diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
index d3b15c1..573096c 100644
--- a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
 HOMEPAGE = "http://packages.python.org/distribute"
 SECTION = "devel/python"
 LICENSE = "PSF"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 7921f40..dbdab1a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -5,10 +5,10 @@ verifying, querying, and updating software packages. Each software \
 package consists of an archive of files along with information about \
 the package like its version, a description, etc."
 
-SUMMARY_${PN}-libs = "Libraries for manipulating RPM packages."
+SUMMARY_${PN}-libs = "Libraries for manipulating RPM packages"
 DESCRIPTION_${PN}-libs = "This package contains the RPM shared libraries."
 
-SUMMARY_${PN}-dev = "Development files for manipulating RPM packages."
+SUMMARY_${PN}-dev = "Development files for manipulating RPM packages"
 DESCRIPTION_${PN}-dev = "This package contains the RPM C library and header files. These \
 development files will simplify the process of writing programs that \
 manipulate RPM packages and databases. These files are intended to \
@@ -16,20 +16,20 @@ simplify the process of creating graphical package managers or any \
 other tools that need an intimate knowledge of RPM packages in order \
 to function."
 
-SUMMARY_${PN}-common = "Common RPM paths, scripts, documentation and configuration."
+SUMMARY_${PN}-common = "Common RPM paths, scripts, documentation and configuration"
 DESCRIPTION_${PN}-common = "The rpm-common package contains paths, scripts, documentation \
 and configuration common between RPM Package Manager."
 
-SUMMARY_${PN}-build = "Scripts and executable programs used to build packages."
+SUMMARY_${PN}-build = "Scripts and executable programs used to build packages"
 DESCRIPTION_${PN}-build = "The rpm-build packagec ontains the scripts and executable programs \
 that are used to build packages using the RPM Package Manager."
 
-SUMMARY_python-rpm = "Python bindings for apps which will manupulate RPM packages."
+SUMMARY_python-rpm = "Python bindings for apps which will manupulate RPM packages"
 DESCRIPTION_python-rpm = "The rpm-python package contains a module that permits applications \
 written in the Python programming language to use the interface \
 supplied by the RPM Package Manager libraries."
 
-SUMMARY_perl-module-rpm = "Perl bindings for apps which will manipulate RPM packages."
+SUMMARY_perl-module-rpm = "Perl bindings for apps which will manipulate RPM packages"
 DESCRIPTION_perl-modules-rpm = "The perl-modules-rpm package contains a module that permits applications \
 written in the Perl programming language to use the interface \
 supplied by the RPM Package Manager libraries."
diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
index af2f3bb..f87b170 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace NFS server v3 protocol"
+SUMMARY = "Userspace NFS server v3 protocol"
 SECTION = "console/network"
 LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 3702ba4..176421d 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Very high-quality data compression program."
+SUMMARY = "Very high-quality data compression program"
 DESCRIPTION = "bzip2 compresses files using the Burrows-Wheeler block-sorting text compression algorithm, and \
 Huffman coding. Compression is generally considerably better than that achieved by more conventional \
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index c2ca417..613b538 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Diffutils contains tools used for finding differences between files."
+SUMMARY = "Diffutils contains tools used for finding differences between files"
 DESCRIPTION = "Diffutils contains the GNU diff, diff3, \
 sdiff, and cmp utilities. These programs are usually \
 used for creating patch files."
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 81e6785..4edb127 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -1,4 +1,4 @@
-SUMMARY = "find, locate, and xargs binaries."
+SUMMARY = "find, locate, and xargs binaries"
 DESCRIPTION = "The GNU Find Utilities are the basic directory searching utilities of the GNU operating system. \
 These programs are typically used in conjunction with other programs to provide modular and powerful directory \
 search and file locating capabilities to other commands."
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index f6734c7..1245a11 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -1,4 +1,4 @@
-SUMMARY = "mailx is the traditional command-line-mode mail user agent."
+SUMMARY = "mailx is the traditional command-line-mode mail user agent"
 
 DESCRIPTION = "Mailx is derived from Berkeley Mail and is intended provide the \
 functionality of the POSIX mailx command with additional support \
diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.31.bb b/meta/recipes-extended/msmtp/msmtp_1.4.31.bb
index 964a285..57942ed 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.31.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.31.bb
@@ -1,4 +1,4 @@
-SUMMARY = "msmtp is an SMTP client."
+SUMMARY = "msmtp is an SMTP client"
 DESCRIPTION = "A sendmail replacement for use in MTAs like mutt"
 HOMEPAGE = "http://msmtp.sourceforge.net/"
 SECTION = "console/network"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index c89923d..f3b4ff7 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2010 Intel Corporation
 #
 
-DESCRIPTION = "Create Basic Image Tasks"
+SUMMARY = "Create Basic Image Tasks"
 PR = "r6"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
index e2e0341..45d3966 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Perl module for using and building Perl SAX2 XML processors" 
+SUMMARY = "Perl module for using and building Perl SAX2 XML processors"
 DESCRIPTION = "XML::SAX consists of several framework classes for using and \
 building Perl SAX2 XML parsers, filters, and drivers.  It is designed \ 
 around the need to be able to "plug in" different SAX parsers to an \
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 3148d73..22d8e54 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Console URL download utility supporting HTTP, FTP, etc."
+SUMMARY = "Console URL download utility supporting HTTP, FTP, etc"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index b0433ad..9dbd6f7 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A collection of documentation utilities for the Gnome project."
+SUMMARY = "A collection of documentation utilities for the Gnome project"
 DESCRIPTION = "The GNOME Documentation Build Utilities (gnome-doc- \
 utils) were created to make it easier for application developers to \
 include and create documentation in their releases. They include the \
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
index d2bcb07..65da8c2 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject."
+SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject"
 DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
  data structures, using a DOM-like API. JSON-GLib also offers GObject \
 integration, providing the ability to serialize and deserialize GObject \
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index f08cf1d..e3524f7 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2012 Wind River Ltd
 #
 
-SUMMARY = "A toolset that contains most of the native packages."
+SUMMARY = "A toolset that contains most of the native packages"
 DESCRIPTION = "The packagegroup is required to build most native \
 tools, it is useful for testing and collecting the native tools."
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/images/core-image-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
index 2d71c62..ad0197c 100644
--- a/meta/recipes-graphics/images/core-image-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-directfb.bb
@@ -1,4 +1,4 @@
-SUMMARY = "An image that uses DirectFB instead of X11."
+SUMMARY = "An image that uses DirectFB instead of X11"
 LICENSE = "MIT"
 
 
diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 30cc845..52e271d 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A very basic Wayland image with a terminal"
+SUMMARY = "A very basic Wayland image with a terminal"
 
 IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
 
diff --git a/meta/recipes-graphics/images/core-image-x11.bb b/meta/recipes-graphics/images/core-image-x11.bb
index 14bb1ac..8455bb8 100644
--- a/meta/recipes-graphics/images/core-image-x11.bb
+++ b/meta/recipes-graphics/images/core-image-x11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A very basic X11 image with a terminal"
+SUMMARY = "A very basic X11 image with a terminal"
 
 IMAGE_FEATURES += "splash package-management x11-base"
 
diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
index 4dce8a7..05d58b6 100644
--- a/meta/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
@@ -1,4 +1,4 @@
-SUMMARY = "An abstraction layer for touchscreen panel events."
+SUMMARY = "An abstraction layer for touchscreen panel events"
 DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
 events, as well as a filter stack for the manipulation of those events. \
 Tslib is generally used on embedded devices to provide a common user \
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
index cf8dd20..6e2740c 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
@@ -1,4 +1,4 @@
-SUMMARY = "XFixes: X Fixes extension library."
+SUMMARY = "XFixes: X Fixes extension library"
 
 DESCRIPTION = "X applications have often needed to work around various \
 shortcomings in the core X window system.  This extension is designed to \
diff --git a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
index 1125e14..9a74614 100644
--- a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
+++ b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Perl module for provides screen dump of Perl data."
+SUMMARY = "Perl module for provides screen dump of Perl data"
 
 HOMEPAGE = "http://search.cpan.org/~flora/Dumpvalue/"
 SECTION = "libs"
diff --git a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb b/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
index 7d256fb..dd8e115 100644
--- a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
+++ b/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Perl module that imports environment variables as scalars or arrays."
+SUMMARY = "Perl module that imports environment variables as scalars or arrays"
 DESCRIPTION = "Perl maintains environment variables in a special hash named %ENV. \
 For when this access method is inconvenient, the Perl module Env allows environment \
 variables to be treated as scalar or array variables."
diff --git a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb b/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb
index a8d8a7c..19247d8 100644
--- a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb
+++ b/meta/recipes-lsb4/perl/libpod-plainer-perl_1.03.bb
@@ -1,4 +1,4 @@
-SUMMARY = "Perl extension for converting Pod to old-style Pod."
+SUMMARY = "Perl extension for converting Pod to old-style Pod"
 DESCRIPTION = "Pod::Plainer uses Pod::Parser which takes Pod with the (new) 'C<< .. >>' \
 constructs and returns the old(er) style with just 'C<>'; '<' and '>' are replaced by \
 'E<lt>' and 'E<gt>'. \
diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 8a778e0..5e675be 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A complete, cross-platform solution to record, convert and stream audio and video."
+SUMMARY = "A complete, cross-platform solution to record, convert and stream audio and video"
 HOMEPAGE = "http://libav.org/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
index 994462d..b95cc5e 100644
--- a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
@@ -1,3 +1,3 @@
 require nativesdk-packagegroup-qt-toolchain-host.inc
 
-DESCRIPTION = "Host packages for Qt SDK"
+SUMMARY = "Host packages for Qt SDK"
diff --git a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
index eadecf5..296e4b8 100644
--- a/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
@@ -1,3 +1,3 @@
 require nativesdk-packagegroup-qt-toolchain-host.inc
 
-DESCRIPTION = "Host packages for Qt Embedded SDK"
+SUMMARY = "Host packages for Qt Embedded SDK"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index c993242..15dec8e 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2010  Intel Corporation. All rights reserved
 #
 
-DESCRIPTION = "Qt package groups"
+SUMMARY = "Qt package groups"
 LICENSE = "MIT"
 PR = "r4"
 
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
index 738ca82..c6aa753 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Target packages for Qt SDK"
+SUMMARY = "Target packages for Qt SDK"
 
 QTLIBPREFIX = ""
 
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
index 0b022c9..92ed237 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Target packages for Qt Embedded SDK"
+SUMMARY = "Target packages for Qt Embedded SDK"
 
 PR = "r7"
 
diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
index 45a6fa7..78da0bd 100644
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Spidermonkey: a javascript engine written in C"
+SUMMARY = "Spidermonkey: a javascript engine written in C"
 HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
 SECTION = "libs"
 
-- 
1.8.5.4


