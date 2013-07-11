Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1020460687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:04:20 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 03:04:17 +0200
Message-Id: <1373504657-10575-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] qt4-x11-free: fix post-processing of QtWebKit.pc
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
X-List-Received-Date: Thu, 11 Jul 2013 01:04:20 -0000

Previously it worked for qt4-embedded only. qt4-x11-free has X11
libs between -lwebcore and -ljscore.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-qt/qt4/qt4.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 81866ea..6adc404 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -345,7 +345,8 @@ do_install() {
 			-e 's#" -Wl,-rpath-link,${S}/lib/\?"##g' \
 			-e 's#" -Wl,-rpath-link,${libdir}/\?"##g' \
 			-e 's#Iin#I${in#g' \
-			-e 's#-L\.\./\.\./WebCore/release\s\+-L\.\./\.\./JavaScriptCore/release\s\+-lwebcore\s\+-ljscore##g' \
+			-e 's#-L\.\./\.\./WebCore/release\s\+-L\.\./\.\./JavaScriptCore/release\s\+-lwebcore##g' \
+			-e 's#-ljscore##g' \
 			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
 
 	sed -i -e s#" -Wl,-rpath-link,${S}/lib"##g \
-- 
1.8.1.2


