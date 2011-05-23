Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QOWeE-00062B-NS
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 17:02:22 +0200
Received: by wye20 with SMTP id 20so4698222wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 07:59:22 -0700 (PDT)
Received: by 10.227.200.138 with SMTP id ew10mr2350802wbb.21.1306162761870;
	Mon, 23 May 2011 07:59:21 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ca12sm4144261wbb.53.2011.05.23.07.59.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 07:59:21 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 16:59:17 +0200
Message-Id: <1306162757-12769-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] pulseaudio: package udev rules
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
X-List-Received-Date: Mon, 23 May 2011 15:02:22 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_0.9.15.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 78d790f..e46b716 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -69,7 +69,7 @@ FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la"
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin = "${bindir}/* \
                    ${sysconfdir}/default/volatiles/volatiles.04_pulse"
-FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl"
+FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl ${base_libdir}/udev/rules.d/*.rules"
 FILES_${PN}-gconf-helper = "${libexecdir}/pulse/gconf-helper"
 FILES_${PN}-misc = "${bindir}/*"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
index 7bac9f9..71e19e9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
@@ -1,7 +1,7 @@
 require pulseaudio.inc
 
 DEPENDS += "dbus gdbm speex"
-PR = "r14"
+PR = "r15"
 
 SRC_URI += "\
   file://buildfix.patch;patch=1 \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index 91893d7..863beda 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "gdbm speex"
 
-- 
1.6.6.1



