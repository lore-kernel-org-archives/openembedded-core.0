Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 1296 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Mar 2017 22:01:51 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA6170101
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 22:01:51 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v28LuLR2002089 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 16:01:53 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 292q4r0sx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 16:01:53 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v28M1qd2010028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 16:01:52 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 8 Mar 2017 16:01:52 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 8 Mar 2017 16:01:52 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Mar 2017 16:01:50 -0600
Message-ID: <1489010510-20121-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-03-08_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=14
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
	definitions=main-1703080170
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-03-08_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=30
	priorityscore=1501 malwarescore=0
	suspectscore=45 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=30
	reason=mlx scancount=1 engine=8.0.1-1702020001
	definitions=main-1703080170
Subject: [PATCH] libsolv: upgrade to 0.6.26
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
X-List-Received-Date: Wed, 08 Mar 2017 22:01:52 -0000
Content-Type: text/plain

Drop 0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...-libsolvext-into-it-s-own-pkg-config-file.patch | 67 ----------------------
 .../{libsolv_0.6.24.bb => libsolv_0.6.26.bb}       |  3 +-
 2 files changed, 1 insertion(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.6.24.bb => libsolv_0.6.26.bb} (86%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch b/meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch
deleted file mode 100644
index 9d9b234..0000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 0830ceffb32bdf61dab2a598b9e77f65d089074f Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Fri, 27 Jan 2017 16:10:14 -0600
-Subject: [PATCH] Split libsolvext into it's own pkg-config file
-
-Upstream-Status: Submitted (https://github.com/openSUSE/libsolv/pull/177)
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
- CMakeLists.txt                    | 4 +++-
- libsolv.pc.in                     | 4 ++--
- libsolv.pc.in => libsolvext.pc.in | 4 ++--
- 3 files changed, 7 insertions(+), 5 deletions(-)
- copy libsolv.pc.in => libsolvext.pc.in (62%)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 82034e0..0777ed9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -384,9 +384,11 @@ MACRO (SPECFILE)
- ENDMACRO (SPECFILE)
- 
- MACRO (PCFILE)
--  MESSAGE (STATUS "Writing pkg-config file...")
-+  MESSAGE (STATUS "Writing pkg-config files...")
-   CONFIGURE_FILE (${CMAKE_SOURCE_DIR}/libsolv.pc.in ${CMAKE_BINARY_DIR}/libsolv.pc @ONLY)
-   INSTALL( FILES ${CMAKE_BINARY_DIR}/libsolv.pc DESTINATION ${LIB_INSTALL_DIR}/pkgconfig )
-+  CONFIGURE_FILE (${CMAKE_SOURCE_DIR}/libsolvext.pc.in ${CMAKE_BINARY_DIR}/libsolvext.pc @ONLY)
-+  INSTALL( FILES ${CMAKE_BINARY_DIR}/libsolvext.pc DESTINATION ${LIB_INSTALL_DIR}/pkgconfig )
- ENDMACRO (PCFILE)
- 
- SPECFILE ()
-diff --git a/libsolv.pc.in b/libsolv.pc.in
-index c82dfc4..40a8623 100644
---- a/libsolv.pc.in
-+++ b/libsolv.pc.in
-@@ -2,7 +2,7 @@ libdir=@LIB_INSTALL_DIR@
- includedir=@INCLUDE_INSTALL_DIR@
- 
- Name: libsolv
--Description: Library for solving packages and reading repositories
-+Description: Library for solving packages
- Version: @VERSION@
--Libs: -L${libdir} -lsolvext -lsolv
-+Libs: -L${libdir} -lsolv
- Cflags: -I${includedir}
-diff --git a/libsolv.pc.in b/libsolvext.pc.in
-similarity index 62%
-copy from libsolv.pc.in
-copy to libsolvext.pc.in
-index c82dfc4..6395f39 100644
---- a/libsolv.pc.in
-+++ b/libsolvext.pc.in
-@@ -1,8 +1,8 @@
- libdir=@LIB_INSTALL_DIR@
- includedir=@INCLUDE_INSTALL_DIR@
- 
--Name: libsolv
--Description: Library for solving packages and reading repositories
-+Name: libsolvext
-+Description: Library for reading repositories
- Version: @VERSION@
- Libs: -L${libdir} -lsolvext -lsolv
- Cflags: -I${includedir}
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb b/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
similarity index 86%
rename from meta/recipes-extended/libsolv/libsolv_0.6.24.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.26.bb
index 6de38b5..f29b9a1 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           file://0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
 
-SRCREV = "4049d57b026d3a67c8c164ed20db85ff62b87728"
+SRCREV = "ba32f8286d3deec6faaabc79762a4760e9af0a07"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


