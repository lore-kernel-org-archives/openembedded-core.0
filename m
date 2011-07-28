Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX181CLHIFZSjDrcFDUXTPuJdzHlrCkuKrL8=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmYUI-0005TW-PN
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 23:51:27 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SLl7op026484;
	Thu, 28 Jul 2011 16:47:08 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 16:47:07 -0500
Message-Id: <1311889627-28232-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune-ppce500mc: Adjust PowerPC e500mc tune file to correctly set hard fpu.
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
X-List-Received-Date: Thu, 28 Jul 2011 21:51:27 -0000

From: Malcolm Crossley <malcolm.crossley@ge.com>

Signed-off-by: Malcolm Crossley <malcolm.crossley@ge.com>
Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppce500mc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index a4cdb1f..73217dd 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -7,5 +7,5 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc
 TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
 
 AVAILTUNES += "ppce500mc"
-TUNE_FEATURES_tune-ppce500mc = "m32 hard-fpu ppce500mc"
+TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
-- 
1.7.3.4



