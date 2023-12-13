Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE44FC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 10:21:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33157.1702462892786043845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 02:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I3Wodibf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0711e39491=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD9OZXt001195
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 02:21:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=LDKw1
	csVBAiFlOguZZ2uZLstEW5CqX8RtSP/026BbgM=; b=I3WodibfOuRGIzQQKKwGs
	hUorTtd9S2e4XdGEgXvoSJvkLwDlGfs7YEToBYwvhjep/PTPbSrwU2PiEIkaxuZJ
	JCuLck6Bwx5unBRaD+csx+KcDSEFysrZQ2f9atLkdFTmig/wpE2+qP3ODvgbq6+B
	7iF36dfugDFi6Zp0YfY8KNqW8t5nnTl3BRI3Oxi9siOySy2YjegB7EsyMjNCB50K
	nfUyK9Z7b4o5Rb7gvhFTObE9s/gbj8N60bR0HbkZwbahf2hYTAGQ5GB+tuy2rFta
	keIpQyoahISMEhtxUH+AOv3jnNFXSghb6/sK/oVMQWo1uZtFlwAKVyKpjemMVjuE
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxjacu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 02:21:31 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 02:21:36 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 02:21:35 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-license-expression: Fix the ptest failure
Date: Wed, 13 Dec 2023 18:21:29 +0800
Message-ID: <20231213102129.618430-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lxogQvAJGa2xJKeqxBnN9dqhR8H9AqVs
X-Proofpoint-GUID: lxogQvAJGa2xJKeqxBnN9dqhR8H9AqVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=923 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 10:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192278

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below ptest failure:
 self = <test_skeleton_codestyle.BaseTests testMethod=test_skeleton_codestyle>
 def test_skeleton_codestyle(self):
 """
 This test shouldn't run in proliferated repositories.
 """
 setup_cfg = configparser.ConfigParser()
 setup_cfg.read("setup.cfg")
 > if setup_cfg["metadata"]["name"] != "skeleton":
 tests/test_skeleton_codestyle.py:22:
 self = <configparser.ConfigParser object at 0x7fd87cf55110>, key = 'metadata'
 def _getitem_(self, key):
 if key != self.default_section and not self.has_section(key):
 > raise KeyError(key)
 E KeyError: 'metadata'

After the patch:
 # ./run-ptest
 [snip]
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_bad_syntax
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_exception_as_regular_key
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_exception_with_choice
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_exception
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_exception_strict_false
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_key
 PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
 PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_licensing
 PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_info
 PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_info_vendored
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_duplicated_elements
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_empty_input
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_or_relationship
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_regular
 PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle

 ============================= 175 passed in 10.36s =============================

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-license-expression/run-ptest                 | 2 +-
 .../python/python3-license-expression_30.1.1.bb                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-license-expression/run-ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
index 5cec711696..3385d68939 100644
--- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
+++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
index 31fb88d6e5..5d3923d487 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
@@ -33,4 +33,5 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/src
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
+    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
 }
-- 
2.25.1


