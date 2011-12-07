Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RYNNI-0002KO-TD
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 20:41:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2011 11:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99763188"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.36])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 11:35:03 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:34:46 -0800
Message-Id: <38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 7/8] OECore license fixes: meta/*
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
X-List-Received-Date: Wed, 07 Dec 2011 19:41:54 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This is a quick audit of only the most obviously wrong licenses
found within OECore. These fixes fall into four areas:

- LICENSE field had incorrect format so that the parser choked
- LICENSE field has a license with no version
- LICENSE field was actually incorrect
- LICENSE field has an imaginary license that didn't exist

This fixes most of the LICENSE warnings thrown, along with my prior
commit adding additional licenses to common-licenses and additional
SPDXLICENSEMAP entries.

HOWEVER..... there is much to be done on the license front.
For a list of recipes with licenses that need obvious fixing see:

https://wiki.yoctoproject.org/wiki/License_Audit

That said, I would suggest another license audit as I've found
enough inconsistencies. A good suggestion is when in doubt, look at
how openSuse or Gentoo or Debian license the package.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../base-files/base-files/licenses/Artistic        |  131 ----
 .../base-files/base-files/licenses/BSD             |   26 -
 .../base-files/base-files/licenses/GFDL-1.2        |  397 ------------
 .../base-files/base-files/licenses/GPL-3           |  676 --------------------
 .../base-files/base-files/licenses/LGPL-2          |  481 --------------
 .../base-files/base-files/licenses/LGPL-2.1        |  510 ---------------
 .../base-files/base-files/licenses/LGPL-3          |  165 -----
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   20 +-
 meta/recipes-core/busybox/busybox.inc              |    3 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +-
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    4 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    4 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    4 +-
 .../squashfs-tools/squashfs-tools_4.2.bb           |    4 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    4 +-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    4 +-
 .../transfig/transfig-native_3.2.5d.bb             |    4 +-
 meta/recipes-extended/byacc/byacc_20110908.bb      |   10 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    4 +-
 meta/recipes-extended/less/less_444.bb             |    7 +-
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
 meta/recipes-extended/unzip/unzip_6.0.bb           |    4 +-
 meta/recipes-extended/xinetd/xinetd_2.3.14.bb      |    5 +-
 meta/recipes-extended/zip/zip.inc                  |    2 +-
 meta/recipes-extended/zip/zip_3.0.bb               |    2 +-
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    4 +-
 meta/recipes-graphics/clutter/clutter-box2d.inc    |    2 +-
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 meta/recipes-graphics/freetype/freetype_2.4.6.bb   |    4 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    4 +-
 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb     |    4 +-
 .../recipes-graphics/xorg-font/font-alias_1.0.3.bb |    4 +-
 meta/recipes-graphics/xorg-font/font-util_1.2.0.bb |    5 +-
 .../linux-firmware/linux-firmware_git.bb           |    5 +
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    4 +-
 .../matchbox-theme-sato/matchbox-theme-sato.inc    |    2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.1.bb |    2 +-
 .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 meta/recipes-support/boost/boost.inc               |    4 +-
 41 files changed, 79 insertions(+), 2452 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/Artistic
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/BSD
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/GFDL-1.2
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/GPL-3
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/LGPL-2
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/LGPL-2.1
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/LGPL-3


diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 8f5313b..eb40917 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,9 +1,15 @@
 SUMMARY = "Miscellaneous files for the base system."
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r69"
+PR = "r70"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
+# Removed all license related tasks in this recipe as license.bbclass 
+# now deals with this. In order to get accurate licensing on to the image:
+# Set COPY_LIC_MANIFEST to just copy just the license.manifest to the image
+# For the manifest and the license text for each package:
+# Set COPY_LIC_MANIFEST and COPY_LIC_DIRS
+
 SRC_URI = "file://rotation \
            file://nsswitch.conf \
            file://motd \
@@ -18,14 +24,8 @@ SRC_URI = "file://rotation \
            file://usbd \
            file://share/dot.bashrc \
            file://share/dot.profile \
-           file://licenses/BSD \
            file://licenses/GPL-2 \
-           file://licenses/GPL-3 \
-           file://licenses/LGPL-2 \
-           file://licenses/LGPL-2.1 \
-           file://licenses/LGPL-3 \
-           file://licenses/GFDL-1.2 \
-           file://licenses/Artistic"
+           "
 S = "${WORKDIR}"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -103,10 +103,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
-	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
-		install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
-	done
-
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b948e2c..07ca782 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -5,7 +5,8 @@ BUGTRACKER = "https://bugs.busybox.net/"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2"
+# bzip2 is not a bzip2 license (no such thing)
+LICENSE = "GPLv2 & BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 
 SECTION = "base"
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index 7a54789..7360219 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 9db2eb1..615582e 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -2,10 +2,10 @@ SUMMARY = "Utilities and libraries for producing multi-lingual messages."
 DESCRIPTION = "Gettext offers to programmers, translators, and even users, a well integrated set of tools and documentation. Specifically, the GNU `gettext' utilities are a set of tools that provides a framework to help other GNU packages produce multi-lingual messages. These tools include a set of conventions about how programs should be written to support message catalogs, a directory and file naming organization for the message catalogs themselves, a runtime library supporting the retrieval of translated messages, and a few stand-alone programs to massage in various ways the sets of translatable strings, or already translated strings."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r5"
+PR = "r6"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
diff --git a/meta/recipes-core/jpeg/jpeg_8c.bb b/meta/recipes-core/jpeg/jpeg_8c.bb
index df6c5b6..1c242d1 100644
--- a/meta/recipes-core/jpeg/jpeg_8c.bb
+++ b/meta/recipes-core/jpeg/jpeg_8c.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "libjpeg contains a library for handling the JPEG (JFIF) image for
 HOMEPAGE = "http://www.ijg.org/"
 BUGTRACKER = ""
 
-LICENSE ="jpeg"
+LICENSE ="BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
                     file://jpeglib.h;endline=14;md5=22f1e0f8fc71f6f7563146d3b210dbe5 \
                     file://djpeg.c;endline=13;md5=ca89254925da06fef47e4b6468233432"
@@ -13,7 +13,7 @@ SECTION = "libs"
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
 	   file://debian-libjpeg7_7-1.diff;"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 1399eb7..0f4e8ca 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "A collection of utilities and DSOs to handle compiled objects."
 HOMEPAGE = "https://fedorahosted.org/elfutils"
 SECTION = "base"
-LICENSE = "(GPLv2 & Exception)"
+LICENSE = "(GPL-2+ & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index 330f856..7d80554 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Pyrex is a language specially designed for writing Python extensi
 It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
 and the messy, low-level world of C."
 SECTION = "devel/python"
-LICENSE = "Apache-2"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
 SRCNAME = "Pyrex"
-PR = "ml1"
+PR = "ml2"
 
 SRC_URI = "\
   http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index a2ed8ba..c54081b 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -2,12 +2,12 @@
 # and I don't think the kernel supports it any more.
 DESCRIPTION = "Tools to manipulate Squashfs filesystems."
 SECTION = "base"
-LICENSE = "GPLv2 & Public Domain"
+LICENSE = "GPL-2 & PD"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
                    "
 DEPENDS = "attr zlib xz"
-PR = "r0"
+PR = "1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index 2c11628..c9ac396 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Target Communication Framework"
 HOMEPAGE = "http://wiki.eclipse.org/TCF"
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
-LICENSE = "EPL-1 | EDLv1.0"
+LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f \
                     file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "1855"
 PV = "0.0+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=agent;proto=http \
            http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.html;name=epl \
diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index b1424f4..146021a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Tool Command Language"
-LICENSE = "tcl"
+LICENSE = "BSD-3-Clause"
 SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
 DEPENDS = "tcl-native"
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r0"
+PR = "r2"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
diff --git a/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb b/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
index 97441c6..c20a243 100644
--- a/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
+++ b/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "This package contains utilities (mainly fig2dev) to \
 handle XFig (Facility for Interactive Generation of figures) files."
 HOMEPAGE = "http://www-epb.lbl.gov/xfig/"
 SECTION = "console/utils"
-LICENSE = "xfig"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://fig2dev/fig2dev.c;endline=16;md5=6bab01e017409cf9ab21d3e953b793f7"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "imake-native xorg-cf-files-native zlib-native jpeg-native libpng-native libxpm-native"
 
diff --git a/meta/recipes-extended/byacc/byacc_20110908.bb b/meta/recipes-extended/byacc/byacc_20110908.bb
index 5969d0a..5e01c25 100644
--- a/meta/recipes-extended/byacc/byacc_20110908.bb
+++ b/meta/recipes-extended/byacc/byacc_20110908.bb
@@ -1,5 +1,11 @@
-PR = "r0"
-LICENSE="other-BSD"
+PR = "r1"
+
+# Sigh. This is one of those places where everyone licenses it differently. Someone
+# even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
+# "I've found no reliable source which states that byacc must bear a UCB copyright."
+# Setting to PD as this is what the upstream has it as.
+
+LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=4dc4c30f840a7203fb6edf20b3db849e"
 require byacc.inc
 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index f5b9ac1..14cd240 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -4,9 +4,9 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "http://www.bzip.org/"
 SECTION = "console/utils"
-LICENSE = "bzip2"
+LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.bzip.org/${PV}/${BPN}-${PV}.tar.gz \
            file://configure.ac \
diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_444.bb
index c78dbaa..f198692 100644
--- a/meta/recipes-extended/less/less_444.bb
+++ b/meta/recipes-extended/less/less_444.bb
@@ -7,11 +7,14 @@ SECTION = "console/utils"
 
 # (GPLv2+ (<< 418), GPLv3+ (>= 418)) | less
 # less is a 2-clause BSD-like permissive license
-LICENSE = "GPLv3+ | less"
+# Reading LICENSE and COPYING indicate that GPL-3+ is suffient.
+# openSuse .spec and Debian seem to agree here. setting to GPL-3+
+
+LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=1237c0f825bb36122b0b2b486ffbe6be"
 DEPENDS = "ncurses"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 46d9675..985e848 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "Tools for monitoring and filtering incoming requests for tcp \
 	      services."
 SECTION = "console/network"
 
-LICENSE = "tcp-wrappers"
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r7"
+PR ="r8"
 
 
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev ${PN} ${PN}-doc"
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index b9eff43..79e450d 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A (de)compression library for the ZIP format"
 HOMEPAGE = "http://www.info-zip.org"
 SECTION = "console/utils"
-LICENSE = "Info-ZIP"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://avoid-strip.patch"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.14.bb b/meta/recipes-extended/xinetd/xinetd_2.3.14.bb
index 159cb2c..26ba78f 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.14.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.14.bb
@@ -2,11 +2,12 @@ DESCRIPTION = "Highly configurable, modular and secure inetd"
 HOMEPAGE = "http://www.xinetd.org"
 
 # xinetd is a BSD-like license
-LICENSE = "xinetd"
+# Apple and Gentoo say BSD here.
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
-PR ="r0"
+PR ="r1"
 
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
index 8cce146..a3bbc93 100644
--- a/meta/recipes-extended/zip/zip.inc
+++ b/meta/recipes-extended/zip/zip.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Archiver for .zip files"
 HOMEPAGE = "http://www.info-zip.org"
 SECTION = "console/utils"
 
-LICENSE = "Info-ZIP"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz"
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index b009c24..1238071 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -1,6 +1,6 @@
 require zip.inc
 
-PR="r0"
+PR="r1"
 
 # zip-2.32 still uses directory name of zip-2.30
 S = "${WORKDIR}/zip30"
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 587ac40..00ba1d1 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "GNOME 2 default icon themes"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "LGPLv3 | BY-SAv3"
+LICENSE = "LGPLv3+ | CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7e289d90fc8bdceed5e3f142f98229e"
 
 SECTION = "x11/gnome"
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native"
 RDEPENDS_${PN} = "hicolor-icon-theme"
 RRECOMMENDS_${PN} = "librsvg-gtk"
-PR = "r1"
+PR = "r2"
 
 FILES_${PN} += "${datadir}/*"
 
diff --git a/meta/recipes-graphics/clutter/clutter-box2d.inc b/meta/recipes-graphics/clutter/clutter-box2d.inc
index 599b467..056b091 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d.inc
+++ b/meta/recipes-graphics/clutter/clutter-box2d.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Clutter Box2D"
 HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPLv2.1+"
 
 # The main clutter lib is machine specific so we need to be too
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index 554ce81..d256a28 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
 
 SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
 PV = "0.12.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.gnome.org/clutter-box2d.git"
 
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.6.bb b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
index 94a389a..f002103 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.6.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
@@ -6,14 +6,14 @@ image generation tools, and many other products as well."
 HOMEPAGE = "http://www.freetype.org/"
 BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 
-LICENSE = "FreeTypeLicense | GPLv2+"
+LICENSE = "FreeType | GPLv2+"
 LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39 \
                     file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SECTION = "libs"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 682184a..6214c16 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -5,9 +5,9 @@ and bold).  In addition Fontconfig/Xft2 can artificially oblique the \
 serif faces for you: this loses hinting and distorts the faces slightly, \
 but is visibly different than normal and bold, and reasonably pleasing."
 SECTION = "x11/fonts"
-LICENSE = "Bitstream_Vera"
+LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
-PR = "r5"
+PR = "r6"
 RDEPENDS_${PN} = "fontconfig-utils"
 
 inherit allarch
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
index afb45cb..4410865 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
@@ -6,11 +6,11 @@ DESCRIPTION = "Xrandr is used to set the size, orientation and/or \
 reflection of the outputs for a screen. It can also set the screen \
 size."
 
-LICENSE= "BSD-X"
+LICENSE= "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "9735173a84dca9b05e06fd4686196b07"
 SRC_URI[sha256sum] = "1059ff7a9ad0df8e00a765ffa4e08a505304c02663112da370ac7082030b980e"
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
index 7005291..a212f19 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "X font aliases."
 
 require xorg-font-common.inc
 
-LICENSE = "Font-Alias"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf0158b89be493d523d69d9f29265038 \
                     file://cyrillic/fonts.alias;md5=f40795b0640d6785826aecd3b16f6124 \
                     file://75dpi/fonts.alias;md5=6bc48023f2ae7f3bfc105db7b0ee6b49 \
@@ -18,7 +18,7 @@ RDEPENDS_${PN}_virtclass-native = "font-util-native"
 inherit allarch
 
 PE = "1"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI[md5sum] = "6d25f64796fef34b53b439c2e9efa562"
 SRC_URI[sha256sum] = "8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a"
diff --git a/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
index 8834708..2c5ba41 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "X.Org font package creation/installation utilities"
 
 require xorg-font-common.inc
 
-LICENSE = "BSD & MIT-style & Unicode"
+#Unicode is MIT
+LICENSE = "BSD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0067273d90f6336008cb2504e14bd32 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
@@ -13,7 +14,7 @@ DEPENDS_virtclass-native = "util-macros-native"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
 RDEPENDS_${PN}_virtclass-native = "mkfontdir-native mkfontscale-native"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 do_configure_prepend() {
         sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" fontutil.m4.in
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 224cec0..1534cd9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -1,5 +1,10 @@
 DESCRIPTION = "Firmware files for use with Linux kernel"
 SECTION = "kernel"
+# Notes:
+# This is kind of a mess. Each bit of firmware has their own license. Some free
+# some not. Leaving this as Proprietary for now, but this recipe should be probably
+# be rethought out a bit more around how it deals with licenses.
+
 LICENSE = "Proprietary"
 
 LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef43 \
diff --git a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
index c646c15..7d60326 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "This software provides support for the Tag Image File Format (TIFF)"
-LICENSE = "${PN}"
+LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
index 032dc2d..f031ce0 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Matchbox window manager Sato themes"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.openedhand.com/"
 
-LICENSE = "CCPL"
+LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aae86bb34b0a83716ca09f4e783d6ba4"
 
 DEPENDS = "matchbox-wm"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
index e00386f..f6786dd 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
@@ -1,6 +1,6 @@
 require matchbox-theme-sato.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://pokylinux.org/releases/sato/matchbox-theme-sato-0.1.tar.gz"
 
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 75e029c..9fd1012 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Sato Icon Theme"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.openedhand.com/"
 
-LICENSE = "CCPL"
+LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
 
 SECTION = "x11"
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 54e4627..652424a 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,7 +2,7 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index fecdb97..cc26ef9 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.boost.org/"
 SECTION = "libs"
 DEPENDS = "boost-native zlib"
 DEPENDS_virtclass-native = ""
-LICENSE = "Boost"
+LICENSE = "BSL-1 & MIT & Python-2.0"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
-- 
1.7.1



