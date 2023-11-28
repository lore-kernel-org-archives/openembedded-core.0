Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4653C46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 07:55:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27917.1701158109921242363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 23:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KtFionwj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9696e6ba9e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS5ujiZ024661
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=zxHZXZBm6lkFCa9clPhpNnlpT49InqhTHgfYxZEn1HY=; b=
	KtFionwjAnDIQshVxWLoVpkb1N5SbVJQV0Sl0bP45ElNRBep15qage7mD54z30ep
	NuF3KIKX4DCVKQhKZE53rYXf9LRI0C8HH05qj2dl12OQxDPtQsX6y2vOyUhSu/8Y
	x7M9u6un2ahjcE4D6E5IigxK+B5fSsBNKZ1totHxa/ExwZk2zRuQ5mOGG/YAPMbx
	zkMuMRn+dOZs6J0dVq3bYPDvXiB25zLjyo1b8tMKDEz0J2VSGAnLaVTWN9GYkMCC
	ueW8uHZ1ZwCyjZDeM13tipPOBBAzowaz/vqpWHxTtaXyVe2Egv8LJ5fF1KttlqfE
	Wmmoiej16XjcTyBn/oIYow==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6jdg4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:09 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 23:55:14 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 23:55:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] gnu-config: Update to latest revision
Date: Mon, 27 Nov 2023 23:55:06 -0800
Message-ID: <7701bc572c2df6c9fb52f2a699b48b3afbafd343.1701157879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701157879.git.liezhi.yang@windriver.com>
References: <cover.1701157879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GoUWPfBMWKjjun28EIpyiSz7dU6l3AMp
X-Proofpoint-ORIG-GUID: GoUWPfBMWKjjun28EIpyiSz7dU6l3AMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=705
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191338

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 2a0e6f8e41..718f798a00 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "63acb96f92473ceb5e21d873d7c0aee266b3d6d3"
-PV = "20230216+git"
+SRCREV = "28ea239c53a2d5d8800c472bc2452eaa16e37af2"
+PV = "20231127+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.42.0


