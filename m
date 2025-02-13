Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDE2C021A9
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:46:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.5628.1739429198578677563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=GcGcODKh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D0n9ha010515;
	Thu, 13 Feb 2025 06:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yJKuJQY8SFDFEjOhyrHdNv
	1+qU/uPZoX1IrytCtPRYM=; b=GcGcODKhwRM3KE7KuF6TgB1fPVicHT59Kstj3j
	x7YHwfrkzDA/wqoTAnGV7P9MbN0W9P8Ef8tt5HhPwqEeP2CfHYVNNwdIw6QQevJr
	uSGjtirVzhyXs7E9gN34m/b1aYhbMqVdptjMzoaHz1vRxWmcvOP4CRTLxCa4blp0
	y8FbrbksB6dEkZScpjWphQg4MQNixAO8xsr/E/L3L7871WXNBwCIchcpmv68o9aV
	WRCokSWCmMIIcj/KpjK7/HRFWhDMzkQk3GnNSn8JfZj+6y42YmCv7fPmTyta9iVt
	Yw1oSXjX5QJcATZqaX5shi/sxI5EtUeZEiaJIrx1uXA+H32g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5j72m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:46:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D6kacD009541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:46:36 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 22:46:34 -0800
From: Vivek Puar <quic_vpuar@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <quic_vpuar@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH v3] linux-firmware: upgrade 20250109 -> 20250211
Date: Thu, 13 Feb 2025 12:16:18 +0530
Message-ID: <20250213064618.1907931-1-quic_vpuar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: La4p54_-Epyz6pGZvr_LJZrFKO1nFY5_
X-Proofpoint-GUID: La4p54_-Epyz6pGZvr_LJZrFKO1nFY5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211301

Add DSP firmware for Qualcomm SA8775P / QCS9100
platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
packages, and updating it with correct license information.

Add QCA6698AQ package ${PN}-ath11k-qca6698aq
to ath11k firmware.

Add bluetooth WCN3950 package ${PN}-qca-wcn3950,
bluetooth QCA6698 package ${PN}-qca-qca6698
to qca firmware.

Add two more WCN3950 1.3 NVM files to
${PN}-qca-wcn3950 package.

Add device specific ath11k firmware to QCM6490
boards in ${PN}-qcom-qcm6490-wifi package.

Add Firmware files for Lenovo T14s G6 Qualcomm platform
to ${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute}
packages.

License-Update: additional files

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...20250109.bb => linux-firmware_20250211.bb} | 68 +++++++++++++++++--
 1 file changed, 63 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (96%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
similarity index 96%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index b932300742..099a039662 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -55,6 +55,7 @@ LICENSE = "\
     & Firmware-powervr \
     & Firmware-qat \
     & Firmware-qcom \
+    & Firmware-qcom-2 \
     & Firmware-qcom-yamato \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
@@ -132,6 +133,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533 \
                     file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
+                    file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0 \
                     file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
                     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
                     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
@@ -158,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
+WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,6 +214,7 @@ NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
 NO_GENERIC_LICENSE[Firmware-powervr] = "LICENSE.powervr"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
+NO_GENERIC_LICENSE[Firmware-qcom-2] = "LICENSE.qcom-2"
 NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
 NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
@@ -247,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
+SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
 
 inherit allarch
 
@@ -389,6 +392,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath11k-ipq8074 \
              ${PN}-ath11k-qca2066 \
              ${PN}-ath11k-qca6390 \
+             ${PN}-ath11k-qca6698aq \
              ${PN}-ath11k-qcn9074 \
              ${PN}-ath11k-wcn6750 \
              ${PN}-ath11k-wcn6855 \
@@ -401,6 +405,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-qca61x4-serial \
              ${PN}-qca-qca61x4-usb \
              ${PN}-qca-qca6390 \
+             ${PN}-qca-qca6698 \
+             ${PN}-qca-wcn3950 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
@@ -461,7 +467,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-prestera \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qed \
-             ${PN}-qcom-license ${PN}-qcom-yamato-license \
+             ${PN}-qcom-license ${PN}-qcom-2-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-aic100 ${PN}-qcom-qdu100 \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
@@ -472,11 +478,12 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
-             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa \
+             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
              ${PN}-qcom-qcs615-adreno \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
-             ${PN}-qcom-sa8775p-adreno \
+             ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
+             ${PN}-qcom-sa8775p-generalpurpose \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -489,6 +496,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
+             ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
+             ${PN}-qcom-x1e80100-lenovo-t14s-g6-compat ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -584,6 +593,7 @@ LICENSE:${PN}-ath11k-ipq6018 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-ipq8074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qca6390 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-qca6698aq = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
@@ -595,6 +605,8 @@ LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca6698 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn3950 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
@@ -629,6 +641,7 @@ FILES:${PN}-ath11k-ipq6018 = "${nonarch_base_libdir}/firmware/ath11k/IPQ6018"
 FILES:${PN}-ath11k-ipq8074 = "${nonarch_base_libdir}/firmware/ath11k/IPQ8074"
 FILES:${PN}-ath11k-qca2066 = "${nonarch_base_libdir}/firmware/ath11k/QCA2066"
 FILES:${PN}-ath11k-qca6390 = "${nonarch_base_libdir}/firmware/ath11k/QCA6390"
+FILES:${PN}-ath11k-qca6698aq = "${nonarch_base_libdir}/firmware/ath11k/QCA6698AQ"
 FILES:${PN}-ath11k-qcn9074 = "${nonarch_base_libdir}/firmware/ath11k/QCN9074"
 FILES:${PN}-ath11k-wcn6750 = "${nonarch_base_libdir}/firmware/ath11k/WCN6750"
 FILES:${PN}-ath11k-wcn6855 = "${nonarch_base_libdir}/firmware/ath11k/WCN6855"
@@ -660,6 +673,20 @@ FILES:${PN}-qca-qca6390 = " \
   ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
   ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
 "
+FILES:${PN}-qca-qca6698 = " \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206 \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207 \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin \
+"
+FILES:${PN}-qca-wcn3950 = " \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv \
+  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin \
+"
 FILES:${PN}-qca-wcn3988 = " \
   ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
   ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
@@ -745,6 +772,7 @@ RDEPENDS:${PN}-ath11k-ipq6018 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-ipq8074 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qca6390 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-qca6698aq += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qcn9074 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
@@ -757,6 +785,8 @@ RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
 RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca6698 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn3950 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
@@ -1739,6 +1769,7 @@ FILES:${PN}-linaro-license   = "${nonarch_base_libdir}/firmware/LICENCE.linaro"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
+LICENSE:${PN}-qcom-2-license = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-aic100 = "Firmware-qcom"
 LICENSE:${PN}-qcom-qdu100 = "Firmware-qcom"
@@ -1771,6 +1802,7 @@ LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
@@ -1778,6 +1810,9 @@ LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sa8775p-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sa8775p-compute = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sa8775p-generalpurpose = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1795,8 +1830,12 @@ LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
+FILES:${PN}-qcom-2-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom-2"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
 
 FILES:${PN}-qcom-aic100 = "${nonarch_base_libdir}/firmware/qcom/aic100/*"
@@ -1835,6 +1874,7 @@ FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]64
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
+FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
@@ -1842,6 +1882,9 @@ FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
 FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
 FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
+FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.*"
+FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
+FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
@@ -1861,6 +1904,10 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat = "${nonarch_base_libdir}/firmware/qcom/21N1"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
 
 RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
@@ -1897,6 +1944,7 @@ RPROVIDES:${PN}-qcom-qcm6490-audio = "${PN}-qcom-qcs6490-audio"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
@@ -1906,6 +1954,9 @@ RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
 # c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
 RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
 RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sa8775p-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sa8775p-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sa8775p-generalpurpose = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
@@ -1923,12 +1974,19 @@ RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 
+RRECOMMENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-x1e80100-lenovo-t14s-g6-compat"
+RRECOMMENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-x1e80100-lenovo-t14s-g6-compat"
+RRECOMMENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-x1e80100-lenovo-t14s-g6-compat"
+
 LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.34.1


