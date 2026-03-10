Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969F3FCC9D8
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 07:41:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34889.1773128510264387228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 00:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DJ41+wbI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EY1X1900084
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 07:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d5JiIBoXSXdik6XuYn4pLb
	NYlX6LxXgAKLDnYkJa4Uo=; b=DJ41+wbIqDppr3DtadVvb8Nlq6Lo5zMZCV0+VI
	LLFJ0d/KiBkN8sWOihr9DpI6XCYEsT+O2IK1R16QHfFGCfYKZGXuRnXqft35djwW
	8BwZWYw8Ta5wibln/JV2BYtpE1ahLhlv87Z6JKO8DUWTzv6hfbHh0CSrEVCQl55e
	RdvSC6OdfkP+GvmIRV0T4/+eZWPlZUHFERnMqaKvEx+e+tbDdxFPiJaovH3eOqit
	bedS6Jwun3+/VkmZTjUSShZ8uIzDpO+OUhkoqytlvHMwFZIc6J+STtiGQmH+1F4R
	c+nDLUs2CmNblbHAdx9qE8DMnVQ0soLUr/OUQ2ZSMWE5DRGg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsac7sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 07:41:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 62A7fkrf008822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 07:41:46 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 10 Mar 2026 00:41:44 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20260221 -> 20260309
Date: Tue, 10 Mar 2026 13:11:28 +0530
Message-ID: <20260310074128.3451158-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u0V5nAUYq1TRhuO8nbmjDjm928g68L9D
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69afcb3d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=6yRcuEPjEMwtFemCnq8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MyBTYWx0ZWRfX8Wg0E+y+oCtQ
 RakU066sAslgVLhLJmhhAh3wbue9wekqR5caRtoWtmXsuO2UyGiy025X/vUGbu93TXIdcU/dM8O
 xmyPRmBLhuEKMDYFiRhlyMjIFI/e9BAsULefXnx7IKiCePdPVQFCr0WslIm/TWIzvpbx40KeaXN
 RL8AiS7FOJ5WzCMGsPlLiebIlcMOF+CBEVXv8rzoebb0RbbqNz4uFUHSCQ9068dTm51w7NqIGo8
 X61wph6Bu17KfVpQsAeoJMoWbZg0Mpni55+7AvXQOmZSdGp/k6DhFxVYZghv7uWwZv+FLr2ThjS
 nx4M5ZK++FjqNhfatEupOvc95KO8ZLrP/U9PL3AiL9uPq0BR1BHByaT626pRwHapRbIUgmFvbdU
 bd7RxOTJksVLbpry0cEF1U0FSaQ5R8XkbV/zkl5Tpzx+3hfvbzLQn7ya/q8AAzaaT/40qLyk8p8
 /DH9eR4+hcDrWrc7aRg==
X-Proofpoint-ORIG-GUID: u0V5nAUYq1TRhuO8nbmjDjm928g68L9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 07:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232761

Upgrade the firmware package to latest release. Add package
${PN}-lt8713sx for Lontium LT8713SX DP hub, add audioreach
firmware for Kaanapali, Lenovo ISH LNLM firmware was renamed so
add new packages, and modify FILES:${PN} for package
${PN}-ish-lnlm-12128606 to pack firmwares properly.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260221.bb => linux-firmware_20260309.bb} | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260221.bb => linux-firmware_20260309.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
index 168ccaa6d5..1eebb92e1d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
@@ -314,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "e3897ca46d046032a2b60b8554caf61d"
+WHENCE_CHKSUM  = "772c8667ff568e7de3a7794fd420f2f7"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -452,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "bd19acc4c1a02548e09d3df67f987fe6e378df735bab138c1d9e917962056d94"
+SRC_URI[sha256sum] = "c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c"
 
 inherit allarch
 
@@ -763,7 +763,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
-             ${PN}-lt9611uxc ${PN}-lontium-license \
+             ${PN}-lt8713sx ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-wfx-license ${PN}-wfx \
              ${PN}-whence-license \
              ${PN}-xc4000-license ${PN}-xc4000 \
@@ -774,6 +774,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \
              ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
              ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad \
+             ${PN}-ish-lnlm-lenovo-thinkpad-x9-14 ${PN}-ish-lnlm-lenovo-thinkpad-x1 \
              ${PN}-ish-ptl \
              ${PN}-advansys-license ${PN}-advansys \
              ${PN}-aeonsemi-license ${PN}-as21xxx \
@@ -1324,9 +1325,11 @@ RDEPENDS:${PN}-amdgpu-misc += "${PN}-amdgpu-license"
 
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
+LICENSE:${PN}-lt8713sx = "Firmware-Lontium"
 
 FILES:${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
 FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin*"
+FILES:${PN}-lt8713sx = "${nonarch_base_libdir}/firmware/lt8713sx_fw.bin*"
 
 # For Arm Mali
 FILES:${PN}-mali-csffw-license = "${nonarch_base_libdir}/firmware/LICENCE.mali_csffw"
@@ -2459,7 +2462,7 @@ FILES:${PN}-qcom-glymur-adreno = "${nonarch_base_libdir}/firmware/qcom/glymur/ge
 FILES:${PN}-qcom-glymur-audio = "${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.*"
 FILES:${PN}-qcom-glymur-compute = "${nonarch_base_libdir}/firmware/qcom/glymur/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
-FILES:${PN}-qcom-kaanapali-audio = "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.*"
+FILES:${PN}-qcom-kaanapali-audio = "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.* ${nonarch_base_libdir}/firmware/qcom/kaanapali/Kaanapali-MTP-tplg.bin*"
 FILES:${PN}-qcom-kaanapali-compute = "${nonarch_base_libdir}/firmware/qcom/kaanapali/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-soccp = "${nonarch_base_libdir}/firmware/qcom/kaanapali/soccp*.*"
 FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn*"
@@ -2783,8 +2786,8 @@ FILES:${PN}-hp-license = "${nonarch_base_libdir}/firmware/LICENSE.HP"
 
 LICENSE:${PN}-ish-lnlm-12128606 = "Firmware-HP"
 FILES:${PN}-ish-lnlm-12128606 = " \
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_12128606.bin* \
-    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_12128606.bin* \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_12128606_*.bin* \
+    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_12128606_*.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-12128606 = "${PN}-hp-license"
 
@@ -2794,11 +2797,23 @@ FILES:${PN}-lenovo-license = "${nonarch_base_libdir}/firmware/LICENCE.lenovo"
 
 LICENSE:${PN}-ish-lnlm-53c4ffad = "Firmware-lenovo"
 FILES:${PN}-ish-lnlm-53c4ffad = "\
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_*.bin* \
     ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-53c4ffad = "${PN}-lenovo-license"
 
+LICENSE:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 = "Firmware-lenovo"
+FILES:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 = "\
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bin* \
+"
+RDEPENDS:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 = "${PN}-lenovo-license"
+
+LICENSE:${PN}-ish-lnlm-lenovo-thinkpad-x1 = "Firmware-lenovo"
+FILES:${PN}-ish-lnlm-lenovo-thinkpad-x1 = "\
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5.8.4.7720.bin* \
+"
+RDEPENDS:${PN}-ish-lnlm-lenovo-thinkpad-x1 = "${PN}-lenovo-license"
+
+
 LICENSE:${PN}-ish-ptl = "Firmware-intel"
 FILES:${PN}-ish-ptl = "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
 RDEPENDS:${PN}-ish-ptl = "${PN}-intel-license"
-- 
2.34.1


