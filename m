Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19UliPWpKBwjI6Ybs/qbxQdc03tG0ccPdY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmXjq-0004gj-TU
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 23:03:27 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SKxBD8002622
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 15:59:12 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:59:08 -0500
Message-Id: <1311886748-17637-5-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311886748-17637-4-git-send-email-galak@kernel.crashing.org>
References: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-2-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-3-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-4-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 5/5] image-mklibs.bbclass: Add powerpc64 arch support
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
X-List-Received-Date: Thu, 28 Jul 2011 21:03:27 -0000

Just mimic what we do on powerpc (32-bit).

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/image-mklibs.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 9f5a4ea..d5e8ab7 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -16,7 +16,7 @@ mklibs_optimize_image_doit() {
 		> ${WORKDIR}/mklibs/executables.list
 
 	case ${TARGET_ARCH} in
-		powerpc | mips | microblaze )
+		powerpc | powerpc64 | mips | microblaze )
 			dynamic_loader="/lib/ld.so.1"
 			;;
 		x86_64)
-- 
1.7.3.4



