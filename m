Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D2FE674BA
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 08:29:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33127.1730449789309735439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 01:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1035821dfb=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A16OYPo009769
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Nov 2024 01:29:49 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mew20pwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 01:29:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 01:29:48 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 01:29:47 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] kexec-tools: update COMPATIBLE_HOST because of makedumpfile
Date: Fri, 1 Nov 2024 16:29:43 +0800
Message-ID: <20241101082943.3836337-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5Ojan5tLTWja4PtoIFmqObz6ZUmkqdUt
X-Authority-Analysis: v=2.4 cv=dLb0m/Zb c=1 sm=1 tr=0 ts=6724917c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=cQFC9DkW39RecSc0iagA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5Ojan5tLTWja4PtoIFmqObz6ZUmkqdUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_04,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 mlxlogscore=577 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411010059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 08:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206609

From: Kai Kang <kai.kang@windriver.com>

makedumpfile is not compatible with mipsarcho32 and riscv32, so set for
kexec-tools accordingly.

And update packagegroup-core-tools-testapps too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb          | 1 +
 meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 34af40a43f..180660adab 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -13,6 +13,7 @@ inherit packagegroup
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS:e5500-64b ?= ""
 KEXECTOOLS:microblaze ?= ""
+KEXECTOOLS:mipsarcho32 ?= ""
 KEXECTOOLS:nios2 ?= ""
 KEXECTOOLS:riscv64 ?= ""
 KEXECTOOLS:riscv32 ?= ""
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
index be24d064bb..9f5eb6e8c1 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
@@ -82,5 +82,8 @@ SYSTEMD_SERVICE:kdump = "kdump.service"
 SECURITY_PIE_CFLAGS:remove = "-fPIE -pie"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
+# makedumpfile would not compile on mips/rv32
+COMPATIBLE_HOST:mipsarcho32 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
 
 INSANE_SKIP:${PN} = "arch"
-- 
2.34.1


