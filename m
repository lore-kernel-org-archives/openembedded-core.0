Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C62106F31F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:22:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44189.1774520517631004139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=STDLp+fb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7545a6f598=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q78KZr2227557
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=hQkAvXwsBx9OD6/Ab+5s8zRTy7n6AMrJ6weB16uWawU=; b=STDLp+fbRK33
	p2YxKSGgzlLxBa/PwZkByl2nguo0hn+UadnltwQ+wgvji8EzFcWEB9tnIugYRuWz
	9E3wVgod2MWcV74XI/I1qxzadEz1G6Csc15TzO47m+9c1KbCZ9PFxUwaqbdYbgtL
	pZz1+BeQKk7pb/MjjgFbWwRu7K/OZ/9q0I3EdabEI2Hn41YUcQ54ygu63g9tDh88
	AjdOQS7+LWptACEzkecd8yhQsx0UO8YIqCEoFC/+kHaN1QhzMkHUtRFb6h0RjehD
	KoadQE1OiPER8YaUc7rLFSVpVie9SdKmACokNMvGxQJE5dWze9uwvtYuI4T0Nxtl
	HOcVM0Qu9A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj86c20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:21:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Mar 2026 03:21:54 -0700
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Mar 2026 03:21:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <kai.kang@windriver.com>
Subject: [meta-openembedded][PATCH 2/2] gtkmm3/gtkmm4: Set S to fix patch failure after BPN -> GNOMEBN change
Date: Thu, 26 Mar 2026 18:21:50 +0800
Message-ID: <20260326102150.1059814-3-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326102150.1059814-1-liezhi.yang@windriver.com>
References: <20260326102150.1059814-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dq54SiS_tjIF8Jl35WEOOqmgnJ2E2XRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MSBTYWx0ZWRfX/m1V/XqNiDV/
 1nKR0/qshNfzCcsF/udoE7ToTW9aHFyvEmqnUk96ZrhLlV5ao+czU8i+tckHH6C7Z/eDMNTIVjm
 efMI6EhqkWdyrUVU5mDAyhOrpwbg5EvDBogxvvdKWt6FzREtOCy5gUBfORI5fg1J/pP5OuXKLv5
 kPuJWXH2/OZyASSGgnl8gphuO8AahBFIu38GXQcBzCa2v1ymIuzWUdYp5+QCOMNahO1tdoS1M8n
 OeXk6wDW1Ln6cb7cHBgAujxcMdsRw5NDr9Vl+jRavHNbyNw0CnG5Lpeu1dY/fF1JghbbFKK/sTw
 im6yTnYB9qEsayKsoZPXYJa+VyHmxA9G/36exDGntdqV16ZEGy5k9wV3136l3wKDPTQHuRuwdsc
 OB7Xscaog1APYetXB/5crnz5hDKcO9zhbr0ecLzHOy7s5TPsIwPy2N8ommAMTt46yKve80wHK1A
 sHrPSJMNTRgtceBph4g==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c508c4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=ODljw8OYl2A4GS5_V-8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dq54SiS_tjIF8Jl35WEOOqmgnJ2E2XRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233965

From: Robert Yang <liezhi.yang@windriver.com>

Issue: LIN1025-8580

Commit 8e038dee175eeaaa4bb0835b935ef7a2a72fa7e0 replaced BPN with GNOMEBN, with
to avoid the confusing BPN override. However, this change makes the default
doesn't work, this patch fixes teh problem.

(LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance,
                             master branch doesn't need it

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb | 2 ++
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index b09d1150bb..6415c20f2e 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -18,4 +18,6 @@ SRC_URI[archive.sha256sum] = "1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f
 
 EXTRA_OEMESON = "-Dbuild-demos=false"
 
+S = "${WORKDIR}/${GNOMEBN}-${PV}"
+
 FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
index dcb23cdf17..7a19058612 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
@@ -18,4 +18,6 @@ SRC_URI[archive.sha256sum] = "9350a0444b744ca3dc69586ebd1b6707520922b6d9f4f23210
 
 EXTRA_OEMESON = "-Dbuild-demos=false"
 
+S = "${WORKDIR}/${GNOMEBN}-${PV}"
+
 FILES:${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.34.1


