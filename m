Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B835EF36F3
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:10:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8673.1773040198218505586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VQsQCRHt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528f2bec4=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296sM8W021137
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 07:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lCxbQWJPWdnPyNct/G7w
	Ntbu7GSQ/Ncz05buMlZdRkk=; b=VQsQCRHtl0UDwLs79ZeZ+HwiPmDGYyxEfsa7
	VZu7uMunAPfAHbXpR1gBArK0nc8/sl38/M1J4EUGALWK5rimWrCRRJB/WGjiaOHr
	GOEQX456bMVO7ZU9RYWXWkqdhOdY/SoL4TkM1tq24T6gYaBhyxRfb1J1y6tjznNT
	sCV1r2W+m4p8A1S67LNF7zQXxyzg3j8bTpHMvEBgVZ18YdqSK32m2SlfltxpVxND
	bfJxKdfns12hzRJSo9dtEG1a9kH0KLhRZwWZ0QVxdg2V57pvYIKHXvlyBhllkgKo
	koyoCeYWsxAEFDg+VBV0I31FIwS+Igj+2YMRjijid1kL8QuabA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb081hhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:09:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Mar 2026 00:09:54 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Mar 2026 00:09:54 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Date: Mon, 9 Mar 2026 15:09:53 +0800
Message-ID: <20260309070953.2372929-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Sk7exBJAp4MayA3Z1z4bnmmc98ZKWpv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2NSBTYWx0ZWRfXwPg+7SlGtQtU
 N8ASVAceFgIejIzNvSQ1vKkkp/21+bgnIAQDyqgbExwx6K5zlgiZ1Zj+P3OwT2nhu/GDgmGijDs
 1BJkynCoYvT2d+2oOoLSql3WtxB9qrPWNYLa5/6Kcj+zqG8v9zKHXRVp3cDg4ngiFG2CPopGn5q
 KrSdINDtxFHNAr8pxh5roM957ChShDp8bZor9S17o0BaUdcuW+pXn6Q1ACINQs0BK9jp6LjF5sl
 iaZ8vaU7GAckzMgiJPasBbHCmCEfACFQ7g9GuBgShNQqy/BIqu3yvr5r1ZIaz5N7rVDMOtBiH4j
 WbKCWQZ//dhFQwksVAS/ZgT5s5XslwerLMIgbKC2UWZIR3FgD4VCBDIVW1DoPBCrlR7WgtSgrq7
 dW1jlu8uOpxfAwKQeUd8FTpH7sRQbnXXUFZM8RQQikIz+M8+mcSd+YemSg6DMdU3cLdVwyCXp6l
 BzXj0U47oBJ0mnYg1gA==
X-Proofpoint-ORIG-GUID: Sk7exBJAp4MayA3Z1z4bnmmc98ZKWpv1
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69ae7245 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=nQYV5XC8AAAA:20 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=LBSX2RE2-p1LFtTRt-sA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232681

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:https://github.com/Rogdham/pyzstd/blob/master/CHANGELOG.md

Recipe changes:
- Remove 0001-Remove-setuptools-version-limit-of-74.patch (no longer needed)
- Switch from python_setuptools_build_meta to python_hatchling
- Add python3-hatch-vcs-native to DEPENDS
- Add python3-misc to RDEPENDS (provides compression.zstd module)
- Remove obsolete do_configure:append:arm:toolchain-clang (setup.py no longer exists)

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
 ...std_0.17.0.bb => python3-pyzstd_0.19.1.bb} | 12 ++++-----
 2 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
 rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb => python3-pyzstd_0.19.1.bb} (53%)

diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
deleted file mode 100644
index f2910322ff..0000000000
--- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 14:38:31 -0700
-Subject: [PATCH] Remove setuptools version limit of '74'
-
-Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
-support beyond that which is needed for python 3.9 on windows. We
-do not have this problem on Linux
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index dd885e4..5d4d511 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- # setuptools 64+ support --build-option
- # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 under Windows
--requires = ["setuptools>=64,<74"]
-+requires = ["setuptools>=64"]
- backend-path = ["build_script"]
- build-backend = "pyzstd_pep517"
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
similarity index 53%
rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
index af7069b6ed..cda074221d 100644
--- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
@@ -9,12 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI += "file://0001-Remove-setuptools-version-limit-of-74.patch"
-SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
+SRC_URI[sha256sum] = "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
 
-# clang-16 with -flto segfaults on arm, therefore ignore flto for now
-do_configure:append:arm:toolchain-clang() {
-    sed -i -e "s|'-flto'|''|" ${S}/setup.py
-}
+DEPENDS += "python3-hatch-vcs-native"
+
+RDEPENDS:${PN} += "python3-misc"
-- 
2.34.1


