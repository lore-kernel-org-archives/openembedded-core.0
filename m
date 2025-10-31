Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9017ACCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 06:45:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8970.1761893108952148533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 23:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m157l8fX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33992ecfb6=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V5KFLZ3027044;
	Fri, 31 Oct 2025 06:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1zBSMksrVHL8U2fGl348
	8i7ZzXS14fVI/Ejix1f/lPE=; b=m157l8fXRbil17LnllotKFpAvSQc2ZYywc1f
	CJHIWKqnY3G/C3TIl0P0l3StqrqLhmOfPmM3zAAU12k0AydF/g3Jtz+npFcwBLVb
	YLk1v6e4geMWaymYvllHlGwXy1zmcKhELsCruiifEkU3nm9HA3IxhSd/NTH8a69J
	TxVSTOF9/o5QGoxPBbLBRNeT2/KnJWeBo5n1Uw78kgyrCC63sIsesiUYc0k7Nlrw
	q0+qQQUgoZII4CP+IXRmvT5YLoZsXYANlQnlQpaGvJqPcbXHMwllhSLAAXoa3Xbd
	JHoHW4uSZBXc9j9KOuR/51IDbj3J2w88Esm+yUqONvEhf5TPIg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w7hhh15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Oct 2025 06:45:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 30 Oct 2025 23:45:06 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 30 Oct 2025 23:45:05 -0700
From: <jiaying.song.cn@windriver.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] icu: use automake ptest output format
Date: Fri, 31 Oct 2025 14:45:04 +0800
Message-ID: <20251031064504.461920-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1OSBTYWx0ZWRfX6NoU+cxN9A7A
 LuBVrdn3MBjzKfKoAxUtsMjzdGGGkcQOGcKrHL+i3Mg9GmU6it9oMA9cymvia2Pny9ZLIxbX3C2
 7R6p3rdipKJSc2eoRfY78L2vSbN40jfsJ6bX+Zb1QzhOq1sxnw7cyaNvEKJr04HJFt1VkmV4r6O
 DPchXsiChDdzH6qMlGgZu0AYYdn3NnW35nRRizs6/YZYhCpVN9roQlT9MmvLews3QwFqSO3cNxZ
 Acapy1LfTy9jL0wYWtPqFqeFFh5NfGGvze8spo4S14P797VUVHj2q6tc30x/yYjDeAZLy54qqWg
 twkPGU+ZDe5cUvfXh4Kn9gWTfLFBjbk+61ZN2kp06OFplOgG7SRqC+6SebkkYk/dOmzq5U0Ll9k
 F0rE8nlzUHHROPJQgH9q/mtaEpcgPg==
X-Proofpoint-ORIG-GUID: 3Ji2I80sLHzrM6uPLfQovhwdfIjS-5Kg
X-Authority-Analysis: v=2.4 cv=UatciaSN c=1 sm=1 tr=0 ts=69045af3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=DsB6jYfgYT2NhSETTEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3Ji2I80sLHzrM6uPLfQovhwdfIjS-5Kg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 06:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225532

From: Jiaying Song <jiaying.song.cn@windriver.com>

Make ICU ptest output compatible with Automake format.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...utput-compatible-with-Automake-forma.patch | 132 ++++++++++++++++++
 meta/recipes-support/icu/icu_77-1.bb          |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch

diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
new file mode 100644
index 0000000000..7ced43f723
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
@@ -0,0 +1,132 @@
+From 47e77a544076270eea4c7a814b6d435d1b74d5fa Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Thu, 30 Oct 2025 17:26:39 +0800
+Subject: [PATCH] Make ICU ptest output compatible with Automake format
+
+- Change test result format to PASS/FAIL for Automake compatibility
+- Adjust indentation and timing output formatting
+
+Upstream-Status: Pending
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ test/intltest/intltest.cpp | 24 ++++++++++--------------
+ tools/ctestfw/ctest.c      | 14 +++++++-------
+ 2 files changed, 17 insertions(+), 21 deletions(-)
+
+diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
+index 33829b0..aa6c3ec 100644
+--- a/test/intltest/intltest.cpp
++++ b/test/intltest/intltest.cpp
+@@ -785,7 +785,7 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+     IntlTest* saveTest = gTest;
+     gTest = this;
+     do {
+-        this->runIndexedTest( index, false, name, par );
++        this->runIndexedTest(index, false, name, par );
+         if (strcmp(name,"skip") == 0) {
+             run_this_test = false;
+         } else {
+@@ -801,8 +801,9 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+             lastErrorCount = errorCount;
+             execCount++;
+             char msg[256];
+-            snprintf(msg, sizeof(msg), "%s {", name);
++            snprintf(msg, sizeof(msg), "Start the test %s ", name);
+             LL_message(UnicodeString(msg), true);
++            LL_indentlevel += 3;
+             UDate timeStart = uprv_getRawUTCtime();
+             strcpy(saveBaseLoc,name);
+             strcat(saveBaseLoc,"/");
+@@ -813,13 +814,9 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+ 
+             UDate timeStop = uprv_getRawUTCtime();
+             rval = true; // at least one test has been called
+-            char secs[256];
+-            if(!no_time) {
+-              snprintf(secs, sizeof(secs), "%f", (timeStop-timeStart)/1000.0);
+-            } else {
+-              secs[0]=0;
+-            }
+-            
++            char secs[256]= {0};
++            if(!no_time)
++               snprintf(secs, sizeof(secs), "%f", (timeStop-timeStart)/1000.0);
+ 
+             strcpy(saveBaseLoc,name);
+ 
+@@ -828,13 +825,14 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+             
+ 
+             saveBaseLoc[0]=0; /* reset path */
+-            
++           
++            LL_indentlevel -= 3; 
+             if (lastErrorCount == errorCount) {
+-                snprintf( msg, sizeof(msg),  "   } OK:   %s ", name );
++                snprintf(msg, sizeof(msg), "PASS: %s ", name);
+                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
+                 lastTestFailed = false;
+             }else{
+-                snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
++                snprintf(msg, sizeof(msg), "FAIL: %s (errors: %li)", name, static_cast<long>(errorCount - lastErrorCount));
+                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
+ 
+                 for(int i=0;i<LL_indentlevel;i++) {
+@@ -844,7 +842,6 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+                 errorList += "\n";
+                 lastTestFailed = true;
+             }
+-            LL_indentlevel -= 3;
+             if (lastTestFailed) {
+                 LL_message({}, true);
+             }
+@@ -852,7 +849,6 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+             if (lastTestFailed) {
+                 LL_message({}, true);
+             }
+-            LL_indentlevel += 3;
+         }
+         index++;
+     }while(name);
+diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
+index 7634526..94abe05 100644
+--- a/tools/ctestfw/ctest.c
++++ b/tools/ctestfw/ctest.c
+@@ -359,16 +359,14 @@ static void iterateTestsWithLevel ( const TestNode* root,
+         strcat(pathToFunction, separatorString);
+     }
+     strcat(pathToFunction, nodeList[i]->name); /* including 'root' */
+-
+-    /* print test name and space. */
+-    INDENT_LEVEL = depth-1;
+-    if(root->name[0]) {
++    
++    if(root->test == NULL && root->name[0]) { 
+     	log_testinfo_i("%s ", root->name);
+-    } else {
++    } else if(root->test == NULL) {
+     	log_testinfo_i("(%s) ", ARGV_0);
++    } else {
++    	ON_LINE = true;
+     }
+-    ON_LINE = true;  /* we are still on the line with the test name */
+-
+ 
+     if ( (mode == RUNTESTS) &&
+ 		(root->test != NULL))  /* if root is a leaf node, run it */
+@@ -413,9 +411,11 @@ static void iterateTestsWithLevel ( const TestNode* root,
+         ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
+ 
+         if (myERROR_COUNT != ERROR_COUNT) {
++          log_testinfo_i("FAIL: %s", root->name);
+           log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT, pathToFunction);
+           strcpy(ERROR_LOG[ERRONEOUS_FUNCTION_COUNT++], pathToFunction);
+         } else {
++          log_testinfo_i("PASS: %s", root->name);
+           if(!ON_LINE) { /* had some output */
+             int spaces = FLAG_INDENT-(depth-1);
+             log_testinfo_i("} %*s[OK] ", spaces, "---");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index fa25b3e7c8..8efdc83ce1 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -122,6 +122,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch \
            file://0001-test-Add-support-ptest.patch \
            file://run-ptest \
+           file://0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.34.1


