Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPgS8-0004uX-WA
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 21:42:41 +0200
Received: by wwb17 with SMTP id 17so962278wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 12:39:37 -0700 (PDT)
Received: by 10.227.11.67 with SMTP id s3mr1251179wbs.62.1306438776834;
	Thu, 26 May 2011 12:39:36 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm697314wbh.59.2011.05.26.12.39.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 12:39:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 21:39:32 +0200
Message-Id: <1306438772-8066-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] dbus: clean up dbus-x11 packaging
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
X-List-Received-Date: Thu, 26 May 2011 19:42:41 -0000

Martin Jansa spotted some differences with OE dev, which this commit fixes:

 * dbus-launch is mentioned twice in FILES
 * dbus-x11 should drag in dbus-1

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/dbus.inc      |    2 +-
 meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8275a1b..74be30f 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -24,12 +24,12 @@ DEBIANNAME_${PN} = "dbus-1"
 PACKAGES =+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
 
 FILES_${PN}-x11 = "${bindir}/dbus-launch"
+RDEPENDS_${PN}-x11 "${PN}"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
 
 FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-uuidgen \
-               ${bindir}/dbus-launch \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
                ${bindir}/dbus-monitor \
diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
index 00720fd..1c8aeaa 100644
--- a/meta/recipes-core/dbus/dbus_1.4.1.bb
+++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
@@ -1,6 +1,6 @@
 include dbus.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
 SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
-- 
1.6.6.1



