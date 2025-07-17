Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA64C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 08:22:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43691.1752740539526150800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 01:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92934ef8f0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H4lugh031481
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:22:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdtvd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:22:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 17 Jul 2025 01:22:18 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 17 Jul 2025 01:22:17 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] lttng-ust: Upgrade 2.13.9 -> 2.14.0
Date: Thu, 17 Jul 2025 16:22:15 +0800
Message-ID: <20250717082216.459161-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: i16RlC6as0Y9HJaYuqpPvoVAcmQf1kdj
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=6878b2ba cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8
 a=TFK_pN8AgNZdR70Al1YA:9 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: i16RlC6as0Y9HJaYuqpPvoVAcmQf1kdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfXwq5xtTkA3APL
 CHR61SSV/7xZzJGfNWdIhtDzzX7xdI0iPfJMxOODDWcZL3L0JKN8tjCNzOa9AEYsDtRB4qT8R8P
 lbi3pN6ofMTYB/5dT4yWYvg0bzcKezdNIqfvk3HAP1qF9WBpsIT9mA/nx+Qht7PUCqgaR+UC8Fk
 T4muJdzp1LxQ8+cenLQ5dqAGWdu+nqCi/YsxElE0HinFsqwWX/fKxHuHVhq1dbIiOMXC1oOAJK9
 lZ7HRefsZvlNc8X6PgbI0ltkxKoV3U/AUXGG+wEGUTL552QK5hkjFhOgfW2DpycfyHC6xbvKCKO
 7lGWyyO+K9tps2iqq5XskmeVdhj5NU9vJPNANgQ7YuHLsx3QcrR31FZG3JjPEkzqkiuqR04/Hv1
 4nAGHu/I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220520

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
index dd7657e0cc1..1a15c5b4201 100644
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


