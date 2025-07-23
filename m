Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30356C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 02:16:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4972.1753236983078687555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 19:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299c564b0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N1RXoB1389103;
	Tue, 22 Jul 2025 19:16:17 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1kmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Jul 2025 19:16:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 19:16:04 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 19:16:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] libxml2: upgrade 2.14.3 -> 2.14.5
Date: Wed, 23 Jul 2025 10:16:02 +0800
Message-ID: <20250723021602.4064064-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9c8d7ee715e01a7f7aa977bc30f1d8d7bc4d5fd0.camel@linuxfoundation.org>
References: <9c8d7ee715e01a7f7aa977bc30f1d8d7bc4d5fd0.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZXxtaX9cBRbHVsuQQlilRQKk0TVd-RTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxOCBTYWx0ZWRfX364GbzDjOmE/
 oAZqs6vxNVFJpChjjaLln8c+VpeqEFc7glT8sgDVP6HoowEg56SFTLNyMzOtVYLsYuD0HabJ8qS
 AgOJXYwBZPR7OV9BstA5AGvzaNqQnZJXlvchle6RXD6+Lc5hdnVkL8SFVTEQmgagsY5vkrL8cBb
 vP4+vLoUdVnI+ts9HGrc5MRiQFu5RNYs/p99lDoz3Qkwa83cBmiXSdqIqFHfIyPGPv9G9JUvrh3
 8K8ZKLVQORt9tlkF4df8RlyBXZgbq5w1wkBe6y6g6S1iZmn1CW8H6Tmm1EeY90qZ2znxc/c7JBN
 DsGQTW45ONrXX42qd2qKfWUWwdiYBBE9WtsQTOoSpRFoij9muyPiDXHpwU8MUGVvZ3FoX7lcjB1
 6AESrFDG
X-Proofpoint-GUID: ZXxtaX9cBRbHVsuQQlilRQKk0TVd-RTg
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=688045f1 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8
 a=a_U1oVfrAAAA:8 a=7CQSdrXTAAAA:8 a=SEUDYsWWKZk9PtqiWv4A:9 a=m9p5bXcFLgAA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 02:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220777

Release notes:

    https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.14.5

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-installation-directories-in-libxml2.patch | 14 ++++----
 .../libxml/libxml2/CVE-2025-6021.patch        | 36 +++----------------
 .../libxml/libxml2/install-tests.patch        |  4 +--
 .../{libxml2_2.14.3.bb => libxml2_2.14.5.bb}  |  2 +-
 4 files changed, 14 insertions(+), 42 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.3.bb => libxml2_2.14.5.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 6ea5adafa22..627f8472c38 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 55ed199fdb55a1a600616ba14ad0feedcf828d86 Mon Sep 17 00:00:00 2001
+From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 40e75151..d21ebfe5 100644
+index aaa02e3..fb241bb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1061,17 +1061,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -37,7 +37,7 @@ index 40e75151..d21ebfe5 100644
  AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
                     [System configuration directory (/etc)])
 diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
-index 4945dda4..31036805 100644
+index e040a75..dc0d6b8 100644
 --- a/libxml2-config.cmake.in
 +++ b/libxml2-config.cmake.in
 @@ -24,17 +24,20 @@
@@ -66,7 +66,7 @@ index 4945dda4..31036805 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 4c59211d..3e5f25d3 100644
+index 98bc6e3..3ef0bd0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -599,9 +599,6 @@ config_cmake = configuration_data()
@@ -77,5 +77,5 @@ index 4c59211d..3e5f25d3 100644
 -config_cmake.set('INSTALL_INCLUDEDIR', dir_include)
 -config_cmake.set('INSTALL_LIBDIR', dir_lib)
  config_cmake.set('VERSION', meson.project_version())
- config_cmake.set('WITH_HTTP', want_http.to_int().to_string())
- config_cmake.set('WITH_ICONV', want_iconv.to_int().to_string())
+ config_cmake.set10('BUILD_SHARED_LIBS',
+                    get_option('default_library') != 'static')
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
index 157486848b9..0b73bceb245 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -1,4 +1,4 @@
-From 33d7969baf541326a35e2fbe31943c46af8c71db Mon Sep 17 00:00:00 2001
+From e546e423d69ec9b3c71167d3c3140fa1b9af93c7 Mon Sep 17 00:00:00 2001
 From: Nick Wellnhofer <wellnhofer@aevum.de>
 Date: Tue, 27 May 2025 12:53:17 +0200
 Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
@@ -14,11 +14,11 @@ CVE: CVE-2025-6021
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- tree.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
+ tree.c | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/tree.c b/tree.c
-index 7454b07..22ec11c 100644
+index e14bc62..22ec11c 100644
 --- a/tree.c
 +++ b/tree.c
 @@ -23,6 +23,7 @@
@@ -29,31 +29,3 @@ index 7454b07..22ec11c 100644
  
  #ifdef LIBXML_ZLIB_ENABLED
  #include <zlib.h>
-@@ -168,10 +169,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
- xmlChar *
- xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
- 	      xmlChar *memory, int len) {
--    int lenn, lenp;
-+    size_t lenn, lenp;
-     xmlChar *ret;
- 
--    if (ncname == NULL) return(NULL);
-+    if ((ncname == NULL) || (len < 0)) return(NULL);
-     if (prefix == NULL) return((xmlChar *) ncname);
- 
- #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
-@@ -182,8 +183,10 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
- 
-     lenn = strlen((char *) ncname);
-     lenp = strlen((char *) prefix);
-+    if (lenn >= SIZE_MAX - lenp - 1)
-+        return(NULL);
- 
--    if ((memory == NULL) || (len < lenn + lenp + 2)) {
-+    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
- 	ret = xmlMalloc(lenn + lenp + 2);
- 	if (ret == NULL)
- 	    return(NULL);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 789aeca119f..4c1faa83cbb 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
+From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4cb9a5c..8adcd7e 100644
+index 6f98144..ecb3b54 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -26,6 +26,16 @@ check_PROGRAMS = \
diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipes-core/libxml/libxml2_2.14.5.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.14.3.bb
rename to meta/recipes-core/libxml/libxml2_2.14.5.bb
index 4baab59186e..f60a46e1876 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.5.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"
+SRC_URI[archive.sha256sum] = "03d006f3537616833c16c53addcdc32a0eb20e55443cba4038307e3fa7d8d44b"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


