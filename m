Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm5s0-0003Ji-So
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:18:00 +0200
Received: by wyg30 with SMTP id 30so1209914wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:13:46 -0700 (PDT)
Received: by 10.227.27.67 with SMTP id h3mr875480wbc.45.1311779626449;
	Wed, 27 Jul 2011 08:13:46 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fr7sm186120wbb.5.2011.07.27.08.13.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 08:13:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 17:13:39 +0200
Message-Id: <1311779619-28654-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] base bbclass: add TUNE_FEATURES to the default banner
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
X-List-Received-Date: Wed, 27 Jul 2011 15:18:01 -0000

This makes debugging the new tune code easier since it doesn't involve staring at 'bitbake -e' output anymore.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3ed1bb8..e41cce2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -173,7 +173,7 @@ python base_eventhandler() {
 
 	if name.startswith("BuildStarted"):
 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
-		statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
+		statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TUNE_FEATURES', 'TARGET_FPU']
 		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
 
 		layers = (data.getVar("BBLAYERS", e.data, 1) or "").split()
-- 
1.6.6.1



