Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C4EC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 08:08:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7568.1675152480853518112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 00:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395d7d770=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V7uJHO028441
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 00:08:00 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncyv8atc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 00:08:00 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 00:07:59 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 00:07:58 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glslang: branch rename master -> main
Date: Tue, 31 Jan 2023 16:07:58 +0800
Message-ID: <20230131080758.2088809-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DXOtf4PsH72RcevDll-XM7QvMZTa37w0
X-Proofpoint-ORIG-GUID: DXOtf4PsH72RcevDll-XM7QvMZTa37w0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=808 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176509

From: Mingli Yu <mingli.yu@windriver.com>

Branch name is changed from master to main.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-graphics/glslang/glslang_1.3.236.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
index 99eca6a6c1..22838dfc8c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
 SRCREV = "77551c429f86c0e077f26552b7c1c0f12a9f235e"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


