Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id D87F5606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:12:53 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BB738F811E2; Thu,  9 Apr 2015 06:12:54 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5F480F811D7;
	Thu,  9 Apr 2015 06:12:54 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 06:13:09 -0600
Message-Id: <1428581589-5734-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] gst-player: Fix typo
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
X-List-Received-Date: Thu, 09 Apr 2015 12:12:56 -0000

The subtitle (shown in desktop icon) should say
  Basic media player
    -not-
  Basic media plaer

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
index 9eb6ada..9fd207b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
+++ b/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
@@ -1,6 +1,6 @@
 [Desktop Entry]
 Name=Media Player
-Comment=Basic media plaer
+Comment=Basic media player
 Icon=audio-player
 TryExec=gtk-play
 Exec=gtk-play
-- 
1.9.1


