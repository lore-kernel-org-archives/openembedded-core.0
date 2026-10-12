Return-Path: <tdarote@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B4CCA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:37:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10588.1791801462127895964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KeZmiQCv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KMoO2796577
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dwSx0Y0Uyxh7UX/hZ9X58VIEWbxabD7xgAX
	EYNBu/EI=; b=KeZmiQCvKqkgoiSsn4BjEZyqkb9sxYJk+qLOnXOmIEJN52D48F6
	yeIBc9T/GwohAZVg3rKAoxxj3Ov0ldgQK7iEPOsPoQpja/M0ZXVRntY5jHm0rI1M
	SfkOaQ8+XJtzYqbLfmPDe8cBqajuLxK/UyxE6GTa09IXsS7StUfoYqQH5fokjDMY
	AlqAzqr0s50BlNvzhCBHXNXtI+8BgWSyXRjUHq0xHGdZAnTv0T5ocY4UtiJlIhqN
	lUoywElmew0Tp8o4nieHw7mIRvl05QlJWH+UIuZuEhxEehcnhygsAXjErOITT/2s
	MQe0je/q+yIg4xGPMrl2jF/Bhr0z4WoXcig==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gqnc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:37:41 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69CAUPUX3271235;
	Mon, 12 Oct 2026 10:30:25 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-tdarote-hyd.qualcomm.com [10.147.247.89])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69CAUOQ63271222
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:30:24 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 4146169)
	id 9180C211E8; Mon, 12 Oct 2026 16:00:23 +0530 (+0530)
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Shantanu Majumdar <shanmaju@qti.qualcomm.com>,
        Tushar Darote <tdarote@qti.qualcomm.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: use gtk+3 dependency name
Date: Mon, 12 Oct 2026 16:00:21 +0530
Message-ID: <20261012103021.2643566-1-tdarote@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfXwo0SF8+pH8XM
 yXVkSciHBeOR2BOJ93699ECr+FsRhel4Wk58I+X8DH8ruKSXqIR9xTPmPCuklAY0+fjr6LOJ0jL
 EMotPCy56vBIyB7NLxt7RNqUy60B+jU1o18cj1Hia9YMKTziVvTmq9neSK0kwow6IrGaVSD8JAx
 WxROgnGyHIea8dFyD7ApDdNzNL3jLi6KiLM75PBtpiHr5TMBnFLLizqMonjvhiQ1S3xLRLPsncj
 epx9+O1jla6e7jV84YfMkPCJV1BSsegKOxeH8C/39eoSwabEvKoWlEL2x1GMujYrQWP9u75/EUX
 BpXcy+BOtFm5mHNxhl83ZayU9Cdqup2V9PihL9PlHF9ZKkORCrRLm4kM3yPu35IUnu2xOj4u0YB
 o/8VV3/GuaaZYp8zboXu64otpd9tjeQ7bX4F/IUp6YMvynPMoyFvrWmuzv3YG58uKH+sZPFsXgA
 ojMNyfp83vlV1uCkQfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX68P+8w/SFYK8
 Xj1EgsFtnYQDYsVS+yx4MgP6RlF1vNQ6jcSMTuxVQX13nr/B7MBq2uNAKSVvBZ1hCUbAkLYj0Ba
 p7XJgerHA4/eCXhfaXHatvesjTuyB6g=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accb875 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Cv24dpK0CmeL2Y3-DUMA:9
X-Proofpoint-ORIG-GUID: UzZpqBG8Da6viI6LGv2E0bjq-QxfenpB
X-Proofpoint-GUID: UzZpqBG8Da6viI6LGv2E0bjq-QxfenpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247628

From: Shantanu Majumdar <shanmaju@qti.qualcomm.com>

Replace the PACKAGECONFIG gtk3 dependency from gtk3+ to
gtk+3 to match the recipe name used in OE-Core.

Signed-off-by: Shantanu Majumdar <shanmaju@qti.qualcomm.com>
Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
index 7964d5b6de..de143b26a0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
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


