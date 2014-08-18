Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF11165E11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:11:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6BpQ1029911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:11:51 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:11:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:11:46 -0700
Message-ID: <d78698a7b5d7799fd9dc0d0a65d613ba65a89bf2.1408342098.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342098.git.liezhi.yang@windriver.com>
References: <cover.1408342098.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] rpm: add perl to RDEPENDS_rpm-build
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
X-List-Received-Date: Mon, 18 Aug 2014 06:11:55 -0000
Content-Type: text/plain

Perl scripts:
rpm-build/usr/lib64/rpm/http.req
rpm-build/usr/lib64/rpm/php.prov
rpm-build/usr/lib64/rpm/osgideps.pl
rpm-build/usr/lib64/rpm/perl.prov
rpm-build/usr/lib64/rpm/bin/api-sanity-autotest.pl
rpm-build/usr/lib64/rpm/php.req
rpm-build/usr/lib64/rpm/perldeps.pl
rpm-build/usr/lib64/rpm/perl.req

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb |    4 +---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb  |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 27d01dd..d2dec5f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -274,8 +274,6 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmbuild-*.so \
 		"
 
-RDEPENDS_${PN}-build += "bash"
-
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
 		${bindir}/rpmbuild.real \
@@ -349,7 +347,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-build = "file"
+RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 8fec656..0c9ef5b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -261,8 +261,6 @@ FILES_${PN}-libs = "${libdir}/librpm-*.so \
 		${libdir}/librpmbuild-*.so \
 		"
 
-RDEPENDS_${PN}-build += "bash"
-
 FILES_${PN}-build = "${prefix}/src/rpm \
 		${bindir}/rpmbuild \
 		${bindir}/rpmbuild.real \
@@ -336,7 +334,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}-build = "file"
+RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
-- 
1.7.9.5


