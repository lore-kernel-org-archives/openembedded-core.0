Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18Dxwg9Fy5fk6vcJyRMhL/vBZR1Akui0DM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QopDd-00057z-7Z
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 06:07:37 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7443Ege005987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 23:03:15 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:03:14 -0500
Message-Id: <1312430594-5605-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v3] image-mklibs.bbclass: Add powerpc64 arch support
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
X-List-Received-Date: Thu, 04 Aug 2011 04:07:37 -0000

powerp64 dynamic loader is 'ld64.so.1'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
v2: 
* Use correct name of ppc64 dynamic loader
* user ${baselib} so if we are /lib or /lib64 things work

v3:
* use base_libdir instead of baselib

 meta/classes/image-mklibs.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 9f5a4ea..d6630c4 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -19,6 +19,9 @@ mklibs_optimize_image_doit() {
 		powerpc | mips | microblaze )
 			dynamic_loader="/lib/ld.so.1"
 			;;
+		powerpc64)
+			dynamic_loader="${base_libdir}/ld64.so.1"
+			;;
 		x86_64)
 			dynamic_loader="/lib/ld-linux-x86-64.so.2"
 			;;
-- 
1.7.3.4



