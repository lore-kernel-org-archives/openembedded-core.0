Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/cqEy/4Xbm6umT6iK4UYKVNfSsZ1G2rls=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QosLi-0005Qk-NX
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 09:28:11 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p747NluJ006541
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 02:23:48 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 02:23:47 -0500
Message-Id: <1312442627-20579-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune/arch-powerpc64: include arch-powerpc.inc to keep things in sync
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
X-List-Received-Date: Thu, 04 Aug 2011 07:28:11 -0000

Added a DEFAULTTUNE setting and included arch-powerpc.inc.  This way we
pick up the changes to TUNE_PKGARCH and things should be kept more in
sync going forward.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../machine/include/powerpc/arch-powerpc64.inc     |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index a965d59..7ef8ddc 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -1,3 +1,7 @@
+DEFAULTTUNE ?= "powerpc64"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
 TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNE_CONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
-- 
1.7.3.4



