Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DFAF174702
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 08:11:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40751985"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2018 16:11:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DA794B41E7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:11:33 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 5 Jun 2018 16:11:38 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jun 2018 16:10:54 +0800
Message-ID: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 9DA794B41E7C.A06F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] bc:1.06 -> 1.07.1
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
X-List-Received-Date: Tue, 05 Jun 2018 08:11:43 -0000
Content-Type: text/plain

1.Upgrade bc from 1.06 to 1.07.1.
2.Update the checksum of LIC_FILES_CHKSUM, since GPLv3 has been added into the license of bc.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/bc/bc_1.06.bb   | 26 --------------------------
 meta/recipes-extended/bc/bc_1.07.1.bb | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/bc/bc_1.06.bb
 create mode 100644 meta/recipes-extended/bc/bc_1.07.1.bb

diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
deleted file mode 100644
index d8c8a86..0000000
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Arbitrary precision calculator language"
-HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
-
-LICENSE = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://bc/bcdefs.h;endline=31;md5=46dffdaf10a99728dd8ce358e45d46d8 \
-                    file://dc/dc.h;endline=25;md5=2f9c558cdd80e31b4d904e48c2374328 \
-                    file://lib/number.c;endline=31;md5=99434a0898abca7784acfd36b8191199"
-
-SECTION = "base"
-DEPENDS = "flex"
-PR = "r3"
-
-SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
-           file://fix-segment-fault.patch "
-
-SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
-SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
-
-inherit autotools texinfo update-alternatives
-
-ALTERNATIVE_${PN} = "dc"
-ALTERNATIVE_PRIORITY = "100"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
new file mode 100644
index 0000000..264d648
--- /dev/null
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Arbitrary precision calculator language"
+HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
+
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://bc/bcdefs.h;endline=31;md5=8c8b24c7a8dd453e1e310383190a8285 \
+                    file://dc/dc.h;endline=25;md5=636f7358bade791f26a8607a20da0eb7 \
+                    file://lib/number.c;endline=31;md5=5c437fc63f83a46d4d769d4dd1e74525"
+
+SECTION = "base"
+DEPENDS = "flex"
+PR = "r3"
+
+SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
+SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
+
+inherit autotools texinfo update-alternatives
+
+ALTERNATIVE_${PN} = "dc"
+ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4




