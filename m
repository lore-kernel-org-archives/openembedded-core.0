Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWy-0006xv-R5
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 17B8F31335; Tue,  5 Jul 2011 23:51:26 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:12 +0100
Message-Id: <d181003d0a1427af76e3751b2ba5d407aa3b871e.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/17] gtk-engines: Package unpackaged files
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gtk-engines/gtk-engines_2.20.2.bb              |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 85c38e2..bbf52be 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/base"
 DEPENDS = "gtk+"
 
-PR = "r0"
+PR = "r1"
 
 PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
 
@@ -21,6 +21,9 @@ RDEPENDS_gtk-theme-thinice = "gtk-engine-thinice"
 RDEPENDS_gtk-theme-industrial = "gtk-engine-industrial"
 RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
 
+FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
+
 CFLAGS_prepend = "-DHAVE_ANIMATION "
 
 inherit gnome
-- 
1.7.4.1



