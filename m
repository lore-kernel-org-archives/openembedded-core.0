Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-07.prod.phx3.secureserver.net
	(p3plsmtpa09-07.prod.phx3.secureserver.net [173.201.193.236])
	by mail.openembedded.org (Postfix) with ESMTP id 4A84560557
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Nov 2014 17:04:58 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-07.prod.phx3.secureserver.net with 
	id AH4w1p0070BVjqb01H4yW4; Sat, 01 Nov 2014 10:04:59 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Nov 2014 12:04:37 -0500
Message-Id: <1414861479-5493-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1414861479-5493-1-git-send-email-pab@pabigot.com>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 1/3] pseudo: default --without-passwd-fallback
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
X-List-Received-Date: Sat, 01 Nov 2014 17:05:00 -0000

No good reason exists to fall back to the build host /etc files when
attempting to resolve user and group information.  Recipe dependencies
should be updated so the correct target files are available.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
index 78eeedf..fb85f89 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
@@ -10,4 +10,4 @@ SRC_URI = " \
 SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
 SRC_URI[sha256sum] = "c72be92689511ced7c419149c6aaa1b1a9e4dfc6409d1f16ab72cc35bc1e376a"
 
-PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
-- 
1.8.5.5


