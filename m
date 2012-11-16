Received: from smarthost.techfak.uni-bielefeld.de ([129.70.137.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@herbrechtsmeier.net>) id 1TZJXT-0005mJ-Qu
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 11:52:48 +0100
Received: from localhost.localdomain (sarotti.TechFak.Uni-Bielefeld.DE
	[129.70.144.156])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	952FC80029; Fri, 16 Nov 2012 11:29:16 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 11:28:49 +0100
Message-Id: <1353061729-28868-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.0.4
Cc: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
Subject: [PATCH] distutils-common-base: Create staticdev pacakge for static libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2012 10:52:48 -0000

From: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 meta/classes/distutils-common-base.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index f66a5cd..9a608eb 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -5,10 +5,13 @@ EXTRA_OEMAKE = ""
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
+PACKAGES = "${PN}-staticdev ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
 
 FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
+FILES_${PN}-staticdev += "\
+  ${PYTHON_SITEPACKAGES_DIR}/*.a \
+"
 FILES_${PN}-dev += "\
   ${datadir}/pkgconfig \
   ${libdir}/pkgconfig \
-- 
1.7.0.4



