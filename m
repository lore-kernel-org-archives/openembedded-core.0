Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3772365DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1cg009452; Tue, 4 Nov 2014 11:39:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZGprymWdvtxZ; Tue,  4 Nov 2014 11:39:01 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4BcdgK009419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS5-0000J3-Ao; Tue, 04 Nov 2014 11:39:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:01 +0000
Message-Id: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH 1/8] nasm: 2.11.05 -> 2.11.06
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:40 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/nasm_2.11.05.bb | 29 -----------------------------
 meta/recipes-devtools/nasm/nasm_2.11.06.bb | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm_2.11.05.bb
 create mode 100644 meta/recipes-devtools/nasm/nasm_2.11.06.bb

diff --git a/meta/recipes-devtools/nasm/nasm_2.11.05.bb b/meta/recipes-devtools/nasm/nasm_2.11.05.bb
deleted file mode 100644
index fbfd585..0000000
--- a/meta/recipes-devtools/nasm/nasm_2.11.05.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "General-purpose x86 assembler"
-SECTION = "devel"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
-COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
-
-
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "f6b1db2858cad82bbb0c8c6f3e2b0fb2"
-SRC_URI[sha256sum] = "4a417bcf5cde5d203e228feea3f428a6ff4d700d558e4d79d50a30a695bdfae9"
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
diff --git a/meta/recipes-devtools/nasm/nasm_2.11.06.bb b/meta/recipes-devtools/nasm/nasm_2.11.06.bb
new file mode 100644
index 0000000..4a69a6a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm_2.11.06.bb
@@ -0,0 +1,29 @@
+SUMMARY = "General-purpose x86 assembler"
+SECTION = "devel"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
+COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
+
+
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
+SRC_URI[md5sum] = "9d93e8df5f5c005567f47ed6ca3a93d4"
+SRC_URI[sha256sum] = "87b6d97d6981ca468f9dafda44cf1bb1ba122cec329d4d389af5db04fa0c3e6c"
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
2.0.2


