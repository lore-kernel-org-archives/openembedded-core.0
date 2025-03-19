Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3974DC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:23:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.3278.1742412225791061818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=U+RQTFwH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JG7RTH031116
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 19:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jSwZlBbsAZ+MHXr+//gdFT
	d3F6VaGGnuhxji0ogdCsg=; b=U+RQTFwHubo0JFRDYaM5vIV/yGMD+/sKY8Q2rN
	++gSe96r4tf4n5NaCV5bK1HGsHDi/IetJ4P8lv4oGbnFcMgrwBk/rKGF4ZhLchzM
	DWiyEroMhGtF72NQqRYIDgb7/SRUB/jO1TXr6OOZwnW0gpHgD8ifRZSRtBh6yRUB
	sNSVVuYU2nOImYWOO5ULnrWc8ZA6KEms0o4Hf0ypZGB6iSeRfuaXnvmZNcLZM7fO
	pvANaGGJwb5Hi5SNef/F4ubSfio4EsoWfDpg8vqbDrBe+L8UUABtMIVGjjQSbw13
	aGCQm8MNPOu63Aq2JQDiO96UzR26tlsZDggRt+/mBWAT+rPg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y0gqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 19:23:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52JJNhGA021692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 19:23:43 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 12:23:42 -0700
From: Vivek Puar <quic_vpuar@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <quic_vpuar@quicinc.com>
Subject: [PATCH] linux-firmware: update qca-qca61x4-usb package contents
Date: Thu, 20 Mar 2025 00:53:25 +0530
Message-ID: <20250319192325.952672-1-quic_vpuar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0PW0p8VcO1EmH84TUSkOHdI67tuH6yxr
X-Proofpoint-ORIG-GUID: 0PW0p8VcO1EmH84TUSkOHdI67tuH6yxr
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67db19c0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=xN9hhQR7lVrd8nsUKT4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_07,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=867 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 19:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213351

The NVM and rampatch files for QCA61x4 USB chips went 
to qca-qca2066 instead of -qca-qca61x4. Fix package contents.

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
---
 .../linux-firmware/linux-firmware_20250311.bb               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 1a2a6b095e..675d378376 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -668,6 +668,9 @@ FILES:${PN}-qca-qca61x4-serial = " \
 FILES:${PN}-qca-qca61x4-usb = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin* \
   ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin* \
 "
 FILES:${PN}-qca-qca6390 = " \
   ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv* \
@@ -741,9 +744,6 @@ FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
-  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin* \
 "
 FILES:${PN}-qca-wcn7850 = " \
   ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
-- 
2.34.1


