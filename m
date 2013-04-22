Received: from bhuna.collabora.co.uk ([93.93.135.160])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.kiagiadakis@collabora.com>)
	id 1UUCB3-0007B0-UI for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:32:46 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: gkiagia) with ESMTPSA id 92F771698595
From: George Kiagiadakis <george.kiagiadakis@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:05:46 +0300
Message-Id: <1366617946-14627-1-git-send-email-george.kiagiadakis@collabora.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] pulseaudio: install alsa mixer data files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 08:32:47 -0000

These data files are required for module-alsa-card to load properly

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2f5a974..e4fc648 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,6 +147,7 @@ RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 
 FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_pulseaudio-module-bluetooth-proximity += "${libexecdir}/pulse/proximity-helper"
+FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
 
 RDEPENDS_pulseaudio-server += "\
         ${@base_contains('DISTRO_FEATURES', 'x11', 'pulseaudio-module-console-kit', '', d)}"
-- 
1.7.10.4



