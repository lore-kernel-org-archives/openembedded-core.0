Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJr0i-0007CY-Vr
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:46:17 +0200
Received: by wwb17 with SMTP id 17so5920220wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 10:43:31 -0700 (PDT)
Received: by 10.216.0.206 with SMTP id 56mr4150957web.112.1305049410730;
	Tue, 10 May 2011 10:43:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t5sm3659901wes.33.2011.05.10.10.43.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 10:43:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 19:43:22 +0200
Message-Id: <1305049402-31382-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] git: RDEPENDS are transitive, so remove tk so it builds with just OE-core
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
X-List-Received-Date: Tue, 10 May 2011 17:46:17 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/git/git.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 7f12859..9c7375f 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -41,7 +41,7 @@ RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
 # git-tk package with gitk and git-gui
 PACKAGES =+ "${PN}-tk"
-RDEPENDS_${PN}-tk = "${PN} tk tcl"
+#RDEPENDS_${PN}-tk = "${PN} tk tcl"
 EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
 FILES_${PN}-tk = " \
     ${bindir}/gitk \
-- 
1.6.6.1



