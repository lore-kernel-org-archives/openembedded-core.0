Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CEA1760796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904315"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:53 +0200
Message-Id: <579344a1f80632bf1c438c5844015a4497ab0567.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/9] package_regex.inc: split the rest of the entries to their recipes
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:25 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc         | 68 ----------------------
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |  2 +
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |  2 +
 meta/recipes-connectivity/dhcp/dhcp.inc            |  3 +
 .../nfs-utils/libnfsidmap_0.25.bb                  |  2 +
 .../wireless-tools/wireless-tools_30.pre9.bb       |  3 +
 .../autogen/autogen-native_5.18.5.bb               |  3 +
 meta/recipes-devtools/chrpath/chrpath_0.16.bb      |  2 +
 meta/recipes-devtools/cmake/cmake.inc              |  2 +
 .../dosfstools/dosfstools_3.0.28.bb                |  2 +
 meta/recipes-devtools/intltool/intltool.inc        |  3 +
 meta/recipes-devtools/json-c/json-c_0.12.bb        |  5 ++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  2 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  2 +
 meta/recipes-extended/cups/cups.inc                |  3 +
 .../foomatic/foomatic-filters_4.0.17.bb            |  2 +
 meta/recipes-extended/iputils/iputils_s20121221.bb |  2 +
 meta/recipes-extended/less/less_479.bb             |  2 +
 meta/recipes-extended/lsof/lsof_4.89.bb            |  2 +
 meta/recipes-extended/minicom/minicom_2.7.bb       |  2 +
 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb      |  2 +
 meta/recipes-extended/sysstat/sysstat.inc          |  2 +
 .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |  2 +
 meta/recipes-graphics/cairo/cairo_1.14.4.bb        |  2 +
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  2 +
 meta/recipes-graphics/tslib/tslib_1.1.bb           |  1 +
 meta/recipes-graphics/waffle/waffle_1.5.1.bb       |  2 +
 .../xorg-lib/libxkbcommon_0.5.0.bb                 |  2 +
 meta/recipes-kernel/powertop/powertop_2.7.bb       |  2 +
 .../libsamplerate/libsamplerate0_0.1.8.bb          |  3 +
 .../libtheora/libtheora_1.1.1.bb                   |  2 +
 meta/recipes-multimedia/webp/libwebp_0.4.3.bb      |  2 +
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |  2 +
 meta/recipes-support/libevent/libevent_2.0.22.bb   |  2 +
 meta/recipes-support/libical/libical_1.0.0.bb      |  2 +
 meta/recipes-support/libmpc/libmpc_1.0.3.bb        |  2 +
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |  3 +
 meta/recipes-support/mpfr/mpfr_3.1.3.bb            |  2 +
 meta/recipes-support/nettle/nettle.inc             |  2 +
 meta/recipes-support/nss/nss_3.19.2.bb             |  3 +
 meta/recipes-support/sqlite/sqlite3_3.9.0.bb       |  3 +
 meta/recipes-support/taglib/taglib_1.9.1.bb        |  2 +
 42 files changed, 93 insertions(+), 68 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index beed994..e08082a 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -20,71 +20,3 @@
 #	   determine the upstream release version. This regex can be used
 #	   to filter only relevant tags.
 #
-
-COMMON_REGEX = "(?P<pver>(\d+[\.\-_]*)+)"
-
-# Generic regex don't match
-REGEX_URI_pn-wireless-tools = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
-REGEX_pn-wireless-tools = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
-
-REGEX_URI_pn-sqlite3="http://www.sqlite.org/"
-REGEX_pn-sqlite3="releaselog/${COMMON_REGEX}.html"
-
-REGEX_URI_pn-dhcp = "ftp://ftp.isc.org/isc/dhcp/"
-REGEX_pn-dhcp="(?P<pver>\d+\.\d+\.(\d+?))/"
-
-REGEX_pn-foomatic-filters = "foomatic-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
-REGEX_pn-xdg-utils = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
-REGEX_pn-rpm="rpm-${COMMON_REGEX}-.*$"
-REGEX_pn-libtheora = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
-
-REGEX_pn-iputils="iputils-(?P<pver>s\d+).tar"
-REGEX_pn-nettle = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
-
-REGEX_pn-cairo = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
-REGEX_pn-cmake = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
-REGEX_pn-libsdl = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
-REGEX_pn-libxslt = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
-
-REGEX_URI_pn-autogen = "http://ftp.gnu.org/gnu/autogen/"
-REGEX_pn-autogen = "rel(?P<pver>\d+(\.\d+)+)/"
-
-# Isn't possible to download with the default URI web server returns
-# (403, 404, 550)
-REGEX_URI_pn-dosfstools = "https://github.com/dosfstools/dosfstools/releases"
-REGEX_pn-json-c = "json-c-(?P<pver>\d+(\.\d+)+).tar"
-# json-c releases page is fetching the list of releases in some weird XML format
-# from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
-#REGEX_URI_pn-json-c = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
-REGEX_URI_pn-chrpath = "http://alioth.debian.org/frs/?group_id=31052"
-
-REGEX_URI_pn-powertop = "https://01.org/powertop/downloads"
-REGEX_URI_pn-libsamplerate0 = "http://www.mega-nerd.com/SRC/download.html"
-REGEX_URI_pn-libxkbcommon = "http://xkbcommon.org/"
-REGEX_URI_pn-tslib = "https://github.com/kergoth/tslib/releases"
-REGEX_URI_pn-waffle="http://www.waffle-gl.org/releases.html"
-REGEX_URI_pn-lrzsz = "http://ohse.de/uwe/software/lrzsz.html"
-REGEX_URI_pn-libacpi = "http://www.ngolde.de/libacpi.html"
-REGEX_URI_pn-less  = "http://www.greenwoodsoftware.com/less/download.html"
-REGEX_URI_pn-cups = "http://www.cups.org/software.php"
-REGEX_pn-cups = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
-REGEX_URI_pn-bzip2 = "http://www.bzip.org/downloads.html"
-REGEX_URI_pn-minicom = "https://alioth.debian.org/frs/?group_id=30018"
-REGEX_URI_pn-sysstat = "http://sebastien.godard.pagesperso-orange.fr/download.html"
-REGEX_URI_pn-libical = "https://github.com/libical/libical/releases/"
-REGEX_URI_pn-libmpc = "http://www.multiprecision.org/index.php?prog=mpc&page=download"
-REGEX_URI_pn-taglib = "http://github.com/taglib/taglib/releases/"
-REGEX_URI_pn-libevent = "http://libevent.org/"
-REGEX_URI_pn-db = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
-REGEX_URI_pn-python-smartpm="https://launchpad.net/smart/trunk/"
-REGEX_URI_pn-lsof = "ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
-REGEX_URI_pn-pbzip2 = "http://compression.ca/pbzip2/"
-REGEX_URI_pn-quicky = "http://qt-apps.org/content/download.php?content=80325&id=1&tan=10417482"
-REGEX_URI_pn-libwebp = "http://downloads.webmproject.org/releases/webp/index.html"
-
-# The engine tries to use directory versioning but is a false-positive
-REGEX_URI_pn-intltool = "https://launchpad.net/intltool/trunk/"
-REGEX_URI_pn-libnfsidmap = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/"
-REGEX_URI_pn-mpfr = "http://www.mpfr.org/mpfr-current/"
-REGEX_URI_pn-nss = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
-REGEX_pn-nss = "NSS_(?P<pver>.+)_release_notes"
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index bf302f3..692d295 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
 
+REGEX_URI = "http://www.ngolde.de/libacpi.html"
+
 inherit lib_package
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index e0ce57d..df55142 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
+REGEX_URI = "http://ohse.de/uwe/software/lrzsz.html"
+
 inherit autotools gettext
 
 do_install() {
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index d883a8d..96cf108 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -20,6 +20,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://dhcpd.service file://dhcrelay.service \
            file://dhcpd6.service "
 
+REGEX_URI = "ftp://ftp.isc.org/isc/dhcp/"
+REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
+
 inherit autotools systemd
 
 SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index 5b578e9..2884e48 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${P
 SRC_URI[md5sum] = "2ac4893c92716add1a1447ae01df77ab"
 SRC_URI[sha256sum] = "656d245d84400e1030f8f40a5a27da76370690c4a932baf249110f047fe7efcf"
 
+REGEX_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/"
+
 inherit autotools
 
 EXTRA_OECONF = "--disable-ldap"
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
index 26ecdf3..c9d69a6 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
@@ -19,6 +19,9 @@ SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.$
 SRC_URI[md5sum] = "ca91ba7c7eff9bfff6926b1a34a4697d"
 SRC_URI[sha256sum] = "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
 
+REGEX_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
+REGEX = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
+
 S = "${WORKDIR}/wireless_tools.30"
 
 CFLAGS =+ "-I${S}"
diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
index 2a28512..b27ac95 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
@@ -17,6 +17,9 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
 SRC_URI[md5sum] = "385d7c7dfbe60babbee261c054923a53"
 SRC_URI[sha256sum] = "7bbdb73b5518baf64c6d3739fb2ecc66d2cccda888ce5ad573abe235ab5d96ba"
 
+REGEX_URI = "http://ftp.gnu.org/gnu/autogen/"
+REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
+
 DEPENDS = "guile-native libtool-native libxml2-native"
 
 inherit autotools texinfo native pkgconfig
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index 0a3b06e..9a55cb0 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -13,6 +13,8 @@ SRC_URI = "http://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
 SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
 
+REGEX_URI = "http://alioth.debian.org/frs/?group_id=31052"
+
 inherit autotools
 
 # We don't have a staged chrpath-native for ensuring our binary is
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index c912bcc..c28fcd1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,6 +19,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 SRC_URI[md5sum] = "5febbd11bcaac854a27eebaf4a124be2"
 SRC_URI[sha256sum] = "e75a178d6ebf182b048ebfe6e0657c49f0dc109779170bad7ffcb17463f2fc22"
 
+REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
+
 inherit autotools
 
 # Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
index ac131cb..8845d8a 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
@@ -13,6 +13,8 @@ SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/do
 SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
 SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
 
+REGEX_URI = "https://github.com/dosfstools/dosfstools/releases"
+
 FILES_${PN} = "${base_sbindir}"
 FILES_${PN}-doc = "${mandir} ${docdir}"
 
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index be77704..b434677 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -4,6 +4,9 @@ LICENSE = "GPLv2"
 
 URLV="${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
+
+REGEX_URI = "https://launchpad.net/intltool/trunk/"
+
 S = "${WORKDIR}/intltool-${PV}"
 
 DEPENDS = "libxml-parser-perl-native"
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index cfef03d..ff97a29 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -11,6 +11,11 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
 SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
 SRC_URI[sha256sum] = "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f"
 
+REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
+# json-c releases page is fetching the list of releases in some weird XML format
+# from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
+#REGEX_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
+
 RPROVIDES_${PN} = "libjson"
 
 inherit autotools
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 3930410..7b7a97b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -111,6 +111,8 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 SRC_URI[md5sum] = "25093d399a0b5d1342d24900a91b347d"
 SRC_URI[sha256sum] = "676e3ab41f72e3b504e04109cfb565a300742f56a7da084f202013b30eeae467"
 
+REGEX = "rpm-(?P<pver>(\d+[\.\-_]*)+)-.*$"
+
 inherit autotools gettext
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index d7b8c06..909f259 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
 
+REGEX_URI = "http://www.bzip.org/downloads.html"
+
 PACKAGES =+ "libbz2"
 
 CFLAGS_append = " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2c34da9..2209483 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -12,6 +12,9 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://cups.service \
 	  "
 
+REGEX_URI = "http://www.cups.org/software.php"
+REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
+
 LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 790c981..38d9e18 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
 SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
+REGEX = "foomatic-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index e87a32a..edd0323 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "6072aef64205720dd1893b375e184171"
 SRC_URI[sha256sum] = "450f549fc5b620c23c5929aa6d54b7ddfc7ee1cb1e8efdc5e8bb21d8d0c5319f"
 
+REGEX = "iputils-(?P<pver>s\d+).tar"
+
 do_compile () {
 	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all man
 }
diff --git a/meta/recipes-extended/less/less_479.bb b/meta/recipes-extended/less/less_479.bb
index 618954b..f9bb7c6 100644
--- a/meta/recipes-extended/less/less_479.bb
+++ b/meta/recipes-extended/less/less_479.bb
@@ -30,6 +30,8 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "049f51ccfe2686009c6ce943eeb4bbaf"
 SRC_URI[sha256sum] = "5bf06cb30ee2a2bd1f79f39aa91e46444e7cb19b48c95c4992fa63cfe4527a80"
 
+REGEX_URI  = "http://www.greenwoodsoftware.com/less/download.html"
+
 inherit autotools update-alternatives
 
 do_install () {
diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 0e9d071..acee2b0 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -9,6 +9,8 @@ SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
 SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
 
+REGEX_URI = "ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
+
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
 
diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
index 1575cfb..5191414 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
 SRC_URI[md5sum] = "7044ca3e291268c33294f171d426dc2d"
 SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4"
 
+REGEX_URI = "https://alioth.debian.org/frs/?group_id=30018"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
 
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
index 0330981..5b32c19 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
 SRC_URI[md5sum] = "91a4911b13305850423840eb0fa6f4f9"
 SRC_URI[sha256sum] = "573bb358a5a7d3bf5f42f881af324cedf960c786e8d66dd03d448ddd8a0166ee"
 
+REGEX_URI = "http://compression.ca/pbzip2/"
+
 do_configure[noexec] = "1"
 
 EXTRA_OEMAKE = "CXX='${CXX} ${CXXFLAGS}' LDFLAGS='${LDFLAGS}'"
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 5c761fa..104af58 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -9,6 +9,8 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://sysstat.service \
           "
 
+REGEX_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+
 DEPENDS += "base-passwd"
 
 inherit autotools-brokensep gettext systemd
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index 46f1e3c..2d8e0eb 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
 SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
 
+REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
+
 inherit autotools-brokensep distro_features_check
 
 # The xprop requires x11 in DISTRO_FEATURES
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.4.bb b/meta/recipes-graphics/cairo/cairo_1.14.4.bb
index 17ea851..e7b7ecd 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.4.bb
@@ -7,6 +7,8 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 SRC_URI[md5sum] = "90a929e8fe66fb5d19b5adaaea1e9a12"
 SRC_URI[sha256sum] = "f6ec9c7c844db9ec011f0d66b57ef590c45adf55393d1fc249003512522ee716"
 
+REGEX = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
+
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
 SUMMARY_${PN} = "The Cairo 2D vector graphics library"
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c0d5c6a..6a92a3d 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://pkgconfig.patch \
           "
 
+REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
+
 S = "${WORKDIR}/SDL-${PV}"
 
 SRC_URI[md5sum] = "9d96df8417572a2afb781a7c4c811a85"
diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
index 6d8c7dd..3d694e7 100644
--- a/meta/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
 SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
 SRC_URI[sha256sum] = "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c"
 
+REGEX_URI = "https://github.com/kergoth/tslib/releases"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-graphics/waffle/waffle_1.5.1.bb b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
index af84020..f83e988 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "c0d802bc3d0aba87c51e423a3a8bdd69"
 SRC_URI[sha256sum] = "cbab0e926515064e818bf089a5af04be33307e5f40d07659fb40d59b2bfe20aa"
 
+REGEX_URI = "http://www.waffle-gl.org/releases.html"
+
 inherit cmake distro_features_check lib_package
 
 # This should be overridden per-machine to reflect the capabilities of the GL
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
index a166b57..4a99792 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "2e1faeafcc609c30af3a561a91e84158"
 SRC_URI[sha256sum] = "90bd7824742b9a6f52a6cf80e2cadd6f5349cf600a358d08260772615b89d19c"
 
+REGEX_URI = "http://xkbcommon.org/"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-docs"
diff --git a/meta/recipes-kernel/powertop/powertop_2.7.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
index 5ba07e9..0671c3e 100644
--- a/meta/recipes-kernel/powertop/powertop_2.7.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.7.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.t
 SRC_URI[md5sum] = "e0d686e47daaf7e9d89031f7763432ef"
 SRC_URI[sha256sum] = "8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca"
 
+REGEX_URI = "https://01.org/powertop/downloads"
+
 inherit autotools gettext pkgconfig
 
 # we need to explicitly link with libintl in uClibc systems
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
index f06935c..cc7fb0c 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "1c7fb25191b4e6e3628d198a66a84f47"
 SRC_URI[sha256sum] = "93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06"
+
+REGEX_URI = "http://www.mega-nerd.com/SRC/download.html"
+
 S = "${WORKDIR}/libsamplerate-${PV}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 18cb168..8566596 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -15,6 +15,8 @@ SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "292ab65cedd5021d6b7ddd117e07cd8e"
 SRC_URI[sha256sum] = "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
 
+REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
diff --git a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb b/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
index c4b80f6..e245e6f 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
 SRC_URI[md5sum] = "08813525eeeffe7e305b4cbfade8ae9b"
 SRC_URI[sha256sum] = "efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4"
 
+REGEX_URI = "http://downloads.webmproject.org/releases/webp/index.html"
+
 EXTRA_OECONF = " \
     --disable-experimental \
     --disable-wic \
diff --git a/meta/recipes-qt/qt-apps/quicky_0.4.bb b/meta/recipes-qt/qt-apps/quicky_0.4.bb
index bcaa562..53e09bd 100644
--- a/meta/recipes-qt/qt-apps/quicky_0.4.bb
+++ b/meta/recipes-qt/qt-apps/quicky_0.4.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://qt-apps.org/CONTENT/content-files/80325-quicky-0.4.tar.gz"
 SRC_URI[md5sum] = "824d9e477ee9c4994f73a3cb215161d9"
 SRC_URI[sha256sum] = "9c66376e0035d44547612bf629890769a6178c3e7eafbcf95f1c6207ac0f352a"
 
+REGEX_URI = "http://qt-apps.org/content/download.php?content=80325&id=1&tan=10417482"
+
 inherit qt4x11
 
 do_install() {
diff --git a/meta/recipes-support/libevent/libevent_2.0.22.bb b/meta/recipes-support/libevent/libevent_2.0.22.bb
index 58c263c..5709664 100644
--- a/meta/recipes-support/libevent/libevent_2.0.22.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.22.bb
@@ -14,6 +14,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "c4c56f986aa985677ca1db89630a2e11"
 SRC_URI[sha256sum] = "71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3"
 
+REGEX_URI = "http://libevent.org/"
+
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
 PACKAGECONFIG ??= ""
diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.0.bb
index be6b635..85b403d 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.0.bb
@@ -10,4 +10,6 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
 SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
 
+REGEX_URI = "https://github.com/libical/libical/releases/"
+
 inherit autotools
diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
index f3e5a18..85e0b6e 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
 SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
 
+REGEX_URI = "http://www.multiprecision.org/index.php?prog=mpc&page=download"
+
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 87fabec..3a07086 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -15,6 +15,9 @@ SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
 SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
+
+REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.3.bb b/meta/recipes-support/mpfr/mpfr_3.1.3.bb
index af19b54..c777630 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.3.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.3.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
 SRC_URI[md5sum] = "6969398cd2fbc56a6af570b5273c56a9"
 SRC_URI[sha256sum] = "6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16"
 
+REGEX_URI = "http://www.mpfr.org/mpfr-current/"
+
 S = "${WORKDIR}/mpfr-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
index fafff6d..444509c 100644
--- a/meta/recipes-support/nettle/nettle.inc
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -16,6 +16,8 @@ SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
 SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
 SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
 
+REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
+
 EXTRA_OECONF = "--disable-openssl"
 
 inherit autotools ptest
diff --git a/meta/recipes-support/nss/nss_3.19.2.bb b/meta/recipes-support/nss/nss_3.19.2.bb
index 23a4a1f..fff6e96 100644
--- a/meta/recipes-support/nss/nss_3.19.2.bb
+++ b/meta/recipes-support/nss/nss_3.19.2.bb
@@ -27,6 +27,9 @@ SRC_URI = "\
 SRC_URI[md5sum] = "b02ffd1e8e8ef5f8512fa02d8ca9db3d"
 SRC_URI[sha256sum] = "1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae"
 
+REGEX_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
+REGEX = "NSS_(?P<pver>.+)_release_notes"
+
 inherit siteinfo
 
 DEPENDS = "sqlite3 nspr zlib nss-native"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.0.bb b/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
index 50531ba..39f3e6c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
@@ -15,6 +15,9 @@ SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[md5sum] = "cd0f883b2ddfc29e8e1bbbbd8e85f555"
 SRC_URI[sha256sum] = "a324143f4cc35cd7e9605a0a8dec9f9e4861d0be8305f3642e7d05008b77e60d"
 
+REGEX_URI = "http://www.sqlite.org/"
+REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
+
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
 # Provide column meta-data API
diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.9.1.bb
index 1f27814..fa56567 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
 SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"
 
+REGEX_URI = "http://github.com/taglib/taglib/releases/"
+
 BINCONFIG = "${bindir}/taglib-config"
 
 inherit cmake pkgconfig binconfig-disabled
-- 
2.6.2


