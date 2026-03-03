Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A50E67A81
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12734.1772521011832883413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XRV4ZKUR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236m3Nw3923275
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9F6kNljFiEN+4x9Mq6EPV3QJFbPNXT07aM003GnM0y0=; b=XRV4ZKURxuAL
	kpUncNiCrb+FlHG3N2Djv/ZHo1YbJs3m1llcDV/154j63Vzc3RIVr3I2DsfUvyfE
	/qtY6Q5+6s0OVbjdsLuzzmVNjpyKkaE1Sq2awcDmIExtxOwaprkUQnncfOooYa8L
	tr3nPgejsvKBtDMeTy/zhJY3vlnTlZhV5bBW1fL920zw3PQyNEO+KMt15vxMu4an
	spvE8DCYuKRlZHQRRWQcpZeR9YrhiBpiTGdkj12tTDH7PiaALR36vyZdAkywi/AQ
	IqCtkQSdcFXYMQhWnzZS2ap2Wdr1ZPEPAZwvsH97E5rM7Wkrzctb3j+okNX5TpeQ
	2VM9J30m4g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvkdfh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:50 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 09/19] python3-hypothesis: upgrade 6.151.4 -> 6.151.9
Date: Tue, 3 Mar 2026 14:56:30 +0800
Message-ID: <20260303065640.2541884-9-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1J2LdLRwWQKlQlVrgUYZWL4wRFbxXN5I
X-Proofpoint-ORIG-GUID: 1J2LdLRwWQKlQlVrgUYZWL4wRFbxXN5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfXz8/pP9itj/Is
 1AeS3Df/DMm+lW3qfBFeAlL7dIoqK4z9NhS6PIL+8ZnlYR5hBxc58AT4RUle8P0ZjyXILVdcNBd
 2hzEav5LJJZ+2KaGi1laDisk2AkfYYNR6mU0UQUqFOsBpp/blHCbvPYNrYhgLHeMg9gGm0gMdpe
 dFTv2oYo1qDd0J6B+0BZYfmqnNFx/9256tmkvAOEzvkk9YObPEir1tBvlmWbTF5IER5bfykLmEU
 tL9ED8HvE/yWz4weYMCUi/JLIQKIOHoEt2gOI/c0zInWbaoaXhQZ0oodtSoN14k+HkLtkrQab/m
 McbolEEgW3HkuvrR1mcKVv2eqcpm13LNMmVyhlZHlLgUdDDF5jFal9PJbeVW0KgIKkNPUB37FOv
 jLhrazj32FVYSDaXCuzrRkEroKE3nVuge1S1msyHXKI4oEG0Rvg50EktHJdYeUxW/6jrFZ/E0kP
 8O0lYD9tJ9FEbUvOsFQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a68632 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8
 a=Zj3VLXkBQeKVcZDWTUYA:9 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232247

6.151.9 - 2026-02-16 [1]
- Remove some old unused code.

[1] https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-151-9

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...hon3-hypothesis_6.151.4.bb => python3-hypothesis_6.151.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.151.4.bb => python3-hypothesis_6.151.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
index 425b2e6441..157e4a2ee0 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "658a62da1c3ccb36746ac2f7dc4bb1a6e76bd314e0dc54c4e1aaba2503d5545c"
+SRC_URI[sha256sum] = "2f284428dda6c3c48c580de0e18470ff9c7f5ef628a647ee8002f38c3f9097ca"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


