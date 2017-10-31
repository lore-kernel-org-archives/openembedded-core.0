Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C2F1178215
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 17:43:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Oct 2017 10:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,325,1505804400"; d="scan'208";a="1212472691"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2017 10:43:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Oct 2017 19:43:57 +0200
Message-Id: <20171031174357.9502-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171031174357.9502-1-alexander.kanavin@linux.intel.com>
References: <20171031174357.9502-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] oe-core: take UPSTREAM_CHECK_COMMITS into use where possible
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
X-List-Received-Date: Tue, 31 Oct 2017 17:43:55 -0000

This greatly reduces the amount of recipes for which upstream
version check fails: from about 30 to about 8.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                           | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                               | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb                       | 2 +-
 meta/recipes-devtools/build-compare/build-compare_git.bb               | 2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb                     | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                                 | 2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb                             | 2 +-
 meta/recipes-devtools/prelink/prelink_git.bb                           | 3 +--
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb             | 2 +-
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb                 | 2 +-
 meta/recipes-graphics/fstests/fstests_git.bb                           | 2 +-
 meta/recipes-graphics/kmscube/kmscube_git.bb                           | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                             | 2 +-
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb                       | 2 +-
 .../xcursor-transparent-theme/xcursor-transparent-theme_git.bb         | 2 +-
 meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb                    | 2 +-
 meta/recipes-graphics/xorg-proto/calibrateproto_git.bb                 | 2 +-
 meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb                 | 2 +-
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb               | 2 +-
 meta/recipes-multimedia/gstreamer/gst-player_git.bb                    | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                               | 2 +-
 meta/recipes-sato/puzzles/puzzles_git.bb                               | 2 +-
 22 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 4afb90c20a5..c24295b5370 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ PV = "0.1+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 3b7f818fc56..aab2c0360de 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -12,7 +12,7 @@ PR = "r15"
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
            ${SPLASH_IMAGES}"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
 
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index 6fc6f6e1abe..76d4312d881 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/philb/update-rc.d.git \
            file://check-if-symlinks-are-valid.patch \
            file://fix-to-handle-priority-numbers-correctly.patch \
           "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 84d04cfa0d3..efcf6b6dd3c 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
 PE = "1"
 PV = "2015.02.10+git${SRCPV}"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 4fded60f197..8de81381276 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -14,7 +14,7 @@ PV = "20150728+git${SRCPV}"
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 CLEANBROKEN = "1"
 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index f06fa49ae58..de57dd16147 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;protocol=http
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 S = "${WORKDIR}/git"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 50acdb1cc2a..efaabc11482 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -9,7 +9,7 @@ SRCREV = "37c86e60c0442fef570b75cd81aeb1db4d0cbafd"
 PV = "0.1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 570ef36a3cc..cc93bcc384f 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -32,8 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
            file://prelink.cron.daily \
            file://prelink.default \
 	   file://macros.prelink"
-UPSTREAM_CHECK_GITTAGREGEX = "upstream has no usable tags"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 TARGET_OS_ORIG := "${TARGET_OS}"
 OVERRIDES_append = ":${TARGET_OS_ORIG}"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 0f991706c1e..a8baca51e3f 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
            file://fix-compat.patch \
 "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
 SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
 
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 6d6789ae852..ab70ea98a32 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "git://${GO_IMPORT}"
 SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "github.com/golang/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 9e09cd2685b..69f217830af 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -8,7 +8,7 @@ SRCREV = "e5939ff608b95cdd4d0ab0e1935781ab9a276ac0"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 LIC_FILES_CHKSUM = "file://test-pango-gdk.c;endline=24;md5=1ee74ec851ecda57eb7ac6cc180f7655"
 
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index cab68fffb43..4265f8a8dc1 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315
 
 SRCREV = "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d274a8fbd56..bbe9a88969e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
            "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 # From 2017-07-03
 SRCREV = "c8f4fd9eeb298a2ef0855927f22634f794ef3eff"
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index 0b8943508b8..5fc9c2dba75 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
            file://0001-Fix-build-on-x86.patch \
 "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "18df00c7b4677b0889486e16977857aa987947e2"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index 733ebce7450..a4ab7f6eb81 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -11,7 +11,7 @@ SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
 PV = "0.1.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
index 7c7fa3ddb3c..0fe65318bea 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -16,7 +16,7 @@ PV = "0.0+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
            file://fix-xcb.patch"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
index 3a989262c1d..eb4b4224cae 100644
--- a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
@@ -17,5 +17,5 @@ PR = "r2"
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto \
            file://fix.patch;apply=yes"
 S = "${WORKDIR}/git"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 2667dd899d9..1d275a0042c 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -8,7 +8,7 @@ SRCREV = "7d38b881e99eb74169d292b40f7164e461a65092"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/test-xvideo"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0338ba8ac21..532f01ea2f7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -189,7 +189,7 @@ SRC_URI += "https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/linux-firmware.
 
 SRC_URI[iwlwifi-19.md5sum] = "132fbaee36beec5e98714f0bd66f7a1d"
 SRC_URI[iwlwifi-19.sha256sum] = "2034470df64d323b827c4f2d4d0d55be2846b7360179b5574aa28ff77b6c9471"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 4fe8fdef4a2..ee11e2ba10d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
 
 SRCREV = "ee3c226c82767a089743e4e06058743e67f73cdb"
 PV = "0.0.1+git${SRCPV}"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index c5476c7a9b3..bc9775ab2a1 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            file://Fix-X32-build-by-disabling-asm.patch \
            "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 SRCREV = "2b741f81e51f92d053d87a49f59ff1026553a0f6"
 
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index decd2a8b300..6148e40adaa 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-Clarify-conditions-to-avoid-compiler-errors.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            "
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "8dfe5cec31e784e4ece2955ecc8cc35ee7e8fbb3"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-- 
2.14.2


