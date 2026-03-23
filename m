Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5E8D58CC8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:11:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9376.1774235482450773422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L7y0eN8I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542962ecc=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N2e4P33415377;
	Sun, 22 Mar 2026 20:11:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=HRjES0RIU/qgfT/vUl7x
	U57Z4UK7usFrzhO6BwRWGx4=; b=L7y0eN8I/yHeqp4EXv9gty+OxL1eT6aYNIRj
	fVgWGK1tVw/XkWZiqLqFBn5P+jHpjoHJEB//LPDCS++VWZ7BqHbNNmXuNQrfprKl
	IzqjQCbYNTgZwJMiHlFdcMNUTJhxVsnVGxusZ3GmAbQMvTVNFppg7bhwkY1HRGYC
	BNyHd8YsruVkxd95YvIE7a3VYKgntNn87cBxrwrGVkmsu/rGVI2hjUuFCAUkPd5e
	CWkJu5+l0yva43qcvyqJdmxEQFKTAkUMuwKjhTvPZ+Q1GgYJrCi+3QYuyPDLLFKn
	Rd4JVD95cnrAlR1s0DbWp3H4HqXg6uVrbKMdrZeRzafGh38APw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky97ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Mar 2026 20:11:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 22 Mar 2026 20:11:18 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 22 Mar 2026 20:11:17 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <Ross.Burton@arm.com>
Subject: [PATCH v2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
Date: Mon, 23 Mar 2026 11:11:16 +0800
Message-ID: <20260323031116.2513728-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyMiBTYWx0ZWRfX8XNubuB7LYkD
 2e/nAYnNn39Cnm0+10preVVqR6F5BDK/zJhjehdt0HEgt1xwgmqsXlqCD5+m3d4g/bgJVDUQUHK
 rVuDZn7nro8pDn2MWP6JOySeHRksIvTIMqmGrFofl9aZMR95QDVmWAe1yugXA6Q1Kg45fAQURGT
 5gvIyYNgYiFDJ74rguYrJZG4h5P7HPqi287bDFn8KPlMcYb2rG6OWq1dBLg+Z1XPwGpKSjscO4R
 DUWpZ9QOazM2qc7QxMzcZZAp8NN9W9CE6CjcbDNAgCLKWoMvnMozhpN/Xdq4RrQikgFRKf4IfhI
 3xE3xrnyXffawcnmTPslvsJpy+Ao4OlcR1MH2oRiZFOM6O1XclTPj+QcqVjqXVjXD2kDGJIaQUi
 kmQRsCUphQIxMDF7pveWBP6ITGI/7plSxIlcpQgDqA+xVc7B1m7qlhSIcukarzNtFV5K8Dcz2IO
 o6wUd7kwtiNuL6HXxOQ==
X-Proofpoint-ORIG-GUID: KHsbkhWJGv8thKwhfYF_n3SDvJeUzOg3
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c0af56 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=nQYV5XC8AAAA:20 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=LBSX2RE2-p1LFtTRt-sA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: KHsbkhWJGv8thKwhfYF_n3SDvJeUzOg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233690

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:https://github.com/Rogdham/pyzstd/blob/master/CHANGELOG.md

Recipe changes:
- Remove 0001-Remove-setuptools-version-limit-of-74.patch (no longer needed)
- Switch from python_setuptools_build_meta to python_hatchling
- Add python3-hatch-vcs-native to DEPENDS
- Remove obsolete do_configure:append:arm:toolchain-clang (setup.py no longer exists)

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
 ...std_0.17.0.bb => python3-pyzstd_0.19.1.bb} | 11 +++-----
 2 files changed, 4 insertions(+), 34 deletions(-)
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
index af7069b6ed..ccf37eacf3 100644
--- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
@@ -9,12 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI += "file://0001-Remove-setuptools-version-limit-of-74.patch"
-SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
+SRC_URI[sha256sum] = "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
+
+DEPENDS += "python3-hatch-vcs-native"
 
-# clang-16 with -flto segfaults on arm, therefore ignore flto for now
-do_configure:append:arm:toolchain-clang() {
-    sed -i -e "s|'-flto'|''|" ${S}/setup.py
-}
-- 
2.34.1


