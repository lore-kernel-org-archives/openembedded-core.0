Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qyzow-0002jo-3D
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 07:28:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Aug 2011 22:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,310,1312182000"; d="scan'208";a="44570440"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.3])
	by azsmga001.ch.intel.com with ESMTP; 31 Aug 2011 22:23:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2011 22:23:09 -0700
Message-Id: <87171d7f1319f6c9d1902d29e1919e8e59d87640.1314854414.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314854414.git.sgw@linux.intel.com>
References: <cover.1314854414.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314854414.git.sgw@linux.intel.com>
References: <cover.1314854414.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] o-hand recipes: convert from svn.o-hand.org to git.yoctoproject.org
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
X-List-Received-Date: Thu, 01 Sep 2011 05:28:11 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../zaurusd/{zaurusd_svn.bb => zaurusd_git.bb}     |   11 ++++++-----
 .../{dbus-wait_svn.bb => dbus-wait_git.bb}         |   11 ++++++-----
 .../psplash/{psplash_svn.bb => psplash_git.bb}     |   12 ++++++------
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |   17 +++++++----------
 .../fstests/{fstests_svn.bb => fstests_git.bb}     |   15 ++++++++-------
 .../matchbox-wm-2/matchbox-wm-2_svn.bb             |   10 +++++-----
 .../{xvideo-tests_svn.bb => xvideo-tests_git.bb}   |    8 ++++----
 .../recipes-sato/gaku/{gaku_svn.bb => gaku_git.bb} |   11 +++++------
 ...k-sato-engine_svn.bb => gtk-sato-engine_git.bb} |   12 ++++++------
 .../libowl/{libowl_svn.bb => libowl_git.bb}        |   10 +++++-----
 ...op-sato_svn.bb => matchbox-desktop-sato_git.bb} |   10 ++++++----
 ...-sato-2_svn.bb => matchbox-theme-sato-2_git.bb} |    8 ++++----
 ...heme-sato_svn.bb => matchbox-theme-sato_git.bb} |    8 ++++----
 .../{libowl-av_svn.bb => libowl-av_git.bb}         |   11 ++++++-----
 .../{owl-video_svn.bb => owl-video_git.bb}         |   10 +++++-----
 .../{oh-puzzles_svn.bb => oh-puzzles_git.bb}       |   14 +++++++-------
 .../{screenshot_svn.bb => screenshot_git.bb}       |   10 +++++-----
 .../web/{web-webkit_svn.bb => web-webkit_git.bb}   |   10 +++++-----
 18 files changed, 100 insertions(+), 98 deletions(-)
 rename meta/recipes-bsp/zaurusd/{zaurusd_svn.bb => zaurusd_git.bb} (70%)
 rename meta/recipes-core/dbus-wait/{dbus-wait_svn.bb => dbus-wait_git.bb} (50%)
 rename meta/recipes-core/psplash/{psplash_svn.bb => psplash_git.bb} (81%)
 rename meta/recipes-graphics/fstests/{fstests_svn.bb => fstests_git.bb} (65%)
 rename meta/recipes-graphics/xvideo-tests/{xvideo-tests_svn.bb => xvideo-tests_git.bb} (64%)
 rename meta/recipes-sato/gaku/{gaku_svn.bb => gaku_git.bb} (80%)
 rename meta/recipes-sato/gtk-engines/{gtk-sato-engine_svn.bb => gtk-sato-engine_git.bb} (69%)
 rename meta/recipes-sato/libowl/{libowl_svn.bb => libowl_git.bb} (78%)
 rename meta/recipes-sato/matchbox-desktop-sato/{matchbox-desktop-sato_svn.bb => matchbox-desktop-sato_git.bb} (68%)
 rename meta/recipes-sato/matchbox-theme-sato/{matchbox-theme-sato-2_svn.bb => matchbox-theme-sato-2_git.bb} (48%)
 rename meta/recipes-sato/matchbox-theme-sato/{matchbox-theme-sato_svn.bb => matchbox-theme-sato_git.bb} (50%)
 rename meta/recipes-sato/owl-video-widget/{libowl-av_svn.bb => libowl-av_git.bb} (80%)
 rename meta/recipes-sato/owl-video-widget/{owl-video_svn.bb => owl-video_git.bb} (89%)
 rename meta/recipes-sato/puzzles/{oh-puzzles_svn.bb => oh-puzzles_git.bb} (92%)
 rename meta/recipes-sato/screenshot/{screenshot_svn.bb => screenshot_git.bb} (79%)
 rename meta/recipes-sato/web/{web-webkit_svn.bb => web-webkit_git.bb} (78%)

diff --git a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
similarity index 70%
rename from meta/recipes-bsp/zaurusd/zaurusd_svn.bb
rename to meta/recipes-bsp/zaurusd/zaurusd_git.bb
index eaac303..3aa56af 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -4,14 +4,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "tslib"
 RDEPENDS_${PN} = "xrandr"
-SRCREV = "426"
-PV = "0.0+svnr${SRCPV}"
-PR = "r3"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
+SRCREV = "82b30c7865f007fff81372c3cdc71b2ff6843ccc"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
 	file://fix_makefile.patch"
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_svn.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
similarity index 50%
rename from meta/recipes-core/dbus-wait/dbus-wait_svn.bb
rename to meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 1270973..3f1cc08 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -1,16 +1,17 @@
 DESCRIPTION = "A simple tool to wait for a specific signal over DBus"
-HOMEPAGE = "http://svn.o-hand.com/repos/misc/trunk"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "426"
 DEPENDS = "dbus"
-PV = "0.0+svnr${SRCPV}"
+
+SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
+PV = "0.0+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=dbus-wait;proto=http"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta/recipes-core/psplash/psplash_svn.bb b/meta/recipes-core/psplash/psplash_git.bb
similarity index 81%
rename from meta/recipes-core/psplash/psplash_svn.bb
rename to meta/recipes-core/psplash/psplash_git.bb
index 477894a..d2b265c 100644
--- a/meta/recipes-core/psplash/psplash_svn.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -1,19 +1,19 @@
 SUMMARY = "Userspace framebuffer boot logo based on usplash."
 DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly embedded Linux devices supporting a 16bpp or 32bpp framebuffer. It has few dependencies (just libc), supports basic images and text and handles rotation. Its visual look is configurable by basic source changes. Also included is a 'client' command utility for sending information to psplash such as boot progress information."
-HOMEPAGE = "http://svn.o-hand.com/view/misc/trunk/psplash/"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;md5=a87c39812c1e37f3451567cc29a29c8f"
 
-SRCREV = "424"
-PV = "0.0+svnr${SRCPV}"
-PR = "r6"
+SRCREV = "e05374aae945bcfc6d962ed0d7b2774b77987e1d"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
 	   file://psplash-poky-img.h"
 
-S = "${WORKDIR}/psplash"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d
 
diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index c5a84d6..f15cf2e 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -6,18 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SRCREV = "1161"
 PV = "2.11.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;proto=http \
-	http://svn.o-hand.com/repos/web/trunk/patches/at-import_box-pos.patch;striplevel=0;maxrev=1157;name=patch1 \
-	http://svn.o-hand.com/repos/web/trunk/patches/css-stylesheet-user.patch;striplevel=0;maxrev=1157;name=patch2 \
-	http://svn.o-hand.com/repos/web/trunk/patches/css-media.patch;striplevel=0;maxrev=1157;name=patch3 \
-	http://svn.o-hand.com/repos/web/trunk/patches/add-end-element-signal.patch;striplevel=0;maxrev=1157;name=patch4 \
-	http://svn.o-hand.com/repos/web/trunk/patches/add-dom-functions.patch;striplevel=0;maxrev=1157;name=patch5 \
-	http://svn.o-hand.com/repos/web/trunk/patches/iain-mem-leak.patch;striplevel=0;maxrev=1157;name=patch6"
-
-SRC_URI[patch1.md5sum] = "160c648e29637f2ed6301f4dfdecce21"
-SRC_URI[patch1.sha256sum] = "3ec786e6df9e1a935aff4848b6989cad8f87c1fa8813dc033b338e18b17138d8"
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-media.patch;striplevel=0;name=patch3 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-end-element-signal.patch;striplevel=0;name=patch4 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-dom-functions.patch;striplevel=0;name=patch5 \
+           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/iain-mem-leak.patch;striplevel=0;name=patch6 \
+          "
 
 SRC_URI[patch2.md5sum] = "05fc3627ca364095702dc804f41c8391"
 SRC_URI[patch2.sha256sum] = "df5cca50a8f95333505d7920929fea251daea3be25be6834a1c50a742d9eb674"
diff --git a/meta/recipes-graphics/fstests/fstests_svn.bb b/meta/recipes-graphics/fstests/fstests_git.bb
similarity index 65%
rename from meta/recipes-graphics/fstests/fstests_svn.bb
rename to meta/recipes-graphics/fstests/fstests_git.bb
index 2ffdc35..69178e9 100644
--- a/meta/recipes-graphics/fstests/fstests_svn.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -4,16 +4,17 @@ SECTION = "devel"
 LICENSE = "Zlib"
 DEPENDS = "pango libxext libxft virtual/libx11 gtk+"
 
-SRCREV = "426"
-PV = "0.0+svnr${SRCPV}"
-PR = "r1"
+SRCREV = "218b99d82b56011e3f1b909e6baf22ce25af6334"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-inherit autotools
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=fstests;proto=http \
-	file://dso_linking_change_build_fix.patch"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+           file://dso_linking_change_build_fix.patch"
+
+S = "${WORKDIR}/git/tests"
 
-S = "${WORKDIR}/fstests/tests"
+inherit autotools
 
 do_install() {
     install -d ${D}${bindir}
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
index 0b5e3f1..f1fb4ac 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
@@ -5,15 +5,15 @@ LIC_FILES_CHKSUM = "file://matchbox/core/mb-wm.h;endline=21;md5=1b1d328a52790635
 
 DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pango libxdamage libxcomposite gtk+"
 
-SRCREV = "2106"
-PV = "0.0+svnr${SRCPV}"
-PR = "r5"
+SRCREV = "18ab9c7e4ffcb066b25281172ea82947bd56cb86"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-window-manager-2;proto=http \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;proto=git \
 	file://fix_makefile.patch \
 	  "
 
-S = "${WORKDIR}/matchbox-window-manager-2"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-alternatives
 
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
similarity index 64%
rename from meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb
rename to meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 0c6ca3f..bb406ac 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/test-xvideo.c;beginline=1;endline=20;md5=6ae3b4c3c2ff9e51dbbc35bb237afa00"
 DEPENDS = "libxv"
 
-SRCREV = "270"
-PV = "0.0+svnr${SRCPV}"
+SRCREV = "f8f320d0254c09ce483fc1d8ee99ecf5bc940965"
+PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI="svn://svn.o-hand.com/repos/misc/trunk;module=test-xvideo;proto=http"
+SRC_URI = "git://git.yoctoproject.org/test-xvideo;protocol=git"
 
-S = "${WORKDIR}/test-xvideo"
+S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta/recipes-sato/gaku/gaku_svn.bb b/meta/recipes-sato/gaku/gaku_git.bb
similarity index 80%
rename from meta/recipes-sato/gaku/gaku_svn.bb
rename to meta/recipes-sato/gaku/gaku_git.bb
index 3806021..e2ae1bc 100644
--- a/meta/recipes-sato/gaku/gaku_svn.bb
+++ b/meta/recipes-sato/gaku/gaku_git.bb
@@ -15,13 +15,12 @@ RRECOMMENDS_${PN} = "gst-plugins-good-id3demux \
                gst-plugins-base-ogg \
                ${COMMERCIAL_AUDIO_PLUGINS}"
 
-SRCREV = "399"
-PV = "0.0+svnr${SRCPV}"
+SRCREV = "a0be2fe4b5f12b8b07f4e3bd624b3729657f0ac5"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-PR = "r4"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http"
-
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
similarity index 69%
rename from meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
rename to meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
index 6099ae4..0f21972 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/sato-utils.h;endline=24;md5=708f28cfe7fe028d497aaf4389b80b62 \
                     file://src/sato-main.c;endline=24;md5=b5e5dddebca570275becb51b526e4c5a"
 
-SRCREV = "163"
-PV = "0.3.2+svnr${SRCPV}"
-PR = "r1"
+SRCREV = "e4a29fbb7648f12fb3aefd8ea0120c3f54ba392a"
+PV = "0.3.2+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/sato/trunk;module=gtk-engine;proto=http"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
-EXTRA_OECONF += "${@base_contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/gtk-engine"
+EXTRA_OECONF += "${@base_contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
diff --git a/meta/recipes-sato/libowl/libowl_svn.bb b/meta/recipes-sato/libowl/libowl_git.bb
similarity index 78%
rename from meta/recipes-sato/libowl/libowl_svn.bb
rename to meta/recipes-sato/libowl/libowl_git.bb
index 1500fad..6ec4a72 100644
--- a/meta/recipes-sato/libowl/libowl_svn.bb
+++ b/meta/recipes-sato/libowl/libowl_git.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "libs"
 DEPENDS = "gtk+"
-SRCREV = "408"
-PV = "0.0+svnr${SRCPV}"
-PR = "r6"
+SRCREV = "6ebc8ac8f8575278dd40a535cadefa26374e44b1"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
similarity index 68%
rename from meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb
rename to meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
index 7a68138..182791c 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
@@ -8,12 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "x11"
 DEPENDS = ""
 CONFLICTS = "matchbox-common"
-SRCREV = "76"
-PV = "0.0+svnr${SRCPV}"
+
+SRCREV = "810b0b08eb79e4685202da2ec347b990bb467e07"
+PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/sato/trunk;module=desktop-folders;proto=http"
-S = "${WORKDIR}/desktop-folders"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
similarity index 48%
rename from meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb
rename to meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
index 89e01b1..58b2bec 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
@@ -1,12 +1,12 @@
 require matchbox-theme-sato.inc
 
 DEPENDS = "matchbox-wm-2"
-SRCREV = "164"
-PV = "0.1+svnr${SRCPV}"
+SRCREV = "f72cf4ed7d71ad9e47b0f2d3dbc593bc2f3e76f8"
+PV = "0.1+git${SRCPV}"
 
-SRC_URI = "svn://svn.o-hand.com/repos/sato/trunk;module=matchbox-sato;proto=http \
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=git \
           file://png_rename.patch"
 
-S = "${WORKDIR}/matchbox-sato"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--disable-matchbox-1 --enable-matchbox-2"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
similarity index 50%
rename from meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb
rename to meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
index 776d802..c838e10 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
@@ -1,13 +1,13 @@
 require matchbox-theme-sato.inc
 
-SRCREV = "90"
-PV = "0.1+svnr${SRCPV}"
+SRCREV = "f72cf4ed7d71ad9e47b0f2d3dbc593bc2f3e76f8"
+PV = "0.1+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "svn://svn.o-hand.com/repos/sato/trunk;module=matchbox-sato;proto=http"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=git"
 
 EXTRA_OECONF += "${@base_contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
 
-S = "${WORKDIR}/matchbox-sato"
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
similarity index 80%
rename from meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
rename to meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index 04928a4..3044fd0 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -12,14 +12,15 @@ DEPENDS = "gtk+ gstreamer gst-plugins-base"
 RDEPENDS_${PN} = "gst-meta-base"
 RRECOMMENDS_${PN} = "gst-meta-audio gst-meta-video"
 
-SRCREV = "416"
-PV = "0.0+svnr${SRCPV}"
-PR = "r6"
+SRCREV = "1379fd230a32509e94971961183f1031f469737a"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-S = "${WORKDIR}/${BPN}"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://gst_change_state.patch \
 	   file://make-382.patch"
 
+S = "${WORKDIR}/git"
+
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_svn.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
similarity index 89%
rename from meta/recipes-sato/owl-video-widget/owl-video_svn.bb
rename to meta/recipes-sato/owl-video-widget/owl-video_git.bb
index 52883ce..59db2ae 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_svn.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
 SECTION = "x11"
 DEPENDS = "libowl-av"
 
-SRCREV = "394"
-PV = "0.0+svnr${SRCPV}"
-PR = "r3"
+SRCREV = "f133472318970796fae1ea3e98ac062156768baf"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-S = "${WORKDIR}/video"
+S = "${WORKDIR}/git"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=video;proto=http \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://gtk_multithread_safe.patch \
            file://owl-video-widget.png \
            file://stock_media-play.png \
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
similarity index 92%
rename from meta/recipes-sato/puzzles/oh-puzzles_svn.bb
rename to meta/recipes-sato/puzzles/oh-puzzles_git.bb
index b5e5b91..e725d5c 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -11,18 +11,18 @@ SECTION = "x11"
 DEPENDS = "gtk+ gconf intltool-native librsvg"
 DEPENDS_append_poky = " libowl"
 
-SRCREV = "23"
-PV = "0.1+svnr${SRCPV}"
+SRCREV = "92f1a20e4b72eed7a35b00984d9793b51dc2fb3b"
+PV = "0.1+git${SRCPV}"
 PR = "r10"
 
-bindir = "/usr/games"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;striplevel=0 "
 
-inherit autotools pkgconfig
+S = "${WORKDIR}/git"
 
-SRC_URI = "svn://svn.o-hand.com/repos/;module=oh-puzzles;proto=http"
-SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;striplevel=0 "
+inherit autotools pkgconfig
 
-S = "${WORKDIR}/${BPN}"
+bindir = "/usr/games"
 
 EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
 
diff --git a/meta/recipes-sato/screenshot/screenshot_svn.bb b/meta/recipes-sato/screenshot/screenshot_git.bb
similarity index 79%
rename from meta/recipes-sato/screenshot/screenshot_svn.bb
rename to meta/recipes-sato/screenshot/screenshot_git.bb
index 825870d..a4717e6 100644
--- a/meta/recipes-sato/screenshot/screenshot_svn.bb
+++ b/meta/recipes-sato/screenshot/screenshot_git.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
 
 DEPENDS = "matchbox-panel-2"
-SRCREV = "292"
-PV = "0.0+svnr${SRCPV}"
-PR = "r2"
+SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://fix_ldadd_order.patch"
 
-S = ${WORKDIR}/${BPN}
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-sato/web/web-webkit_svn.bb b/meta/recipes-sato/web/web-webkit_git.bb
similarity index 78%
rename from meta/recipes-sato/web/web-webkit_svn.bb
rename to meta/recipes-sato/web/web-webkit_git.bb
index 2f79e0a..2068949 100644
--- a/meta/recipes-sato/web/web-webkit_svn.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -11,15 +11,15 @@ DEPENDS = "libxml2 glib-2.0 gtk+ libglade webkit-gtk curl gconf js libowl"
 # To access https web pages
 RRECOMMENDS_${PN} += "glib-networking"
 
-SRCREV = "130"
-PV = "0.0+svnr${SRCPV}"
-PR = "r4"
+SRCREV = "0f7019acd9db5383c732d0524c7c3a5eaec9be2b"
+PV = "0.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://svn.o-hand.com/repos/web/branches;module=webkit;proto=http \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://link-with-g++.patch \
 	   file://make-382.patch"
 
-S = "${WORKDIR}/webkit"
+S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--enable-libowl"
 
-- 
1.7.6



