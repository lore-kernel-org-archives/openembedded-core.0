Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 61C8E6BB2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:43:11 +0000 (UTC)
Received: from soylentgreen.sue.net (unknown [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 1375A266C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 13:43:12 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 13:43:06 +0100
Message-Id: <1395751386-23529-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] Enable yasm in gstreamer1.0-libav by default
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
X-List-Received-Date: Tue, 25 Mar 2014 12:43:14 -0000

Since yasm has been moved to OE-core, there is no reason for not enabling
yasm by default anymore. It improves performance of gstreamer1.0-libav
considerably.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 784ddc3..84e6e95 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -10,7 +10,7 @@ inherit autotools pkgconfig
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
 # libav copy included in the gst-libav package.
-PACKAGECONFIG ??= " orc "
+PACKAGECONFIG ??= " orc yasm "
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
 PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
-- 
1.8.3.2


