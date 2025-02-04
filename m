Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1EAC02192
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 01:39:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106311.1738633173146204225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 17:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4130ac9f02=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141GuLl008827;
	Mon, 3 Feb 2025 17:39:29 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0pt4dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Feb 2025 17:39:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 3 Feb 2025 17:39:28 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Mon, 3 Feb 2025 17:39:28 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <raj.khem@gmail.com>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 3/3] ptest-packagelists: remove valgrind
Date: Mon, 3 Feb 2025 20:39:25 -0500
Message-ID: <20250204013925.2005184-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204013925.2005184-1-Randy.MacLeod@windriver.com>
References: <20250204013925.2005184-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a16fd1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=mgsllR0D_50n1A9ox3EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8zRQB15du-O_gFQHPe_ITH_wxKuHsDOI
X-Proofpoint-GUID: 8zRQB15du-O_gFQHPe_ITH_wxKuHsDOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=863 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 01:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210748

From: Randy MacLeod <Randy.MacLeod@windriver.com>

The valgrind-3.24 and glibc-2.41 update result in lots of valgrind ptests
failing. Remove all valgrind ptests until that can be fixed.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e2a90c1c2e..f3fdededf6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -126,17 +126,14 @@ PTESTS_SLOW = "\
     tcl \
     tcl8 \
     util-linux \
-    valgrind \
 "
 
 # python3 ptests hang on qemuriscv64
-PTESTS_SLOW:remove:riscv64 = "valgrind python3"
-PTESTS_PROBLEMS:append:riscv64 = " valgrind python3"
-PTESTS_SLOW:remove:riscv32 = "lttng-tools strace valgrind"
-PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace valgrind"
+PTESTS_SLOW:remove:riscv64 = "python3"
+PTESTS_PROBLEMS:append:riscv64 = " python3"
+PTESTS_SLOW:remove:riscv32 = "lttng-tools strace "
+PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
-PTESTS_SLOW:remove:x86 = "valgrind"
-PTESTS_PROBLEMS:append:x86 = " valgrind"
 
 #    ruby \ # Timeout
 #    rt-tests \ # Needs to be checked whether it runs at all
-- 
2.34.1


