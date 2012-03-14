Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7ujy-00051c-Li
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 21:24:10 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C8E212FF3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 16:15:19 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 13:15:21 -0700
Message-Id: <d12c1ebf31aac5fa3ea294f0c4079c5522e1faba.1331756004.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331756004.git.scott.a.garman@intel.com>
References: <cover.1331756004.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331756004.git.scott.a.garman@intel.com>
References: <cover.1331756004.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C8E212FF3D.8407D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/2] PR bump for all recipes that DEPEND on ncurses
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
X-List-Received-Date: Wed, 14 Mar 2012 20:24:11 -0000

The packaging changes to ncurses could break package feeds,
so bump the PR on everythong that DEPENDS on ncurses.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +-
 meta/recipes-core/readline/readline_5.2.bb         |    2 +-
 meta/recipes-core/readline/readline_6.2.bb         |    2 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
 meta/recipes-devtools/cmake/cmake.inc              |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-extended/bash/bash_3.2.48.bb          |    2 +-
 meta/recipes-extended/bash/bash_4.2.bb             |    2 +-
 meta/recipes-extended/less/less_444.bb             |    2 +-
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |    2 +-
 meta/recipes-extended/mc/mc_4.8.1.bb               |    2 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    2 +-
 meta/recipes-extended/psmisc/psmisc_22.16.bb       |    2 +-
 meta/recipes-extended/screen/screen_4.0.3.bb       |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    2 +-
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    2 +-
 meta/recipes-kernel/powertop/powertop_1.13.bb      |    2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 5efdbd3..4144d2b 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r9"
+PR = "r10"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
diff --git a/meta/recipes-core/readline/readline_5.2.bb b/meta/recipes-core/readline/readline_5.2.bb
index d838e64..bf64853 100644
--- a/meta/recipes-core/readline/readline_5.2.bb
+++ b/meta/recipes-core/readline/readline_5.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=03b36fdd84f74b8d8189a202b980b67f"
 
 DEPENDS += "ncurses"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz \
            file://configure-fix.patch \
diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
index e6f330d..fda01a4 100644
--- a/meta/recipes-core/readline/readline_6.2.bb
+++ b/meta/recipes-core/readline/readline_6.2.bb
@@ -1,6 +1,6 @@
 require readline.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "67948acb2ca081f23359d0256e9a271c"
 SRC_URI[sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 78010db..893d8fd 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,7 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r5"
+INC_PR = "r6"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index bcf92e0..d899dd3 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r3"
+PR = "r4"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 8433c53..d080e50 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f372516292ff7c33337bf16a74a5f9a8 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index a100b79..0833a03 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index f10f687..509d7a0 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
 DEPENDS = "ncurses"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 8070918..e96709a 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_444.bb
index fb7059d..a5c9c00 100644
--- a/meta/recipes-extended/less/less_444.bb
+++ b/meta/recipes-extended/less/less_444.bb
@@ -23,7 +23,7 @@ LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
 DEPENDS = "ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index 59f32ad..e7ccc77 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-extended/mc/mc_4.8.1.bb b/meta/recipes-extended/mc/mc_4.8.1.bb
index 78bbc9d..7bcdcda 100644
--- a/meta/recipes-extended/mc/mc_4.8.1.bb
+++ b/meta/recipes-extended/mc/mc_4.8.1.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 6a41ccd..27d2b5c 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r4"
+PR = "r5"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-extended/psmisc/psmisc_22.16.bb b/meta/recipes-extended/psmisc/psmisc_22.16.bb
index ac3bd28..ada46d9 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.16.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.16.bb
@@ -1,7 +1,7 @@
 require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "d52caf26159c905574c2ce4bd792b9ee"
 SRC_URI[sha256sum] = "ae426d7238e5353fdf51b1d313897c2bbed0023e66e5b4af2be9cd03d87a9d01"
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index a875a35..1a7eb20 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
 SECTION = "console/utils"
 DEPENDS = "ncurses \
           ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-11+lenny1.diff.gz;name=patch \
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index 60408e3..f9e566b 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "zlib ncurses texinfo-native"
 DEPENDS_virtclass-native = "zlib-native ncurses-native"
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 247ec16..15f3667 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a
 
 DEPENDS = "virtual/libintl ncurses glib-2.0 gtk+"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
             file://latencytop-makefile.patch"
diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
index b08f65c..b4f45dd 100644
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_1.13.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/libintl ncurses"
 # powertop 1.13 needs lspci
 RDEPENDS_${PN} = "pciutils"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
            file://stub_out_the_ncurses_calls_in_dump_mode.patch \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index ed2886d..4c3e9dc 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index 0bc74cf..a76ebae 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -1,6 +1,6 @@
 require attr.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
index 763878b..25e2b24 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
@@ -1,6 +1,6 @@
 require sqlite3.inc
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 507e272..6111ccf 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.5.4



