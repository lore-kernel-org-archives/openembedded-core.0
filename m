Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6225376F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:47:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5CC68608EEC
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 10:47:14 +0100
Message-Id: <eee0663a9fe5211b26d08b4b611c826d76905fde.1445334356.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 6/7] xserver-xorg: add Xwayland RRECOMMENDS
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
X-List-Received-Date: Tue, 20 Oct 2015 09:47:33 -0000

Xwayland has the same runtime dependencies as the standard
xserver so set RRECOMMENDS the same way.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 9881c94..30b3485 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -72,7 +72,9 @@ PACKAGES =+ "${PN}-security-policy \
 SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 INSANE_SKIP_xf86-video-modesetting = "xorg-driver-abi"
 
-RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
+XSERVER_RRECOMMENDS = "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
+RRECOMMENDS_${PN} += "${XSERVER_RRECOMMENDS}"
+RRECOMMENDS_${PN}-xwayland += "${XSERVER_RRECOMMENDS}"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
-- 
2.1.4


