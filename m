Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0287FE67A79
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12738.1772521016035331599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p5dmBe+2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235Ia0e3905950
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:56:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=mKDZWTYaZlsbV4yXdBIUx9Ytm5rjdVbM+DQRArhs2wY=; b=p5dmBe+2ylHJ
	q+hTy3RqXZZNNoeYtV7ZOnkyl2iy1IJ30YFueQvdtV+ip7uNWr5IUrcR5jMw2Ewk
	T3S/oPBhSQQDi2O/dKe8L+4O8x1CQXj64DQtYeWBdsAKapj1bHW/WQkZJ+S2UXgd
	4opoBCVMG6S2DW8tf9pIsOAXikZM0R5M9ZXcFDNp2XfQsxPVB11J5zAaVFf4f57v
	7ZDjL0QA4ckw46r5i+6Ad9evLVSODDPAbpWA0qEO1Htk5tR8okx/1aHk9DP5UWPy
	CK9BobmftX+LocdigVTos7IYfcahVD8lKmE9XaQ+DtWmDGO9fUCaBBo7GqxXjTDS
	BYEj0pwBZA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh430b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:56:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:54 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:53 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 13/19] python3-pyproject-metadata: upgrade 0.10.0 -> 0.11.0
Date: Tue, 3 Mar 2026 14:56:34 +0800
Message-ID: <20260303065640.2541884-13-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Kx_qIHqQ1-Vlrc-EqZTfY23wvbburYBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfXyEhWHSaRiNws
 KgQ0dhodI2qDIiLCC8JgUQch4mhuK0oYSJFmnWVzCVNrNWNeuRH8Uf7C4Wz4R7CD5u6NygGzIEh
 yZ91WMzIcKSbRx3cNXYKt51NhY4GF8ru7qqqTpbfFgy2hQZ8khoGBi3hWJ3KkiKXzNdvTfF644v
 jXCjrARNrKsSUWtVu3wyC4/7RmD9srdlHxKCvL5Lgj3EkCqcbTz78WtmJujtYfWVHbyF5zQ1rgC
 Qnqe+FKRegn6EZEuiDJrjCCUGIkHFHiaea431YLtpO7LC1JX8fC1Zxz7+PQTUidHDkGV6IJ6PAh
 EHsKW7vVoYs43Qn9OLzJNVOfVK+KsGCBtsHBI4oRI0+A3ktuwZbpdB1oVhfV0T0AzP9VndDvEbe
 yEGyndV6flfexz8UtRkKgbVhxUrpA1iA8Sf+nvQkkQvxwioIY/r1p9VxsH7gWG3cJGFtNSPGi5Z
 tCQzL5jCoWY9iKwAZ6g==
X-Proofpoint-GUID: Kx_qIHqQ1-Vlrc-EqZTfY23wvbburYBj
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a68637 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=H-e_mD_7AAAA:20 a=t7CeM3EgAAAA:8
 a=EuUwx4xs6hvqi5ODsLYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232251

Relase note [1]:

This release refactors a lot of the internals to break up conversion and validation.
This should not be noticeable except for better error messages in some cases. We also
now test on some downstream projects; if you are using pyproject-metadata for a backend,
you can suggest adding a downstream test to our noxfile.

Refactoring:

    Restructured internals around conversion.

Internal and CI:

    Test on some downstream projects.
    Remove some PEP 621 terminology

[1] https://github.com/pypa/pyproject-metadata/releases/tag/0.11.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-metadata_0.10.0.bb => python3-pyproject-metadata_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.10.0.bb => python3-pyproject-metadata_0.11.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
index 5b5396fdd7..02a9064f2a 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "7f5bd0ef398b60169556cb17ea261d715caf7f8561238151f51b2305084ba8d4"
+SRC_URI[sha256sum] = "c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.34.1


