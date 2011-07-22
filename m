Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18h448yUYne6sGs6E7QDFF9uMFn+YiwSIc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkC2e-0004Xv-Ps
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:29:09 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M9OxIm003881
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 04:24:59 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 04:24:54 -0500
Message-Id: <1311326696-11745-4-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311326696-11745-3-git-send-email-galak@kernel.crashing.org>
References: <1311326696-11745-1-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-2-git-send-email-galak@kernel.crashing.org>
	<1311326696-11745-3-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 3/5] kernel-arch: Add handling of powerpc64
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
X-List-Received-Date: Fri, 22 Jul 2011 09:29:09 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/kernel-arch.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 86c15d3..225d599 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -6,7 +6,7 @@
 
 valid_archs = "alpha cris ia64 \
                i386 x86 \
-               m68knommu m68k ppc powerpc ppc64  \
+               m68knommu m68k ppc powerpc powerpc64 ppc64  \
 	       sparc sparc64 \
                arm  arm26 \
                m32r mips \
@@ -24,6 +24,7 @@ def map_kernel_arch(a, d):
 	elif re.match('arm26$', a):		        return 'arm26'
 	elif re.match('armeb$', a):		        return 'arm'
 	elif re.match('mipsel$', a):		        return 'mips'
+	elif re.match('p(pc|owerpc)(|64)', a):		return 'powerpc'
 	elif re.match('sh(3|4)$', a):		        return 'sh'
 	elif re.match('bfin', a):                       return 'blackfin'
 	elif re.match('microblazeel', a):               return 'microblaze'
@@ -36,7 +37,7 @@ export ARCH = "${@map_kernel_arch(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
 def map_uboot_arch(a, d):
 	import re
 
-	if   re.match('powerpc$', a): return 'ppc'
+	if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
 	elif re.match('i.86$', a): return 'x86'
 	return a
 
-- 
1.7.3.4



