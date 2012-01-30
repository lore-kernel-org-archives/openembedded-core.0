Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RruZ0-0000xb-FN
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 17:58:42 +0100
Received: by wgbdt11 with SMTP id dt11so4295963wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:50:49 -0800 (PST)
Received: by 10.180.106.33 with SMTP id gr1mr28675037wib.6.1327942208713;
	Mon, 30 Jan 2012 08:50:08 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fr8sm54024311wib.10.2012.01.30.08.50.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 08:50:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 17:49:58 +0100
Message-Id: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] alsa-state: fix RDEPENDS assignment
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
X-List-Received-Date: Mon, 30 Jan 2012 16:58:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index bc17b25..83c9faa 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -10,7 +10,7 @@ sound state at system boot and save it at system shut down."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "0.2.0"
-PR = "r0"
+PR = "r2"
 
 SRC_URI = "\
   file://asound.conf \
@@ -18,8 +18,6 @@ SRC_URI = "\
   file://alsa-state \
 "
 
-RDEPENDS = "alsa-utils-alsactl"
-
 inherit update-rc.d
 
 INITSCRIPT_NAME = "alsa-state"
@@ -39,6 +37,7 @@ PACKAGES += "alsa-states"
 
 RRECOMMENDS_alsa-state = "alsa-states"
 
+RDEPENDS_${PN} = "alsa-utils-alsactl"
 FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
 CONFFILES_${PN} = "${sysconfdir}/asound.conf"
 
-- 
1.7.2.5



