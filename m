Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54EAF62131
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:51:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Nov 2015 01:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853512464"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2015 01:51:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:52:34 +0200
Message-Id: <32c492a1c5c990fa638d3a9763b2ec4fa68f06ea.1447840091.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/8] package_regex.inc: split sourceforge related entries to their own recipes
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
X-List-Received-Date: Wed, 18 Nov 2015 09:51:58 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc         | 43 ----------------------
 .../console-tools/console-tools_0.3.2.bb           |  3 ++
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |  2 +
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |  4 ++
 .../cdrtools/cdrtools-native_3.01a31.bb            |  2 +
 .../docbook-dsssl-stylesheets-native_1.79.bb       |  3 ++
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |  3 ++
 meta/recipes-devtools/expect/expect_5.45.bb        |  3 ++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb      |  3 ++
 .../openjade/openjade-native_1.3.2.bb              |  2 +
 meta/recipes-devtools/python/python-scons_2.3.6.bb |  3 ++
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |  3 ++
 meta/recipes-extended/lsb/lsb_4.1.bb               |  4 ++
 meta/recipes-extended/quota/quota_4.02.bb          |  3 ++
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |  3 ++
 meta/recipes-graphics/glew/glew_1.12.0.bb          |  3 ++
 .../menu-cache/menu-cache_1.0.0.bb                 |  2 +
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |  3 ++
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        |  2 +
 meta/recipes-lsb4/libpng/libpng12_1.2.53.bb        |  3 ++
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |  3 ++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |  2 +
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |  2 +
 meta/recipes-support/libpcre/libpcre_8.37.bb       |  3 ++
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |  3 ++
 25 files changed, 67 insertions(+), 43 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 7888260..7db8d57 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -120,49 +120,6 @@ REGEX_pn-nativesdk-qt4-tools = "(?P<pver>\d+(\.\d+)+)/"
 REGEX_URI_pn-qt4-native = "http://download.qt.io/official_releases/qt/4.8/"
 REGEX_pn-qt4-native = "(?P<pver>\d+(\.\d+)+)/"
 
-# Sourceforge sites
-REGEX_URI_pn-python-scons = "http://sourceforge.net/projects/scons/files/scons/"
-REGEX_pn-python-scons = "/scons/${COMMON_REGEX}/"
-REGEX_URI_pn-expect = "http://sourceforge.net/projects/expect/files/Expect/"
-REGEX_pn-expect = "/Expect/${COMMON_REGEX}/"
-REGEX_URI_pn-docbook-xsl-stylesheets = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
-REGEX_pn-docbook-xsl-stylesheets = "/docbook-xsl/${COMMON_REGEX}/"
-REGEX_URI_pn-glew = "http://sourceforge.net/projects/glew/files/glew"
-REGEX_pn-glew = "/glew/${COMMON_REGEX}/"
-REGEX_URI_pn-menu-cache = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
-REGEX_URI_pn-x11vnc = "http://sourceforge.net/projects/libvncserver/files/x11vnc/"
-REGEX_pn-x11vnc = "/x11vnc/${COMMON_REGEX}/"
-REGEX_URI_pn-quota = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
-REGEX_pn-quota = "/quota-tools/${COMMON_REGEX}/"
-REGEX_URI_pn-lsb = "http://sourceforge.net/projects/lsb/files/lsb_release/"
-REGEX_pn-lsb = "/lsb_release/${COMMON_REGEX}/"
-REGEX_URI_pn-libpcre = "http://sourceforge.net/projects/pcre/files/pcre/"
-REGEX_pn-libpcre = "/pcre/${COMMON_REGEX}/"
-REGEX_URI_pn-libusb-compat = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
-REGEX_pn-libusb-compat = "/libusb-compat-${COMMON_REGEX}/$"
-REGEX_URI_pn-sysfsutils = "http://sourceforge.net/projects/linux-diag/files/sysfsutils/"
-REGEX_pn-sysfsutils = "/sysfsutils/${COMMON_REGEX}/"
-REGEX_URI_pn-console-tools = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
-REGEX_pn-console-tools = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
-REGEX_URI_pn-watchdog = "http://sourceforge.net/projects/watchdog/files/watchdog/"
-REGEX_pn-watchdog = "/watchdog/${COMMON_REGEX}/"
-REGEX_URI_pn-cracklib = "http://sourceforge.net/projects/cracklib/files/cracklib/"
-REGEX_pn-cracklib = "/cracklib/${COMMON_REGEX}/"
-REGEX_URI_pn-gptfdisk = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
-REGEX_pn-gptfdisk = "/gptfdisk/${COMMON_REGEX}/"
-REGEX_URI_pn-libpng12 = "http://sourceforge.net/projects/libpng/files/libpng12/"
-REGEX_pn-libpng12 = "/libpng12/${COMMON_REGEX}/"
-REGEX_URI_pn-docbook-dsssl-stylesheets = "http://sourceforge.net/projects/docbook/files/docbook-dsssl/"
-REGEX_pn-docbook-dsssl-stylesheets = "/docbook-dsssl/${COMMON_REGEX}/"
-
-REGEX_URI_pn-openjade = "http://openjade.sourceforge.net/download.html"
-REGEX_URI_pn-libpfm4 = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
-REGEX_URI_pn-liba52 = "http://liba52.sourceforge.net/downloads.html"
-REGEX_URI_pn-mpeg2dec = "http://libmpeg2.sourceforge.net/downloads.html"
-REGEX_URI_pn-pcmanfm = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
-REGEX_URI_pn-libcgroup = "http://sourceforge.net/projects/libcg/files/libcgroup/"
-REGEX_URI_pn-cdrtools = "http://sourceforge.net/projects/cdrtools/files/alpha/"
-
 # Keep old gcc versions at their major versions
 REGEX_pn-gcc-source-4.9.3 = "gcc-(?P<pver>4\.9\.\d+).tar"
 REGEX_pn-gcc-source-4.8.4 = "gcc-(?P<pver>4\.8\.\d+).tar"
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index a9805b3..6f99030 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -20,6 +20,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
 SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
 SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1c126c2"
 
+REGEX_URI = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
+REGEX = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
+
 do_configure_prepend () {
 	mkdir -p ${S}/m4
 	cp ${WORKDIR}/lcmessage.m4 ${S}/m4/
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 52ba1d76..590c3cf 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -15,6 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2
 SRC_URI[md5sum] = "3dea9d50b8a5b73ff0bf1cdcb210f63f"
 SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51"
 
+REGEX_URI = "http://sourceforge.net/projects/libcg/files/libcgroup/"
+
 EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
 PACKAGES =+ "cgroups-pam-plugin"
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index b9f40f4..a4562d1 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -17,6 +17,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "14e7dcd0436d2f49aa403f67e1ef7ddc"
 SRC_URI[sha256sum] = "e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a"
+
+REGEX_URI = "http://sourceforge.net/projects/linux-diag/files/sysfsutils/"
+REGEX = "/sysfsutils/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/sysfsutils-${PV}"
 
 inherit autotools
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
index d0f36e2..c22d6c6 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a31.bb
@@ -12,6 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
 SRC_URI[md5sum] = "78172557894f469b4584d008e93ec469"
 SRC_URI[sha256sum] = "183b5c12777779e78d8b69461aae52401f863768e7e7391d60730006f8cadc5a"
 
+REGEX_URI = "http://sourceforge.net/projects/cdrtools/files/alpha/"
+
 S = "${WORKDIR}/cdrtools-3.01"
 
 inherit native
diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index 461b48f..3af05dd 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -13,6 +13,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-dsssl-${PV}.tar.bz2"
 SRC_URI[md5sum] = "bc192d23266b9a664ca0aba4a7794c7c"
 SRC_URI[sha256sum] = "2f329e120bee9ef42fbdd74ddd60e05e49786c5a7953a0ff4c680ae6bdf0e2bc"
 
+REGEX_URI = "http://sourceforge.net/projects/docbook/files/docbook-dsssl/"
+REGEX = "/docbook-dsssl/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/docbook-dsssl-${PV}"
 
 inherit native
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 2a1bdc4..2b88bd5 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -11,6 +11,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "6dd0f89131cc35bf4f2ed105a1c17771"
 SRC_URI[sha256sum] = "c98f7296ab5c8ccd2e0bc07634976a37f50847df2d8a59bdb1e157664700b467"
 
+REGEX_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
+REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/docbook-xsl-${PV}"
 
 inherit allarch
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 3c2aab4..6d314f6 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -29,6 +29,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
 SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
 SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
 
+REGEX_URI = "http://sourceforge.net/projects/expect/files/Expect/"
+REGEX = "/Expect/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/${BPN}${PV}"
 
 do_install_append() {
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
index a4cc846..c08767e 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
@@ -10,6 +10,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "2061f917af084215898d4fea04d8388f"
 SRC_URI[sha256sum] = "5b66956743a799fc0471cdb032665c1391e82f9c5b3f1d7d726d29fe2ba01d6c"
 
+REGEX_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
+REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
+
 do_install() {
     install -d ${D}${sbindir}
     install -m 0755 cgdisk ${D}${sbindir}
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index fa7aa62..2d67cf3 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -22,6 +22,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
 
+REGEX_URI = "http://openjade.sourceforge.net/download.html"
+
 inherit autotools-brokensep native
 
 EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
diff --git a/meta/recipes-devtools/python/python-scons_2.3.6.bb b/meta/recipes-devtools/python/python-scons_2.3.6.bb
index c4ad7d3..d231d20 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.6.bb
+++ b/meta/recipes-devtools/python/python-scons_2.3.6.bb
@@ -9,6 +9,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 SRC_URI[md5sum] = "9c6a1c3c716cbe5f16515f163c91d928"
 SRC_URI[sha256sum] = "98adaa351d8f4e4068a5bf1894bdd7f85b390c8c3f80d437cf8bb266012404df"
 
+REGEX_URI = "http://sourceforge.net/projects/scons/files/scons/"
+REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index c0ffe33..e99cecd 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -18,6 +18,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
 SRC_URI[md5sum] = "376790a95c1fb645e59e6e9803c78582"
 SRC_URI[sha256sum] = "59ab0138bc8cf90cccb8509b6969a024d5e58d2d02bcbdccbb9ba9b88be3fa33"
 
+REGEX_URI = "http://sourceforge.net/projects/cracklib/files/cracklib/"
+REGEX = "/cracklib/(?P<pver>(\d+[\.\-_]*)+)/"
+
 inherit autotools gettext pythonnative python-dir
 
 do_install_append_class-target() {
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index c9f6a8b..b898428 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -24,6 +24,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
+
+REGEX_URI = "http://sourceforge.net/projects/lsb/files/lsb_release/"
+REGEX = "/lsb_release/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/lsb-release-1.4"
 
 CLEANBROKEN = "1"
diff --git a/meta/recipes-extended/quota/quota_4.02.bb b/meta/recipes-extended/quota/quota_4.02.bb
index 673d584..23f728f 100644
--- a/meta/recipes-extended/quota/quota_4.02.bb
+++ b/meta/recipes-extended/quota/quota_4.02.bb
@@ -17,6 +17,9 @@ SRC_URI_append_libc-musl = " file://replace_getrpcbynumber_r.patch"
 SRC_URI[md5sum] = "a8a5df262261e659716ccad2a5d6df0d"
 SRC_URI[sha256sum] = "f4c2f48abf94bbdc396df33d276f2e9d19af58c232cb85eef9c174a747c33795"
 
+REGEX_URI = "http://sourceforge.net/projects/linuxquota/files/quota-tools/"
+REGEX = "/quota-tools/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/quota-tools"
 
 DEPENDS = "gettext-native e2fsprogs"
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index 9ec0a8e..41b2ec0 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -17,6 +17,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
 SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
 SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
 
+REGEX_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
+REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
+
 inherit autotools
 inherit update-rc.d
 
diff --git a/meta/recipes-graphics/glew/glew_1.12.0.bb b/meta/recipes-graphics/glew/glew_1.12.0.bb
index eb28c4d..712d4de 100644
--- a/meta/recipes-graphics/glew/glew_1.12.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.12.0.bb
@@ -18,6 +18,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
 SRC_URI[md5sum] = "01246c7ecd135d99be031aa63f86dca1"
 SRC_URI[sha256sum] = "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf"
 
+REGEX_URI = "http://sourceforge.net/projects/glew/files/glew"
+REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
+
 inherit autotools lib_package pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
index ab909f7..c6fd301 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
@@ -13,4 +13,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.xz"
 SRC_URI[md5sum] = "4a8e6c1a86d5e64ec725d850a4abfbad"
 SRC_URI[sha256sum] = "ff7df437bbfd3119c5f662c6d209b98f15de03a7203308c6b56a4c1e1d419aaf"
 
+REGEX_URI = "http://sourceforge.net/projects/lxde/files/menu-cache/1.0/"
+
 inherit autotools gettext pkgconfig gtk-doc
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index ec0241f..24a5a95 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
 SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
 SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
 
+REGEX_URI = "http://sourceforge.net/projects/libvncserver/files/x11vnc/"
+REGEX = "/x11vnc/(?P<pver>(\d+[\.\-_]*)+)/"
+
 DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
 
 inherit autotools-brokensep distro_features_check
diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
index 2dfda90..07b8cb0 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}
 SRC_URI[md5sum] = "5077b9022440e4951d96f2d0e73bd487"
 SRC_URI[sha256sum] = "5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f"
 
+REGEX_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
+
 EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
 EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
 EXTRA_OEMAKE_append_powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
index bf861a7..60c91df 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
@@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.
 SRC_URI[md5sum] = "7d18a74e6fd2029aee76ccd00e00a9e6"
 SRC_URI[sha256sum] = "b45e49f689e7451bd576569e6a344f7e0d11c02ecbb797f4da0e431526765c0a"
 
+REGEX_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
+REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
+
 BINCONFIG_GLOB = "${PN}-config"
 
 inherit autotools binconfig pkgconfig
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 94b66b1..0b33129 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -13,6 +13,9 @@ SRC_URI = "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "caa9f5bc44232dc8aeea773fea56be80"
 SRC_URI[sha256sum] = "a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33"
+
+REGEX_URI = "http://liba52.sourceforge.net/downloads.html"
+
 S = "${WORKDIR}/a52dec-${PV}"
 
 EXTRA_OECONF = " --enable-shared "
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index cede2bf..b369808 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz \
 SRC_URI[md5sum] = "7631b0a4bcfdd0d78c0bb0083080b0dc"
 SRC_URI[sha256sum] = "c74a76068f8ec36d4bb59a03bf1157be44118ca02252180e8b358b0b5e3edeee"
 
+REGEX_URI = "http://libmpeg2.sourceforge.net/downloads.html"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-shared --disable-sdl"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
index b63db87..5e34f92 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
@@ -23,6 +23,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 SRC_URI[md5sum] = "c993402d407b0a3fc076f842ac1bc5c9"
 SRC_URI[sha256sum] = "cfa8d82fc63be147045174bef074807e1e32ce8c6bf4dbd8fad49e260bcf6380"
 
+REGEX_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
+
 inherit autotools pkgconfig distro_features_check
 
 # The startup-notification requires x11 in DISTRO_FEATURES
diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
index 1880639..57e04ce 100644
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.37.bb
@@ -17,6 +17,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
 SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
 
+REGEX_URI = "http://sourceforge.net/projects/pcre/files/pcre/"
+REGEX = "/pcre/(?P<pver>(\d+[\.\-_]*)+)/"
+
 S = "${WORKDIR}/pcre-${PV}"
 
 PROVIDES += "pcre"
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
index 646872c..cced15e 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
@@ -25,6 +25,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
 SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
 
+REGEX_URI = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
+REGEX = "/libusb-compat-(?P<pver>(\d+[\.\-_]*)+)/$"
+
 BINCONFIG = "${bindir}/libusb-config"
 
 inherit autotools pkgconfig binconfig-disabled lib_package
-- 
2.1.4


