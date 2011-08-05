Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpONn-0007hB-Sj
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 19:40:27 +0200
Received: by wwe32 with SMTP id 32so2312149wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 10:36:02 -0700 (PDT)
Received: by 10.216.162.211 with SMTP id y61mr2149681wek.19.1312565762793;
	Fri, 05 Aug 2011 10:36:02 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k17sm1170858wed.22.2011.08.05.10.36.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 10:36:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 19:35:57 +0200
Message-Id: <1312565757-730-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gtk-icon-cache bbclass: don't assing to global RDEPENDS
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
X-List-Received-Date: Fri, 05 Aug 2011 17:40:28 -0000

Only the package with the icons needs it

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/gtk-icon-cache.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 4142d0e..5d8ef34 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -37,9 +37,9 @@ python populate_packages_append () {
 			continue
 
 		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
-		rdepends = bb.data.getVar('RDEPENDS', d, 1)
+		rdepends = bb.data.getVar('RDEPENDS_%s' % pkg, d, 1)
 		rdepends += "hicolor-icon-theme"
-		bb.data.setVar('RDEPENDS', rdepends, d)
+		bb.data.setVar('RDEPENDS_%s' % pkg, rdepends, d)
 	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
 		
-- 
1.6.6.1



