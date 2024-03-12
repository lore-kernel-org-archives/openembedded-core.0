Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0A2C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 07:54:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3437.1710230038043469573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 00:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c+d6raWk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3801017dec=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C6WBpk020050
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 00:53:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=cUUME
	TD9Gqgv88i83fKoAxdlDa8kSQcdYIGfNrm7iYY=; b=c+d6raWkwJU8yI5/RnJCF
	xxft8YXQrDfgWOBuCOTS86/KyBC/ZVxJlULJ4Au4+cIuEPQS2B9dS7NHmFaMSClE
	dGgtrVMwSTSpEHAiqXfsxFBLv9jbUBsSW0Hu6LRL0bB+C09ZlUIuBTu4u6jJdOta
	ZzxPVP1NhV45TqEBV9P3RQ/Kbu1Uw3Tk3tQOVo78vFwrtSLt1GP+HcywFIgVN2dV
	VKsJPgFqvfR7yIghLjc9qJ8GXLRkbVZQovrdl7a+E80bhw1RBrZYNATztS+Po+x7
	JUAQt69R3nX7cVHArWwRnRPKzucrJaQ4R5CtpF+qBpDfwZfcfbdCaBEaJv5Rgv4a
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrkx4aa82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 00:53:57 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 00:53:52 -0700
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] expat: Upgrade to 2.6.0
Date: Tue, 12 Mar 2024 07:53:36 +0000
Message-ID: <20240312075336.2895321-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 8CU8iKScx9lGUMbjnE4u6XsnYD0r92Hy
X-Proofpoint-ORIG-GUID: 8CU8iKScx9lGUMbjnE4u6XsnYD0r92Hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_06,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 07:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196972

From: Meenali Gupta <meenali.gupta@windriver.com>

Package and run benchmark as part of ptest
This is a major release with following changes [1]

ChangeLog:
https://github.com/libexpat/libexpat/blob/R_2_6_1/expat/Changes

Security fixes:
      #789 #814  CVE-2023-52425 -- Fix quadratic runtime issues with big tokens
                   that can cause denial of service, in partial where
                   dealing with compressed XML input.  Applications
                   that parsed a document in one go -- a single call to
                   functions XML_Parse or XML_ParseBuffer -- were not affected.
                   The smaller the chunks/buffers you use for parsing
                   previously, the bigger the problem prior to the fix.
                   Backporters should be careful to no omit parts of
                   pull request #789 and to include earlier pull request #771,
                   in order to not break the fix.
           #777  CVE-2023-52426 -- Fix billion laughs attacks for users
                   compiling *without* XML_DTD defined (which is not common).
                   Users with XML_DTD defined have been protected since
                   Expat >=2.4.0 (and that was CVE-2013-0340 back then).

        Bug fixes:
            #753  Fix parse-size-dependent "invalid token" error for
                    external entities that start with a byte order mark
            #780  Fix NULL pointer dereference in setContext via
                    XML_ExternalEntityParserCreate for compilation with
                    XML_DTD undefined
       #812 #813  Protect against closing entities out of order

        Other changes:
            #723  Improve support for arc4random/arc4random_buf
       #771 #788  Improve buffer growth in XML_GetBuffer and XML_Parse
       #761 #770  xmlwf: Support --help and --version
       #759 #770  xmlwf: Support custom buffer size for XML_GetBuffer and read
            #744  xmlwf: Improve language and URL clickability in help output
            #673  examples: Add new example "element_declarations.c"
            #764  Be stricter about macro XML_CONTEXT_BYTES at build time
            #765  Make inclusion to expat_config.h consistent
       #726 #727  Autotools: configure.ac: Support --disable-maintainer-mode
    #678 #705 ..
  #706 #733 #792  Autotools: Sync CMake templates with CMake 3.26
            #795  Autotools: Make installation of shipped man page doc/xmlwf.1
                    independent of docbook2man availability
            #815  Autotools|CMake: Add missing -DXML_STATIC to pkg-config file
                    section "Cflags.private" in order to fix compilation
                    against static libexpat using pkg-config on Windows
       #724 #751  Autotools|CMake: Require a C99 compiler
                    (a de-facto requirement already since Expat 2.2.2 of 2017)
            #793  Autotools|CMake: Fix PACKAGE_BUGREPORT variable
       #750 #786  Autotools|CMake: Make test suite require a C++11 compiler
            #749  CMake: Require CMake >=3.5.0
            #672  CMake: Lowercase off_t and size_t to help a bug in Meson
            #746  CMake: Sort xmlwf sources alphabetically
            #785  CMake|Windows: Fix generation of DLL file version info
            #790  CMake: Build tests/benchmark/benchmark.c as well for
                    a build with -DEXPAT_BUILD_TESTS=ON
       #745 #757  docs: Document the importance of isFinal + adjust tests
                    accordingly
            #736  docs: Improve use of "NULL" and "null"
            #713  docs: Be specific about version of XML (XML 1.0r4)
                    and version of C (C99); (XML 1.0r5 will need a sponsor.)
            #762  docs: reference.html: Promote function XML_ParseBuffer more
            #779  docs: reference.html: Add HTML anchors to XML_* macros
            #760  docs: reference.html: Upgrade to OK.css 1.2.0
       #763 #739  docs: Fix typos
            #696  docs|CI: Use HTTPS URLs instead of HTTP at various places
    #669 #670 ..
    #692 #703 ..
       #733 #772  Address compiler warnings
       #798 #800  Address clang-tidy warnings
       #775 #776  Version info bumped from 9:10:8 (libexpat*.so.1.8.10)
                    to 10:0:9 (libexpat*.so.1.9.0); see https://verbump.de/
                    for what these numbers do

        Infrastructure:
       #700 #701  docs: Document security policy in file SECURITY.md
            #766  docs: Improve parse buffer variables in-code documentation
    #674 #738 ..
    #740 #747 ..
  #748 #781 #782  Refactor coverage and conformance tests
       #714 #716  Refactor debug level variables to unsigned long
            #671  Improve handling of empty environment variable value
                    in function getDebugLevel (without visible user effect)
    #755 #774 ..
    #758 #783 ..
       #784 #787  tests: Improve test coverage with regard to parse chunk size
  #660 #797 #801  Fuzzing: Improve fuzzing coverage
       #367 #799  Fuzzing|CI: Start running OSS-Fuzz fuzzing regression tests
       #698 #721  CI: Resolve some Travis CI leftovers
            #669  CI: Be robust towards absence of Git tags
       #693 #694  CI: Set permissions to "contents: read" for security
            #709  CI: Pin all GitHub Actions to specific commits for security
            #739  CI: Reject spelling errors using codespell
            #798  CI: Enforce clang-tidy clean code
    #773 #808 ..
       #809 #810  CI: Upgrade Clang from 15 to 18
            #796  CI: Start using Clang's Control Flow Integrity sanitizer
  #675 #720 #722  CI: Adapt to breaking changes in GitHub Actions Ubuntu images
            #689  CI: Adapt to breaking changes in Clang/LLVM Debian packaging
            #763  CI: Adapt to breaking changes in codespell
            #803  CI: Adapt to breaking changes in Cppcheck

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 meta/recipes-core/expat/expat/run-ptest                    | 2 +-
 meta/recipes-core/expat/{expat_2.5.0.bb => expat_2.6.0.bb} | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/expat/{expat_2.5.0.bb => expat_2.6.0.bb} (81%)

diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
index dbf602ca80..ff7986db3c 100644
--- a/meta/recipes-core/expat/expat/run-ptest
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -5,5 +5,5 @@ TIME=$(which time)
 echo "runtests"
 ${TIME} -f 'Execution time: %e s' bash -c "./runtests -v"
 echo "runtestspp"
-${TIME} -f 'Execution time: %e s' bash -c "./runtestspp -v"
+${TIME} -f 'Execution time: %e s' bash -c "./runtests_cxx -v"
 echo
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.6.0.bb
similarity index 81%
rename from meta/recipes-core/expat/expat_2.5.0.bb
rename to meta/recipes-core/expat/expat_2.6.0.bb
index 7080f934d1..bdc405148b 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.6.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67"
+SRC_URI[sha256sum] = "ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12ed0ec6f55736b78d85ba"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
@@ -23,7 +23,8 @@ RDEPENDS:${PN}-ptest += "bash"
 inherit cmake lib_package ptest
 
 do_install_ptest:class-target() {
-	install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
+	install -m 755 ${B}/tests/runtests* ${D}${PTEST_PATH}
+	install -m 755 ${B}/tests/benchmark/benchmark ${D}${PTEST_PATH}
 }
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.40.0


