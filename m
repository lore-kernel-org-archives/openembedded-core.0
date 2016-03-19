Return-Path: <mike.looijmans@topic.nl>
Received: from smtp05.mail.online.nl (smtp05.mail.online.nl [194.134.25.75])
	by mail.openembedded.org (Postfix) with ESMTP id 174B56FFC8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 09:13:00 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp05.mail.online.nl (Postfix) with ESMTP id 99D57200018;
	Sat, 19 Mar 2016 10:12:58 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Mar 2016 10:12:50 +0100
Message-Id: <1458378770-18675-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] ffmpeg: Remove RSUGGEST=mplayer
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
X-List-Received-Date: Sat, 19 Mar 2016 09:13:06 -0000

This line causes 'mplayer' to be built unless one explicitly removes it.
There are plenty uses for ffmpeg that don't involve a player, so the
"suggestion" doesn't make sense.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index 036d4f1..7dfcf09 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -80,7 +80,6 @@ do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
 
-RSUGGESTS_${PN} = "mplayer"
 PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
 
 python populate_packages_prepend() {
-- 
2.1.4


