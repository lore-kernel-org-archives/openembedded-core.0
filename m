Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D0C8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:38:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.258.1751384304493093335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9277eaff6f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5615A4s5016262
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 08:38:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm2vsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 08:38:23 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 08:38:21 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 2/3] webkitgtk: Use gcc to compile for arm target
Date: Tue, 1 Jul 2025 21:07:56 +0530
Message-ID: <20250701153757.2798866-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250701153757.2798866-1-yogita.urade@windriver.com>
References: <20250701153757.2798866-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=686400ef cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=3hiznzX7lZKpf3Ok4VIA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rdrvB8RYoXHJwEm7ZUgV-HzV9QMLm7Wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNCBTYWx0ZWRfX7j6w0tMLSn7h e+Pj8CkkvDvdBN8IR/Exp7ORPWv55U9nJMAJ6I7YjtIIdaBVDb/uzW2yrlj9cyxswNxehZ4uO/h a8P6EO1guNwAWdbdlw2BLicS49SF8CEI3fnRXpJahl4Sa1HdKytlf/jVnJHSVJ660NcsBTUiOq6
 YlDYD+zrzdBzH9cclFfMSxgEFNEFf9+dYo9+ttI3f7D5huVy95QmUWyfgwa0HWx5NCJt7htuqrZ dWRCeiVBC+kfhvESQL4sbalMvtqqSY/vR76GNnCInI2TIzuUPN0CTPXZxyDqgjeYs1voHueS6dG fFMLixs+Zxuj89fqUDsJV5DzaEwnP4H35+rCBdKTvy5apK7atUfRpeq6QpRC2Zc2vCsw0ynnUCJ
 6L2nhbi5olnYHkUqhdnDUPjRFWUUxbqN9O4gUnJYmvOFqyN28Ug5sQb+cDKqGFEf1tBJFxFN
X-Proofpoint-ORIG-GUID: rdrvB8RYoXHJwEm7ZUgV-HzV9QMLm7Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=536
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219586

From: Khem Raj <raj.khem@gmail.com>

Builds with clang run into compiler errors

<inline asm>:320:1: error: Relocation Not In Range
  320 | movw r4, #:lower16:.Lllint_op_tail_call_varargs - .Lllint_relativePCBase
      | ^

(From OE-Core rev: be459bf17d5e47c51d96da1a571de01790c277b9)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 5b9846a6d6..a58b44440e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -176,3 +176,5 @@ src_package_preprocess () {
             ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 }
 
+# Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
+TOOLCHAIN:arm = "gcc"
-- 
2.40.0


