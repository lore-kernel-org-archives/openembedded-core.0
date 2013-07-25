Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 595CE60FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 10:01:21 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6PA1IKW026210; 
	Thu, 25 Jul 2013 05:01:20 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 15:02:04 +0500
Message-Id: <1374746524-18179-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] avahi: Remove unnecessary runtime dependency on sysvinit-pidof
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
X-List-Received-Date: Thu, 25 Jul 2013 10:01:22 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

'pidof' is alternatively coming from busybox so no need for avahi to explicitly
rdepend on sysvinit-pidof. This unnecessarily includes sysvinit in systemd only
build.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index c302f87..7bb5381 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -96,8 +96,6 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
-RDEPENDS_avahi-daemon = "sysvinit-pidof"
-
 # uclibc has no nss
 RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
 RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
-- 
1.7.9.5


