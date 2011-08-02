Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/sRkaNdsUhAQsjwyBvBm3LmS2kDkLmJtQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoKYQ-0004qH-D2
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 21:23:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72JIfCJ012383
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 14:18:41 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 14:18:40 -0500
Message-Id: <1312312720-20828-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune/arch-powerpc64: keep insync with arch-powerpc.inc
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
X-List-Received-Date: Tue, 02 Aug 2011 19:23:02 -0000

* Add DEFAULTTUNE setting
* Sync TUNE_PKGARCH with:
	commit 20f285728219c1efcc23d8e861902c212893c68d
	Author: Richard Purdie <richard.purdie@linuxfoundation.org>
	Date:   Tue Aug 2 12:40:06 2011 +0100

	    tune/ppc: Fix various TUNE_PKGARCH issues

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../machine/include/powerpc/arch-powerpc64.inc     |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index a965d59..daad355 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -1,8 +1,13 @@
+DEFAULTTUNE ?= "powerpc64"
+
 TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNE_CONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
 
+PPCPKGARCH = "${TUNE_ARCH}"
+TUNE_PKGARCH ?= "${PPCPKGARCH}"
+
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
-- 
1.7.3.4



