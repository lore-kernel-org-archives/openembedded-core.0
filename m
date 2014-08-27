Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9488A710C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:47:09 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 47C651FC6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 16:47:10 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 16:47:01 +0200
Message-Id: <1409150824-32683-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/4] gstreamer1.0-omx: Add DEPENDS on gstreamer1.0-plugins-bad
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
X-List-Received-Date: Wed, 27 Aug 2014 14:47:11 -0000

gst-omx links to libgstgl if it is present, and libgstgl is built by
gstreamer1.0-plugins-bad. Adding it as a DEPENDS ensures a proper
dependency is established.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index b423863..d698904 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -3,7 +3,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 RDEPENDS_${PN} = "libomxil"
 
 inherit autotools pkgconfig gettext
-- 
1.8.3.2


