Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 385216B726
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010066"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:16 +0000
Message-Id: <752d3ab2a3352a68e7d1be57cca6cc33eac96a13.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 20/38] Basic recipe formatting fixes
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
X-List-Received-Date: Sat, 28 Dec 2013 22:30:13 -0000

Fix statement indenting and spacing issues that I happened to notice.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb        |  4 +++-
 meta/recipes-bsp/acpid/acpid.inc                           |  5 ++---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                |  2 +-
 meta/recipes-devtools/automake/automake_1.13.4.bb          |  2 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb               |  2 +-
 meta/recipes-devtools/expect/expect_5.45.bb                |  2 +-
 meta/recipes-devtools/flex/flex_2.5.37.bb                  |  2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc                      |  2 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc                      |  2 +-
 meta/recipes-devtools/gdb/gdb-7.6.1.inc                    |  2 +-
 meta/recipes-devtools/gdb/gdb-common.inc                   |  2 +-
 meta/recipes-devtools/intltool/intltool_0.50.2.bb          |  2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb               |  4 ++--
 meta/recipes-extended/at/at_3.1.14.bb                      |  2 +-
 meta/recipes-extended/byacc/byacc_20130925.bb              |  2 +-
 meta/recipes-extended/net-tools/net-tools_1.60-25.bb       |  4 ++--
 meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb             |  2 +-
 meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb      |  2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb           |  2 +-
 meta/recipes-sato/puzzles/puzzles_r9765.bb                 |  2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb             |  4 +++-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb            | 14 ++++++++------
 meta/recipes-support/consolekit/consolekit_0.4.6.bb        |  4 ++--
 meta/recipes-support/mpfr/mpfr_3.1.2.bb                    |  3 ++-
 24 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 2579134..20a0ab7 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -4,8 +4,10 @@
 
 SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
-LICENSE="LGPLv2 | LGPLv2.1"
+
+LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 0341094..89cb73f 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -1,10 +1,9 @@
 SUMMARY = "A daemon for delivering ACPI events"
 HOMEPAGE = "http://sourceforge.net/projects/acpid/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=33140&atid=407341"
-
-LICENSE="GPLv2+"
-
 SECTION = "base"
+LICENSE = "GPLv2+"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid/acpid-${PV}.tar.gz \
            file://init \
            file://set_socket_noblock.patch "
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index c29eb0c..21d2704 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 SUMMARY = "Utilities and scripts for power management"
 DESCRIPTION = "Simple shell command line tools to suspend and hibernate."
 HOMEPAGE = "http://pm-utils.freedesktop.org/wiki/"
-LICENSE="GPLv2"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
diff --git a/meta/recipes-devtools/automake/automake_1.13.4.bb b/meta/recipes-devtools/automake/automake_1.13.4.bb
index b114d99..7630754 100644
--- a/meta/recipes-devtools/automake/automake_1.13.4.bb
+++ b/meta/recipes-devtools/automake/automake_1.13.4.bb
@@ -1,5 +1,5 @@
 require automake.inc
-LICENSE="GPLv2"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
 DEPENDS_class-native = "autoconf-native"
 
diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index e623690..d5f5381 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -1,5 +1,5 @@
 SUMMARY = "DSSSL stylesheets used to transform SGML and XML DocBook files"
-HOMEPAGE= "http://docbook.sourceforge.net"
+HOMEPAGE = "http://docbook.sourceforge.net"
 # Simple persmissive
 LICENSE = "DSSSL"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=74;md5=875385159b2ee76ecf56136ae7f542d6"
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 0417ec6..ed55fa5 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -8,7 +8,7 @@ structures to direct the dialogue. In addition, the user can take control and \
 interact directly when desired, afterward returning control to the script. \
 "
 HOMEPAGE = "http://sourceforge.net/projects/expect/"
-LICENSE="PD"
+LICENSE = "PD"
 SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
diff --git a/meta/recipes-devtools/flex/flex_2.5.37.bb b/meta/recipes-devtools/flex/flex_2.5.37.bb
index c3b5e46..c57a948 100644
--- a/meta/recipes-devtools/flex/flex_2.5.37.bb
+++ b/meta/recipes-devtools/flex/flex_2.5.37.bb
@@ -1,5 +1,5 @@
 require flex.inc
-LICENSE="BSD"
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 81c8f07..fe9fb65 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -23,7 +23,7 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
-LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 8d1729b..a140573 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -13,7 +13,7 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.8' ], d)}"
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
-LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-devtools/gdb/gdb-7.6.1.inc b/meta/recipes-devtools/gdb/gdb-7.6.1.inc
index e577732..6fd953a 100644
--- a/meta/recipes-devtools/gdb/gdb-7.6.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.6.1.inc
@@ -1,4 +1,4 @@
-LICENSE="GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 31b5d73..211a574 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -1,6 +1,6 @@
 SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
-LICENSE="GPLv3+"
+LICENSE = "GPLv3+"
 SECTION = "devel"
 DEPENDS = "expat ncurses readline ${LTTNGUST}"
 
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.2.bb b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
index 05c96c7..dffce21 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.2.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
@@ -1,5 +1,5 @@
 require intltool.inc
-LICENSE="GPLv2"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI += "file://intltool-nowarn.patch \
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index 6042dee..94940f8 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 SRCREV = "ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
-		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-        file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
+           file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+           file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
 
 S = "${WORKDIR}/git/"
 
diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.14.bb
index 166a2a5..1eb18b3 100644
--- a/meta/recipes-extended/at/at_3.1.14.bb
+++ b/meta/recipes-extended/at/at_3.1.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Delayed job execution and batch processing"
 DESCRIPTION = "At allows for commands to be run at a particular time.  Batch will execute commands when \
 the system load levels drop to a particular level."
 SECTION = "base"
-LICENSE="GPLv2+"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 DEPENDS = "flex flex-native \
            ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
diff --git a/meta/recipes-extended/byacc/byacc_20130925.bb b/meta/recipes-extended/byacc/byacc_20130925.bb
index 8e68db8..890f4a3 100644
--- a/meta/recipes-extended/byacc/byacc_20130925.bb
+++ b/meta/recipes-extended/byacc/byacc_20130925.bb
@@ -3,7 +3,7 @@
 # "I've found no reliable source which states that byacc must bear a UCB copyright."
 # Setting to PD as this is what the upstream has it as.
 
-LICENSE="PD"
+LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
index bd72acc..5a7b307 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
@@ -1,5 +1,5 @@
-SUMMARY="Basic networking tools"
-DESCRIPTION="A collection of programs that form the base set of the NET-3 networking distribution for the Linux operating system"
+SUMMARY = "Basic networking tools"
+DESCRIPTION = "A collection of programs that form the base set of the NET-3 networking distribution for the Linux operating system"
 HOMEPAGE = "http://net-tools.berlios.de/"
 BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb b/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
index 35e53c8..6ca6863 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Xrandr is used to set the size, orientation and/or \
 reflection of the outputs for a screen. It can also set the screen \
 size."
 
-LICENSE= "MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
index 0afe127..7025719 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.4.bb
@@ -11,7 +11,7 @@ compositing transformations through a client."
 
 require xorg-lib-common.inc
 
-LICENSE= "MIT-style"
+LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
 
 DEPENDS += " compositeproto virtual/libx11 libxfixes libxext"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
index a9711c3..4f8a6a5 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE= "MIT & MIT-style & BSD"
+LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
 DEPENDS += "freetype xtrans fontsproto libfontenc zlib"
diff --git a/meta/recipes-sato/puzzles/puzzles_r9765.bb b/meta/recipes-sato/puzzles/puzzles_r9765.bb
index 6d0e480..5e972ec 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9765.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9765.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simon Tatham's Portable Puzzle Collection"
-HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
+HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 
 DEPENDS = "gtk+ libxt"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index fddc6a5..86fcc93 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -1,7 +1,9 @@
 SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
-LICENSE="LGPLv2 | LGPLv2.1"
+
+LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index eaab2e3..46834d2 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -3,14 +3,16 @@
 # Released under the MIT license (see packages/COPYING)
 
 SUMMARY = "A general-purpose cryptography library"
-HOMEPAGE="http://sourceforge.net/projects/beecrypt"
-SRC_URI="${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
-	 file://disable-icu-check.patch \
-	 file://fix-security.patch \
-         file://fix-for-gcc-4.7.patch"
+HOMEPAGE = "http://sourceforge.net/projects/beecrypt"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
+           file://disable-icu-check.patch \
+           file://fix-security.patch \
+           file://fix-for-gcc-4.7.patch"
 
 SRC_URI[md5sum] = "8441c014170823f2dff97e33df55af1e"
 SRC_URI[sha256sum] = "286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d"
+
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
                     file://COPYING.LIB;md5=dcf3c825659e82539645da41a7908589 \
@@ -25,7 +27,7 @@ do_install_append() {
 	oe_multilib_header beecrypt/gnu.h
 }
 
-EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp --with-java=no"
+EXTRA_OECONF = "--without-python --enable-shared --enable-static --disable-openmp --with-java=no"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cplusplus] = "--with-cplusplus,--without-cplusplus,icu"
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index ebd2dcf..2df97c5 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Framework for defining and tracking users, login sessions, and seats"
-HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
-BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ConsoleKit"
+BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.2.bb b/meta/recipes-support/mpfr/mpfr_3.1.2.bb
index 0ff1df8..c05e956 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.2.bb
@@ -1,5 +1,6 @@
 require mpfr.inc
-LICENSE="GPLv3&LGPLv3"
+
+LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp"
-- 
1.8.1.2


