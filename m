Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6AF103A99C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:26:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14054.1774405591712946319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HQewXtss;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544e4345f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ONpD8K3863552
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:26:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NP1Dj+vmf6ekBKZntREl
	cWUcsyd8rSwMNUGVgE+Sq9o=; b=HQewXtssezu3Qob3TKDuUrr9+tmFt4C8BX6o
	Fc/VLBvNBCpW+zPgdQfu45djpoYcoLR/KTExRVW8dHU2mp9PBqvPqfwAcLxWEFXX
	b8LwH/M2SScW+0t4HOW05DUY2rSnnQ+0Ymdx8vmxG/HmfPluUFEHodj082Wrnm+T
	+hor6/NN8CKi64763AcSBEcyhdyhTmOpJqT/2QIFt1flGSgO/SNOEeJEsB9oqtFD
	jOFc7YyZ6WbwxqoogJ6UnSFamQvQ3QCy/ITI28Zla8UHp2n/0C1a9wjaTyvXfT7o
	PzfmOKWV1CQZk7asUTe2qnrLkJztJwnTrvLH5UHxfrurSQcmxQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyc775-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:26:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 24 Mar 2026 19:26:30 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 24 Mar 2026 19:26:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-numpy: add cpu-optimization option
Date: Wed, 25 Mar 2026 10:26:29 +0800
Message-ID: <20260325022629.2245688-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxNyBTYWx0ZWRfXwWePv4S2lDz+
 s8qlRXX7Hp+GHOE5/W5+Fa6KRIHiiAP5CmsKojEtk5sH4gPXa1hPqYjb7HXIIh2xOgjs3Wf2HEl
 M45TfIA2C/4P/xZTVoikx+KWHJKOKBWr7okR0LpG5E36vQWT3dxtpn55Wa8v0e7xKzIEMfRTZVn
 AeD1pVlMuKzVtYtMtSDD7ntmXdmHzPeTILjRwSmnda3/XbDliGH/qb1w7CiEfSbnXEPGMdva4r3
 HFiWvrssfYtYDW+Ff3MFpER0vpNIpawoXLLW0pBY/TUz9nvTLZ65DYK7SVJVO4sS4b6eosGdT2T
 7hB6T0c+z6vfBlqeI7ljKTu+0yg799gQ8lZ1T10sg7mz+qDrhXKEIMmmvTLDXfA5wwKACfFicah
 6JZVV30YeS6hjTDCLFUP2it8i68FmMcjRprQXvJ8c7xKUsJ0kMiCXf842IenTr9mrsMVEs5LRe0
 Cflc0xg2EdlRl/bK43w==
X-Proofpoint-ORIG-GUID: aduEKsYGleQqZayiDJePeTqZ6T7tGKgA
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c347d7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=hKpBA07XAAAA:8 a=t7CeM3EgAAAA:8
 a=A9C6oZOalONfMp_F2N4A:9 a=e5PuFNF6PdRcDgRFK7o8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: aduEKsYGleQqZayiDJePeTqZ6T7tGKgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233851

Add a cpu-optimization option for disable-optimization [1], disabled by default,
otherwise import numpy failed on qemux86-64 with kvm
[snip]
>>> import numpy as np
...
RuntimeError: NumPy was built with baseline optimizations:
(X86_V2) but your machine doesn't support:
(X86_V2).
[snip]

[1] https://numpy.org/doc/stable/reference/simd/build-options.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3-numpy_2.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.2.bb b/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
index 8a9351e371..c349c683c8 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
@@ -23,6 +23,7 @@ inherit pkgconfig ptest python_mesonpy github-releases cython
 S = "${UNPACKDIR}/numpy-${PV}"
 
 PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
+PACKAGECONFIG[cpu-optimization] = "-Ddisable-optimization=false,-Ddisable-optimization=true"
 
 # the overflow tests fail with compiler-rt on aarch64
 LDFLAGS:append:toolchain-clang:aarch64 = " -rtlib=libgcc -unwindlib=libgcc"
-- 
2.34.1


