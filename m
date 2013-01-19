Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1TwUsj-0000y9-Nt
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 10:38:48 +0100
Received: from atl4mhob08.myregisteredsite.com
	(atl4mhob08.myregisteredsite.com [209.17.115.46])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0J9KN40030059 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 04:20:24 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0J9KMc5014858 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 04:20:22 -0500
Received: (qmail 850 invoked by uid 0); 19 Jan 2013 09:20:22 -0000
Received: from unknown (HELO phenom.lan) (mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 19 Jan 2013 09:20:22 -0000
From: mike.looijmans@topic.nl
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 10:20:15 +0100
Message-Id: <1358587215-23952-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.5.4
Cc: MiLo <milo-software@users.sourceforge.net>
Subject: [PATCH] pulseaudio: Pulseaudio DEPENDS on libjson
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
X-List-Received-Date: Sat, 19 Jan 2013 09:38:49 -0000

From: MiLo <milo-software@users.sourceforge.net>

The configure script tests for libjson's presence. The missing dependency
becomes apparent when building without x11 or gnome.

Signed-off-by: MiLo <milo-software@users.sourceforge.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6633e38..1fcc07c 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
-DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
+DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool libjson \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf \
-- 
1.7.5.4



