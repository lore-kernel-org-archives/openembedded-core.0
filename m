Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUcui-0002aT-QR
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 12:56:36 +0200
Received: by wye20 with SMTP id 20so1121830wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 03:53:17 -0700 (PDT)
Received: by 10.227.55.6 with SMTP id s6mr621538wbg.112.1307616797242;
	Thu, 09 Jun 2011 03:53:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm1122231wbb.32.2011.06.09.03.53.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 03:53:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 12:53:13 +0200
Message-Id: <1307616793-10933-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] consolekit: update to 0.4.5
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
X-List-Received-Date: Thu, 09 Jun 2011 10:56:36 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/consolekit/consolekit_0.4.4.bb |   26 --------------------
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   25 +++++++++++++++++++
 2 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-support/consolekit/consolekit_0.4.4.bb
 create mode 100644 meta/recipes-support/consolekit/consolekit_0.4.5.bb

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.4.bb b/meta/recipes-support/consolekit/consolekit_0.4.4.bb
deleted file mode 100644
index 0aec639..0000000
--- a/meta/recipes-support/consolekit/consolekit_0.4.4.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login sessions, and seats."
-HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
-BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
-
-DEPENDS = "dbus"
-
-PR = "r0"
-
-inherit gnome
-
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2 \
-           file://nopolkit.patch"
-
-SRC_URI[md5sum] = "b57eb18eae8c4d3631d5f4f030218a29"
-SRC_URI[sha256sum] = "f0c00969fb6fe7d628071f0f43ac0d411982a5e798d7dc31747caa772c9716ae"
-S = "${WORKDIR}/ConsoleKit-${PV}"
-
-FILES_${PN} += "${libdir}/ConsoleKit ${datadir}/dbus-1 ${datadir}/PolicyKit"
-
-
-
-
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
new file mode 100644
index 0000000..f3b1ef8
--- /dev/null
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login sessions, and seats."
+HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
+BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
+
+DEPENDS = "dbus"
+
+inherit gnome
+
+SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2 \
+           file://nopolkit.patch"
+SRC_URI[md5sum] = "f2657f93761206922d558471a936fbc3"
+SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b223686b9c38"
+
+
+S = "${WORKDIR}/ConsoleKit-${PV}"
+
+EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/"
+
+FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit"
+
+
-- 
1.6.6.1



