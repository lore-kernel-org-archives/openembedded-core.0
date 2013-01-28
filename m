Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4k-0003nR-Q4
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769989"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:55 -0800
Message-Id: <14f408c0ce7205dbbfffee0990b5000f2830ba21.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 08/13] file: Update to 5.12
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:46 -0000

Remove the backported automake patch, now fixed upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../file/file/obsolete_automake_macros.patch              | 15 ---------------
 meta/recipes-devtools/file/{file_5.11.bb => file_5.12.bb} |  7 +++----
 2 files changed, 3 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
 rename meta/recipes-devtools/file/{file_5.11.bb => file_5.12.bb} (81%)

diff --git a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch b/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
deleted file mode 100644
index 84a78a5..0000000
--- a/meta/recipes-devtools/file/file/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [fixed in file-5.12]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd file-5.11/configure.ac file-5.11/configure.ac
---- file-5.11/configure.ac	2012-02-21 21:16:29.000000000 +0200
-+++ file-5.11/configure.ac	2013-01-02 07:18:23.004856505 +0200
-@@ -3,7 +3,7 @@
- AM_INIT_AUTOMAKE()
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AC_CONFIG_MACRO_DIR([m4])
-
- AC_MSG_CHECKING(for builtin ELF support)
diff --git a/meta/recipes-devtools/file/file_5.11.bb b/meta/recipes-devtools/file/file_5.12.bb
similarity index 81%
rename from meta/recipes-devtools/file/file_5.11.bb
rename to meta/recipes-devtools/file/file_5.12.bb
index 52ae460..4677a6d 100644
--- a/meta/recipes-devtools/file/file_5.11.bb
+++ b/meta/recipes-devtools/file/file_5.12.bb
@@ -10,16 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_class-native = "zlib-native"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://fix_version_check.patch \
-           file://obsolete_automake_macros.patch \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "16a407bd66d6c7a832f3a5c0d609c27b"
-SRC_URI[sha256sum] = "c70ae29a28c0585f541d5916fc3248c3e91baa481f63d7ccec53d1534cbcc9b7"
+SRC_URI[md5sum] = "1d7d85cb9354f79e5e351deef36be6ba"
+SRC_URI[sha256sum] = "199d0dab2e32814cbced8dc30d3d2d5b7e45587598160a2c401358b573273d22"
 
 inherit autotools
 
-- 
1.8.0.2



