Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id F0E9E77050
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 7056B3C886A4
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:59:42 +0100
Message-Id: <d0e684246a2a6eb072b053e3dc59f9f89fe4f88a.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 5/9] pulseaudio: handle udev dir being 2 levels below /
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Sep 2015 15:00:09 -0000

When building with a merged /usr dir the udev directory
lives at /usr/lib/udev - update the FILES pattern to also
pick up udev files installed two levels below the / to
ensure a merged /usr works.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 27e05d3..5b806d7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -115,7 +115,7 @@ FILES_${PN}-dbg += "${libexecdir}/pulse/.debug \
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
-FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules ${systemd_user_unitdir}/*"
+FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 
 #SYSTEMD_PACKAGES = "${PN}-server"
 SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
-- 
2.1.4


