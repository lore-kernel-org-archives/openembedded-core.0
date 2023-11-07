Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96701C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:53:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8454.1699358027687162202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T/KiSmCw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96752bfcfe=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A7917NJ017473
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Nov 2023 03:53:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=TfD2d
	2VbIfsWpjHaNlDWwJSLlmD/b5pfFLTx7nY/KUI=; b=T/KiSmCw/e9bwD99/6zjU
	TV8Ne//OHDQoU/jsLpWnZ2bnrfqmSP3wU3kgLgXc2PaDQ2pPB8GkNbPYXUWG6JKR
	gc9SxF0eyjKD2b5fBjrPpR5thKCMVlv8gevyR4QsJuWH7+QGTK9XT4ct7ZD2Bt8q
	vHMUku2fnPUmHFC0QtDqc73uY8sitwhaeijpskkas+eZT7iG5AFHAyleAINyThsk
	bu+1bldZbhdEeZHkbdIw4pa2CB7x/rQC7fqXoSen6qzJqWmI3Dzxs9SSD1BUY+wT
	7OhmtOfp2pFN9F6MCSwFGXMP4CH+7ubreszdHLSCNPthpZ2Xuwwp+fHLYUMJwYDz
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5nffta26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 03:53:47 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 03:53:48 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-jinja2: Fixed ptest result output as per the standard
Date: Tue, 7 Nov 2023 11:51:58 +0000
Message-ID: <20231107115158.2423357-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: zi8qts06sQm0u23yg7mPAkpJGu3Tlymq
X-Proofpoint-ORIG-GUID: zi8qts06sQm0u23yg7mPAkpJGu3Tlymq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_02,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311070098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190271

From: Narpat Mali <narpat.mali@windriver.com>

There was an extra space between the result and ':'.
After removing extra space, the ptest result will be:
result : testname -> result: testname

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/recipes-devtools/python/python3-jinja2/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
index 3004024619..5817735a63 100644
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s : %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.40.0


