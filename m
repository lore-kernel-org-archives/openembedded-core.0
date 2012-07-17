Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr2Qn-0001b6-0I
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 09:42:53 +0200
Received: by wibhm11 with SMTP id hm11so89148wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KA5lk24C7eOAqMMcFHp/nXWkT2cNwK4SoubTxXfn9J4=;
	b=fvoFmWI0+mC2zhdqDsuzxKXsk18We9YO7GnG+ylKKu8N7e81ovc4KO1OPJ3zEVh2Pg
	2zalaM2SmsPLX1ihUDNylBQiv7CClfh5iiYKjHANyeM/HoYZjbKrfZAyjQ1Y0bdqSMHl
	634+ESKKSRT13ZMvkc+Lo7mxF8bxbITGrB9N26MUWYFUxZ+nJn+XxHJAoVtn9DaFUvrt
	+iFIJcoD3fR3a8IotXAqDl05drpFeLjO0TyHmfH/lsGh/FXAQ2+LuZT4NdpMEkApVAeh
	sUOXKyUpSJK75z/HZOGCSrKRhSCU4GKWiWp9ijEUOBiK8o95aZMGMtlSzzRF31fLMM2x
	M52w==
Received: by 10.180.100.131 with SMTP id ey3mr1725923wib.15.1342510293983;
	Tue, 17 Jul 2012 00:31:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df4sm25706771wib.4.2012.07.17.00.31.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 00:31:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 09:31:34 +0200
Message-Id: <1342510294-23477-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] qt-mobility, xserver-xorg, ofono, bluez4, gst-plugins-good: bump PR to rebuild after libudev0 soname change to libudev1
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
X-List-Received-Date: Tue, 17 Jul 2012 07:42:53 -0000

* this patch depends on http://patchwork.openembedded.org/patch/32085/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
 meta/recipes-connectivity/ofono/ofono_1.8.bb       |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 4a360b6..e26d4ea 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.8.bb b/meta/recipes-connectivity/ofono/ofono_1.8.bb
index e2d97f0..86767f1 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.8.bb
@@ -4,6 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
   file://ofono \
 "
+PR = "r1"
 
 SRC_URI[md5sum] = "e457ea13db22bb2de77767c867dcc4d3"
 SRC_URI[sha256sum] = "164b413068e810281a5e6c9bb90d5002d80f1c30bef2f3ffdbe70f963079524d"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index a44b411..0a69fff 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -3,7 +3,7 @@ require ofono.inc
 S	 = "${WORKDIR}/git"
 SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
 	    file://ofono"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 595ab77..017ac91 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,5 +8,5 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r3"
+PR = "r4"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e0eaf7b..ac63f94 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r1"
+PR = "r2"
 
 inherit gettext gconf
 
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index e612adb..7f0af9f 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r5"
+PR = "r6"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
-- 
1.7.8.6



