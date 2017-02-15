Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id B495F772E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 16:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 1EBF61EE1005;
	Wed, 15 Feb 2017 17:21:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id tF3hDyGF6D6r; Wed, 15 Feb 2017 17:21:07 +0100 (CET)
Received: from Mirage.daviel.idf.intranet (fw-alt.idf.smile.fr
	[109.190.187.143])
	by idris.smile.fr (Postfix) with ESMTPA id E589C1EE0EC1;
	Wed, 15 Feb 2017 17:21:06 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 17:18:47 +0100
Message-Id: <20170215161849.7773-2-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170215161849.7773-1-geoffrey.levillain@smile.fr>
References: <20170215161849.7773-1-geoffrey.levillain@smile.fr>
Subject: [PATCH 1/3] No need to force image licence on MIT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2017 16:21:11 -0000

If there is a user-defined licence there is no need to enforce MIT
licence instead. Therefor we set MIT if there is no licence defined.

Note : It also permit to set the licence before inherit image
in overlayable images (where a licence is needed because of the files
associated to the image).

Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b5a4fb4a33..75c2860a75 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -9,7 +9,7 @@ TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 
-LICENSE = "MIT"
+LICENSE ?= "MIT"
 PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross depmodwrapper-cross"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
-- 
2.11.0


