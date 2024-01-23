Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA13C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 02:37:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2502.1705977457719872822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 18:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=itGIqBVA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=175250b29d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MAf6pd024345
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 18:37:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=6Uc5q
	bMDYNTdTs8EGXduvRJFPz1QKpz+IF9p78bVz+U=; b=itGIqBVAxB3vizHiN2wEz
	6CRfB6RVAloyFZjz+b14Pk14jRahNhhVKSioFVoDG7sCs46j4bIc9EL1lSK+nt+P
	GMdQBVVuuYSpPddIj6cjtmxTPNifMUHD9WpDIjOrBN3Jw/vjljHXlEz1vxyChljq
	jTbCMgRNbHi5cM1+aHATik7DUwV0N3w0PjB4Z9WymceIEIB/y8grCeCBA+NJYSU5
	CSvZahCmmumyUdqbk0duRg9FtqwldltpJzynirIqVOTInJOQCFocfHyke9Le/fqH
	LOETS9UUdoQecDWgRUTTnu+bcsAoKDuMyTrNizzKHA4A+CnfZqEW2DckGqWaTCqA
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4tmp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 18:37:37 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 18:37:42 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 18:37:41 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] tcmode-default.inc: use ?= to set PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
Date: Tue, 23 Jan 2024 10:37:34 +0800
Message-ID: <20240123023734.3803382-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gO6NakVuWRZ5tzrFvsxhKeRytp66Ud_8
X-Proofpoint-GUID: gO6NakVuWRZ5tzrFvsxhKeRytp66Ud_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=588
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 02:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194198

From: Changqing Li <changqing.li@windriver.com>

If meta-clang is included, LLVMVERSION might set to version different
from llvm version in oe-core, and PREFERRED_PROVIDER_llvm set to clang,
In this condition, following warning is reported:
WARNING: preferred version 16.0.1 of llvm-native not available (for item llvm-native)
WARNING: versions of llvm-native available: 15.0.7

use ?= to set following configs in order to allow user
to override the default settings:
PREFERRED_VERSION_llvm
PREFERRED_VERSION_llvm-native
PREFERRED_VERSION_nativesdk-llvm

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 3720a4c5b8..0de858d3af 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
 
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
+PREFERRED_VERSION_llvm ?= "${LLVMVERSION}"
+PREFERRED_VERSION_llvm-native ?= "${LLVMVERSION}"
+PREFERRED_VERSION_nativesdk-llvm ?= "${LLVMVERSION}"
 
 # Rust toolchain preferred versions:
 
-- 
2.25.1


