Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7571FC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 10:28:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34548.1741602511385524971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 03:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5164e9261a=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A6NJlF030515
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 03:28:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qhhxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 03:28:30 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Mar 2025 03:28:28 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] libcap: upgrade 2.73 -> 2.74
Date: Mon, 10 Mar 2025 10:28:09 +0000
Message-ID: <20250310102809.3577826-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67cebece cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Vs1iUdzkB0EA:10 a=gFgmyHasAAAA:20 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=tBsRXd-L8O71sWkwwXoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: t7dOqrkDB1LrE1Eed66hnVQHyNtH4Kcv
X-Proofpoint-ORIG-GUID: t7dOqrkDB1LrE1Eed66hnVQHyNtH4Kcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=958 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 10:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212509

From: Yogita Urade <yogita.urade@windriver.com>

This upgrade includes fix for CVE-2025-1390

Changelog:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.ccbrq82zh7n9

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-support/libcap/{libcap_2.73.bb => libcap_2.74.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.73.bb => libcap_2.74.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.73.bb b/meta/recipes-support/libcap/libcap_2.74.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.73.bb
rename to meta/recipes-support/libcap/libcap_2.74.bb
index 94601c75b3..75019fd35f 100644
--- a/meta/recipes-support/libcap/libcap_2.73.bb
+++ b/meta/recipes-support/libcap/libcap_2.74.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5"
+SRC_URI[sha256sum] = "eb85271f2893188644b6451cec8ce99f4541498f16ff9f84877c2fc872717714"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.40.0


