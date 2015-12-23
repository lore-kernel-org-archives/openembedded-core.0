Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 540 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Dec 2015 08:14:49 UTC
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 721EF60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 08:14:49 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 44A6F280060;
	Wed, 23 Dec 2015 09:05:49 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 09:05:46 +0100
Message-Id: <1450857946-8428-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] libav: Add "--enable-gpl" to PACKAGECONFIG[x264]
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
X-List-Received-Date: Wed, 23 Dec 2015 08:14:50 -0000

Building libav resulted in the following message during configure:
  libx264 is gpl and --enable-gpl is not specified.
Resolve it by adding --enable-gpl to the x264 package config.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-multimedia/libav/libav.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 05b7e87..8ae6739 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -52,7 +52,7 @@ PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
-PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+PACKAGECONFIG[x264] = "--enable-gpl --enable-libx264,--disable-libx264,x264"
 
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
-- 
2.1.4


