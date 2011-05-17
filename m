Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMGvd-0007IM-Rw
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:51:01 +0200
Received: by wwb17 with SMTP id 17so294672wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 02:48:08 -0700 (PDT)
Received: by 10.227.29.27 with SMTP id o27mr437492wbc.16.1305625688129;
	Tue, 17 May 2011 02:48:08 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm215056wbb.48.2011.05.17.02.48.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 02:48:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2011 11:47:53 +0200
Message-Id: <1305625673-28395-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] license bbclass: put licenses in DEPLOY_DIR/licenses to avoid sstate problems when MACHINE is part of DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Tue, 17 May 2011 09:51:01 -0000

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/002535.html for more info.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d0a1418..4fd1f85 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -8,7 +8,7 @@
 #  licenses.conf and compare them to the license names in the recipes. You'll see some
 #  differences and that should be corrected.
 
-LICENSE_DIRECTORY ??= "${DEPLOY_DIR_IMAGE}/licenses"
+LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"
 
 addtask populate_lic after do_patch before do_package 
-- 
1.6.6.1



