Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C8BC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8462.1753349298474626772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 02:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9300d03ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O8TstJ560959
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:17 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483hbq01pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 24 Jul 2025 02:28:15 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 24 Jul 2025 02:28:15 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 1/4] lttng-ust: Upgrade 2.13.9 -> 2.14.0
Date: Thu, 24 Jul 2025 17:28:11 +0800
Message-ID: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Y9f4sgeN c=1 sm=1 tr=0 ts=6881fcb1 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8
 a=TFK_pN8AgNZdR70Al1YA:9 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QjJOsg0bxZmc6BBnxSf7PiMhiVSUqmrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX+FLyOwnQKZXE
 PKiPEGEQwfsfOfg1dyF9uus54BXAh+PQtH5N4FlLLGNFg/HPompXGKhBlZzrxYqQLE6XRo/ytZY
 RbdK7kRUSOumOXXp4x6w9p4QU2C1hjZbwLgeNv+jP1F+EA+DjtxSn7wNdB3RUaC/X4ib+L/OU2C
 JIjfu/kwgKG8CoiHgfqQV2ByiUVGFUeD0iz/pJ+rVGJ5vimOfdOtSiENtfrPQPbxxz+v+b8+5Kh
 9jqztSGF+XWAoITPivPBeLeFTIjdAKwUV0Jsks4YaB0sS5DqLyhz9F5Sn4MuAtlv5ePT3iICOCs
 250OzUuEGKVc1XkE8ahfXaeU+En5b0FHs8Ghm/AnDBT+FAaEKJC4VqukBtCYkgUx5rb62YEVGJm
 LFgThWXn
X-Proofpoint-ORIG-GUID: QjJOsg0bxZmc6BBnxSf7PiMhiVSUqmrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507240061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220826

From: Mingli Yu <mingli.yu@windriver.com>

License-Update:
  implement REUSE with SPDX identifiers [1]

[1] https://github.com/lttng/lttng-ust/commit/e03d7c66c57bf268b87296566a5160039f35ccfb

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index dd7657e0cc..1a15c5b420 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
 LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
@@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "2ad6d69a54a1d924c18a4aa7a233db104e3cc332bcdd240e196bf7adbed3f712"
+SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
 
 CVE_PRODUCT = "ust"
 
-- 
2.34.1


