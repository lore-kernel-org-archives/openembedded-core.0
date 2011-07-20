Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSD3-0001ZJ-A2
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:32:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753227"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:27:49 -0700
Message-Id: <93af543bca2b78530d369d8c51b8b23f9daab6c5.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 02/50] Revert "libiconv: add version 1.13.1"
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
X-List-Received-Date: Wed, 20 Jul 2011 08:32:49 -0000

From: Khem Raj <raj.khem@gmail.com>

This reverts commit bd1e627bef29830f9346b4b984905fd8fcf2e716.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{files => libiconv-1.11.1}/autoconf.patch      |    2 -
 .../shared_preloadable_libiconv_linux.patch        |    2 -
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   29 --------------------
 3 files changed, 0 insertions(+), 33 deletions(-)
 rename meta/recipes-support/libiconv/{files => libiconv-1.11.1}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{files => libiconv-1.11.1}/shared_preloadable_libiconv_linux.patch (98%)
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb

diff --git a/meta/recipes-support/libiconv/files/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
similarity index 98%
rename from meta/recipes-support/libiconv/files/autoconf.patch
rename to meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
index 3cbf549..2b24894 100644
--- a/meta/recipes-support/libiconv/files/autoconf.patch
+++ b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
@@ -2,8 +2,6 @@ It adds the variables that are needed
 for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
 directory. Its imported from OE.
 
-Upstream-Status: Pending
-
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: libiconv-1.11.1/configure.ac
diff --git a/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
similarity index 98%
rename from meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
rename to meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
index fb07f73..a913dad 100644
--- a/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
+++ b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
@@ -4,8 +4,6 @@ Its more enforced by libtool 2.4. I have not checked it with older libtool
 libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
 was released these kind of problem are more likely
 
-Upstream-Status: Pending
-
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: libiconv-1.11.1/lib/Makefile.in
diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
deleted file mode 100644
index 069881d..0000000
--- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
-multiple character encodings, but that support lacks from your system."
-HOMEPAGE = "http://www.gnu.org/software/libiconv"
-SECTION = "libs"
-NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
-PROVIDES = "virtual/libiconv"
-PR = "r0"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
-                    file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://autoconf.patch \
-	   file://shared_preloadable_libiconv_linux.patch \
-          "
-
-SRC_URI[md5sum] = "d42b97f6ef5dd0ba4469d520ed732fed"
-SRC_URI[sha256sum] = "e78c347a1a0cb15f2648519e9799151f4b4a934b61ad9ee7424478efe2b8257f"
-
-S = "${WORKDIR}/libiconv-${PV}"
-
-inherit autotools pkgconfig gettext
-
-EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
-
-LEAD_SONAME = "libiconv.so"
-
-do_configure_prepend () {
-	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
-}
-- 
1.7.3.4



