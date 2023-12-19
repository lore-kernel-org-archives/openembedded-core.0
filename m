Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8E7C35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 02:47:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3501.1702954039849845660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 18:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aoROQwCR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0717775950=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ204YN021389
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=wsRCkJD7XxhTXvqB6W4bmZgHW4wT6ZjpE5cloaEZa58=; b=
	aoROQwCRic8nc/De8fyLM0xaIT2UErveI1b1er0AIOHXJnvEY+oIYv2JZ2Q5Y0kE
	Ks5R7oWBMUzJS8/BqfWOyA6WRr2EooeYPIIAb/NTBNzAaEFDiJq/rfljCy1nP/7/
	psmAayO+eJ6zX+dj+QvXAEsfIa5ONMgJkYdR8Tsrvsi+OboBmfJbrhcrgWih0IpJ
	Caiq6osL6Q/oEbHEUWJxKjNC5zk63w2l5CQj+20JJK1MLd/te1ZWWU5ttvRZv3DV
	dAUFrxYWh27zv1DAR9IMEMGUp7yt7U5TnyYNT0y7S/D/Hay5wJFUL1YGXYJg+HNb
	DXxbfO8Pr750rmhFBsQZjw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xarcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:47:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 18:47:24 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 18:47:23 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 2/2] ptest-packagelists.inc: Add python3-license-expression
Date: Tue, 19 Dec 2023 10:47:15 +0800
Message-ID: <20231219024715.4040882-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219024715.4040882-1-mingli.yu@windriver.com>
References: <CANNYZj9aLEa=zCFMxv3cdjmwDdk3ZRyhsn+qtYFeY1LLBDyfPg@mail.gmail.com>
 <20231219024715.4040882-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o08B8yi5t1UtQ1Bpp7pliti3eqmiF5IB
X-Proofpoint-GUID: o08B8yi5t1UtQ1Bpp7pliti3eqmiF5IB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=922 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 02:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192687

From: Mingli Yu <mingli.yu@windriver.com>

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
    ============================================================================
    Testsuite summary
     # TOTAL: 175
     # PASS: 175
     # SKIP: 0
     # XFAIL: 0
     # FAIL: 0
     # XPASS: 0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 7ca23cb4f0..9057c12b09 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -62,6 +62,7 @@ PTESTS_FAST = "\
     python3-hypothesis \
     python3-jinja2 \
     python3-jsonpointer \
+    python3-license-expression \
     python3-markupsafe \
     python3-more-itertools \
     python3-pluggy \
-- 
2.25.1


