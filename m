Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1G-0003mE-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272078"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:34:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:52 -0700
Message-Id: <f860214ace789b3259c91c36f654199c6969526e.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 20/25] gettext: Use bitbake default FILES for packaging
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:07 -0000

This will ensure correct -dev and -staticdev packging

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb   |    6 +++---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |   24 ++++++++++++------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 73e5f55..4b44ede 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
 
-PR = "r4"
+PR = "r5"
 DEPENDS = "virtual/libiconv"
 DEPENDS_virtclass-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -51,5 +51,5 @@ do_configure_prepend() {
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
 
 PACKAGES =+ "libgettextlib libgettextsrc"
-FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
-FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
+FILES_libgettextlib = "${libdir}/libgettextlib-*${SOLIBS}"
+FILES_libgettextsrc = "${libdir}/libgettextsrc-*${SOLIBS}"
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 0b11a90..670af19 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -53,27 +53,27 @@ acpaths = '-I ${S}/gettext-runtime/m4 \
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
 
 PACKAGES =+ "libgettextlib libgettextsrc"
-FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
-FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
+FILES_libgettextlib = "${libdir}/libgettextlib-*${SOLIBS}"
+FILES_libgettextsrc = "${libdir}/libgettextsrc-*${SOLIBS}"
 
-PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
+PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-staticdev gettext-runtime-doc"
 
 FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
                          ${bindir}/envsubst \
                          ${bindir}/gettext.sh \
-                         ${libdir}/libasprintf.so* \
+                         ${libdir}/libasprintf${SOLIBS} \
                          ${libdir}/GNU.Gettext.dll \
                         "
-FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
+FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl${SOLIBS} \
                                              ${libdir}/charset.alias \
                                            "
-FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
-                      ${includedir}/autosprintf.h \
-                     "
-FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
-                                                 ${includedir}/libintl.h \
-                                               "
+FILES_gettext-runtime-dev += "${includedir}/autosprintf.h"
+FILES_gettext-runtime-staticdev = "${libdir}/libasprintf.a"
+FILES_gettext-runtime-dev_append_libc-uclibc = " ${includedir}/libintl.h"
+FILES_gettext-runtime-staticdev_append_libc-uclibc = " ${libdir}/libintl.a"
+RDEPENDS_gettext-runtime-staticdev = "gettext-runtime-dev (= ${EXTENDPKGV})"
+
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${mandir}/man1/ngettext.* \
                              ${mandir}/man1/envsubst.* \
-- 
1.7.3.4



