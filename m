Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAD9C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 11:58:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12545.1746791884325723930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 04:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7224430138=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5495WCja030450
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 11:58:03 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430pfuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 11:58:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 04:58:01 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 04:58:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] compiler-rt-sanitizers, compiler-rt: skip for armv5
Date: Fri, 9 May 2025 19:58:00 +0800
Message-ID: <20250509115800.3929803-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681dedcb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=rDDrNwEaE9o9UNVAZNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0cR1nJD5ZlXHXNqB-7CszC1bOiTFHSPp
X-Proofpoint-ORIG-GUID: 0cR1nJD5ZlXHXNqB-7CszC1bOiTFHSPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExNiBTYWx0ZWRfX3DZoVsd5/wda 8dJ76XoR53NVRI2n0d70Os6LGBgJMDXmFN8RArdJ8/38FRAyhIYrf4RhPDn3n1Zq4dao5SQGSTK N2g0Fu6mCyMmk/hzfy9ItXma9bIbFU3K3AA7l0Vw2MpChAoCWE2/cjl/dt91drDOOBAKl9ryFd0
 Z4rkb/9H/AQmaXpjQaa/S//RgKEE3lqMGsrz1IvVpFdJ2XY2gUYVqsShR3+SCATOY3nr82G2i+J HW8dUoZK6IaWiS6FFRLvaR7y2ch9yK8CWJE+yri/m/beBJHCKHy59mV8Kzb+LazB2B+fib9Xfh3 rmDyZkVymzDL3wtU12JOSanxxyaXFkD8uH3TtG8rq4COWxNQl2G2UQue7J4SG8o44Y3ODqB4yqc
 HdhlewwFrYQINGLJWw/ZwE98OILEgTTN5HaRJHwBxUEv3VyDLnwPBnE5PfPBWpskkkBqnUUt
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=797
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 11:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216201

$ echo 'MACHINE = "qemuarmv5"' >> conf/local.conf
$ bitbake compiler-rt compiler-rt-sanitizers
...
tmp/work-shared/llvm-project-source-20.1.2-r0/llvm-project-20.1.2.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2: error: #error DMB is only supported on ARMv6+
|    22 | #error DMB is only supported on ARMv6+
|       |  ^~~~~

Due to upstream commit [[compiler-rt][builtins] Move DMB definition
to syn-ops.h][1], compiler-rt cross-compile for ARMv5 fails.

[1] https://github.com/llvm/llvm-project/commit/1c9415806ba6d0d48a160637eea7d1b70efaae69

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 1 +
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index b3c4bfcffdc..8b591b757e3 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -129,3 +129,4 @@ COMPATIBLE_HOST:libc-musl:x86-64 = "(.*)"
 COMPATIBLE_HOST:libc-musl:riscv64 = "(.*)"
 COMPATIBLE_HOST:libc-musl:riscv32 = "(.*)"
 COMPATIBLE_HOST:libc-musl = "null"
+COMPATIBLE_HOST:armv5 = "null"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 93928541273..d634c148508 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -119,3 +119,5 @@ BBCLASSEXTEND = "native nativesdk"
 ALLOW_EMPTY:${PN} = "1"
 
 SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
+
+COMPATIBLE_HOST:armv5 = "null"
-- 
2.34.1


