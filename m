Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45A4C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 11:46:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.48034.1747049794382143567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 04:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QcRDarhY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CA81LR011401
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 11:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSc0V6qr3YnrHRQ4SYEwqS
	jeV9TGGK+MQcHcvgrjug8=; b=QcRDarhYE8tGC+zDkLXBFs4KjsZ/PZQvrGgAB4
	le6bHQ+0g7MevDDbt03BL/3NZ6o+Aj4cJQdJYGeSVo2zZVmuGidGZGkWuNcxwWDX
	4pm/NVWq2Zs2wjDOA0Z01qO2VDAaMguEYkv49LFwAokSSpIh2q1ENmmc3S14XZt5
	kUqQxX2UIB1hYDdI/2FE3ZkervFjgs+7vSAtnKNIRNvFDo2EyQLpr9iW9YEy/d+r
	m859tf9mg3+sxgCXRDYet0VcGDA1ICkJxwelhCJXXTHDTo5Qa2HrEY84VJ/U4Zuz
	dxjMzGWIETB1U2osZl2Y6jaIUF3CJrkhaZIEGhTcC1xUa47w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k47e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 11:36:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54CBaWtm028271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 11:36:32 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 May 2025 04:36:30 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20250410 -> 20250509
Date: Mon, 12 May 2025 17:06:15 +0530
Message-ID: <20250512113615.2112807-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=6821dd41 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=riQnz7vAzH-qgrFcKFgA:9
X-Proofpoint-GUID: TRsV4-Zete4KdYAZuiANQsQWAMAlyESY
X-Proofpoint-ORIG-GUID: TRsV4-Zete4KdYAZuiANQsQWAMAlyESY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEyMSBTYWx0ZWRfX3SBpef2KGeoE
 Tpp6L2Dqavt/DlybGlT96jTTZkSr7EzYjMAq5E33P8V0iRUOTydzs/TaieszmQKYHVdHbbmVZ1g
 hbaazpLUgrlKJMM+4s7Zx39Sn6I0pnG79FzalByaYgLFheOTFRihtOI8k4+CROKdiCQTVMXaKgY
 8OjKxu7z+tYC6nc0p5/Y7K/XG2Zr6soxWu+khvnaggNarxdAlcyj7S6tU3b8OXG3+oC8VCLCyBO
 13S9c8eGTKtMNcoSb+FFvAkpWnoN6VpG+YL0TBHbtQvy2PMgxTQVTSyz4LC+dwxvQds5LWpbU1M
 Z8FBlAhAK3K/ThauGk5Q6iL2cFxUZzccr2KZQVgsQjHwxSB5G3LdYDFo8iYSWohQOhFP/1fShMb
 CIIz2pKFpD81bBckzUpaJOvmgZyshZW+gkHAtrbDCgmFvNl+BL2smnHSAXQ9D+vLvKxH8QE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120121
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 11:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216362

Adding QUPv3 firmware for QCS9100 platform

License-Update: additional files

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...x-firmware_20250410.bb => linux-firmware_20250509.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250410.bb => linux-firmware_20250509.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
index e9491a74bd..a461956a89 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
@@ -160,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "7ddfb44c16e34dcd8bbacc4839ab78dc"
+WHENCE_CHKSUM  = "d85e2f182f489a235400712cbfdb017a"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -250,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2ae6aab2d8930fd54bf30ae15498f1625721bc3630b894644db5d21fad5a20f9"
+SRC_URI[sha256sum] = "f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e"
 
 inherit allarch
 
@@ -487,7 +487,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
-             ${PN}-qcom-sa8775p-generalpurpose \
+             ${PN}-qcom-sa8775p-generalpurpose ${PN}-qcom-sa8775p-qupv3fw \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1833,6 +1833,7 @@ LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sa8775p-audio = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sa8775p-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sa8775p-generalpurpose = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sa8775p-qupv3fw = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1915,6 +1916,7 @@ FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/
 FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.*"
 FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
 FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
+FILES:${PN}-qcom-sa8775p-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/sa8775p/qupv3fw.elf*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
@@ -1997,6 +1999,7 @@ RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sa8775p-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sa8775p-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sa8775p-generalpurpose = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sa8775p-qupv3fw = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
-- 
2.34.1


