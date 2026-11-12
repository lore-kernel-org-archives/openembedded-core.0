Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.631.1794526227523570356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 15:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=T+BYo0Db;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=T1f9oK+0;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=677679e30c=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACMt2iF3349004
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 17:30:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=rma9MgRacwDP50GbGG6R3h8jw8Z
	S2805Zffe0Ofz5Qw=; b=T+BYo0DbcV2pAY1neewEEDp1pHtKBSkaoa2Gdjn76gV
	6OAxpf9cPmGidO7Ecf05ZzYg9wTwIuNDa2dBVjDCE/GXMonsVeb8/yxRcO634pbS
	lVz5WzP465yb7gwUsbQU3AaS9P7G6r9/5bCopr2/KuMdVdKi9j/AjtJSRYbp94Sd
	QUroBGb6240QMSyVogBbAp5IwMTjl/XeTF2owWD/+44CwfYgYTOZyC7118DpbXv/
	HR8ikYG2wKxWfdFVBBwVaJ8bHYjOJ7RJkDKFHe3+cCC6CZhIKMCZ6cVtPGFUuVhF
	6twD5KuOxEHYOn4EkcqXzX7y0YZu/VOCW0npCTKhc7Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021094.outbound.protection.outlook.com [52.101.62.94])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4hw0teac98-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 17:30:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkL8lt5jxxXBd49IhvGc81FTxn3Y7p94iPfT9S0KrYRd4oEAOkfGEj3HiSlGT6UfvWutjGASrAP2BmGdy4dxpMidFB3dyaroUK4tYfvqSUSEM6MEVmQaU7IFViYcM/H9ji3Gk+0pRmwwAIil8Heox/uKlHNA9+EsP7dqfyOnrtfZ7V4gTLZNMdaB0r09SItW2NyiEV65JDH0/OWUdfcDUFnE9/ZoSP229dyqcrKa2FVQ/0stCVeB9QjxTx5ZCXctbQxPP4m90YZIRXSmWnleuRqjzA2hXcnzL4cgUozVgKLpR1KuOtz/v8+cFuKZribSOUMdN0JVsFgU3NziPCgT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rma9MgRacwDP50GbGG6R3h8jw8ZS2805Zffe0Ofz5Qw=;
 b=h+L8Vy8ck9XZhJWSZzE9xys+tCuup1wbDrfoo+pAflq6VfHjdBWCt0kbVKS6SMmLBs4emIgL19l+EtxdA9eF2h8xjy7g+hs2H0fFtYJUICpXqomDZHrEhGcWx9xGQ6xk2qk0aTI/TorQ699UdI/QrTrua3gUYvYbTHAAaKAwirrEdKqrpts+d9xpy6kdvf/Q69FF+/r8ojlymLxcFS8+S0GNi+nNajtVfqBQK+L4jxWBHmEhZ41I4RU7JTO2GdtGMgRodFF7M9hf1fCsb0KpGmTxt34wiOOVorX6RC82kaGh20SGYK8Vmsw5kAXUuNJfrKhnojB3JcOSay5bL4mDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rma9MgRacwDP50GbGG6R3h8jw8ZS2805Zffe0Ofz5Qw=;
 b=T1f9oK+0dwVfPltzgS2M61QLJd2Ymnf7gg5ViptZq1m7v1yPXJeDWoX1+HCd952mYmB+pDL5Bcga/G4BCqK/NmKrFbTl1r2sRiWjq2IucakFfzCOfeVKt+gIiyu6r6PM8XZT4Jk3vi+Akg9VBN317X/uGnVZfwejLhtse+MFTwGMZ0Y3Vv9gCcbRe+MiBK/d8ALJFMlqHIfafk9owNLTMJdo2Rf9b8nCVGYdpV7pnhcrKEFXc+t+vVYnedGDUlcnUBatQhQ1Xr9NuJslBi/k0DtR2O6lKagwzzz+RcqrOlvLeRkQtykQ3QiLu+x0t1cYF3brSpOI+iQ4hE02gvOLxg==
Received: from PH0PR07CA0108.namprd07.prod.outlook.com (2603:10b6:510:4::23)
 by SJ0PR04MB8390.namprd04.prod.outlook.com (2603:10b6:a03:3d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 23:30:20 +0000
Received: from MWH0EPF000DD30F.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::a1) by PH0PR07CA0108.outlook.office365.com
 (2603:10b6:510:4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 23:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 204.77.163.244) smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MWH0EPF000DD30F.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 23:30:13 +0000
Received: from cv1wpa-exse02.ad.garmin.com (10.5.221.23) by cv1wpa-edge1
 (10.60.4.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 12 Nov
 2026 15:49:02 -0600
Received: from KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) by
 cv1wpa-exse02.ad.garmin.com (10.5.221.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 15:48:54 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.65.32.87) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:48:54 -0800
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [scarthgap][PATCH] ffmpeg: Fix CVE-2026-40962
Date: Thu, 12 Nov 2026 15:48:53 -0600
Message-ID: <20261112214853.2178974-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD30F:EE_|SJ0PR04MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c64025a-080d-4f63-9731-08df4114e70b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|261009223027099003|56012099006|260925021311599003|260925022911599003|260925021911599003|10067099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: kPAPsxOSDTRh9KXrbkWdRsi0wcFte5aAP1uEIcwsAQJ4ukuTDyuhzuX0cFvaAIflm/mCScuO0PJ9aYiAObjeQu4Ps2NudPMEkNxiAgIteHNub6DBiD03xCT34+RtGVWZ3jAoL3enm4AgRf9dmNQXAvM9CcHKUvRh93SNGu6rurSUtI8PQq5Er5Jow7FKY2Qzs1U3nx8Em0neEJDzea864zkpyHwvRDauJop1i5XJYbgs3ur7VycYAeEufikB1ajjMZmetZsUaGGIPgXVEg3ZAiLpGFRMBW0dYDzN3GRjIbGqmybp89OnJiX+zMLvD4CDSXSlacHzzmivkniOa5M91v9E/IDOzgIEDk8MzGdxulEdCvrqaU07euR4ke2sNo8fTsz9V6JTREc1h2bSIxtJrM16y6cd0AGQyZMs0VVOQlDj5hsGvRsa/jBhTIqz/54kFp/1XJSm5acasRFxMu1I4i8SrnntmDXOJ2WlKdAAgYOth/RP+sAjuz7aKmUxs22cFYvxD8jzHcHep7yYlkYqqva3BWrUCeuOYSIt6KbB3zURni0Wv4lXAfkA+yyLWlN0z7LV6W+haczUkDOCrCN0W45f6yaMkVrkiEeeDjrTFLRZ8DIIwLJArxLwK8DV5euF2V4qIdhzejP8I6AwRZy+G311uLcG9+M1PZt0hMxX+aY=
X-Forefront-Antispam-Report: CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(261009223027099003)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PPavPGuJQRY5OO+LI1ZrtpyEtC2I6mZ02QusfQxRADjzk5erQtSIeoGd+tYxG0kfJWYPkhRbKbkwo3t5IQnJ5u5g1UPy0tr0Nl4dbsCkaUShNFM1Mv0x92b1GQgC/3VhAHlD/8fUXKCKN5kcxiG2fKzhL3fpV33qgQPQDJwxC6lrSDojB4VHPt3qX7i3S1E920cO5FutntlrmxFQRZvdlZ+HvVBKYlzhq/SUdsw6gopecTEkwDfU9/Xku2ap3i9q4rh0rJOjSon21J5hh3JhnQKfM8fCLoQYvdD3EjaxbSm8Hr9HE+EzGUZssqwzNlOwRvqz5Ialz1aDjc7QbzWzbWRX5Y6d1OStUO3qa31X/0MfMJtomO0Spn6DtPVmPDloqypy8+rG1a7BJJ1rGjvkUnlD6EW3wCllZud4n/ENEeZiku4/0IFwIgLQ3NDFoBqe
X-Exchange-RoutingPolicyChecked: cY5D7lSKoYc/DN19ldaZCzgaHy07yolK4rQRuQo+OtQ8c5PeskvtdUkWq7wYmMfB2UPUC8r2OTlN09Qy88hcsBTKip2v0ztIrbvaMXIgdO4yioTKLhLT2kSBnhlS3TLgXRS8PTLhWf33L/8+S7FOqT35rSII3qp55r/tAaT792jUf0qC1TRZY1/EdNGPiFUhvBbMKEPD8qBmJT09Uin0Eb+mDNIG3AMa/qGVShY3qEXHmQGjnoLelN/uAr9wZA40avhb2xa2UBjdRENJ9k6JLX4LdqwTLMfde5xoTcTNt6sVY44VxqTOFV2BtI37W9c6ogeLoH0niYT5vx1bdUa4rA==
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 23:30:13.9920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c64025a-080d-4f63-9731-08df4114e70b
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000DD30F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8390
X-Proofpoint-GUID: 99MKgI4Djlf4E1VxJrM1DDIBWpLq7SOB
X-Authority-Analysis: v=2.4 cv=VdRir1p9 c=1 sm=1 tr=0 ts=6af64c11 cx=c_pps
 a=QffN0g5EZ+Wxgj/Qwxz7mA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=qm69fr9Wx_0A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mT958ORwFhrKhj1UMJhN:22 a=wyZyLby_BFpw5Tmn_3Yb:22
 a=emhf11hzAAAA:8 a=NbHB2C0EAAAA:8 a=of7ZLECJagERkm5DTHAA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MyBTYWx0ZWRfX8SxSJRIl8Azt
 lbSm3RyVM0fHI/XRkU9rinz/w09FNhb/g69Qox1zHm2338XQyldUjnu11dbo1XzFtzghi0+ZgAl
 NCUuZewv+WIiwOQMWly8zHeHKQjaxwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MyBTYWx0ZWRfX52P1z2CnThjl
 GMA+D/dMyT3/6MrxzpseeVMNMiILkTMGGWchLFYPiaCO7xeGOovQ3MJB4szBQOtm3a7dBd0JoGB
 tUjeJbEiRbZGfH8xFAdVUwFFIhLpQMCd+bxTKBs+SVZDP1DgO1/BhAJw4v4FUpvpRYwp7HXioqk
 hbKPCtXcef25LRwnEbxsWLHLJLgJqBPqd7AdLyLtIHKuHHA64Yf1hDS7OeqPtKsMH0FlGs1xNBI
 UiSgFd/u0cARzX4oS60Xtlzp3L2K3259mE9FcpxUghdKPTTE6V0R1/8zFEbrW3F/UnTEvyGhtNJ
 ciAEQpAjD1N+wgscFOBMn6odoBCe3EESW0o3TEMH9jQrlYGTO/B1TAf8UtELqZJk+rIGk1rGi/x
 wMeyseewvhhSrwhX5eVJhTKvvIcfwb7RKGwFmmAzFg4FuBtpkH399S9suSEVBPaYHux61a5kijK
 50oMJOwHhHd816dV9zaN1AplSv1I0LJEXjSC4b4A=
X-Proofpoint-ORIG-GUID: 99MKgI4Djlf4E1VxJrM1DDIBWpLq7SOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc=notification route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 23:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250131
Content-Type: text/plain; charset="utf-8"

Backports patch for CVE-2026-40962 to ffmpeg 6.1.4.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-40962.patch        | 61 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch
new file mode 100644
index 0000000000..608dc638ed
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch
@@ -0,0 +1,61 @@
+From 5d272b8c9541fa082dfb064e7e5847de4c4300ba Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 24 Feb 2026 03:47:15 +0100
+Subject: [PATCH] avformat/mov: use 64bit in CENC subsample bounds checks
+
+Found-by: Quang Luong <oss@engineer.ink>
+Found-by: PrymEvol
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit e392fb8c9c3949d975531d2b23c645d2465a7ebc)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-40962
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/78c944bdb170d8dcece166115d92b45379b040f4]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ libavformat/mov.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libavformat/mov.c b/libavformat/mov.c
+index 7a7545c9b5..af103ad24d 100644
+--- a/libavformat/mov.c
++++ b/libavformat/mov.c
+@@ -7178,7 +7178,7 @@ static int cenc_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+@@ -7233,7 +7233,7 @@ static int cbc1_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+@@ -7295,7 +7295,7 @@ static int cens_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+@@ -7360,7 +7360,7 @@ static int cbcs_scheme_decrypt(MOVContext *c, MOVStreamContext *sc, AVEncryption
+     }
+ 
+     for (i = 0; i < sample->subsample_count; i++) {
+-        if (sample->subsamples[i].bytes_of_clear_data + sample->subsamples[i].bytes_of_protected_data > size) {
++        if (sample->subsamples[i].bytes_of_clear_data + (int64_t)sample->subsamples[i].bytes_of_protected_data > size) {
+             av_log(c->fc, AV_LOG_ERROR, "subsample size exceeds the packet size left\n");
+             return AVERROR_INVALIDDATA;
+         }
+-- 
+2.56.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 849835c849..44ad063e69 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2026-40962.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.56.1

