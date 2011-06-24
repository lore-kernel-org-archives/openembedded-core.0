Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qa6zi-0007n2-97
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 16:04:26 +0200
Received: by wyb34 with SMTP id 34so2204427wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 07:00:49 -0700 (PDT)
Received: by 10.216.173.14 with SMTP id u14mr722109wel.38.1308924047372;
	Fri, 24 Jun 2011 07:00:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 74sm1409906wem.17.2011.06.24.07.00.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 07:00:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2011 16:00:42 +0200
Message-Id: <1308924042-12173-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] webkit-gtk: fix packaging
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
X-List-Received-Date: Fri, 24 Jun 2011 14:04:26 -0000

Somewhere in the past webkit changed from webkit-x to webkitgtk-x but the person updating the recipe didn't catch that

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 6d134ad..af43ae8 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -14,7 +14,7 @@ SRCREV_FORMAT = "webcore-rwebkit"
 
 SRCREV = "72836"
 PV = "1.3.7+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
@@ -71,8 +71,9 @@ PACKAGES =+ "${PN}-webinspector ${PN}launcher-dbg ${PN}launcher libjavascriptcor
 FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libJavaScriptCore.so.*"
-FILES_${PN}-webinspector = "${datadir}/webkit-1.0/webinspector/"
-FILES_${PN} += "${datadir}/webkit-1.0/resources/error.html ${datadir}/webkit-1.0/images"
-
+FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
+FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
+                ${datadir}/webkitgtk-*/images \
+                ${datadir}/glib-2.0/schemas"
 
 
-- 
1.6.6.1



