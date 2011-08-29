Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1Qy1jO-0001Fl-KH
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:18:26 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so4557138fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=RXwkFyEwkMGZP17+HsqtTaDrFqYMz7IxUXUjtnpt3OE=;
	b=YGj0pCjoEdkrovetPLgxJ/3+8gtuo9GQlWnvTXdzuN6N/C6U5t45GE18ogEsSerDbt
	17oXflSCCVVRItucM6arnyTu0BvWPlXGGIOUDF8dXNDd07pcV4QaCt49HoZzbZ4dyyT8
	Lav4+dGGv9XUKLBLdmu0UgVtZvoYgHDwE4kl4=
Received: by 10.223.17.136 with SMTP id s8mr2377226faa.148.1314623616923;
	Mon, 29 Aug 2011 06:13:36 -0700 (PDT)
Received: from localhost.localdomain (esq70.neoplus.adsl.tpnet.pl
	[83.20.136.70])
	by mx.google.com with ESMTPS id p3sm3750918faa.33.2011.08.29.06.13.35
	(version=SSLv3 cipher=OTHER); Mon, 29 Aug 2011 06:13:36 -0700 (PDT)
Sender: Sebastian Krzyszkowiak <seba.dos1@gmail.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:13:32 +0200
Message-Id: <1314623612-17596-1-git-send-email-dos@dosowisko.net>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gdb: upgrade from 7.3 to 7.3a
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
X-List-Received-Date: Mon, 29 Aug 2011 13:18:26 -0000

* because 7.3 archive is not fetchable anymore

Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>
---
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 +++---
 .../recipes-devtools/gdb/gdb-cross-canadian_7.3.bb |    7 -------
 .../gdb/gdb-cross-canadian_7.3a.bb                 |    7 +++++++
 meta/recipes-devtools/gdb/gdb-cross_7.3.bb         |    6 ------
 meta/recipes-devtools/gdb/gdb-cross_7.3a.bb        |    6 ++++++
 meta/recipes-devtools/gdb/gdb_7.3.bb               |    8 --------
 meta/recipes-devtools/gdb/gdb_7.3a.bb              |    8 ++++++++
 7 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.3.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.3a.bb
 delete mode 100644 meta/recipes-devtools/gdb/gdb_7.3.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb_7.3a.bb

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 9879e97..074f913 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -22,8 +22,8 @@ inherit autotools
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
            file://no-werror.patch"
 
-SRC_URI[md5sum] = "1d6b4e469270433583ef62a906c02fa8"
-SRC_URI[sha256sum] = "d1791d1f9d6c21ec265f4f74dadc15bc35698158a1b836d1626b9a69b818f5c5"
+SRC_URI[md5sum] = "9443a370dabd9ca9c41b496b59f05145"
+SRC_URI[sha256sum] = "2c2b26eea33ab477ea1f7739a8e511b1e8d89b6f74d87cdd510c6262a3af82d7"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb
deleted file mode 100644
index 58c20c4..0000000
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require gdb-common.inc
-require gdb-cross-canadian.inc
-
-PR = "${INC_PR}.0"
-
-GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-EXPAT = "--with-expat"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
new file mode 100644
index 0000000..58c20c4
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
@@ -0,0 +1,7 @@
+require gdb-common.inc
+require gdb-cross-canadian.inc
+
+PR = "${INC_PR}.0"
+
+GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
+EXPAT = "--with-expat"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.3.bb b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
deleted file mode 100644
index 587d518..0000000
--- a/meta/recipes-devtools/gdb/gdb-cross_7.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gdb-cross.inc
-
-SRC_URI += "file://sim-install-6.6.patch"
-EXPAT = "--with-expat"
-
-PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.3a.bb b/meta/recipes-devtools/gdb/gdb-cross_7.3a.bb
new file mode 100644
index 0000000..587d518
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.3a.bb
@@ -0,0 +1,6 @@
+require gdb-cross.inc
+
+SRC_URI += "file://sim-install-6.6.patch"
+EXPAT = "--with-expat"
+
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/gdb/gdb_7.3.bb b/meta/recipes-devtools/gdb/gdb_7.3.bb
deleted file mode 100644
index 5e21858..0000000
--- a/meta/recipes-devtools/gdb/gdb_7.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gdb.inc
-LICENSE="GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-PR = "${INC_PR}.0"
-
diff --git a/meta/recipes-devtools/gdb/gdb_7.3a.bb b/meta/recipes-devtools/gdb/gdb_7.3a.bb
new file mode 100644
index 0000000..5e21858
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb_7.3a.bb
@@ -0,0 +1,8 @@
+require gdb.inc
+LICENSE="GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+PR = "${INC_PR}.0"
+
-- 
1.7.5.4



