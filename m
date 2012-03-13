Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fdw-00011O-Bb
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:12 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cbVp004565 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mcw-2nFpOHEb
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:37 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cYnk004521
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:35 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVS-0002eA-C6
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:26 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:08 +0000
Message-Id: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/17] leafpad: Package currently unpackaged files.
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:12 -0000

This resolves the QA warning:

WARNING: For recipe leafpad, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/icons
WARNING:   /usr/share/icons/hicolor
WARNING:   /usr/share/icons/hicolor/16x16
WARNING:   /usr/share/icons/hicolor/22x22
WARNING:   /usr/share/icons/hicolor/scalable
WARNING:   /usr/share/icons/hicolor/32x32
WARNING:   /usr/share/icons/hicolor/24x24
WARNING:   /usr/share/icons/hicolor/16x16/apps
WARNING:   /usr/share/icons/hicolor/16x16/apps/leafpad.png
WARNING:   /usr/share/icons/hicolor/22x22/apps
WARNING:   /usr/share/icons/hicolor/22x22/apps/leafpad.png
WARNING:   /usr/share/icons/hicolor/scalable/apps
WARNING:   /usr/share/icons/hicolor/scalable/apps/leafpad.svg
WARNING:   /usr/share/icons/hicolor/32x32/apps
WARNING:   /usr/share/icons/hicolor/32x32/apps/leafpad.png
WARNING:   /usr/share/icons/hicolor/24x24/apps
WARNING:   /usr/share/icons/hicolor/24x24/apps/leafpad.png

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index 68402c5..3d1bc43 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Simple GTK+ Text Editor"
 HOMEPAGE = "http://tarot.freeshell.org/leafpad/"
-BUGTRACKER = ""
 
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -14,7 +13,7 @@ SRC_URI = "http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
 SRC_URI[sha256sum] = "959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
-PR = "r1"
+PR = "r2"
 
 SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
 
@@ -29,3 +28,6 @@ do_install_append () {
 }
 
 FILES_${PN} += "${datadir}/applications/leafpad.desktop"
+
+PACKAGES += "leafpad-stock-icons"
+FILES_leafpad-stock-icons = "${datadir}/icons/hicolor/"
-- 
1.7.5.4



