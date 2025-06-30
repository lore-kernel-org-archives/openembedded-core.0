Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36A8C83032
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 12:17:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38826.1751285833340369371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 05:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9276563c86=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U50m39028305
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 12:17:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m19t3a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 12:17:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 30 Jun 2025 05:17:11 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 30 Jun 2025 05:17:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] kernel-devsrc: make package version consistent with kernel source
Date: Mon, 30 Jun 2025 20:17:08 +0800
Message-ID: <20250630121708.4010323-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630121708.4010323-1-hongxu.jia@windriver.com>
References: <20250630121708.4010323-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwMCBTYWx0ZWRfX9bmQpRisaW4w Z1V2nPpxjpFkGaI0TeBUyDVum6ICQS6uS7T7jVhZ6/myHuJ/ObYPTqo7jKnIGW/ZHsnEho2A4o3 l2qnN5e8UxQ6tYR2vaazTAmyVR2J1y9Ts7DQOkqTBfml8MqhR34EThuOTwVmY1tou6+P5yIEdJV
 +LYYFngnDwY/piQpbmfbXZVxGjCm8hMd6gOTbipqj+CIxYSiqk4kMNdGy69NJGYkzg9hPK6U3DM lvleKL8kOyhR2uU3i5B+O0sYNL91ZzRF/FJsFF9p/2o7CM0wZNVPz8dMlLIg9ZB29862hY2pWSb r+AiZAMolcuvdKBdYAA9xMGK7PwV5f4fO3TmQaSM/KYz0Avyr3yYJGDFYEJ2S27n/K/vNPwPmlD
 Qw/Zub7Bfy8rimp5ITb6/sV9pNwS7JbwU1F0wA1KyGOxRuq3dub8aBozBCqthhf0CfUfq7/v
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68628048 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=fKP2KVUKu4Y3BLxCb-wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bVZJNcdcX5oJtE4iUKWU0C-5sSi1kwo9
X-Proofpoint-ORIG-GUID: bVZJNcdcX5oJtE4iUKWU0C-5sSi1kwo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506300100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 12:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219516

The package version of kernel-devsrc is 1.0 which is not consistent
with kernel source

$ bitbake kernel-devsrc
$ ls tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-*
tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-1.0-r0.qemux86_64.rpm
tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dbg-1.0-r0.qemux86_64.rpm
tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dev-1.0-r0.qemux86_64.rpm

After commit [kernelsrc.bbclass/perf: make package version consistent
with kernel source] applied, it moved the setting of PKGV to
kernelsrc.bbclass for common use. And bbclass kernelsrc has already
inherited linux-kernel-base, this commit uses bbclass kernelsrc to
instead of linux-kernel-base, and remove duplicated settings.

After applying this commit:
$ ls tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-*
tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-6.12.31-r0.qemux86_64.rpm
tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dbg-6.12.31-r0.qemux86_64.rpm
tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0/deploy-rpms/qemux86_64/kernel-devsrc-dev-6.12.31-r0.qemux86_64.rpm

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 7ad848c35eb..3d2eb3929e6 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -7,7 +7,7 @@ SECTION = "kernel"
 
 LICENSE = "GPL-2.0-only"
 
-inherit linux-kernel-base
+inherit kernelsrc
 
 # Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
 inherit module-base
@@ -20,14 +20,10 @@ do_install[depends] += "virtual/kernel:do_shared_workdir"
 do_install[depends] += "virtual/kernel:do_install"
 
 # There's nothing to do here, except install the source where we can package it
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 deltask do_populate_sysroot
 
-S = "${STAGING_KERNEL_DIR}"
 B = "${STAGING_KERNEL_BUILDDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1


