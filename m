Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SSZkK-0007Xt-7h
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 22:13:56 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2012 22:03:57 +0200
Message-Id: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] e2fsprogs: fix packaging error for libext2fs
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
X-List-Received-Date: Thu, 10 May 2012 20:13:56 -0000

* libext2fs is located in base_libdir, not libdir

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
index 6df7cea..8d4443b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4 \
@@ -58,7 +58,7 @@ FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
 FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
 FILES_libss = "${base_libdir}/libss.so.*"
 FILES_libe2p = "${base_libdir}/libe2p.so.*"
-FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
+FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
 FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



