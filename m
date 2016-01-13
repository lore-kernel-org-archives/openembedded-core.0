Return-Path: <rah@fern.h.settrans.net>
X-Greylist: delayed 954 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Jan 2016 11:50:29 UTC
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id 2599C60588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 11:50:29 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1aJJhC-0007wO-QS for openembedded-core@lists.openembedded.org;
	Wed, 13 Jan 2016 11:34:34 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>) id 1aJJhB-0002UI-RF
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jan 2016 11:34:33 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id CBD60B40E59; Wed, 13 Jan 2016 11:34:33 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 11:34:33 +0000
Message-Id: <1452684873-15629-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xserver-xorg: ensure xkbcomp is present for xwayland-only installs
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
X-List-Received-Date: Wed, 13 Jan 2016 11:50:30 -0000

Add appropriate RRECOMMENDS for Xwayland runtime dependencies.

Co-Authored-By: Joshua Lock <joshua.lock@collabora.co.uk>
Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 9881c94..8707e34 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -73,6 +73,7 @@ SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 INSANE_SKIP_xf86-video-modesetting = "xorg-driver-abi"
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
+RRECOMMENDS_${PN}-xwayland += "xkeyboard-config rgb xserver-xf86-config xkbcomp"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
-- 
2.1.4


