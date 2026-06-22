Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C94FCDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:18:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38586.1782116290765131691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 01:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hra0NS28;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59I4F3850632
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T41zaIs/JXw/buHtmzWHs1
	RM293MmOVvlzxFXP3gmDo=; b=hra0NS28qH3bo1Cl6INroIh97ctDvbAsRv0ptW
	ysfQQenlJwsjGnNTMR3K2Ym3Ua+2wX0JnQ7W7ZWrlfGTg96fciD2BHW279tsbq7s
	IU1wfkqajom64+7nZSWslajtsbUPh1BhD5VMVub7xiLG6o4MLngPJvWq5UGSiJU2
	4d5deCKUVEVMhZnmwnbc60zmEPn88DqzLdnFnqavQBbXJDR4QSpy5kajNvOO88GU
	acJTOg97TrM/CQePPDgdNQgZN97JTysefup9iyuw9BaQaL4eS3M9QzPvPTXuqzdJ
	ttLtBXovsbY9mRelHjrHPVeYVVzN7SQKfsx03/dXudrbdk+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm585bqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:18:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 65M8HMvU026057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:17:40 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Jun 2026 01:17:25 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH] maintainers.inc: update ownership for linux-firmware
Date: Mon, 22 Jun 2026 13:47:10 +0530
Message-ID: <20260622081710.3632461-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: R6XDtIX33r06oC5EN_fnt0Z4vR1qPBC6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MSBTYWx0ZWRfX7biXxh2d3gSl
 n0HHXLiJgB5+/9AKIbrK0ysNQ24QyvM/i780qXmr+ObpVBrFdF2MmH7Si4BnACq3I36f3dHNtHV
 FCZX7Ma17GD2i0hHz7Ogh5bm4d0KeEY=
X-Proofpoint-GUID: R6XDtIX33r06oC5EN_fnt0Z4vR1qPBC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MSBTYWx0ZWRfXwZWY2vl043Ob
 V0wEUbmsO2maSl6IEi4F8sRy4ZVLC/EsKNThPRGiuIYplodpC9617S2caGwdJZ1i0XQp1P/afor
 lJ8SoNhlgjOU+ZbGaOEKSb0hCbP8Ags7OI65BtZ64NHTcpqfBh5sMHGYF6QVuVr9XreDXMYED/F
 zU3dsJ0HsMT42VGVBW3T5aRnTF5k99iqbeA5pQ2h0m2+c8n4O2Zj0WQ5NM1jy3Y0ldN6wStYWYh
 AF+41E3Wb+RaG0XDMS/QbhHXefAjAAxBFVtGq6tIifTcNyMRfydbU/07QsQPADY9ab1jGWibJkq
 6VN0mVUTLVnSRFC1LZunwA7YzrK8j0ky1j/MK9L2VIUPbZOcMuGe2BFnDpCk8q50/8wfC6vtl9X
 GU0ZtE3rLeV2F/r91TLUF3LA2Hx+H0pdrSILPIS2FCF8nfbuaEK0wAJ4q8U/3fQBJkIH+YFlY+b
 G7OhvuLL/Fi5tGx64vQ==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a38efc0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iGHA9ds3AAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=ENdlVatws_NGTdbHyKgA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239275

I propose to take ownership for linux-firmware recipe.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f757fafdcb..4c6307086c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -472,7 +472,7 @@ RECIPE_MAINTAINER:pn-libxxf86vm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libyaml = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-lighttpd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-dummy = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-linux-firmware = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-linux-firmware = "Vivek Puar <vpuar@qti.qualcomm.com>"
 RECIPE_MAINTAINER:pn-linux-libc-headers = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-- 
2.34.1


