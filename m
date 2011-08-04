Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX199xaLq3lkcoLXp1aMQ0ymrFABuLLnH+YM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QosQE-0005ZL-Ip
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 09:32:51 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p747SSap008894
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 02:28:28 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 02:28:27 -0500
Message-Id: <1312442907-21017-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1312442907-21017-1-git-send-email-galak@kernel.crashing.org>
References: <1312442907-21017-1-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 2/2] arch-powerpc64: set BASE_LIB to 'lib64'
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
X-List-Received-Date: Thu, 04 Aug 2011 07:32:51 -0000

Default baselib location on ppc64 to 'lib64'.  This matches what other
Linux ppc64 distro's have done to date and keeps thing in sync for the
multilib case.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 7ef8ddc..7681eae 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -10,3 +10,4 @@ TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "",
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
+BASE_LIB = "lib64"
-- 
1.7.3.4



