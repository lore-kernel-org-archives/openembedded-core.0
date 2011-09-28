Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJ1-00041w-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360962"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:53 -0700
Message-Id: <a49b45da2d30fce8c51b2cb29c002eadd29ef224.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/29] rpm: fix QA Warning on installed but not shipped staticdev filesw
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:54 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 356512a..bbef0be 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -168,7 +168,7 @@ EXTRA_OECONF = "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -304,27 +304,30 @@ FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
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
+		"
+
 ###%{_rpmhome}/lib/libxar.a
 ###%{_rpmhome}/lib/libxar.la
 ###%{_rpmhome}/lib/libxar.so
-- 
1.7.6



