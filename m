Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3544E78745
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:22:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFMV46021245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:22:32 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpXr-0004j1-Mz; Wed, 17 Jan 2018 15:22:31 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:22:26 +0000
Message-Id: <1516202549-18121-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/4] nasm: upgrade 2.13.01 -> 2.13.02
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
X-List-Received-Date: Wed, 17 Jan 2018 15:22:34 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/nasm_2.13.01.bb | 28 ----------------------------
 meta/recipes-devtools/nasm/nasm_2.13.02.bb | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm_2.13.01.bb
 create mode 100644 meta/recipes-devtools/nasm/nasm_2.13.02.bb

diff --git a/meta/recipes-devtools/nasm/nasm_2.13.01.bb b/meta/recipes-devtools/nasm/nasm_2.13.01.bb
deleted file mode 100644
index bf18cd6..0000000
--- a/meta/recipes-devtools/nasm/nasm_2.13.01.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "General-purpose x86 assembler"
-SECTION = "devel"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
-
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-
-SRC_URI[md5sum] = "1f7d4662040d24351df7d6719ed4f97a"
-SRC_URI[sha256sum] = "08f97baf0a7f892128c6413cfa93b69dc5825fbbd06c70928aea028835d198fa"
-
-inherit autotools-brokensep
-
-do_configure_prepend () {
-	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
-		mv ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${mandir}/man1
-
-	oe_runmake 'INSTALLROOT=${D}' install
-}
-
-BBCLASSEXTEND = "native"
-
-DEPENDS = "groff-native"
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.02.bb b/meta/recipes-devtools/nasm/nasm_2.13.02.bb
new file mode 100644
index 0000000..15672ab
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm_2.13.02.bb
@@ -0,0 +1,28 @@
+SUMMARY = "General-purpose x86 assembler"
+SECTION = "devel"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
+
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
+
+SRC_URI[md5sum] = "f301c7ce89f28af9319edaf917365f61"
+SRC_URI[sha256sum] = "8d3028d286be7c185ba6ae4c8a692fc5438c129b2a3ffad60cbdcedd2793bbbe"
+
+inherit autotools-brokensep
+
+do_configure_prepend () {
+	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
+		mv ${S}/aclocal.m4 ${S}/acinclude.m4
+	fi
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -d ${D}${mandir}/man1
+
+	oe_runmake 'INSTALLROOT=${D}' install
+}
+
+BBCLASSEXTEND = "native"
+
+DEPENDS = "groff-native"
-- 
2.7.4


