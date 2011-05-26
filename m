Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPgUu-0004xV-Kw
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 21:45:32 +0200
Received: by wye20 with SMTP id 20so887337wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 12:42:28 -0700 (PDT)
Received: by 10.216.39.82 with SMTP id c60mr4182416web.30.1306438948385;
	Thu, 26 May 2011 12:42:28 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a1sm571936wek.22.2011.05.26.12.42.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 12:42:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 21:42:24 +0200
Message-Id: <1306438944-8656-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] x11-common: fix dbus-launch RDEPENDS
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
X-List-Received-Date: Thu, 26 May 2011 19:45:32 -0000

/usr/bin/dbus-launch is in the dbus-x11 packages, the dbus-launch package doesn't exist

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 10757ac..6951cf3 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and configuration files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r41"
+PR = "r43"
 
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
@@ -16,6 +16,6 @@ do_install() {
 	find ${D}/etc -type f -name \*~ -exec rm -rf {} \;
 }
 
-RDEPENDS_${PN} = "dbus-launch xmodmap xdpyinfo xtscal xinit formfactor"
+RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"
 PACKAGE_ARCH = "all"
 
-- 
1.6.6.1



