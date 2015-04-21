Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 531 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Apr 2015 13:42:58 UTC
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.61])
	by mail.openembedded.org (Postfix) with ESMTP id 8B41E65CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:42:58 +0000 (UTC)
Received: from atl4mhob03.myregisteredsite.com
	(atl4mhob03.myregisteredsite.com [209.17.115.41])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t3LDY9RP002924 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:34:10 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t3LDY6ff003013 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:34:06 -0400
Received: (qmail 24991 invoked by uid 0); 21 Apr 2015 13:34:06 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 21 Apr 2015 13:34:05 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 15:33:44 +0200
Message-Id: <1429623224-28512-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] alsa-utils: Remove double dependency on udev
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
X-List-Received-Date: Tue, 21 Apr 2015 13:43:00 -0000

"udev" is already added when PACKAGECONFIG includes it, so it should
not be in the DEPENDS list on itself.

This caused udev to be built for systems that don't use it.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index ac5512a..506698e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
-DEPENDS = "alsa-lib ncurses libsamplerate0 udev"
+DEPENDS = "alsa-lib ncurses libsamplerate0"
 
 PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
-- 
1.9.1


