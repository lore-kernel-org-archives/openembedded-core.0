Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC2FE67A89
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12825.1772521017977665280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zt+VnowO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234sKoa1536224
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kVGayZ0Derm7VWY9Wn52+HJ3Jo9HqeOOFyqv/b7LiCM=; b=Zt+VnowOzxE1
	JFaI9vx0+XXlIbbIDdU7O9ZM1/sADpRXbF8sr0azRX9k7yrV6+exHs2RPG0jZn9E
	YPR71rbPYa81nBVJj9S9rmlFuuFHNflgFy6K7EMPqhRpyddB3i44nYRDELR7C+ey
	6Oy+pHTdlUAjUUT8iIHSOJ9tPfsV1KvDdpDQEnJc15yU0c9p4wsUhiOAFTjHuAIy
	kfTWUznTkA4Ml7jdr8ReEUWnD+IiQn3WLZpZnB/esj4YAR8SeNTKyjvtytGt9tXy
	vADIqqY2KekZ6FylZ5mPDOtUllBR9kY9Tg+4bg4f/oWqz+dth3TMBWx6ZIMqpJtv
	fBZy4ahW/g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4kack-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:55 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 14/19] python3-setuptools: upgrade 80.9.0 -> 82.0.0
Date: Tue, 3 Mar 2026 14:56:35 +0800
Message-ID: <20260303065640.2541884-14-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a68638 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=dXvAoEkxAAAA:8 a=t7CeM3EgAAAA:8
 a=wSSiNX-koXoRra6oJ88A:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: S5Ul_PV6mZZ5z4R8Ou2HOofRQtI2fM5u
X-Proofpoint-ORIG-GUID: S5Ul_PV6mZZ5z4R8Ou2HOofRQtI2fM5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX5JCsKCawj7Py
 hoagKbEfGa04gPUFXWSnP4KkpwOzqz523L8M2d/+6+shKUXwNTH2axnRauyxECTI5B2oEeIUX+T
 Ysyf3wDWlIIODrN7ZpX5aDDFpDBaCxWcAlL03YowzZ7SJrBrqgJVR9ozOcqIcHeYVsxZVhrxIeZ
 +v+lwcNdY+yXma0YFBB7nDWPuiu9vTEG4bexiQwsIpdbETJvhtGGdexEeXLV5E2tuRqBH4e3gq6
 IFfKP0jDtm1cjJQVvSzGhAcUTlJ9BSMQvux95RhJTUvLp4eNjrIbh+4gxroeoU79l54ffw+/2Ci
 cDArrYEOUMqy7RWuocdamm7lElkkaReZBFnzl+5aUAMB8gDnY45+HJFukkRENafGKfNBoVGz1qS
 MVKacaJESWYtTOV2PuEdnCgC+7LdLUIUA+Hg+lSBo1rxxzWK8d5gKmBjgJON2Dpn6nkWXEgSIMV
 U9iYjWpAmvUOr5qPFRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232252

History v82.0.0 [1]:

Deprecations and Removals
- pkg_resources has been removed from Setuptools. Most common uses of pkg_resources have
  been superseded by the importlib.resources and importlib.metadata projects. Projects
  and environments relying on pkg_resources for namespace packages or other behavior
  should depend on older versions of setuptools. (#3085)

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-_distutils-sysconfig.py-make-it-possible-to-substite.patch | 2 +-
 ...ython3-setuptools_80.9.0.bb => python3-setuptools_82.0.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_80.9.0.bb => python3-setuptools_82.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 39153883b0..0fc5e3f134 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From e2eab8c254f16c461de25123f6859b8a18db5cd8 Mon Sep 17 00:00:00 2001
+From cb37237fd60689ccf999689ff60acabe8e1ec1de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
index 533d8ce3d4..e9313d2a07 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
+SRC_URI[sha256sum] = "22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb"
 
 DEPENDS += "python3"
 
-- 
2.34.1


