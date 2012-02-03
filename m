Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtSmO-0003lS-L7
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 00:42:56 +0100
Received: by eaal10 with SMTP id l10so912733eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 15:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dpxXnMPa0InuyST0LqchRGSh3H48anReh1c3hkVrGdo=;
	b=en4bNITSLtGUOdFJsozUTQRiiyp4GbGFEDuWVDhRW8/osKatjSAasHkDA+GZokIm2h
	03s/gCtrbqjfS2UBJKq9sTNAHGLcLXDeTN9nj/WCBwuwUGnHGd3AnfsfeTVRcyPTuSSa
	8HM8iuO6sqi0NKsg93iqDL/afVqoIGUx/UKDU=
Received: by 10.213.110.15 with SMTP id l15mr1516850ebp.62.1328312098916;
	Fri, 03 Feb 2012 15:34:58 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n56sm27553559eeh.6.2012.02.03.15.34.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 15:34:58 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Feb 2012 00:32:50 +0100
Message-Id: <1328311971-2340-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/2] webkit-gtk: Fix error.html resource path.
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
X-List-Received-Date: Fri, 03 Feb 2012 23:42:56 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9652953..92ceb50 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -81,7 +81,7 @@ FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
 FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
-FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
+FILES_${PN} += "${datadir}/webkitgtk-*/resources/error.html \
                 ${datadir}/webkitgtk-*/images \
                 ${datadir}/glib-2.0/schemas"
 
-- 
1.7.3.4



