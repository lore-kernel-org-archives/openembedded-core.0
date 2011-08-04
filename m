Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18gvfUYKl/KiRv3h6FVsRehOcuk3jomjvk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QopDm-00059Q-De
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 06:07:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7443OwH006070
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 23:03:24 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:03:23 -0500
Message-Id: <1312430603-5629-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib
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
X-List-Received-Date: Thu, 04 Aug 2011 04:07:48 -0000

We might redefine ${base_libdir} from being set to just /lib.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/image-mklibs.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index d6630c4..69dac2f 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -17,19 +17,19 @@ mklibs_optimize_image_doit() {
 
 	case ${TARGET_ARCH} in
 		powerpc | mips | microblaze )
-			dynamic_loader="/lib/ld.so.1"
+			dynamic_loader="${base_libdir}/ld.so.1"
 			;;
 		powerpc64)
 			dynamic_loader="${base_libdir}/ld64.so.1"
 			;;
 		x86_64)
-			dynamic_loader="/lib/ld-linux-x86-64.so.2"
+			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
 			;;
 		i586 )
-			dynamic_loader="/lib/ld-linux.so.2"
+			dynamic_loader="${base_libdir}/ld-linux.so.2"
 			;;
 		arm )
-			dynamic_loader="/lib/ld-linux.so.3"
+			dynamic_loader="${base_libdir}/ld-linux.so.3"
 			;;
 		* )
 			dynamic_loader="/unknown_dynamic_linker"
-- 
1.7.3.4



