Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6ctp-0002Ix-2R
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:36:46 +0200
Received: by fxi1 with SMTP id 1so2453886fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 23:31:26 -0700 (PDT)
Received: by 10.223.5.76 with SMTP id 12mr2458398fau.103.1316673085910;
	Wed, 21 Sep 2011 23:31:25 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e17sm6530710fae.17.2011.09.21.23.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 23:31:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 08:31:18 +0200
Message-Id: <1316673078-22962-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] avahi: fix avahi-systemd dependencies
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
X-List-Received-Date: Thu, 22 Sep 2011 06:36:46 -0000

During the avahi-ui split the RDEPENDS line got dropped leading to: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=ae0db0eb51bde42f09b9513842c3b745c37c60d5

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/avahi/avahi.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index c3c9c71..5ad9db0 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -78,6 +78,8 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
+RDEPENDS_avahi-systemd = "avahi-daemon"
+
 RDEPENDS_avahi-daemon = "sysvinit-pidof"
 
 # uclibc has no nss
-- 
1.6.6.1



