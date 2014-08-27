Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9563C7114D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:47:10 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 4C85B2365E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 16:47:11 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 16:47:04 +0200
Message-Id: <1409150824-32683-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409150824-32683-1-git-send-email-dv@pseudoterminal.org>
References: <1409150824-32683-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 4/4] gstreamer1.0-plugins-bad: Add DEPENDS on jpeg
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

libjpeg is automatically linked to if present. This cannot be turned off.
Adding DEPENDS on jpeg ensures that a proper dependency is established.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 055eed2..fb31293 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -2,7 +2,7 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
 
-DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng"
+DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng jpeg"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.8.3.2


