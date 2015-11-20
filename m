Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A68AB6212E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904326"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:54 +0200
Message-Id: <499324d6f57272cb6a7d96b36e9ba4b2ac5599ce.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 9/9] bitbake: rename REGEX and REGEX_URI to UPSTREAM_CHECK_REGEX and UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:26 -0000

So that it's more clean in the context of recipes what these variables are for.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 bitbake/lib/bb/fetch2/wget.py                                       | 4 ++--
 bitbake/lib/bb/tests/fetch.py                                       | 6 +++---
 meta/classes/upstream-version-is-even.bbclass                       | 2 +-
 meta/conf/distro/include/package_regex.inc                          | 6 +++---
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb                              | 2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb                             | 2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                             | 2 +-
 meta/recipes-connectivity/dhcp/dhcp.inc                             | 4 ++--
 meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb             | 2 +-
 meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb             | 2 +-
 meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb  | 4 ++--
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb                 | 2 +-
 meta/recipes-core/console-tools/console-tools_0.3.2.bb              | 4 ++--
 meta/recipes-core/libcgroup/libcgroup_0.41.bb                       | 2 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb                    | 4 ++--
 meta/recipes-devtools/apt/apt.inc                                   | 2 +-
 meta/recipes-devtools/autogen/autogen-native_5.18.5.bb              | 4 ++--
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb           | 2 +-
 meta/recipes-devtools/chrpath/chrpath_0.16.bb                       | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                               | 2 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb                        | 4 ++--
 .../docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb             | 4 ++--
 .../docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb             | 4 ++--
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb | 4 ++--
 meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb               | 2 +-
 meta/recipes-devtools/expect/expect_5.45.bb                         | 4 ++--
 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb                       | 4 ++--
 meta/recipes-devtools/gcc/gcc-4.9.inc                               | 2 +-
 meta/recipes-devtools/intltool/intltool.inc                         | 2 +-
 meta/recipes-devtools/json-c/json-c_0.12.bb                         | 4 ++--
 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb             | 2 +-
 meta/recipes-devtools/python/python-async_0.6.2.bb                  | 2 +-
 meta/recipes-devtools/python/python-git_1.0.1.bb                    | 4 ++--
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb                  | 2 +-
 meta/recipes-devtools/python/python-mako_1.0.1.bb                   | 4 ++--
 meta/recipes-devtools/python/python-nose_1.3.6.bb                   | 4 ++--
 meta/recipes-devtools/python/python-pexpect_3.3.bb                  | 2 +-
 meta/recipes-devtools/python/python-scons_2.3.6.bb                  | 4 ++--
 meta/recipes-devtools/python/python-smmap_0.9.0.bb                  | 4 ++--
 meta/recipes-devtools/python/python.inc                             | 2 +-
 meta/recipes-devtools/python/python3-native_3.4.3.bb                | 2 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb                   | 2 +-
 meta/recipes-devtools/python/python3-setuptools_18.2.bb             | 2 +-
 meta/recipes-devtools/python/python3_3.4.3.bb                       | 2 +-
 meta/recipes-devtools/rpm/rpm_5.4.14.bb                             | 2 +-
 meta/recipes-extended/blktool/blktool_4-7.bb                        | 2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb                          | 2 +-
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb                    | 4 ++--
 meta/recipes-extended/cups/cups.inc                                 | 4 ++--
 meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb           | 2 +-
 meta/recipes-extended/iputils/iputils_s20121221.bb                  | 2 +-
 meta/recipes-extended/less/less_479.bb                              | 2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb                                | 4 ++--
 meta/recipes-extended/lsof/lsof_4.89.bb                             | 2 +-
 meta/recipes-extended/mailx/mailx_12.5-5.bb                         | 2 +-
 meta/recipes-extended/minicom/minicom_2.7.bb                        | 2 +-
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb                | 4 ++--
 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb                       | 2 +-
 meta/recipes-extended/quota/quota_4.02.bb                           | 4 ++--
 meta/recipes-extended/sysstat/sysstat.inc                           | 2 +-
 meta/recipes-extended/unzip/unzip_6.0.bb                            | 2 +-
 meta/recipes-extended/watchdog/watchdog_5.14.bb                     | 4 ++--
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb              | 2 +-
 meta/recipes-extended/zip/zip_3.0.bb                                | 2 +-
 meta/recipes-gnome/gtk+/gtk+.inc                                    | 2 +-
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb                | 2 +-
 meta/recipes-graphics/cairo/cairo_1.14.4.bb                         | 2 +-
 meta/recipes-graphics/glew/glew_1.12.0.bb                           | 4 ++--
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb                       | 2 +-
 meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb                | 2 +-
 meta/recipes-graphics/tslib/tslib_1.1.bb                            | 2 +-
 meta/recipes-graphics/waffle/waffle_1.5.1.bb                        | 2 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                       | 4 ++--
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb                | 2 +-
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb                         | 2 +-
 meta/recipes-kernel/powertop/powertop_2.7.bb                        | 2 +-
 meta/recipes-lsb4/libpng/libpng12_1.2.53.bb                         | 4 ++--
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb                      | 2 +-
 meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb       | 2 +-
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb                | 2 +-
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb                       | 2 +-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb                  | 2 +-
 meta/recipes-multimedia/webp/libwebp_0.4.3.bb                       | 2 +-
 meta/recipes-qt/qt-apps/quicky_0.4.bb                               | 2 +-
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc                         | 4 ++--
 meta/recipes-qt/qt4/qt4-4.8.7.inc                                   | 4 ++--
 meta/recipes-qt/qt4/qt4-native.inc                                  | 4 ++--
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb                          | 2 +-
 meta/recipes-support/db/db_6.0.30.bb                                | 4 ++--
 meta/recipes-support/libevent/libevent_2.0.22.bb                    | 2 +-
 meta/recipes-support/libical/libical_1.0.0.bb                       | 2 +-
 meta/recipes-support/libmpc/libmpc_1.0.3.bb                         | 2 +-
 meta/recipes-support/libpcre/libpcre_8.37.bb                        | 4 ++--
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb                  | 4 ++--
 meta/recipes-support/libxslt/libxslt_1.1.28.bb                      | 2 +-
 meta/recipes-support/mpfr/mpfr_3.1.3.bb                             | 2 +-
 meta/recipes-support/nettle/nettle.inc                              | 2 +-
 meta/recipes-support/nss/nss_3.19.2.bb                              | 4 ++--
 meta/recipes-support/sqlite/sqlite3_3.9.0.bb                        | 4 ++--
 meta/recipes-support/taglib/taglib_1.9.1.bb                         | 2 +-
 100 files changed, 139 insertions(+), 139 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index bd2a897..3a1372d 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -480,7 +480,7 @@ class Wget(FetchMethod):
         self.suffix_regex_comp = re.compile(psuffix_regex)
 
         # compile regex, can be specific by package or generic regex
-        pn_regex = d.getVar('REGEX', True)
+        pn_regex = d.getVar('UPSTREAM_CHECK_REGEX', True)
         if pn_regex:
             package_custom_regex_comp = re.compile(pn_regex)
         else:
@@ -516,7 +516,7 @@ class Wget(FetchMethod):
         bb.debug(3, "latest_versionstring, regex: %s" % (package_regex.pattern))
 
         uri = ""
-        regex_uri = d.getVar("REGEX_URI", True)
+        regex_uri = d.getVar("UPSTREAM_CHECK_URI", True)
         if not regex_uri:
             path = ud.path.split(package)[0]
 
diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index 94173c1..e87b97a 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -692,7 +692,7 @@ class FetchLatestVersionTest(FetcherTest):
             : "5.0",
         ("xserver-xorg", "http://xorg.freedesktop.org/releases/individual/xserver/xorg-server-1.15.1.tar.bz2", "", "")
             : "1.15.1",
-        # packages with valid REGEX_URI and REGEX
+        # packages with valid UPSTREAM_CHECK_URI and UPSTREM_CHECK_REGEX
         ("cups", "http://www.cups.org/software/1.7.2/cups-1.7.2-source.tar.bz2", "http://www.cups.org/software.php", "(?P<name>cups\-)(?P<pver>((\d+[\.\-_]*)+))\-source\.tar\.gz")
             : "2.0.0",
         ("db", "http://download.oracle.com/berkeley-db/db-5.3.21.tar.gz", "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html", "http://download.oracle.com/otn/berkeley-db/(?P<name>db-)(?P<pver>((\d+[\.\-_]*)+))\.tar\.gz")
@@ -715,8 +715,8 @@ class FetchLatestVersionTest(FetcherTest):
         def test_wget_latest_versionstring(self):
             for k, v in self.test_wget_uris.items():
                 self.d.setVar("PN", k[0])
-                self.d.setVar("REGEX_URI", k[2])
-                self.d.setVar("REGEX", k[3])
+                self.d.setVar("UPSTREAM_CHECK_URI", k[2])
+                self.d.setVar("UPSTREAM_CHECK_REGEX", k[3])
                 ud = bb.fetch2.FetchData(k[1], self.d)
                 pupver = ud.method.latest_versionstring(ud, self.d)
                 verstring = pupver[0]
diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index 21d844e..8188c91 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -2,4 +2,4 @@
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
 # This scheme is used by Gnome and a number of other projects
 # to signify stable releases vs development releases.
-REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index e08082a..a7117be 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -9,12 +9,12 @@
 #"
 # The format is as a bitbake variable override for each recipe
 #"
-#       REGEX_URI_pn-<recipe name> = "recipe_url"
+#       UPSTREAM_CHECK_URI_pn-<recipe name> = "recipe_url"
 #	 - This is the url used by the package checking system to
 #	   get the latest version of the package
-#       REGEX_pn-<recipe name> = "package_regex"
+#       UPSTREAM_CHECK_REGEX_pn-<recipe name> = "package_regex"
 #	 - This is the regex the package checking system uses to
-#	   parse the page found at REGEX_URI_pn-<recipe name>
+#	   parse the page found at UPSTREAM_CHECK_URI_pn-<recipe name>
 #	GITTAGREGEX_pn-<recipe name> = "git_tag_regex"
 #	 - When source code is fetched from git, git tags are used to
 #	   determine the upstream release version. This regex can be used
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 511d209..9492c69 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -24,7 +24,7 @@ SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
-REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
 
 S = "${WORKDIR}/apmd-3.2.2.orig"
 
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 692d295..3dd9ab6 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
 
-REGEX_URI = "http://www.ngolde.de/libacpi.html"
+UPSTREAM_CHECK_URI = "http://www.ngolde.de/libacpi.html"
 
 inherit lib_package
 
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index df55142..4b349be 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-REGEX_URI = "http://ohse.de/uwe/software/lrzsz.html"
+UPSTREAM_CHECK_URI = "http://ohse.de/uwe/software/lrzsz.html"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 96cf108..a673dbc 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -20,8 +20,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://dhcpd.service file://dhcrelay.service \
            file://dhcpd6.service "
 
-REGEX_URI = "ftp://ftp.isc.org/isc/dhcp/"
-REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
+UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
 inherit autotools systemd
 
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index 2884e48..2565771 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${P
 SRC_URI[md5sum] = "2ac4893c92716add1a1447ae01df77ab"
 SRC_URI[sha256sum] = "656d245d84400e1030f8f40a5a27da76370690c4a932baf249110f047fe7efcf"
 
-REGEX_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/"
+UPSTREAM_CHECK_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/"
 
 inherit autotools
 
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
index 564354f..cc37541 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "5a6e21e8ba6822a5f93075c8c8fe7977e34780ba551af51930d0b31fdd
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-REGEX_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
 inherit allarch
 
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
index c9d69a6..d6ec0ce 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.$
 SRC_URI[md5sum] = "ca91ba7c7eff9bfff6926b1a34a4697d"
 SRC_URI[sha256sum] = "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
 
-REGEX_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
-REGEX = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
+UPSTREAM_CHECK_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
+UPSTREAM_CHECK_REGEX = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
 
 S = "${WORKDIR}/wireless_tools.30"
 
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 26495ba..a770168 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc5598
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-REGEX_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
 
 inherit autotools
 
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 6f99030..7e14b31 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -20,8 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
 SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
 SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1c126c2"
 
-REGEX_URI = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
-REGEX = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
+UPSTREAM_CHECK_REGEX = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
 
 do_configure_prepend () {
 	mkdir -p ${S}/m4
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 590c3cf..1bbeb4a 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2
 SRC_URI[md5sum] = "3dea9d50b8a5b73ff0bf1cdcb210f63f"
 SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51"
 
-REGEX_URI = "http://sourceforge.net/projects/libcg/files/libcgroup/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libcg/files/libcgroup/"
 
 EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index a4562d1..f9f067d 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "14e7dcd0436d2f49aa403f67e1ef7ddc"
 SRC_URI[sha256sum] = "e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a"
 
-REGEX_URI = "http://sourceforge.net/projects/linux-diag/files/sysfsutils/"
-REGEX = "/sysfsutils/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linux-diag/files/sysfsutils/"
+UPSTREAM_CHECK_REGEX = "/sysfsutils/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/sysfsutils-${PV}"
 
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 0bec5b4..8e267c3 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-REGEX_URI = "${DEBIAN_MIRROR}/main/a/apt/"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
index b27ac95..373dd89 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.5.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
 SRC_URI[md5sum] = "385d7c7dfbe60babbee261c054923a53"
 SRC_URI[sha256sum] = "7bbdb73b5518baf64c6d3739fb2ecc66d2cccda888ce5ad573abe235ab5d96ba"
 
-REGEX_URI = "http://ftp.gnu.org/gnu/autogen/"
-REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
+UPSTREAM_CHECK_URI = "http://ftp.gnu.org/gnu/autogen/"
+UPSTREAM_CHECK_REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
index c22d6c6..d7ad253 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
 SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
 SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
 
-REGEX_URI = "http://sourceforge.net/projects/cdrtools/files/alpha/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cdrtools/files/alpha/"
 
 S = "${WORKDIR}/cdrtools-3.01"
 
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index 9a55cb0..e115eb5 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
 SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
 
-REGEX_URI = "http://alioth.debian.org/frs/?group_id=31052"
+UPSTREAM_CHECK_URI = "http://alioth.debian.org/frs/?group_id=31052"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index c28fcd1..a14ce35 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 SRC_URI[md5sum] = "5febbd11bcaac854a27eebaf4a124be2"
 SRC_URI[sha256sum] = "e75a178d6ebf182b048ebfe6e0657c49f0dc109779170bad7ffcb17463f2fc22"
 
-REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index 3af05dd..b7791f3 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -13,8 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-dsssl-${PV}.tar.bz2"
 SRC_URI[md5sum] = "bc192d23266b9a664ca0aba4a7794c7c"
 SRC_URI[sha256sum] = "2f329e120bee9ef42fbdd74ddd60e05e49786c5a7953a0ff4c680ae6bdf0e2bc"
 
-REGEX_URI = "http://sourceforge.net/projects/docbook/files/docbook-dsssl/"
-REGEX = "/docbook-dsssl/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-dsssl/"
+UPSTREAM_CHECK_REGEX = "/docbook-dsssl/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/docbook-dsssl-${PV}"
 
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
index 83d60a0..a3ee5d8 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.docbook.org/sgml/3.1/docbk31.zip \
 SRC_URI[md5sum] = "432749c0c806dbae81c8bcb70da3b5d3"
 SRC_URI[sha256sum] = "20261d2771b9a052abfa3d8fab1aa62be05791a010281c566f9073bf0e644538"
 
-REGEX_URI = "http://www.docbook.org/sgml/"
-REGEX = "(?P<pver>3\..+)/"
+UPSTREAM_CHECK_URI = "http://www.docbook.org/sgml/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>3\..+)/"
 
 do_compile() {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd-3.html
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
index 77938e1..be59680 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://docbook.org/sgml/4.1/docbk41.zip \
 SRC_URI[md5sum] = "489f6ff2a2173eb1e14216c10533ede2"
 SRC_URI[sha256sum] = "deaafcf0a3677692e7ad4412c0e41c1db3e9da6cdcdb3dd32b2cc1f9c97d6311"
 
-REGEX_URI = "http://www.docbook.org/sgml/"
-REGEX = "(?P<pver>4\.1(\.\d+)*)/"
+UPSTREAM_CHECK_URI = "http://www.docbook.org/sgml/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>4\.1(\.\d+)*)/"
 
 do_compile() {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 2b88bd5..878e7cf 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "6dd0f89131cc35bf4f2ed105a1c17771"
 SRC_URI[sha256sum] = "c98f7296ab5c8ccd2e0bc07634976a37f50847df2d8a59bdb1e157664700b467"
 
-REGEX_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
-REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
+UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/docbook-xsl-${PV}"
 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
index 8845d8a..addcbf6 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/do
 SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
 SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
 
-REGEX_URI = "https://github.com/dosfstools/dosfstools/releases"
+UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
 FILES_${PN} = "${base_sbindir}"
 FILES_${PN}-doc = "${mandir} ${docdir}"
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 6d314f6..43f16e4 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -29,8 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
 SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
 SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
 
-REGEX_URI = "http://sourceforge.net/projects/expect/files/Expect/"
-REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/expect/files/Expect/"
+UPSTREAM_CHECK_REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/${BPN}${PV}"
 
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
index c08767e..2dd3b5b 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "2061f917af084215898d4fea04d8388f"
 SRC_URI[sha256sum] = "5b66956743a799fc0471cdb032665c1391e82f9c5b3f1d7d726d29fe2ba01d6c"
 
-REGEX_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
-REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
+UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
 
 do_install() {
     install -d ${D}${sbindir}
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 0a35d49..d393a4a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -85,7 +85,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
 
-REGEX = "gcc-(?P<pver>4\.9\.\d+).tar"
+UPSTREAM_CHECK_REGEX = "gcc-(?P<pver>4\.9\.\d+).tar"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index b434677..eb7ae00 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 URLV="${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 
-REGEX_URI = "https://launchpad.net/intltool/trunk/"
+UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
 
 S = "${WORKDIR}/intltool-${PV}"
 
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index ff97a29..b56b37e 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -11,10 +11,10 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
 SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
 SRC_URI[sha256sum] = "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f"
 
-REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
+UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
 # json-c releases page is fetching the list of releases in some weird XML format
 # from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
-#REGEX_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
+#UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
 
 RPROVIDES_${PN} = "libjson"
 
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 2d67cf3..f588fd3 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
 
-REGEX_URI = "http://openjade.sourceforge.net/download.html"
+UPSTREAM_CHECK_URI = "http://openjade.sourceforge.net/download.html"
 
 inherit autotools-brokensep native
 
diff --git a/meta/recipes-devtools/python/python-async_0.6.2.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
index 0da6be6..ad0a617 100644
--- a/meta/recipes-devtools/python/python-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python-async_0.6.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
-REGEX_URI = "https://pypi.python.org/pypi/async/"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
 
 S = "${WORKDIR}/async-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-git_1.0.1.bb b/meta/recipes-devtools/python/python-git_1.0.1.bb
index 6a6f15b..247372f 100644
--- a/meta/recipes-devtools/python/python-git_1.0.1.bb
+++ b/meta/recipes-devtools/python/python-git_1.0.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.ta
 SRC_URI[md5sum] = "4659644b42c41e5e5170c0cd83ed6422"
 SRC_URI[sha256sum] = "9c88c17bbcae2a445ff64024ef13526224f70e35e38c33416be5ceb56ca7f760"
 
-REGEX_URI = "https://pypi.python.org/pypi/GitPython/"
-REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
+UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
 
 S = "${WORKDIR}/GitPython-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
index 20b8b06..c82df1e 100644
--- a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
 SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
 SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
 
-REGEX_URI = "https://pypi.python.org/pypi/gitdb/"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
 
 S = "${WORKDIR}/gitdb-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-mako_1.0.1.bb b/meta/recipes-devtools/python/python-mako_1.0.1.bb
index 2c2b45e..647c2d1 100644
--- a/meta/recipes-devtools/python/python-mako_1.0.1.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.1.bb
@@ -8,8 +8,8 @@ SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
 SRC_URI[md5sum] = "9f0aafd177b039ef67b90ea350497a54"
 SRC_URI[sha256sum] = "45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c"
 
-REGEX_URI = "https://pypi.python.org/pypi/mako/"
-REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
+UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
 
 S = "${WORKDIR}/Mako-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb b/meta/recipes-devtools/python/python-nose_1.3.6.bb
index 54811fc..d9daea2 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.6.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.6.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
 SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
 SRC_URI[sha256sum] = "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
 
-REGEX_URI = "https://pypi.python.org/pypi/nose/"
-REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/nose/"
+UPSTREAM_CHECK_REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
 
 S = "${WORKDIR}/nose-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-pexpect_3.3.bb b/meta/recipes-devtools/python/python-pexpect_3.3.bb
index 6ff6b3e..5318405 100644
--- a/meta/recipes-devtools/python/python-pexpect_3.3.bb
+++ b/meta/recipes-devtools/python/python-pexpect_3.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.g
 SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
 SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
 
-REGEX_URI = "https://pypi.python.org/pypi/pexpect"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
 S = "${WORKDIR}/pexpect-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-scons_2.3.6.bb b/meta/recipes-devtools/python/python-scons_2.3.6.bb
index d231d20..cb90294 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.6.bb
+++ b/meta/recipes-devtools/python/python-scons_2.3.6.bb
@@ -9,8 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 SRC_URI[md5sum] = "9c6a1c3c716cbe5f16515f163c91d928"
 SRC_URI[sha256sum] = "98adaa351d8f4e4068a5bf1894bdd7f85b390c8c3f80d437cf8bb266012404df"
 
-REGEX_URI = "http://sourceforge.net/projects/scons/files/scons/"
-REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/scons/files/scons/"
+UPSTREAM_CHECK_REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/meta/recipes-devtools/python/python-smmap_0.9.0.bb b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
index 72a2851..5f9cf45 100644
--- a/meta/recipes-devtools/python/python-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
 SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
 SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
 
-REGEX_URI = "https://pypi.python.org/pypi/smmap/"
-REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/smmap/"
+UPSTREAM_CHECK_REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
 
 S = "${WORKDIR}/smmap-${PV}"
 
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index eafedb6..878f582 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
-REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
+UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
 
 PYTHON_MAJMIN = "2.7"
 
diff --git a/meta/recipes-devtools/python/python3-native_3.4.3.bb b/meta/recipes-devtools/python/python3-native_3.4.3.bb
index 5f2ff77..e0048dc 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.3.bb
@@ -33,7 +33,7 @@ SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043e
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
 # exclude pre-releases for both python 2.x and 3.x
-REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
+UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3-pip_6.1.1.bb b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
index 45b3145..8f9a692 100644
--- a/meta/recipes-devtools/python/python3-pip_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "6b19e0a934d982a5a4b798e957cb6d45"
 SRC_URI[sha256sum] = "89f3b626d225e08e7f20d85044afa40f612eb3284484169813dc2d0631f2a556"
 
-REGEX_URI = "https://pypi.python.org/pypi/pip"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pip"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_18.2.bb b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
index 94144b5..5687e30 100644
--- a/meta/recipes-devtools/python/python3-setuptools_18.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "52b4e48939ef311d7204f8fe940764f4"
 SRC_URI[sha256sum] = "0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
 
-REGEX_URI = "https://pypi.python.org/pypi/setuptools"
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index cae2f13..d5d4bb5 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -42,7 +42,7 @@ SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
 SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
 
 # exclude pre-releases for both python 2.x and 3.x
-REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
+UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 7b7a97b..78fe534 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -111,7 +111,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 SRC_URI[md5sum] = "25093d399a0b5d1342d24900a91b347d"
 SRC_URI[sha256sum] = "676e3ab41f72e3b504e04109cfb565a300742f56a7da084f202013b30eeae467"
 
-REGEX = "rpm-(?P<pver>(\d+[\.\-_]*)+)-.*$"
+UPSTREAM_CHECK_REGEX = "rpm-(?P<pver>(\d+[\.\-_]*)+)-.*$"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.bb
index 751a3ce..d6250a9 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.bb
@@ -20,7 +20,7 @@ SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e0680
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
-REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
 
 S = "${WORKDIR}/${BPN}-4.orig"
 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 909f259..f717d85 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
 
-REGEX_URI = "http://www.bzip.org/downloads.html"
+UPSTREAM_CHECK_URI = "http://www.bzip.org/downloads.html"
 
 PACKAGES =+ "libbz2"
 
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index e99cecd..7bfb869 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
 SRC_URI[md5sum] = "376790a95c1fb645e59e6e9803c78582"
 SRC_URI[sha256sum] = "59ab0138bc8cf90cccb8509b6969a024d5e58d2d02bcbdccbb9ba9b88be3fa33"
 
-REGEX_URI = "http://sourceforge.net/projects/cracklib/files/cracklib/"
-REGEX = "/cracklib/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cracklib/files/cracklib/"
+UPSTREAM_CHECK_REGEX = "/cracklib/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools gettext pythonnative python-dir
 
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2209483..13234fc 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -12,8 +12,8 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://cups.service \
 	  "
 
-REGEX_URI = "http://www.cups.org/software.php"
-REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
+UPSTREAM_CHECK_URI = "http://www.cups.org/software.php"
+UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
 LEAD_SONAME = "libcupsdriver.so"
 
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 38d9e18..0cffedd 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
 SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
 SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
-REGEX = "foomatic-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
+UPSTREAM_CHECK_REGEX = "foomatic-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-extended/iputils/iputils_s20121221.bb b/meta/recipes-extended/iputils/iputils_s20121221.bb
index edd0323..49913d6 100644
--- a/meta/recipes-extended/iputils/iputils_s20121221.bb
+++ b/meta/recipes-extended/iputils/iputils_s20121221.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "6072aef64205720dd1893b375e184171"
 SRC_URI[sha256sum] = "450f549fc5b620c23c5929aa6d54b7ddfc7ee1cb1e8efdc5e8bb21d8d0c5319f"
 
-REGEX = "iputils-(?P<pver>s\d+).tar"
+UPSTREAM_CHECK_REGEX = "iputils-(?P<pver>s\d+).tar"
 
 do_compile () {
 	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all man
diff --git a/meta/recipes-extended/less/less_479.bb b/meta/recipes-extended/less/less_479.bb
index f9bb7c6..c1858f02 100644
--- a/meta/recipes-extended/less/less_479.bb
+++ b/meta/recipes-extended/less/less_479.bb
@@ -30,7 +30,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "049f51ccfe2686009c6ce943eeb4bbaf"
 SRC_URI[sha256sum] = "5bf06cb30ee2a2bd1f79f39aa91e46444e7cb19b48c95c4992fa63cfe4527a80"
 
-REGEX_URI  = "http://www.greenwoodsoftware.com/less/download.html"
+UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
 inherit autotools update-alternatives
 
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index b898428..06b9f90 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
 
-REGEX_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
-REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
+UPSTREAM_CHECK_REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/lsb-release-1.4"
 
diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index acee2b0..5cce0ef 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -9,7 +9,7 @@ SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
 SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
 
-REGEX_URI = "ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
+UPSTREAM_CHECK_URI = "ftp://sunsite.ualberta.ca/pub/Mirror/lsof/"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
diff --git a/meta/recipes-extended/mailx/mailx_12.5-5.bb b/meta/recipes-extended/mailx/mailx_12.5-5.bb
index 49aa3a7..5cfb3bf 100644
--- a/meta/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5-5.bb
@@ -28,7 +28,7 @@ SRC_URI[archive.sha256sum] = "015ba4209135867f37a0245d22235a392b8bbed956913286b8
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
-REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
 
 S = "${WORKDIR}/heirloom-mailx-12.5"
 
diff --git a/meta/recipes-extended/minicom/minicom_2.7.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
index 5191414..3118686 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
 SRC_URI[md5sum] = "7044ca3e291268c33294f171d426dc2d"
 SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4"
 
-REGEX_URI = "https://alioth.debian.org/frs/?group_id=30018"
+UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 7f0c72b..923d048 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/
 
 # for this package we're mostly interested in tracking debian patches,
 # and not in the upstream version where all development has effectively stopped
-REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
 
 S = "${WORKDIR}/net-tools-1.60"
 
@@ -27,7 +27,7 @@ SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e4
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-REGEX_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
 
 inherit gettext
 
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
index 5b32c19..b3f2920 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
 SRC_URI[md5sum] = "91a4911b13305850423840eb0fa6f4f9"
 SRC_URI[sha256sum] = "573bb358a5a7d3bf5f42f881af324cedf960c786e8d66dd03d448ddd8a0166ee"
 
-REGEX_URI = "http://compression.ca/pbzip2/"
+UPSTREAM_CHECK_URI = "http://compression.ca/pbzip2/"
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-extended/quota/quota_4.02.bb b/meta/recipes-extended/quota/quota_4.02.bb
index 23f728f..319a088 100644
--- a/meta/recipes-extended/quota/quota_4.02.bb
+++ b/meta/recipes-extended/quota/quota_4.02.bb
@@ -17,8 +17,8 @@ SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 SRC_URI[md5sum] = "a8a5df262261e659716ccad2a5d6df0d"
 SRC_URI[sha256sum] = "f4c2f48abf94bbdc396df33d276f2e9d19af58c232cb85eef9c174a747c33795"
 
-REGEX_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
-REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
+UPSTREAM_CHECK_REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/quota-tools"
 
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 104af58..85be902 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -9,7 +9,7 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://sysstat.service \
           "
 
-REGEX_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
 
 DEPENDS += "base-passwd"
 
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index cb9636d..7705794 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -22,7 +22,7 @@ SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
 # exclude version 5.5.2 which triggers a false positive
-REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
+UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
 S = "${WORKDIR}/unzip60"
 
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index 41b2ec0..9cb89d5 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
 SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
 SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
 
-REGEX_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
-REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
+UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools
 inherit update-rc.d
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index 2d8e0eb..f86b51f 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
 SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
 
-REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
+UPSTREAM_CHECK_REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
 
 inherit autotools-brokensep distro_features_check
 
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 21f6eaa..383da4b 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -9,7 +9,7 @@ SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
 # exclude version 2.3.2 which triggers a false positive
-REGEX = "^zip(?P<pver>(?!232).+)\.tgz"
+UPSTREAM_CHECK_REGEX = "^zip(?P<pver>(?!232).+)\.tgz"
 
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 35aa10f..0f41306 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -15,7 +15,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 # This picks stable releases in the 2.x series (but not 2.90 onwards,
 # which were GNOME 3 betas).
-REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
 
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 8c265da..aaf8cab 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -39,7 +39,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 # This picks stable releases in the 2.x series (but not 2.90 onwards,
 # which were GNOME 3 betas).
-REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
 
 python populate_packages_prepend() {
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.4.bb b/meta/recipes-graphics/cairo/cairo_1.14.4.bb
index e7b7ecd..a47bfa5 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.4.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.4.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 SRC_URI[md5sum] = "90a929e8fe66fb5d19b5adaaea1e9a12"
 SRC_URI[sha256sum] = "f6ec9c7c844db9ec011f0d66b57ef590c45adf55393d1fc249003512522ee716"
 
-REGEX = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
diff --git a/meta/recipes-graphics/glew/glew_1.12.0.bb b/meta/recipes-graphics/glew/glew_1.12.0.bb
index 712d4de..ef416ec 100644
--- a/meta/recipes-graphics/glew/glew_1.12.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.12.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
 SRC_URI[md5sum] = "01246c7ecd135d99be031aa63f86dca1"
 SRC_URI[sha256sum] = "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf"
 
-REGEX_URI = "http://sourceforge.net/projects/glew/files/glew"
-REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
+UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools lib_package pkgconfig distro_features_check
 # depends on virtual/libx11
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 6a92a3d..5170b7d 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://pkgconfig.patch \
           "
 
-REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
 
 S = "${WORKDIR}/SDL-${PV}"
 
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
index c6fd301..5d46e89 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
@@ -13,6 +13,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
 SRC_URI[md5sum] = "4a8e6c1a86d5e64ec725d850a4abfbad"
 SRC_URI[sha256sum] = "ff7df437bbfd3119c5f662c6d209b98f15de03a7203308c6b56a4c1e1d419aaf"
 
-REGEX_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
 
 inherit autotools gettext pkgconfig gtk-doc
diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
index 3d694e7..8e304a6 100644
--- a/meta/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.
 SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
 SRC_URI[sha256sum] = "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c"
 
-REGEX_URI = "https://github.com/kergoth/tslib/releases"
+UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-graphics/waffle/waffle_1.5.1.bb b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
index f83e988..6e77948 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "c0d802bc3d0aba87c51e423a3a8bdd69"
 SRC_URI[sha256sum] = "cbab0e926515064e818bf089a5af04be33307e5f40d07659fb40d59b2bfe20aa"
 
-REGEX_URI = "http://www.waffle-gl.org/releases.html"
+UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
 inherit cmake distro_features_check lib_package
 
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 24a5a95..b505eee 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
 SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
 SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
 
-REGEX_URI = "http://sourceforge.net/projects/libvncserver/files/x11vnc/"
-REGEX = "/x11vnc/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libvncserver/files/x11vnc/"
+UPSTREAM_CHECK_REGEX = "/x11vnc/(?P<pver>(\d+[\.\-_]*)+)/"
 
 DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
index 4a99792..de22a81 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "2e1faeafcc609c30af3a561a91e84158"
 SRC_URI[sha256sum] = "90bd7824742b9a6f52a6cf80e2cadd6f5349cf600a358d08260772615b89d19c"
 
-REGEX_URI = "http://xkbcommon.org/"
+UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
index 07b8cb0..0b024ad 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}
 SRC_URI[md5sum] = "5077b9022440e4951d96f2d0e73bd487"
 SRC_URI[sha256sum] = "5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f"
 
-REGEX_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 
 EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
 EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
diff --git a/meta/recipes-kernel/powertop/powertop_2.7.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
index 0671c3e..e2d0ae5 100644
--- a/meta/recipes-kernel/powertop/powertop_2.7.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.t
 SRC_URI[md5sum] = "e0d686e47daaf7e9d89031f7763432ef"
 SRC_URI[sha256sum] = "8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca"
 
-REGEX_URI = "https://01.org/powertop/downloads"
+UPSTREAM_CHECK_URI = "https://01.org/powertop/downloads"
 
 inherit autotools gettext pkgconfig
 
diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
index 60c91df..4e458bf 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.
 SRC_URI[md5sum] = "7d18a74e6fd2029aee76ccd00e00a9e6"
 SRC_URI[sha256sum] = "b45e49f689e7451bd576569e6a344f7e0d11c02ecbb797f4da0e431526765c0a"
 
-REGEX_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
-REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
+UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
 
 BINCONFIG_GLOB = "${PN}-config"
 
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 0b33129..8ff8889 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
 SRC_URI[md5sum] = "caa9f5bc44232dc8aeea773fea56be80"
 SRC_URI[sha256sum] = "a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33"
 
-REGEX_URI = "http://liba52.sourceforge.net/downloads.html"
+UPSTREAM_CHECK_URI = "http://liba52.sourceforge.net/downloads.html"
 
 S = "${WORKDIR}/a52dec-${PV}"
 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
index cc7fb0c..1c37681 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
 SRC_URI[md5sum] = "1c7fb25191b4e6e3628d198a66a84f47"
 SRC_URI[sha256sum] = "93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06"
 
-REGEX_URI = "http://www.mega-nerd.com/SRC/download.html"
+UPSTREAM_CHECK_URI = "http://www.mega-nerd.com/SRC/download.html"
 
 S = "${WORKDIR}/libsamplerate-${PV}"
 
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 8566596..664d848 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "292ab65cedd5021d6b7ddd117e07cd8e"
 SRC_URI[sha256sum] = "b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
 
-REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
+UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
index 94352e0..74f0a72 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
@@ -11,7 +11,7 @@ SRC_URI[md5sum] = "9aee7107408a128c0c7b24286c0db900"
 SRC_URI[sha256sum] = "8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890"
 
 # exclude betas
-REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
+UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
 inherit autotools
 
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index b369808..1666994 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz \
 SRC_URI[md5sum] = "7631b0a4bcfdd0d78c0bb0083080b0dc"
 SRC_URI[sha256sum] = "c74a76068f8ec36d4bb59a03bf1157be44118ca02252180e8b358b0b5e3edeee"
 
-REGEX_URI = "http://libmpeg2.sourceforge.net/downloads.html"
+UPSTREAM_CHECK_URI = "http://libmpeg2.sourceforge.net/downloads.html"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb b/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
index e245e6f..1285bc1 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.4.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
 SRC_URI[md5sum] = "08813525eeeffe7e305b4cbfade8ae9b"
 SRC_URI[sha256sum] = "efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4"
 
-REGEX_URI = "http://downloads.webmproject.org/releases/webp/index.html"
+UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
 EXTRA_OECONF = " \
     --disable-experimental \
diff --git a/meta/recipes-qt/qt-apps/quicky_0.4.bb b/meta/recipes-qt/qt-apps/quicky_0.4.bb
index 53e09bd..3c7a4f0 100644
--- a/meta/recipes-qt/qt-apps/quicky_0.4.bb
+++ b/meta/recipes-qt/qt-apps/quicky_0.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://qt-apps.org/CONTENT/content-files/80325-quicky-0.4.tar.gz"
 SRC_URI[md5sum] = "824d9e477ee9c4994f73a3cb215161d9"
 SRC_URI[sha256sum] = "9c66376e0035d44547612bf629890769a6178c3e7eafbcf95f1c6207ac0f352a"
 
-REGEX_URI = "http://qt-apps.org/content/download.php?content=80325&id=1&tan=10417482"
+UPSTREAM_CHECK_URI = "http://qt-apps.org/content/download.php?content=80325&id=1&tan=10417482"
 
 inherit qt4x11
 
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 3eb4c52..54bf2a1 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -18,8 +18,8 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://g++.conf \
            file://linux.conf"
 
-REGEX_URI = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX = "(?P<pver>\d+(\.\d+)+)/"
+UPSTREAM_CHECK_URI = "http://download.qt.io/official_releases/qt/4.8/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7.inc b/meta/recipes-qt/qt4/qt4-4.8.7.inc
index 8b26456..dd1751c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.7.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
@@ -34,8 +34,8 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
 SRC_URI[md5sum] = "d990ee66bf7ab0c785589776f35ba6ad"
 SRC_URI[sha256sum] = "e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0"
 
-REGEX_URI = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX = "(?P<pver>\d+(\.\d+)+)/"
+UPSTREAM_CHECK_URI = "http://download.qt.io/official_releases/qt/4.8/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 37fb6e3..58acac8 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -20,8 +20,8 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://linux.conf \
 	"
 
-REGEX_URI = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX = "(?P<pver>\d+(\.\d+)+)/"
+UPSTREAM_CHECK_URI = "http://download.qt.io/official_releases/qt/4.8/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
index 5e34f92..c8b42ab 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 SRC_URI[md5sum] = "c993402d407b0a3fc076f842ac1bc5c9"
 SRC_URI[sha256sum] = "cfa8d82fc63be147045174bef074807e1e32ce8c6bf4dbd8fad49e260bcf6380"
 
-REGEX_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
 inherit autotools pkgconfig distro_features_check
 
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index cde590a..5d12123 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -27,8 +27,8 @@ SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
 SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
 
 # Exclude NC versions which lack AES encryption
-REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
-REGEX_URI = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
+UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
+UPSTREAM_CHECK_URI = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
 
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
 
diff --git a/meta/recipes-support/libevent/libevent_2.0.22.bb b/meta/recipes-support/libevent/libevent_2.0.22.bb
index 5709664..df8a31c 100644
--- a/meta/recipes-support/libevent/libevent_2.0.22.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.22.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "c4c56f986aa985677ca1db89630a2e11"
 SRC_URI[sha256sum] = "71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3"
 
-REGEX_URI = "http://libevent.org/"
+UPSTREAM_CHECK_URI = "http://libevent.org/"
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes-support/libical/libical_1.0.0.bb
index 85b403d..026e7f1 100644
--- a/meta/recipes-support/libical/libical_1.0.0.bb
+++ b/meta/recipes-support/libical/libical_1.0.0.bb
@@ -10,6 +10,6 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
 SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
 
-REGEX_URI = "https://github.com/libical/libical/releases/"
+UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases/"
 
 inherit autotools
diff --git a/meta/recipes-support/libmpc/libmpc_1.0.3.bb b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
index 85e0b6e..4f1f524 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.3.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
 SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
 
-REGEX_URI = "http://www.multiprecision.org/index.php?prog=mpc&page=download"
+UPSTREAM_CHECK_URI = "http://www.multiprecision.org/index.php?prog=mpc&page=download"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
index 57e04ce..3845be4 100644
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.37.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
 SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
 
-REGEX_URI = "http://sourceforge.net/projects/pcre/files/pcre/"
-REGEX = "/pcre/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcre/files/pcre/"
+UPSTREAM_CHECK_REGEX = "/pcre/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/pcre-${PV}"
 
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
index cced15e..1ddbe23 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
 SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
 
-REGEX_URI = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
-REGEX = "/libusb-compat-(?P<pver>(\d+[\.\-_]*)+)/$"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
+UPSTREAM_CHECK_REGEX = "/libusb-compat-(?P<pver>(\d+[\.\-_]*)+)/$"
 
 BINCONFIG = "${bindir}/libusb-config"
 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 3a07086..bedc03e 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -16,7 +16,7 @@ SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
 SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
 SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
 
-REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
 S = "${WORKDIR}/libxslt-${PV}"
 
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.3.bb b/meta/recipes-support/mpfr/mpfr_3.1.3.bb
index c777630..ee8a238 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.3.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
 SRC_URI[md5sum] = "6969398cd2fbc56a6af570b5273c56a9"
 SRC_URI[sha256sum] = "6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16"
 
-REGEX_URI = "http://www.mpfr.org/mpfr-current/"
+UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
 S = "${WORKDIR}/mpfr-${PV}"
 
diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
index 444509c..ba97ddb 100644
--- a/meta/recipes-support/nettle/nettle.inc
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
 SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
 SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
 
-REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
 EXTRA_OECONF = "--disable-openssl"
 
diff --git a/meta/recipes-support/nss/nss_3.19.2.bb b/meta/recipes-support/nss/nss_3.19.2.bb
index fff6e96..65f3204 100644
--- a/meta/recipes-support/nss/nss_3.19.2.bb
+++ b/meta/recipes-support/nss/nss_3.19.2.bb
@@ -27,8 +27,8 @@ SRC_URI = "\
 SRC_URI[md5sum] = "b02ffd1e8e8ef5f8512fa02d8ca9db3d"
 SRC_URI[sha256sum] = "1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae"
 
-REGEX_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
-REGEX = "NSS_(?P<pver>.+)_release_notes"
+UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
+UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
 
 inherit siteinfo
 
diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.0.bb b/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
index 39f3e6c..7fb2f2e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[md5sum] = "cd0f883b2ddfc29e8e1bbbbd8e85f555"
 SRC_URI[sha256sum] = "a324143f4cc35cd7e9605a0a8dec9f9e4861d0be8305f3642e7d05008b77e60d"
 
-REGEX_URI = "http://www.sqlite.org/"
-REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
+UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
+UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.9.1.bb
index fa56567..d125308 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
 SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"
 
-REGEX_URI = "http://github.com/taglib/taglib/releases/"
+UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
 BINCONFIG = "${bindir}/taglib-config"
 
-- 
2.6.2


