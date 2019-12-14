Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 60C3B7F8C8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:32 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540230"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:15:04 +0800
Message-Id: <121bd949d313159fdb3f5fc36ddf3d1d9ae7d961.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576303901.git.anuj.mittal@intel.com>
References: <cover.1576303901.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 10/11] recipes: change SRC_URI to use https
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
X-List-Received-Date: Sat, 14 Dec 2019 06:15:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>

Change all recipes to https where we get an http 301 permanent redirect.

(From OE-Core rev: e514acda9e12bccde6d3974e0fd1a37b3837191a)

Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/busybox/busybox.inc                       | 2 +-
 meta/recipes-core/busybox/busybox_1.31.0.bb                 | 2 +-
 meta/recipes-core/dbus/dbus-glib_0.110.bb                   | 4 ++--
 meta/recipes-core/dbus/dbus_1.12.16.bb                      | 4 ++--
 meta/recipes-core/udev/eudev_3.2.8.bb                       | 2 +-
 meta/recipes-devtools/patchelf/patchelf_0.10.bb             | 2 +-
 meta/recipes-extended/libmnl/libmnl_1.0.4.bb                | 4 ++--
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb          | 2 +-
 meta/recipes-extended/xz/xz_5.2.4.bb                        | 4 ++--
 .../hicolor-icon-theme/hicolor-icon-theme_0.17.bb           | 2 +-
 meta/recipes-kernel/powertop/powertop_2.10.bb               | 6 +++---
 meta/recipes-sato/webkit/webkitgtk_2.24.4.bb                | 6 +++---
 meta/recipes-support/db/db_5.3.28.bb                        | 4 ++--
 meta/recipes-support/libbsd/libbsd_0.10.0.bb                | 4 ++--
 meta/recipes-support/libyaml/libyaml_0.2.2.bb               | 4 ++--
 meta/recipes-support/mpfr/mpfr_4.0.2.bb                     | 4 ++--
 16 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index d08fa8d3d9..bf6ddae7d1 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Tiny versions of many common UNIX utilities in a single small executable"
 DESCRIPTION = "BusyBox combines tiny versions of many common UNIX utilities into a single small executable. It provides minimalist replacements for most of the utilities you usually find in GNU fileutils, shellutils, etc. The utilities in BusyBox generally have fewer options than their full-featured GNU cousins; however, the options that are included provide the expected functionality and behave very much like their GNU counterparts. BusyBox provides a fairly complete POSIX environment for any small or embedded system."
-HOMEPAGE = "http://www.busybox.net"
+HOMEPAGE = "https://www.busybox.net"
 BUGTRACKER = "https://bugs.busybox.net/"
 
 DEPENDS += "kern-tools-native virtual/crypt"
diff --git a/meta/recipes-core/busybox/busybox_1.31.0.bb b/meta/recipes-core/busybox/busybox_1.31.0.bb
index 34b1f2cc91..5dd8d448da 100644
--- a/meta/recipes-core/busybox/busybox_1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.0.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
+SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.110.bb
index 9afbc2b6a1..0b45805cf4 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.110.bb
@@ -1,7 +1,7 @@
 SUMMARY = "High level language (GLib) binding for D-Bus"
 DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
-HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
+HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
 LICENSE = "AFL-2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
                     file://dbus/dbus-glib.h;beginline=7;endline=21;md5=7755c9d7abccd5dbd25a6a974538bb3c"
@@ -10,7 +10,7 @@ SECTION = "base"
 DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
 DEPENDS_class-native = "glib-2.0-native dbus-native"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz \
            file://no-examples.patch \
            file://test-install-makefile.patch \
 "
diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
index 05716608b0..cfdbec09d0 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -1,6 +1,6 @@
 SUMMARY = "D-Bus message bus"
 DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a \"single instance\" application or daemon, and to launch applications and daemons on demand when their services are needed."
-HOMEPAGE = "http://dbus.freedesktop.org"
+HOMEPAGE = "https://dbus.freedesktop.org"
 SECTION = "base"
 LICENSE = "AFL-2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
@@ -12,7 +12,7 @@ PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '',
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
diff --git a/meta/recipes-core/udev/eudev_3.2.8.bb b/meta/recipes-core/udev/eudev_3.2.8.bb
index eecf64e550..aed411827c 100644
--- a/meta/recipes-core/udev/eudev_3.2.8.bb
+++ b/meta/recipes-core/udev/eudev_3.2.8.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
 
 PROVIDES = "udev"
 
-SRC_URI = "http://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://devfs-udev.rules \
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index 580108e8b8..cc983e033a 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,4 +1,4 @@
-SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
            "
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb b/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
index 23262e8c6f..b55bb311f6 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Minimalistic user-space Netlink utility library"
 DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, providing \
     functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
-HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
+HOMEPAGE = "https://www.netfilter.org/projects/libmnl/index.html"
 SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
+SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
 SRC_URI[tar.md5sum] = "be9b4b5328c6da1bda565ac5dffadb2d"
 SRC_URI[tar.sha256sum] = "171f89699f286a5854b72b91d06e8f8e3683064c5901fb09d954a9ab6f551f81"
 
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 8e46638197..37834baeda 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -17,7 +17,7 @@ xdg-terminal \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 
-SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
           "
diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
index 791746e1cf..83e8fe0cd1 100644
--- a/meta/recipes-extended/xz/xz_5.2.4.bb
+++ b/meta/recipes-extended/xz/xz_5.2.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Utilities for managing LZMA compressed files"
-HOMEPAGE = "http://tukaani.org/xz/"
+HOMEPAGE = "https://tukaani.org/xz/"
 SECTION = "base"
 
 # The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC_URI[md5sum] = "5ace3264bdd00c65eeec2891346f65e6"
 SRC_URI[sha256sum] = "b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
index fb8033448d..6872069241 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
-SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "84eec8d6f810240a069c731f1870b474"
 SRC_URI[sha256sum] = "317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8"
 
diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index 5be8d23111..7b7b3929b3 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Power usage tool"
 DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
-HOMEPAGE = "http://01.org/powertop/"
-BUGTRACKER = "http://bugzilla.lesswatts.org/"
+HOMEPAGE = "https://01.org/powertop/"
+BUGTRACKER = "https://app.devzing.com/powertopbugs/bugzilla"
 DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
+SRC_URI = "https://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
index 8c695ce9e7..c090782411 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "WebKit web rendering engine for the GTK+ platform"
-HOMEPAGE = "http://www.webkitgtk.org/"
-BUGTRACKER = "http://bugs.webkit.org/"
+HOMEPAGE = "https://www.webkitgtk.org/"
+BUGTRACKER = "https://bugs.webkit.org/"
 
 LICENSE = "BSD & LGPLv2+"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
 		   "
 
-SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
            file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 761d80c2fd..a2969055a6 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -10,7 +10,7 @@
 # same system at the same time if really necessary.
 SECTION = "libs"
 SUMMARY = "Berkeley Database v5"
-HOMEPAGE = "http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html"
+HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html"
 LICENSE = "Sleepycat"
 RCONFLICTS_${PN} = "db3"
 
@@ -20,7 +20,7 @@ CVE_VERSION = "11.2.${PV}"
 PR = "r1"
 PE = "1"
 
-SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
+SRC_URI = "https://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://fix-parallel-build.patch \
             file://0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch \
             file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
index eaf244a3b7..3b9ac5a01f 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "This library provides useful functions commonly found on BSD syst
                projects with strong BSD origins, without needing to embed the same \
                code over and over again on each project."
 
-HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
+HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # There seems to be more licenses used in the code, I don't think we want to list them all here, complete list:
 # OE @ ~/projects/libbsd $ grep ^License: COPYING  | sort -u
 # License: BSD-2-clause
@@ -31,7 +31,7 @@ LICENSE = "BSD-4-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
-SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "ead96d240d02faa5b921c0aa50c812b5"
 SRC_URI[sha256sum] = "34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887"
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.2.bb b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
index fbd199205f..5105ce69db 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
@@ -1,13 +1,13 @@
 SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
 DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
 a human-readable data serialization format. "
-HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+HOMEPAGE = "https://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
 
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
 SRC_URI[md5sum] = "54bf11ccb8bc488b5b3bec931f5b70dc"
 SRC_URI[sha256sum] = "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9"
 
diff --git a/meta/recipes-support/mpfr/mpfr_4.0.2.bb b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
index 03059174ee..00c2dc2fe9 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
-HOMEPAGE = "http://www.mpfr.org/"
+HOMEPAGE = "https://www.mpfr.org/"
 LICENSE = "LGPLv3+"
 SECTION = "devel"
 
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     "
 DEPENDS = "gmp autoconf-archive"
 
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
 SRC_URI[md5sum] = "320fbc4463d4c8cb1e566929d8adc4f8"
 SRC_URI[sha256sum] = "1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a"
 
-- 
2.21.0


