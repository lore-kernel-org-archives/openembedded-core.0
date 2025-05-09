Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BBDC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 12:11:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12763.1746792657193597401
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 05:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7224430138=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5495eUA2009405
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 12:10:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430pg7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 12:10:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 05:10:54 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 05:10:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libcxx: remove compiler-rt from PACKAGECONFIG for armv5
Date: Fri, 9 May 2025 20:10:53 +0800
Message-ID: <20250509121053.3962938-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681df0d0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=WwiwOYXBE0mMeD3KfekA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XN6XDS_ynWE5RggvmRLAK-W66FoAYSXh
X-Proofpoint-ORIG-GUID: XN6XDS_ynWE5RggvmRLAK-W66FoAYSXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExOCBTYWx0ZWRfX5FZJOYQJ3L3R ivm/zTN/KkDOgIE/WGMrmAPs5Rpeags7nmhY2yj6DBJadDOEs3t6RDUxJpSb27MUHodgfOe2jSz gjwdc82HL6pbI5VZRXq89z2wAwNh1eyjJgh/mhXS6pT05J+frbPT6jXetgYhHaWEVjbt2UFo5jF
 wcuuo06F5PKHChOtNMM6NI0z4XzWVf289+DqTxSgQViaeLzGwD0zaYpKFgR/MdUcbpJ4XO9Q0gf gWHHWadjMbzg6+ArO+6wjUNu8k8Q93qOnl+sPYhiHubKfxQBRoTShpgKR91YuIFUwBo4eMaunDi SLsT5nsALwdOqjRuBoXf+0uzIHWkOmdhrX9oRm3IIcNptIe8EPqEG34cAd9jfi9BsvWyYdRiCWR
 pndlaQpY7mYkJlKVkX/pMhIgy4YAuXhrRpO2hoXBLgbt0/WcMO2LSyygWqO3Mx6/t3fSkbkp
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=622
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 12:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216202

Due to commit [compiler-rt-sanitizers, compiler-rt: skip for armv5] applied,
world build failed for qemuarmv5.

$ echo 'MACHINE = "qemuarmv5"' >> conf/local.conf
$ bitbake world -n
ERROR: Nothing PROVIDES 'compiler-rt' (but meta/recipes-devtools/clang/libcxx_git.bb DEPENDS on or otherwise requires it)
compiler-rt was skipped: incompatible with host arm-poky-linux-gnueabi (not in COMPATIBLE_HOST)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libcxx', 'compiler-rt']

In libcxx, remove compiler-rt from PACKAGECONFIG for armv5

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index d2655d9da94..19e2810fa16 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -14,6 +14,7 @@ BPN = "libcxx"
 
 PACKAGECONFIG ??= "compiler-rt exceptions ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind unwind-shared", "", d)}"
 PACKAGECONFIG:append:armv5 = " no-atomics"
+PACKAGECONFIG:remove:armv5 = "compiler-rt"
 PACKAGECONFIG:remove:class-native = "compiler-rt"
 PACKAGECONFIG[unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF,,"
 PACKAGECONFIG[exceptions] = "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DLIBCXX_ENABLE_EXCEPTIONS=ON,-DLIBCXXABI_ENABLE_EXCEPTIONS=OFF -DLIBCXX_ENABLE_EXCEPTIONS=OFF -DCMAKE_REQUIRED_FLAGS='-fno-exceptions',"
-- 
2.34.1


