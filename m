Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAEFA76380
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:11:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T9Burr014700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 02:11:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 29 Jul 2015 02:11:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 02:11:55 -0700
Message-ID: <843b4f27732cdc3d9003c9a647ea81d448df051a.1438161068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438161068.git.liezhi.yang@windriver.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta: git://github.com -> ${GITHUB_GIT}
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
X-List-Received-Date: Wed, 29 Jul 2015 09:11:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../connman/connman-gnome_0.7.bb                   |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 meta/recipes-devtools/bootchart2/bootchart2_git.bb |    2 +-
 .../build-compare/build-compare_git.bb             |    2 +-
 meta/recipes-devtools/remake/remake.inc            |    2 +-
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |    2 +-
 .../squashfs-tools/squashfs-tools_git.bb           |    2 +-
 .../chkconfig-alternatives-native_1.3.59.bb        |    2 +-
 meta/recipes-extended/ltp/ltp_20150420.bb          |    2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    2 +-
 meta/recipes-graphics/eglinfo/eglinfo.inc          |    2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |    2 +-
 .../recipes-multimedia/gstreamer/gst-player_git.bb |    2 +-
 meta/recipes-multimedia/libav/libpostproc_git.bb   |    2 +-
 meta/recipes-support/lz4/lz4.bb                    |    2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f5575d2..5a0e37a 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git \
+SRC_URI = "${GITHUB_GIT}/connectivity/connman-gnome.git \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
            file://images/* \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index c15cb78..b5a1727 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -10,7 +10,7 @@ PR = "r5"
 # Revision corresponding to tag update-rc.d_0.7
 SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
 
-SRC_URI = "git://github.com/philb/update-rc.d.git \
+SRC_URI = "${GITHUB_GIT}/philb/update-rc.d.git \
            file://add-verbose.patch \
            file://check-if-symlinks-are-valid.patch \
            file://fix-to-handle-priority-numbers-correctly.patch \
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
index ea9f179..9018bbe 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
@@ -91,7 +91,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 # one commit beyond 1.14.6 for a systemd-related bugfix
 PV = "0.14.6+git${SRCPV}"
 
-SRC_URI = "git://github.com/mmeeks/bootchart.git \
+SRC_URI = "${GITHUB_GIT}/mmeeks/bootchart.git \
            file://bootchartd_stop.sh \
            file://bootchartd-no-bashism.patch \
           "
diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 418aee0..036f906 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/openSUSE/build-compare"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/openSUSE/build-compare.git"
+SRC_URI = "${GITHUB_GIT}/openSUSE/build-compare.git"
 SRC_URI += "file://Rename-rpm-check.sh-to-pkg-diff.sh.patch;striplevel=1"
 SRC_URI += "file://Ignore-DWARF-sections.patch;striplevel=1"
 PATCHTOOL = "git"
diff --git a/meta/recipes-devtools/remake/remake.inc b/meta/recipes-devtools/remake/remake.inc
index 6ac833e..04605cf 100644
--- a/meta/recipes-devtools/remake/remake.inc
+++ b/meta/recipes-devtools/remake/remake.inc
@@ -6,7 +6,7 @@ execution in a comprehensible way, and a debugger."
 HOMEPAGE = "http://bashdb.sourceforge.net/remake/"
 SECTION = "devel"
 
-SRC_URI = "git://github.com/rocky/remake.git"
+SRC_URI = "${GITHUB_GIT}/rocky/remake.git"
 
 inherit autotools gettext update-alternatives
 
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
index 5e3460f..e402c59 100644
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-SRC_URI = "git://github.com/gitpan/SGMLSpm \
+SRC_URI = "${GITHUB_GIT}/gitpan/SGMLSpm \
           "
 
 SRCREV = "71595b9b5e36bfc00046995e058926bd27793fef"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 497b282..944ca13 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "attr zlib xz lzo lz4"
 
 PV = "4.3+gitr${SRCPV}"
 SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
-SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+SRC_URI = "${GITHUB_GIT}/plougher/squashfs-tools.git;protocol=https \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
 "
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
index 7fd34aa..8b4e1b6 100644
--- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # The sysroot branch is 1.3.59 + some git commits from master + --sysroot
 # support for alternatives.
-SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
+SRC_URI = "${GITHUB_GIT}/kergoth/chkconfig;branch=sysroot"
 S = "${WORKDIR}/git"
 
 SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
index 108ebf1..55a74ee 100644
--- a/meta/recipes-extended/ltp/ltp_20150420.bb
+++ b/meta/recipes-extended/ltp/ltp_20150420.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "attr libaio libcap acl openssl zip-native"
 SRCREV = "77d0b7fd0148ce657c5a25060667e978c07662a0"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git \
+SRC_URI = "${GITHUB_GIT}/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
     file://make-setregid02-work.patch \
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index ffc03e5..c8a8eeb 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 DEPENDS = ""
 PR = "r2"
 
-SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
+SRC_URI = "${GITHUB_GIT}/xinetd-org/xinetd.git;protocol=https \
       file://xinetd.init \
       file://xinetd.conf \
       file://xinetd.default \
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index b87688a..4d00036 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
 
 DEPENDS = "virtual/egl"
 
-SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
+SRC_URI = "${GITHUB_GIT}/dv1/eglinfo.git;branch=master"
 SRCREV = "4b317648ec6cf39556a9e5d8078f605bc0edd5de"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index ce35b61..4e4fc96 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -4,7 +4,7 @@ require mx.inc
 SRCREV = "9b1db6b8060bd00b121a692f942404a24ae2960f"
 PV = "1.4.7+git${SRCPV}"
 
-SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4 \
+SRC_URI = "${GITHUB_GIT}/clutter-project/mx.git;branch=mx-1.4 \
 	   file://fix-build-dir.patch \
 	   file://fix-test-includes.patch \
 	  "
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index a9de3d7..425a6b0 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git \
+SRC_URI = "${GITHUB_GIT}/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 54cfbbc..f7ef4c5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
 
-SRC_URI = "git://github.com/sdroege/gst-player.git \
+SRC_URI = "${GITHUB_GIT}/sdroege/gst-player.git \
            file://filechooser.patch \
            file://gtk2.patch \
            file://Fix-pause-play.patch \
diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
index 4aaa50f..8774f4b 100644
--- a/meta/recipes-multimedia/libav/libpostproc_git.bb
+++ b/meta/recipes-multimedia/libav/libpostproc_git.bb
@@ -11,7 +11,7 @@ LICENSE_FLAGS = "commercial"
 PV = "52.3.0+git${SRCPV}"
 
 SRCREV = "811db3b957dfde24aef2d0f82e297e5bf552d873"
-SRC_URI = "git://github.com/lu-zero/postproc;protocol=https"
+SRC_URI = "${GITHUB_GIT}/lu-zero/postproc;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index 0b0c632..e3da4d0 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -8,7 +8,7 @@ SRCREV = "5780864c0ce08622238a267c46fb489d7066cad4"
 
 PV = "128+git${SRCPV}"
 
-SRC_URI = "git://github.com/Cyan4973/lz4.git;protocol=http"
+SRC_URI = "${GITHUB_GIT}/Cyan4973/lz4.git;protocol=http"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


