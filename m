Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4w-0008HT-E3
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0JRD008380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:19 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:14 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:38 -0600
Message-ID: <5af99b648bffd7219bdd6dbd1b6fed3c9069d058.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 06/22] rpm: Move rpmdb_loadcvt from base to dev package
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:49 -0000
Content-Type: text/plain

This item is only useful when the various development components are
installed.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index d435996..ccf079a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r55"
+PR = "r56"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -203,7 +203,6 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/tgpg \
 		${libdir}/rpm/macros \
 		${libdir}/rpm/rpmpopt \
-		${libdir}/rpm/rpmdb_loadcvt \
 		${libdir}/rpm/rpm2cpio \
 		${libdir}/rpm/vcheck \
 		${libdir}/rpm/helpers \
@@ -237,6 +236,8 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmbuild-*.so \
 		"
 
+RDEPENDS_${PN}-build += "bash"
+
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
 		${libdir}/rpm/brp-* \
@@ -317,6 +318,8 @@ FILES_perl-module-rpm = "${libdir}/perl/*/* \
 FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
 		"
 
+RDEPENDS_${PN}-dev += "bash"
+
 FILES_${PN}-dev = "${includedir}/rpm \
 		${libdir}/librpm.la \
 		${libdir}/librpm.so \
@@ -332,6 +335,7 @@ FILES_${PN}-dev = "${includedir}/rpm \
 		${libdir}/librpmbuild.so \
 		${libdir}/rpm/lib/liblua.la \
 		${libdir}/pkgconfig/rpm.pc \
+		${libdir}/rpm/rpmdb_loadcvt \
 		"
 
 FILES_${PN}-staticdev = " \
-- 
1.7.3.4



