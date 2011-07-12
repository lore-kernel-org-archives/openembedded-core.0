Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qgek6-00026z-Rg
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 17:19:22 +0200
Received: by wwi18 with SMTP id 18so4099936wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 08:15:25 -0700 (PDT)
Received: by 10.216.221.33 with SMTP id q33mr4064568wep.90.1310483725439;
	Tue, 12 Jul 2011 08:15:25 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u64sm7617852weq.4.2011.07.12.08.15.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 08:15:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 17:15:20 +0200
Message-Id: <1310483720-11729-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] pulseaudio: enable bluetooth support
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
X-List-Received-Date: Tue, 12 Jul 2011 15:19:22 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 ++--
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a520343..4bb1c59 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://src/pulsecore/vector.h;beginline=1;endline=21;md5=1b561f0a2ca47b1fa49862a6ccaacff1"
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool virtual/libx11"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus consolekit"
+DEPENDS += "bluez4 udev alsa-lib glib-2.0 dbus consolekit"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch;patch=1 \
@@ -19,7 +19,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "\
 		--disable-lynx \
-		--disable-bluez \
+		--enable-bluez \
 		--disable-polkit \
 		--with-x \
 		--without-jack \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index 2757b32..da2e988 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS += "gdbm speex"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 8b96aed..1edd913 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS += "gdbm speex"
 
-- 
1.6.6.1



