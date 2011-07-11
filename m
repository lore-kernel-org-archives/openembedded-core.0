Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjP-0005bH-LQ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491812"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:18 -0700
Message-Id: <c5a86ee71f9a3fb65e9f411ffa3ef76f16530631.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 11/26] rpm: Create ${PN}-staticdev package
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index d093345..5e6d0a4 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -166,7 +166,7 @@ EXTRA_OECONF = "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -301,26 +301,28 @@ FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
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



