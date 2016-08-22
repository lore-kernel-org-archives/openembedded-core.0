Return-Path: <ml@embed.me.uk>
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 8023070034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:05:06 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id F360FDC8E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:05:05 +0000 (UTC)
From: Jack Mitchell <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 14:05:16 +0100
Message-Id: <20160822130516.5719-1-ml@embed.me.uk>
X-Mailer: git-send-email 2.9.3
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [PATCH] cmake: install path variables should be relative to the prefix path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 13:05:06 -0000

From: Jack Mitchell <jack@embed.me.uk>

---
 meta/classes/cmake.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index b18152a..2375d09 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -108,15 +108,15 @@ cmake_do_configure() {
 	  ${OECMAKE_SITEFILE} \
 	  ${OECMAKE_SOURCEPATH} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
-	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
-	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \
-	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir} \
-	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
-	  -DCMAKE_INSTALL_LIBDIR:PATH=${libdir} \
-	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir} \
-	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir} \
+	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir#${prefix}/} \
+	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir#${prefix}/} \
+	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir#${prefix}/} \
+	  -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir#${prefix}/} \
+	  -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${sharedstatedir#${prefix}/} \
+	  -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir#${prefix}/} \
+	  -DCMAKE_INSTALL_LIBDIR:PATH=${libdir#${prefix}/} \
+	  -DCMAKE_INSTALL_INCLUDEDIR:PATH=${includedir#${prefix}/} \
+	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${datadir#${prefix}/} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_VERBOSE_MAKEFILE=1 \
-- 
2.9.3


