Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DF4D2CE0D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 17:22:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.24350.1729617726914357930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 10:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=LIl0vNzn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M99M0o017808
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 17:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uweDNEcTvZSGX3diGPmD5B
	O2qLZYiZNxQIeY4WFTqks=; b=LIl0vNznweWVGNj1ZWSS78A93dZ42xnZJXmZOB
	HajKQztS1RfzNVjg93CTPRr7BTV1goyHSnTwRYeCX9JbOiEKU4gft/X0ZD18DwLu
	z06pbsC5tfovxQrRBLsKoQbTkGEUmiPRgmA5QTJPqcbGfI0YpXJEn6XXfqxgwLZ0
	6To8KUJm6jo92qnC4TuvHjIXILkMyvQ6LkUxsig7kTlqwYpHT1lfo+q8P49KnM8w
	4srJBz5bphs/CQQrsBBAjBODBzEvFJE7tPtfsbz+wveGqAJa1x2/3V/eUYb9kxaY
	IWeZu/7TFxtYFYP7SHlIaHxY9D/jDzTvzDzPvrTPtmyaIZ0A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqd3ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 17:22:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MHM4sk007039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 17:22:04 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 10:22:03 -0700
From: Vivek Puar <quic_vpuar@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <quic_vpuar@quicinc.com>
Subject: [PATCH] linux-firmware: Add qcom-qcm6490-{audio,compute} firmware packages
Date: Tue, 22 Oct 2024 22:51:49 +0530
Message-ID: <20241022172149.539237-1-quic_vpuar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rTnQtgbOxC-KXm9lIBZf-9sRbc5G4suz
X-Proofpoint-GUID: rTnQtgbOxC-KXm9lIBZf-9sRbc5G4suz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 17:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206170

linux-firmware-qcom-qcm6490-{audio,compute} contains
ADSP and CDSP firmware for qcom QCM6490 variant

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
---
 .../linux-firmware/linux-firmware_20241017.bb          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index d18e7414db..60d24efca4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -408,8 +408,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
-             ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
-             ${PN}-qcom-qrb4210-modem \
+             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
+             ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1442,6 +1442,8 @@ LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1494,6 +1496,8 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
+FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.*"
+FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1542,6 +1546,8 @@ RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.34.1


