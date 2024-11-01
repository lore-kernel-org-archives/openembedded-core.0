Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6344E674B1
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 07:59:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32486.1730447934241379607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 00:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1035821dfb=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A16i3pA006116
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Nov 2024 07:58:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mf2e8ncj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:58:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 00:58:52 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 00:58:51 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kexec-tools: update COMPATIBLE_HOST because of makedumpfile
Date: Fri, 1 Nov 2024 15:58:38 +0800
Message-ID: <20241101075838.1598585-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=K4dwHDWI c=1 sm=1 tr=0 ts=67248a3d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NtapVFAgl2IVE8EElV0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IvT3A05Y_NATCSXeHWFzBT8sBDPCmOTV
X-Proofpoint-ORIG-GUID: IvT3A05Y_NATCSXeHWFzBT8sBDPCmOTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_04,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=553 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411010056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206605

From: Kai Kang <kai.kang@windriver.com>

makedumpfile is not compatible with mipsarcho32 and riscv32, so set for
kexec-tools accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb | 3 +++
 1 file changed, 3 insertions(+)

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


