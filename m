Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3P-0001do-Mn
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396906"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:49 -0700
Message-Id: <b1ea6e9d9e01ea3d05901a90b8926114f0659151.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/22] libiconv: add version 1.13.1
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:44 -0000

Keep older libiconv 1.11.1 as 1.13.1 is now LGPLv3

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{libiconv-1.11.1 => files}/autoconf.patch      |    2 +
 .../shared_preloadable_libiconv_linux.patch        |    2 +
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   29 ++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => files}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => files}/shared_preloadable_libiconv_linux.patch (98%)
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb

diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/files/autoconf.patch
similarity index 98%
rename from meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
rename to meta/recipes-support/libiconv/files/autoconf.patch
index 2b24894..3cbf549 100644
--- a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
+++ b/meta/recipes-support/libiconv/files/autoconf.patch
@@ -2,6 +2,8 @@ It adds the variables that are needed
 for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
 directory. Its imported from OE.
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: libiconv-1.11.1/configure.ac
diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
similarity index 98%
rename from meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
rename to meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
index a913dad..fb07f73 100644
--- a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
+++ b/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
@@ -4,6 +4,8 @@ Its more enforced by libtool 2.4. I have not checked it with older libtool
 libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
 was released these kind of problem are more likely
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: libiconv-1.11.1/lib/Makefile.in
diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
new file mode 100644
index 0000000..069881d
--- /dev/null
+++ b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
+multiple character encodings, but that support lacks from your system."
+HOMEPAGE = "http://www.gnu.org/software/libiconv"
+SECTION = "libs"
+NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
+PROVIDES = "virtual/libiconv"
+PR = "r0"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
+                    file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://autoconf.patch \
+	   file://shared_preloadable_libiconv_linux.patch \
+          "
+
+SRC_URI[md5sum] = "d42b97f6ef5dd0ba4469d520ed732fed"
+SRC_URI[sha256sum] = "e78c347a1a0cb15f2648519e9799151f4b4a934b61ad9ee7424478efe2b8257f"
+
+S = "${WORKDIR}/libiconv-${PV}"
+
+inherit autotools pkgconfig gettext
+
+EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
+
+LEAD_SONAME = "libiconv.so"
+
+do_configure_prepend () {
+	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
+}
-- 
1.7.3.4



