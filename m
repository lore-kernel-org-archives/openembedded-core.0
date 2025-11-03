Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE07CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:44:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15394.1762155843906855293
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xhri3aXc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=340267741b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34KJuC2546656;
	Mon, 3 Nov 2025 07:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qNO9bLUBN57yZte/xy7X
	7SGTZZ/7G3FvXuNfe+1v+TM=; b=Xhri3aXcsko744Bzv5bQPecwrHsUluDxWnH7
	u03VbChKxELoToPALFoZvERUEF8PdYe8eg39TnC3mQryp9GoQk6VLFga3OJ/YVMi
	RpsrVJh4wir4LVNePq5gfspKElwQYXxfNAxFDXFOC12xPaMXb7XPKQq8Pp8ZtIyT
	R9o6Z3nnJonnkSYgguQo/d3vu3ZtvVwjzCQzoxAznR61OYIHotohyOE+jSB5x0EA
	eSQfJ8X5+xlaL71j/jOrMTs+GllYQ8Ler45iqmUxtDTDDlIQGWViJxS8NXnQdrSo
	lRAh2rH6AnvGWqzqp58pv3CNmOnxVV1KsjItzKbWRI1halRajA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a57dx1h4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Nov 2025 07:43:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 2 Nov 2025 23:43:56 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 2 Nov 2025 23:43:55 -0800
From: <jiaying.song.cn@windriver.com>
To: <Ross.Burton@arm.com>, <alex.kanavin@gmail.com>,
        <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] icu: use automake ptest output format
Date: Mon, 3 Nov 2025 15:43:54 +0800
Message-ID: <20251103074354.4086836-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mMyj6iQrlQ6eyqNjXLso1gtomhULzu1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3MSBTYWx0ZWRfX7blDH341G0yY
 FkOxOVAz/1LSg9PheTGm670kuBE8/bAw4+yPZoKkErOqvWsVIRArqB2go/pOLnhrmpwX0lIWkK6
 yTagDEgFc3VJAwsxzuOaZg4Qy7Tmw8RJbk0zFx6FfzwlT2oDHE0bvJwRMh060XBb+rcAWTXzCZu
 QKbpdMBzoFRUSH6rubwd1ygw+YwoADs39kNAS8Co7tdF76lwra5LPRDiylEXRnMEPgjdaH4G83E
 9ONc/qGJhRltoOZ43SDKXEpSWMSmWPhokuniDe74CCaEM7eFLWAPqnFHF/miO1ReT4pLsKPySTX
 KbjEx9/FixlrmsaJcBaS5f1cplKaDRCboUitxkPtdH+0kSOSN9WYP38ZDvDUNd4qdi9HLXe3Ilb
 /d5xIty+f5Nz67nmskRPoHjmhLjCfQ==
X-Proofpoint-GUID: mMyj6iQrlQ6eyqNjXLso1gtomhULzu1g
X-Authority-Analysis: v=2.4 cv=BeTVE7t2 c=1 sm=1 tr=0 ts=69085d3d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=lMZyJBgflejPjpnZdzwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225611

From: Jiaying Song <jiaying.song.cn@windriver.com>

Make ICU ptest output compatible with Automake format.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...utput-compatible-with-Automake-forma.patch | 52 +++++++++++++++++++
 meta/recipes-support/icu/icu_77-1.bb          |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch

diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
new file mode 100644
index 0000000000..b30056a4fe
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch
@@ -0,0 +1,52 @@
+From f56e295e936c6c6d9c7219ef649697891cd11382 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Mon, 3 Nov 2025 11:34:06 +0800
+Subject: [PATCH] Make ICU ptest output compatible with Automake format
+
+Change test result format to PASS/FAIL for Automake compatibility
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ test/intltest/intltest.cpp | 4 ++--
+ tools/ctestfw/ctest.c      | 3 ++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
+index 33829b0..07071ea 100644
+--- a/test/intltest/intltest.cpp
++++ b/test/intltest/intltest.cpp
+@@ -830,11 +830,11 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+             saveBaseLoc[0]=0; /* reset path */
+             
+             if (lastErrorCount == errorCount) {
+-                snprintf( msg, sizeof(msg),  "   } OK:   %s ", name );
++                snprintf(msg, sizeof(msg), "PASS: %s\n   }", name);
+                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
+                 lastTestFailed = false;
+             }else{
+-                snprintf(msg, sizeof(msg), "   } ERRORS (%li) in %s", static_cast<long>(errorCount - lastErrorCount), name);
++                snprintf(msg, sizeof(msg), "FAIL: %s\n   } (ERRORS: %li)", name, static_cast<long>(errorCount - lastErrorCount));
+                 if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
+ 
+                 for(int i=0;i<LL_indentlevel;i++) {
+diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
+index 7634526..727b164 100644
+--- a/tools/ctestfw/ctest.c
++++ b/tools/ctestfw/ctest.c
+@@ -413,9 +413,10 @@ static void iterateTestsWithLevel ( const TestNode* root,
+         ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
+ 
+         if (myERROR_COUNT != ERROR_COUNT) {
+-          log_testinfo_i("} ---[%d ERRORS in %s] ", ERROR_COUNT - myERROR_COUNT, pathToFunction);
++          log_testinfo_i("\nFAIL: %s\n} ---[ERRORS: %d]", root->name, ERROR_COUNT - myERROR_COUNT);
+           strcpy(ERROR_LOG[ERRONEOUS_FUNCTION_COUNT++], pathToFunction);
+         } else {
++          log_testinfo_i("\nPASS: %s\n", root->name);
+           if(!ON_LINE) { /* had some output */
+             int spaces = FLAG_INDENT-(depth-1);
+             log_testinfo_i("} %*s[OK] ", spaces, "---");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_77-1.bb
index fa25b3e7c8..370c14af81 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_77-1.bb
@@ -122,7 +122,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch \
            file://0001-test-Add-support-ptest.patch \
            file://run-ptest \
-           "
+           file://0001-Make-ICU-ptest-output-compatible-with-Automake-forma.patch \
+          "
 
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
-- 
2.34.1


