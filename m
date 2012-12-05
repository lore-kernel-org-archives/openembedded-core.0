Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TgGiA-0006mk-Sx
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:16:38 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qB5F26FE004726;
	Wed, 5 Dec 2012 09:02:07 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 20:02:10 +0500
Message-Id: <1354719730-25300-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] zip: Remove QA warnings: No GNU_HASH in the elf binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 15:16:38 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Update the LFLAGS1 in the Makefile to remove warnings:
QA Issue: No GNU_HASH in the elf binary

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-extended/zip/zip.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
index a3bbc93..265d9a8 100644
--- a/meta/recipes-extended/zip/zip.inc
+++ b/meta/recipes-extended/zip/zip.inc
@@ -12,6 +12,8 @@ EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
 		'BINFLAGS=0755' 'INSTALL_D=install -d'"
 
 do_compile() {
+	oe_runmake -f unix/Makefile flags
+	sed -i 's#LFLAGS1=""#LFLAGS1="${LDFLAGS}"#' flags
 	oe_runmake -f unix/Makefile generic
 }
 
-- 
1.7.9.5



