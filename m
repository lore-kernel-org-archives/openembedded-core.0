Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1C-0003mK-2f
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272064"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:34:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:42 -0700
Message-Id: <a487bc376b756f97482342a66837049f9caad90b.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 10/25] rpm: Create -staticdev package
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 9cfb3ab..1ebe3a1 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r19"
+PR = "r20"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -167,7 +167,7 @@ EXTRA_OECONF = "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -302,26 +302,28 @@ FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
 		"
 
 FILE_${PN}-dev = "${includedir}/rpm \
-		${libdir}/librpm.a \
 		${libdir}/librpm.la \
 		${libdir}/librpm.so \
-		${libdir}/librpmconstant.a \
 		${libdir}/librpmconstant.la \
 		${libdir}/librpmconstant.so \
-		${libdir}/librpmdb.a \
 		${libdir}/librpmdb.la \
 		${libdir}/librpmdb.so \
-		${libdir}/librpmio.a \
 		${libdir}/librpmio.la \
 		${libdir}/librpmio.so \
-		${libdir}/librpmmisc.a \
 		${libdir}/librpmmisc.la \
 		${libdir}/librpmmisc.so \
-		${libdir}/librpmbuild.a \
 		${libdir}/librpmbuild.la \
 		${libdir}/librpmbuild.so \
 		${libdir}/pkgconfig/rpm.pc \
 		"
+FILE_${PN}-staticdev = " \
+		${libdir}/librpm.a \
+		${libdir}/librpmconstant.a \
+		${libdir}/librpmdb.a \
+		${libdir}/librpmio.a \
+		${libdir}/librpmmisc.a \
+		${libdir}/librpmbuild.a \
+                "
 
 ###%{_rpmhome}/lib/libxar.a
 ###%{_rpmhome}/lib/libxar.la
-- 
1.7.3.4



