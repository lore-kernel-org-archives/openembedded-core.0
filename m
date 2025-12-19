Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA1BD767C7
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 10:30:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14103.1766140200955564108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 02:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kjq4uH3F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4448d6c4c9=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4PKUh1929928;
	Fri, 19 Dec 2025 02:29:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Dz51SNuLbjpRACTqKn8w
	Omzzla/mXGJbu1/UJByKXRM=; b=kjq4uH3Fax14oCMUz4mV2cIe0s9bm5vlwakV
	F2fW7W866nY0O0r3GWGkFoCiUEEqvPT6K/PvpPJeCDMJsdkMao5zKc8vqPBYwG9X
	J3gRbY7tfjzEdz1oJSG8CKUy2yphZZ4De3VcFdPqSVWiKXWs2FuQlHdX35bIuTkW
	PzTCx/UR2/fp7xr3Ugrm+GpEJ1p1fsVydgBnA+XSzSJ5Owu3uGodEoglRQbPe3c5
	LNsqTus1N8/2uwDQhJyWtwAg7doEnafvv4nRFWWfc4sPB/VKK27Ozg0vnV54vssR
	AB2Y4CgYtM6+r4f+YvTlMHnEbILEN8EiDk4dTliPTqajF8+QIw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r348q9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Dec 2025 02:29:59 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 19 Dec 2025 02:29:58 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 19 Dec 2025 02:29:57 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [PATCH] packagegroup-go-sdk-target: remove go from packagegroup
Date: Fri, 19 Dec 2025 18:29:56 +0800
Message-ID: <20251219102956.442714-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cUhzrMEiKL5LR7fFabaZt4Dl8wpmaAH_
X-Proofpoint-ORIG-GUID: cUhzrMEiKL5LR7fFabaZt4Dl8wpmaAH_
X-Authority-Analysis: v=2.4 cv=Fp8IPmrq c=1 sm=1 tr=0 ts=69452927 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=LEaydxAqHRweoTFkjBQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NiBTYWx0ZWRfX6suGYEGVMKGA
 RtOzegiE+b33Rzya+GEtDYbwddoRnlafcxo0X2+ls39LjInGoGxyiGxjXJdzpO5b9Gvk4N1jbaj
 L1qhu+6Xa+GY9IZ8OQwYzrWNoJU9rY6K6U7Yj/6I85my4nPe74QJa55XXuVrd0guGvKl++KnUvP
 Imj0iQQik0yPo3PcnMCrPxBt6r4fxH8Vjq0P22X9WEbDECGLmPLdL8lg03N2ap7zOQ5SOYDjf2U
 7BrBvEgyYuZc/spprmYJPsE5g9ErdjN50u1GLb7QdArLhANpoFoB2eL29uQdA2UMKAfEo3L9IDQ
 iNKvc5deH04fmcxic/yCimQ+w6H7H1D5v9natQciO5LNwJy2ZVNFcQ+3eAqSHJy83i2JYIaRz8D
 1jleo4+GSXjt/gDtYFQdKOkv0IvVgd9GxplBVDj97FTIM6FCi28O0rmlqgwq8aMI6SoVwlkrTiE
 /pJHAolK3ik+qVhpkuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 10:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228207

From: Changqing Li <changqing.li@windriver.com>

This is for fixing the following error of 'bitbake meta-go-toolchain'
when multilib is enabled:
Error: Transaction test error:
  file /usr/bin/go conflicts between attempted installs of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
  file /usr/bin/gofmt conflicts between attempted installs of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32

Package go only contains some tools, it is not needed to be installed
into sdk, target go tools is not expected to be used in sdk.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index c03918acc8..52dba3d2ff 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -3,7 +3,6 @@ SUMMARY = "Target packages for the Go SDK"
 inherit packagegroup goarch
 
 RDEPENDS:${PN} = " \
-    go \
     go-runtime \
     go-runtime-dev \
 "
-- 
2.34.1


