Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYH8o-0006vQ-Oq
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Jun 2011 14:30:14 +0200
Received: by wyb34 with SMTP id 34so844242wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2011 05:26:41 -0700 (PDT)
Received: by 10.227.132.210 with SMTP id c18mr3941283wbt.44.1308486393760;
	Sun, 19 Jun 2011 05:26:33 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm2382111wbb.0.2011.06.19.05.26.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Jun 2011 05:26:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2011 14:26:29 +0200
Message-Id: <1308486389-20638-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gnome-keyring 2.32.1: fix packaging
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
X-List-Received-Date: Sun, 19 Jun 2011 12:30:14 -0000

NOTE: package gnome-keyring-2.32.1-r1: task do_package: Started
WARNING: the following files were installed but not shipped in any package:

WARNING:   /usr/share/gcr/ui/gcr-import-dialog.ui
WARNING:   /usr/share/gcr/ui/gcr-certificate-basics-widget.ui
WARNING:   /usr/share/gcr/ui/gcr-unlock-options-widget.ui
WARNING:   /usr/lib/security/pam_gnome_keyring.so

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 5932ddd..3f38401 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools gnome pkgconfig
 
@@ -30,6 +30,6 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/org.gnome.keyring.service ${D}${datadir}/dbus-1/services
 }
 
-FILES_${PN} += "${datadir}/dbus-1/services"
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${libdir}/security/*.so"
 FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/"
 FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/"
-- 
1.6.6.1



