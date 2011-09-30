Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9XbU-0005dc-RV
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:52 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506871bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=edqql9aC4cUQNthWgkRSv9J1ga57hL/hrEI3SvRmofg=;
	b=MVr8CQ5ZuSbeRFHPjdAuErYk6cCTfVjL1JQGvjIgvEfGKV1EFSRo2Ulqx9DWqHLShq
	hZZgYpG2+MkXX40uEs/qBINQUMA5b7vBIr0e0v6MztkLq0eYG5G0I7O5zf4tuvV2VhZg
	Z1f/Pzn2NVYtOhdhEYXFz35XDzDcfGbQ7yQ54=
Received: by 10.204.6.205 with SMTP id a13mr7693543bka.364.1317367701103;
	Fri, 30 Sep 2011 00:28:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm3946107bka.0.2011.09.30.00.28.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:18 +0200
Message-Id: <921d348a66792f91d6aad82dc6c9b50063b09c97.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/13] xorg-driver: rename .inc files and merge some changes from meta-oe
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:53 -0000

* use INC_PR
* use BPN directly instead of XORG_PN

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-evdev_2.6.0.bb          |    4 ++--
 .../xorg-driver/xf86-input-keyboard_1.6.0.bb       |    4 ++--
 .../xorg-driver/xf86-input-keyboard_git.bb         |    3 ++-
 .../xorg-driver/xf86-input-mouse_1.7.0.bb          |    4 +++-
 .../xorg-driver/xf86-input-mouse_git.bb            |    4 ++--
 .../xorg-driver/xf86-input-synaptics_1.4.0.bb      |    4 +++-
 .../xorg-driver/xf86-input-synaptics_git.bb        |    3 ++-
 .../xorg-driver/xf86-input-vmmouse_12.7.0.bb       |    4 ++--
 .../xorg-driver/xf86-video-intel_2.15.0.bb         |    4 ++--
 .../xorg-driver/xf86-video-intel_git.bb            |    4 ++--
 .../xorg-driver/xf86-video-omapfb_git.bb           |    4 ++--
 .../xorg-driver/xf86-video-vesa_2.3.0.bb           |    4 +++-
 .../xorg-driver/xf86-video-vmware_11.0.3.bb        |    4 ++--
 ...86-driver-common.inc => xorg-driver-common.inc} |   14 +++++++-------
 ...xf86-input-common.inc => xorg-driver-input.inc} |    3 +--
 ...xf86-video-common.inc => xorg-driver-video.inc} |    2 +-
 16 files changed, 38 insertions(+), 31 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-driver-common.inc => xorg-driver-common.inc} (66%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-common.inc => xorg-driver-input.inc} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-common.inc => xorg-driver-video.inc} (65%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.6.0.bb
index a37be17..db6a3b3 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.6.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.6.0.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- event devices (evdev) input driver"
 
@@ -14,7 +14,7 @@ xorg.conf for each input device that will use this driver. "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "f33fe9413bde68936d8909206a13e8a1"
 SRC_URI[sha256sum] = "b0e7f3991a8183a4743196c3e16d7184d439b80bf43653aa2f45b0756a6753ac"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
index 9b1441d..e374fbd 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- keyboard input driver"
 
@@ -9,7 +9,7 @@ core keyboard."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "e2abe9f13e526a73cb68a7d257546eba"
 SRC_URI[sha256sum] = "c46c790fec905d696573b7a374b10ab8b4389112a8f69993fe011006c99e858e"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
index fe8cee9..5bc0558 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- keyboard input driver"
 
@@ -9,6 +9,7 @@ core keyboard."
 
 SRCREV = "3e28d68b50d291938734e9684b8296ca864f3892"
 PV = "1.3.2+git${SRCPV}"
+PR = "${INC_PR}.0"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard;protocol=git"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
index fbc2c66..b4918ef 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- mouse input driver"
 
@@ -10,5 +10,7 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=237eb1d1a602d29ef2af62d8fba60f19"
 
+PR = "${INC_PR}.0"
+
 SRC_URI[md5sum] = "7f31472689c15b6de62eff04d0fb57d7"
 SRC_URI[sha256sum] = "4e989542b5e9e0c5f9087288b18e70de1064dd27c83a4bc6dce58f3ea9d74994"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
index b4dd1ed..392892e 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- mouse input driver"
 
@@ -10,7 +10,7 @@ driver."
 
 SRCREV = "ea5cfe804e112f320f14ad896c7802d53551d3e6"
 PV = "1.3.0+git${SRCPV}"
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-mouse;protocol=git \
            file://unbreak.patch"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
index 39cd35f..a75d051 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.4.0.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- synaptics touchpad input driver"
 
@@ -10,6 +10,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
+PR = "${INC_PR}.0"
+
 DEPENDS += "libxi"
 
 #
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
index dbfcef5..3b3db59 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
@@ -1,4 +1,4 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 SUMMARY = "X.Org X server -- synaptics touchpad input driver"
 
@@ -10,6 +10,7 @@ advanced features of the touchpad to become available."
 
 SRCREV = "934bc0012f948c52aadc8eda912f7728fb7394a2"
 PV = "0.15.2+git${SRCPV}"
+PR = "${INC_PR}.0"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics;protocol=git"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
index 9535a8f..42e2b14 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
@@ -1,7 +1,7 @@
-require xf86-input-common.inc
+require xorg-driver-input.inc
 
 DESCRIPTION = "X.Org X server -- VMWare mouse input driver"
-PR = "r0"
+PR = "${INC_PR}.0"
 
 RDEPENDS_${PN} += "xf86-input-mouse"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
index 6c9db59..caa8a40 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
@@ -1,4 +1,4 @@
-require xf86-video-common.inc
+require xorg-driver-video.inc
 
 SUMMARY = "X.Org X server -- Intel integrated graphics chipsets driver"
 
@@ -9,7 +9,7 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 EXTRA_OECONF += "--disable-xvmc"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 34fe533..ed1f269 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -1,4 +1,4 @@
-require xf86-video-common.inc
+require xorg-driver-video.inc
 
 SUMMARY = "X.Org X server -- Intel integrated graphics chipsets driver"
 
@@ -12,7 +12,7 @@ DEPENDS += "virtual/libx11 libxvmc drm dri2proto glproto \
 
 SRCREV = "87ea531c5dc5b39809395b277c330854aaaaf019"
 PV = "2.10.0+git${SRCPV}"
-PR = "r0"
+PR = "${INC_PR}.0"
 
 EXTRA_OECONF += "--disable-xvmc --enable-dri --disable-static"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 66aa5c4..cf58302 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -1,4 +1,4 @@
-require xf86-driver-common.inc
+require xorg-driver-driver.inc
 
 SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
 
@@ -11,7 +11,7 @@ DEPENDS += "virtual/libx11"
 
 SRCREV = "044617665d6737f4909aab96f91b06261dff05d2"
 PE = "1"
-PR = "r1"
+PR = "${INC_PR}.0"
 PV = "0.1.1+git${SRCPV}"
 
 SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
index 474c779..30e3dee 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.0.bb
@@ -1,4 +1,4 @@
-require xf86-video-common.inc
+require xorg-driver-video.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e5418e7a75e21268637984e70265e146"
 
@@ -11,6 +11,8 @@ can drive most VESA-compatible video cards, but only makes use of the \
 basic standard VESA core that is common to these cards. The driver \
 supports depths 8, 15 16 and 24."
 
+PR = "${INC_PR}.0"
+
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb
index a0f6041..e77c918 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb
@@ -1,4 +1,4 @@
-require xf86-video-common.inc
+require xorg-driver-video.inc
 
 SUMMARY = "X.Org X server -- VMware SVGA display driver"
 
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 DEPENDS += "virtual/libx11 libxvmc drm glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
similarity index 66%
rename from meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
rename to meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 34d03b2..801d8d3 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,14 +5,13 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "1"
-PR = "r1"
+INC_PR = "r15"
 
 DEPENDS = "virtual/xserver-xf86 xproto randrproto util-macros"
 
-XORG_PN = "${BPN}"
-SRC_URI = "${XORG_MIRROR}/individual/driver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
 
-S = "${WORKDIR}/${XORG_PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 FILES_${PN} += " ${libdir}/xorg/modules/drivers/*.so"
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"
@@ -27,7 +26,8 @@ do_configure_prepend () {
     mv configure.ac.new configure.ac
 }
 
-do_install_append () {
-    # driver's la files are not packaged
-    rm -f ${D}${libdir}/xorg/modules/drivers/*.la
+# FIXME: We don't want to include the libtool archives (*.la) from modules
+# directory, as they serve no useful purpose. Upstream should fix Makefile.am
+do_install_append() {
+	find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
 }
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-input-common.inc
rename to meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index 6fc88cf..bf4ca6c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -1,7 +1,6 @@
-include xf86-driver-common.inc
+include xorg-driver-common.inc
 
 DEPENDS += "inputproto kbproto "
 
 FILES_${PN} += " ${libdir}/xorg/modules/input/*.so"
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/input/.debug"
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
similarity index 65%
rename from meta/recipes-graphics/xorg-driver/xf86-video-common.inc
rename to meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index f2e2817..57c80d1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -1,4 +1,4 @@
-include xf86-driver-common.inc
+include xorg-driver-common.inc
 
 DEPENDS =+ "renderproto videoproto xextproto fontsproto"
 
-- 
1.7.6.1



