Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX186c4cJLcFRxV4IfEr+wzlhfwPXl7Vl+88=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoU3A-0006PU-CT
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 07:31:24 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p735R25T017120
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 00:27:03 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 00:27:02 -0500
Message-Id: <1312349222-27254-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v2] image-mklibs.bbclass: Add powerpc64 arch support
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
X-List-Received-Date: Wed, 03 Aug 2011 05:31:24 -0000

powerp64 dynamic loader is 'ld64.so.1'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
* Use correct name of ppc64 dynamic loader
* user ${baselib} so if we are /lib or /lib64 things work

 meta/classes/image-mklibs.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 9f5a4ea..83f609c 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -19,6 +19,9 @@ mklibs_optimize_image_doit() {
 		powerpc | mips | microblaze )
 			dynamic_loader="/lib/ld.so.1"
 			;;
+		powerpc64)
+			dynamic_loader="/${baselib}/ld64.so.1"
+			;;
 		x86_64)
 			dynamic_loader="/lib/ld-linux-x86-64.so.2"
 			;;
-- 
1.7.3.4



