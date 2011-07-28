Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1//IgfTgfagOuhvoawTMyD8qQSVYYuh2cI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmXjp-0004gT-3A
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 23:03:25 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SKx9EB002590
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 15:59:10 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:59:05 -0500
Message-Id: <1311886748-17637-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
References: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 2/5] tune/arch-powerpc64: Remove support for soft-float from ppc64
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
X-List-Received-Date: Thu, 28 Jul 2011 21:03:25 -0000

All 64-bit PPC processors support hard-float so no need to support
soft-float.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../machine/include/powerpc/arch-powerpc64.inc     |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index e55910c..a965d59 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -1,10 +1,8 @@
 TUNEVALID[m64] = "Power ELF64 standard ABI"
-TUNE_CONFLICTS[m64] = "m32"
+TUNE_CONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
 
-AVAILTUNES += "powerpc64 powerpc64-nf"
+AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
-TUNE_FEATURES_tune-powerpc64-nf ?= "m64 fpu-soft"
-BASE_LIB_tune-powerpc64-nf = "lib64"
-- 
1.7.3.4



