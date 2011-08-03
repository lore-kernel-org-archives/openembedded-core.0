Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/i+KISRKDlebWtClSI2yOv2pGcZUNVM/E=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qodue-0001PJ-3W
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 18:03:16 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p73Fwsgs006317
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 10:58:54 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 10:58:54 -0500
Message-Id: <1312387134-18067-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] libmusicbrainz: utilize base_libdir when configured
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2011 16:03:16 -0000

Pass $base_libdir through when we configure to support a location
other than /lib.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../musicbrainz/libmusicbrainz_3.0.3.bb            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
index d6fb2f4..20080ee 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_3.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24 \
                     file://include/musicbrainz3/includes.h;beginline=1;endline=21;md5=9ab2846573f560cea7561da472803a72"
 DEPENDS = "expat neon"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://ftp.musicbrainz.org/pub/musicbrainz/${BPN}-${PV}.tar.gz \
            file://fix_build_issue_for_gcc_4.5.0.patch "
@@ -15,3 +15,5 @@ SRC_URI[md5sum] = "f4824d0a75bdeeef1e45cc88de7bb58a"
 SRC_URI[sha256sum] = "7fd459a9fd05be9faec60a9a21caa9a1e9fda03147d58d8c7c95f33582a738c5"
 
 inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DLIB_INSTALL_DIR=${base_libdir}"
-- 
1.7.3.4



