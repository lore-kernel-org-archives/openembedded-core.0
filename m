Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgxFS-0001sY-Ar
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:04:58 +0200
Received: by wwi18 with SMTP id 18so4746033wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 04:01:00 -0700 (PDT)
Received: by 10.216.235.83 with SMTP id t61mr809789weq.112.1310554394157;
	Wed, 13 Jul 2011 03:53:14 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z83sm5103890weq.44.2011.07.13.03.53.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 03:53:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:53:08 +0200
Message-Id: <1310554388-28844-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1310554388-28844-1-git-send-email-koen@dominion.thruhere.net>
References: <1310554388-28844-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] connman-gnome: run oe-stylize over recipe
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
X-List-Received-Date: Wed, 13 Jul 2011 11:04:58 -0000

Variable ordering changed slightly and the RRECOMMENDS line is broken up, no functional changes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../connman/connman-gnome_0.5.bb                   |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index 69c5930..416fa4b 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -5,10 +5,10 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
+
 DEPENDS = "gtk+ dbus"
-PR = "r6"
 
-RRECOMMENDS_${PN} = "python python-dbus connman connman-plugin-ethernet connman-plugin-loopback connman-plugin-udhcp connman-plugin-wifi connman-plugin-fake connman-plugin-bluetooth connman-plugin-dnsproxy connman-plugin-ofono"
+PR = "r6"
 
 SRCREV = "78d3c39db6f3f7977b466305110faa8ca5f74ec8"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git \
@@ -17,3 +17,16 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protoc
 S = "${WORKDIR}/git"
 
 inherit autotools gtk-icon-cache
+
+RRECOMMENDS_${PN} = "python  \
+                     python-dbus \
+                     connman \
+                     connman-plugin-ethernet \
+                     connman-plugin-loopback \
+                     connman-plugin-udhcp \
+                     connman-plugin-wifi \
+                     connman-plugin-fake \
+                     connman-plugin-bluetooth \
+                     connman-plugin-dnsproxy \
+                     connman-plugin-ofono \
+                    "
-- 
1.6.6.1



