Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1D8C41513
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 08:33:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56934.1691483584032428456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 01:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=acOBL7T/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75846019c1=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3786q36u002937
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Aug 2023 01:33:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YmTGy
	EzOp6wiggBQco5vQ+ntZZeEN9ahYIs/wdLUMbU=; b=acOBL7T//9YaRmkxfdUkZ
	7ek4ka5VZ8SY2R6Jpq/eVxlKsB2E7HF1QPsY7aETiBWHSLyh5YaeHOkBNL0WDjOk
	YCuPjBy6rqzB3jPjDurpmfRFmulw/BhUdrgH4azLEl6sQrWtbkNK87pRw1/XJhcf
	8iZ5XQLxt8JKLTf7ftiEvIuksjrHpcwa8h0vMc5fwvG+K4Cjx9KfcgRWhDmKIlG/
	zFhOPxGDdd9ZT5/FuIgPDU/8P3sBDVMbGSH/Mk+Fpwp7r/4/K+XTXMQQ3f8Y4FlG
	0RIMf1H8dt/EHnlCU9v6wYXaAG4r7+RXExuxMrrSse8RytBPGVIEiY2a5NqS/Gd0
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9nxfj2y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 01:33:03 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 01:33:01 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] python3-pygments: upgrade 2.14.0 -> 2.15.1
Date: Tue, 8 Aug 2023 08:32:42 +0000
Message-ID: <20230808083242.3788723-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: YKRymE1fkKnT7rK7bDdKCismxl65X-T7
X-Proofpoint-ORIG-GUID: YKRymE1fkKnT7rK7bDdKCismxl65X-T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_06,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=886 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308080076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 08:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185652

From: Narpat Mali <narpat.mali@windriver.com>

* Upstream has dropped setup.py
* Inherit python_setuptools_build_meta instead of setuptools3
* Add self as maintainer, as this is a dependency for python3-sphinx

Adds some new lexers, updates a few others. A handful of bug fixes.

https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L6
https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L18

Have cherry-picked the upgrade commit from upstream/master:
https://git.openembedded.org/openembedded-core/commit/?id=22e2569ae4843071b2b48d026ca4742351baf6d1

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 ...{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} (76%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 07498a23a9..c9d790ca32 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -666,7 +666,7 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pygments = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pygments = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
index 16769e9263..e0e477100e 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
-inherit setuptools3
-SRC_URI[sha256sum] = "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297"
+inherit python_setuptools_build_meta
+SRC_URI[sha256sum] = "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.40.0


