Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9648C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 19:28:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.111648.1680636480217472093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 12:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WMZg8qMo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3458ae3fe2=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334JC1pL003715
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Apr 2023 19:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=nnIZ1+vIRBdXvfWfUrvbSrx03q2tdc6EsVlVy2UO5aY=;
 b=WMZg8qMo1SSuRBuzer/xtdlwqpHhG31CZBNy+D1J2sAX6FA/net1O10+J90Q/oMVM32K
 Bei3HaRgxxa61Dx6OTcU5ucnxoVWGRDM6S7z1ctr8scQ3GXMwtiaI4dgKKxFZqVrX493
 AVJGsjVy1sq13KoGqKa4dJfTE4nc8SC4fYSQnv7qDWOQT84oR9c55/ekFoR/iyWwoH8l
 CJ+dJA6RHP+YVEszYSjhJJeS2pTxehYG9BkRhl834nz3OBClvavi05bGFGqeftku2kVm
 /BvXJr7GIg/HHvmeAYXCXkQ3JZ4lpk3bCvyYe89fq3E/Ba8NlYpmjBnsKpaWoLeacexR dQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pp9u4knr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:27:59 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 4 Apr 2023 12:27:57 -0700
Received: from YOW-MASSELST-L1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 4 Apr 2023 12:27:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oeqa/selftest/bblogging: uncomment python stdout checks
Date: Tue, 4 Apr 2023 15:27:31 -0400
Message-ID: <20230404192731.7198-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IpXxehUzKlkbYXYyA1E56M--vVZNYl7w
X-Proofpoint-GUID: IpXxehUzKlkbYXYyA1E56M--vVZNYl7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_10,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=893 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179708

Since bitbake commit 81a58647b2f4fc0a2589b2978fc9d81b2bfe6aec
[bitbake: build: Make python output print to stdout when running with
-v (verbose)] we no longer need to comment out the python stdout
checks.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/lib/oeqa/selftest/cases/bblogging.py | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblogging.py b/meta/lib/oeqa/selftest/cases/bblogging.py
index 1534a36a85..040c6db089 100644
--- a/meta/lib/oeqa/selftest/cases/bblogging.py
+++ b/meta/lib/oeqa/selftest/cases/bblogging.py
@@ -105,16 +105,14 @@ class BitBakeLogging(OESelftestTestCase):
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_exit -f -v", ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # python tasks don't log output with -v currently
-        #self.assertCount(result.output, "This is python stdout", 1)
+        self.assertCount(result.output, "This is python stdout", 1)
 
     def test_python_exit_loggingD(self):
         # logs, verbose
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_exit -f -v", ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # python tasks don't log output with -v currently
-        #self.assertCount(result.output, "This is python stdout", 1)
+        self.assertCount(result.output, "This is python stdout", 1)
 
     def test_python_exec_func_python_loggingA(self):
         # no logs, no verbose
@@ -139,8 +137,7 @@ class BitBakeLogging(OESelftestTestCase):
         result = bitbake("logging-test -c pythontest_exec_func_python -f -v",
                          ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # python tasks don't log output with -v currently
-        #self.assertCount(result.output, "This is python stdout", 1)
+        self.assertCount(result.output, "This is python stdout", 1)
 
     def test_python_exec_func_python_loggingD(self):
         # logs, verbose
@@ -148,8 +145,7 @@ class BitBakeLogging(OESelftestTestCase):
         result = bitbake("logging-test -c pythontest_exec_func_python -f -v",
                          ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # python tasks don't log output with -v currently
-        #self.assertCount(result.output, "This is python stdout", 1)
+        self.assertCount(result.output, "This is python stdout", 1)
 
     def test_python_fatal_loggingA(self):
         # no logs, no verbose
@@ -173,8 +169,7 @@ class BitBakeLogging(OESelftestTestCase):
         self.write_config('BBINCLUDELOGS = ""')
         result = bitbake("logging-test -c pythontest_fatal -f -v", ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # python tasks don't log output with -v currently
-        #self.assertCount(result.output, "This is python fatal test stdout", 1)
+        self.assertCount(result.output, "This is python fatal test stdout", 1)
         self.assertCount(result.output, "This is a fatal error", 1)
 
     def test_python_fatal_loggingD(self):
@@ -182,7 +177,6 @@ class BitBakeLogging(OESelftestTestCase):
         self.write_config('BBINCLUDELOGS = "yes"')
         result = bitbake("logging-test -c pythontest_fatal -f -v", ignore_status = True)
         self.assertIn("ERROR: Logfile of failure stored in:", result.output)
-        # python tasks don't log output with -v currently
-        #self.assertCount(result.output, "This is python fatal test stdout", 1)
+        self.assertCount(result.output, "This is python fatal test stdout", 1)
         self.assertCount(result.output, "This is a fatal error", 1)
 
-- 
2.30.2


