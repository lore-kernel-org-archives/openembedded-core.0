Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtkiC-0000Jy-Ir
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 19:51:48 +0100
Received: by eekd41 with SMTP id d41so1372935eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4mQUOKcnMHgW5+mET/VaImfHgDgwYh6rTCd+waLSiGw=;
	b=pao1/vHflS51KkBgygCrB/4N/b3SWU4gETVn6+qj/Frv+BMx/xVKDgMePB9qA8JHG+
	pVdk3IzDrresSsYqO2ZhZxp5Dr59QnjPBzoWx5EtlADHcludCCINzoMp+1ItQPq3KCg7
	gOaYZhcZLq3jmh6t7liBLv83lWbW32sPioitI=
Received: by 10.14.100.142 with SMTP id z14mr3739480eef.58.1328381029865;
	Sat, 04 Feb 2012 10:43:49 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n17sm38096348eei.3.2012.02.04.10.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 10:43:49 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Feb 2012 19:41:40 +0100
Message-Id: <1328380901-11856-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/2 v2] webkit-gtk: Fix error.html resource path.
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
X-List-Received-Date: Sat, 04 Feb 2012 18:51:48 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9652953..d754a39 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -14,7 +14,7 @@ SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
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



