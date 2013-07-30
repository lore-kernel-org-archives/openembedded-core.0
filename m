Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail.integraonline.com (relay2.integra.net [204.130.255.181])
	by mail.openembedded.org (Postfix) with SMTP id 0AE2D6B44C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 21:01:13 +0000 (UTC)
Received: (qmail 27751 invoked from network); 30 Jul 2013 21:01:11 -0000
Received: from unknown (HELO localhost.localdomain) (70.96.116.236)
	by relay2.integra.net with SMTP; 30 Jul 2013 21:01:11 -0000
From: Eric Nelson <eric.nelson@boundarydevices.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 14:01:07 -0700
Message-Id: <1375218067-27778-1-git-send-email-eric.nelson@boundarydevices.com>
X-Mailer: git-send-email 1.8.1.2
Cc: otavio@ossystems.com.br
Subject: [PATCH] gst-plugins-gl: add explicit dependency on libpng
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
X-List-Received-Date: Tue, 30 Jul 2013 21:01:13 -0000

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index a6c74fb..213e799 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c42
 
 SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
+DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng"
 
 inherit gettext gconf
 
-- 
1.8.1.2


