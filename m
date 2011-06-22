Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREn-0007vg-H4
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPchw026809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:38 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:21 -0500
Message-ID: <4669faab9e2f6d477065839cb666ba5b5902fd55.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 27/40] gtk-sato-engine: Add missing debug files
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:15 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    2 +-
 .../gtk-engines/gtk-sato-engine_svn.bb             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index a7ebddf..8472ecb 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -11,7 +11,7 @@ RDEPENDS_gtk-theme-sato = "gtk-sato-engine"
 PACKAGES += "gtk-theme-sato"
 FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
 FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*"
-FILES_${PN}-dbg = "${libdir}/gtk-2.0/*/engines/.debug"
+FILES_${PN}-dbg += " ${libdir}/gtk-2.0/*/engines/.debug"
 FILES_gtk-theme-sato = "${datadir}/icons ${datadir}/themes"
 
 inherit autotools  pkgconfig
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
index 230ccbc..6099ae4 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRCREV = "163"
 PV = "0.3.2+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "svn://svn.o-hand.com/repos/sato/trunk;module=gtk-engine;proto=http"
 
-- 
1.7.3.4



