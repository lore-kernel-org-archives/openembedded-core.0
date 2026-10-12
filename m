Return-Path: <tdarote@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0082CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:43:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10671.1791801783544915429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NAXt9vLx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KMpV2796577
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S67uGY6KKcy
	hSawr4qNj2y6NXbtucwUtbezrXv9rETE=; b=NAXt9vLxeF0xC+1/nHTXbp0wTi0
	FhuWz0DzamlV0Ml08yZcYE6VADwaQQpInBxO1OpuLjTNkV0NCVhAZ2h9fWDY/1hB
	Z2CAvCVju3TUWnfbSPGAjGlE71AmoxIdBAKzDWV50gM59V/PQBPAx1IfdhtfLqWL
	vFkjdtuzUjylOwwrJHLhK0f3DBDFRjc74ciDPK8pQmyeuE8/cPlmJGAryuH03WoK
	GOf9usp+2hdvQdrAH8VwtaKpZi44WLNj0Oy/fB4fG9yC5dnTPi+N50Tmc+KUbbZa
	31+Djoh2bP/RCARTtoYviBfi1S/ahJLceVVbiWeqRA7anjBSCghqufxkZ+A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gs1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:43:02 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69CAgEwM3286393
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:42:59 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-tdarote-hyd.qualcomm.com [10.147.247.89])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69CAgxXN3287258
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:42:59 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 4146169)
	id EBED321554; Mon, 12 Oct 2026 16:12:57 +0530 (+0530)
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Shantanu Majumdar <shanmaju@qti.qualcomm.com>,
        Tushar Darote <tdarote@qti.qualcomm.com>
Subject: [WRYNOSE PATCH v2] gstreamer1.0-plugins-bad: use gtk+3 dependency name
Date: Mon, 12 Oct 2026 16:12:55 +0530
Message-ID: <20261012104255.2650938-1-tdarote@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <247625>
References: <247625>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX/BDNwg2jM5xr
 ndtS+NdOinSuYrQolAmqit62HcigVbo65FyaZHagr4ee2Jq32MyP+c7t5AWzyS2eOL5wTuXpmxC
 cjoK2um6LRdpw3p/KqYpZEx/KiXZcCBLgzBFoV2ET9Znvt4cSDlFEnAsyaAoR+6XEM2iaawB43j
 P2tgbYJ4Q+7bzPgElP660nF1cK+Rt8JTM6kWW8yZ+0ju7la3JxKQ7+BFRA+VcsPUIFMb+KXTK9U
 ihldTwZP63sGAdfGvY7rxVWeJofhYyTfsZNlZtN7nQkBgnKE6JirLtlQn7dgztkxEuc7+b8Iuk3
 95naY5LYUJUGTx70WLmn+n4sNlDOZO/JtaHiD4ra1jFymwQi5jNeH6auX9qGj547OiIHXkkuYXb
 XfIPkC+7/Vtb7omFf1uNyKBO4wuOwzm18Xbs88l/++KyerywS5q8G7Ykp+BrxA7ayWqGDdIz+UU
 pZsgnC7ki4eo4RWoQmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfXzXHl+Su2AVGG
 xZN2elUT1NBpEuzCJ17vMp/tjv0HuN6PR9NpAQ7LBR0TyAtPxQsYhPBRAo0Pirmybbs9i7MMYna
 IxbkH9+lwgucOO02hS5TuHIB5d3srHk=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accb9b6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Cv24dpK0CmeL2Y3-DUMA:9
X-Proofpoint-ORIG-GUID: aCbCSSVRAB-mb0u1OpbKrv8CyLTvCotb
X-Proofpoint-GUID: aCbCSSVRAB-mb0u1OpbKrv8CyLTvCotb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247630

From: Shantanu Majumdar <shanmaju@qti.qualcomm.com>

Replace the PACKAGECONFIG gtk3 dependency from gtk3+ to
gtk+3 to match the recipe name used in OE-Core.

Signed-off-by: Shantanu Majumdar <shanmaju@qti.qualcomm.com>
Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
index 17e49ebbda..1b6a8ac30b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
@@ -49,7 +49,7 @@ PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fdkaac]          = "-Dfdkaac=enabled,-Dfdkaac=disabled,fdk-aac"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
-PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk3+"
+PACKAGECONFIG[gtk3]            = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
 PACKAGECONFIG[nettle]          = "-Dhls-crypto=nettle,,nettle"
-- 
2.43.0


