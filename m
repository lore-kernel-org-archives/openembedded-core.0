Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPWTx-0003SM-15
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 11:03:53 +0200
Received: by wwb17 with SMTP id 17so401996wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 02:00:49 -0700 (PDT)
Received: by 10.227.32.73 with SMTP id b9mr543851wbd.86.1306400449433;
	Thu, 26 May 2011 02:00:49 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm317380wbb.67.2011.05.26.02.00.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 02:00:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 11:00:40 +0200
Message-Id: <1306400440-10173-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1306400440-10173-2-git-send-email-koen@dominion.thruhere.net>
References: <1306400440-10173-1-git-send-email-koen@dominion.thruhere.net>
	<1306400440-10173-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/3] x11-common 0.1: add runtime dep on dbus-x11
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
X-List-Received-Date: Thu, 26 May 2011 09:03:53 -0000

dbus-launch moved into the dbus-x11 packages, so we need to drag it in.

Also reorder fields to better fit with the styleguide

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 2d49951..10757ac 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -2,19 +2,20 @@ DESCRIPTION = "Common X11 scripts and configuration files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-RDEPENDS_${PN} = "xmodmap xdpyinfo xtscal xinit formfactor"
-PR = "r40"
+PR = "r41"
 
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
 
 S = ${WORKDIR}
 
-PACKAGE_ARCH = "all"
-
 do_install() {
 	cp -R ${S}/etc ${D}/etc
 	chmod -R 755 ${D}/etc
 	find ${D}/etc -type d -name .svn -prune -exec rm -rf {} \;
 	find ${D}/etc -type f -name \*~ -exec rm -rf {} \;
 }
+
+RDEPENDS_${PN} = "dbus-launch xmodmap xdpyinfo xtscal xinit formfactor"
+PACKAGE_ARCH = "all"
+
-- 
1.6.6.1



