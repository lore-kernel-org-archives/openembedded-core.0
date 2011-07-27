Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm0mO-0005JR-Ty
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:51:53 +0200
Received: by wyg30 with SMTP id 30so980538wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 02:47:37 -0700 (PDT)
Received: by 10.216.158.77 with SMTP id p55mr2551334wek.26.1311760057485;
	Wed, 27 Jul 2011 02:47:37 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm1175472wbb.37.2011.07.27.02.47.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 02:47:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 11:47:33 +0200
Message-Id: <1311760053-15667-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] opkg svn: bump SRCREV to 625
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
X-List-Received-Date: Wed, 27 Jul 2011 09:51:53 -0000

tested on beagleboard/angstrom and qemuarm/angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/opkg/opkg_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5f07c17..099a373 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -15,7 +15,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "609"
+SRCREV = "625"
 PV = "0.1.8+svnr${SRCPV}"
 PR = "r2"
 
-- 
1.6.6.1



