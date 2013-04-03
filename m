Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNPHb-000138-HL
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:07:32 +0200
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 4934A20C7F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2013 16:50:18 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 16:50:14 +0200
Message-Id: <1365000614-14952-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.2
Subject: [oe][PATCH v2] gst-ffmpeg: configure-fix patch used wrong test
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
X-List-Received-Date: Wed, 03 Apr 2013 15:07:36 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
index 81029ca..2bb124b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
@@ -11,7 +11,7 @@ diff -r f2f8f74c6e30 configure.ac
          --enable-gpl"
    fi
  
-+  if test "x$disable_yasm" != "xyes"; then
++  if test "x$disable_yasm" = "xyes"; then
 +    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
 +  fi
 +
-- 
1.8.2



