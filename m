Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0E0CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 05:11:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5434.1779253914453687082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 22:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=W7oi2v/o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JMmF9t341539
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 05:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eLKOfHJMYQsAWaxudN80pk
	spZTajFfKA11wokNCcmTw=; b=W7oi2v/o3seAXtGdFfkq1w90/12AB/gjjirO2g
	y1GthYgHbcs7PrqYYIIJ7vG0fjQS6g8UnHUHzBoCbuvgWAD7ThzxmFv/zJcrdzZJ
	H59masvpChD26LCvi+1uBxSKkId1qR7gAJzjEFQQDdsA5Hb5hOWp3oaCTRTcY5P7
	Hczm7/UfPI1GJKU2eIl7fCZySEQQ+ZstdoG2VI0hBlN66HqYps9Nlt3fsngmKWel
	5aYL4jZsdpuwQHB0IPk39GfJlkRaob8OnCpvNVEFl2rt8Nvfadm2GrebIQUCbfE3
	3MCP3xyhZHyQXo/gfbM/8GCfDZ01Ow64toHknwlI4OeiIMIA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vb0c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 05:11:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 64K5Bqxl022743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 05:11:52 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 May 2026 22:11:50 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20260410 -> 20260519
Date: Wed, 20 May 2026 10:41:36 +0530
Message-ID: <20260520051136.2806904-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-GUID: sB-umyhxBRZgdjlg-pgckg0XNHt8Y0Nl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA0NyBTYWx0ZWRfXywIzmReGcmCo
 RjPT/hiU19nPQ76JFqqCvKWCrcpacOU/jBYsCFYmAlGiNWVrkuoSp7f+E8BF6EQgSCRp7N7/7uT
 cGlWYI7ihiHIRQVzUHGTH4FpOqbv8ksTLFc6QhfNuM6oXY4n8U8DcB3Wu+22RyichOqxVTYmPvu
 9I5iOkFm9HajR9ouywMMzzY97oSjmQTj+dUQaLxZTXVWTYE4eUJxhD2LiCcx8WEaVm/K2/rKkUm
 bXCNz98taVdFcLAouKaio1HRD0UX6QG7Sj36Rp2bBAGr4rK0vTZxB+0xo3SAUU5B7qPmO8LfnLe
 SZnBMVVeBAbVVeAjucYPo0vCQMy4i/qQxAOv3Xh7uKb9HbFuEPbdGbgARKcg08V1kmY9OVyBNSr
 dHSI9vPM7/ETib3lY5/2h1vydHPTxKIeZE+PCneWX7ryKffCxA0Q5eDe9M8F78PYuPA6OFTA1ja
 oKaK3LejTk79ZrjgtGQ==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d4299 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=G7KpAmuA_FgF0sezETUA:9
X-Proofpoint-ORIG-GUID: sB-umyhxBRZgdjlg-pgckg0XNHt8Y0Nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 05:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237381

Upgrade the firmware package to latest release. Add compute package
for shikra. Add packages ${PN}-ath12k-{ipq5424, qcc2072} for ath12k
based chips. Add Texas Instruments PCM6240 firmware, firmware for
tas2783A projects, firmware for Lontium LT7911EXC and LT9611C. Move
lt*_fw.bin firmware to Lontium subdir. Add HP ISH firmware for Intel
Panther Lake systems. Add RDEPENDS on ${PN}-qcom-license for Dell
XPS13 packages as qcom/NOTICE.txt is applicable to those firmwares.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260410.bb => linux-firmware_20260519.bb} | 62 +++++++++++++++----
 1 file changed, 50 insertions(+), 12 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260410.bb => linux-firmware_20260519.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260519.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260519.bb
index b34f8ef255..7eb9bf35fb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260519.bb
@@ -314,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "1468492365c9cec2e7ebf71c79d2e8f5"
+WHENCE_CHKSUM  = "6048e3ea8acf04b4c415db8a9e35a912"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -452,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178"
+SRC_URI[sha256sum] = "b14e7197a290a7e5569f5ef790cde289bddc47e32126f2eb262a8e677fc39727"
 
 inherit allarch
 
@@ -564,7 +564,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-mwl8k ${PN}-mwlwifi\
              ${PN}-ti-connectivity-license ${PN}-wl1251-license ${PN}-wlcommon ${PN}-wl1251 ${PN}-wl12xx ${PN}-wl18xx ${PN}-cc33xx \
              ${PN}-ti-keystone-license ${PN}-ti-keystone \
-             ${PN}-ti-tspa-license ${PN}-ti-tas2563 ${PN}-ti-tas2781 ${PN}-ti-tas2783 ${PN}-ti-vpe \
+             ${PN}-ti-tspa-license ${PN}-ti-pcm6240 ${PN}-ti-tas2563 ${PN}-ti-tas2781 ${PN}-ti-tas2783 ${PN}-ti-vpe \
              ${PN}-ti-usb-3410-5052 \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 ${PN}-rsi-91x \
@@ -641,6 +641,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath11k-wcn6750 \
              ${PN}-ath11k-wcn6855 \
              ${PN}-ath12k \
+             ${PN}-ath12k-ipq5424 \
+             ${PN}-ath12k-qcc2072 \
              ${PN}-ath12k-qcn9274 \
              ${PN}-ath12k-wcn7850 \
              ${PN}-qca \
@@ -748,7 +750,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
-             ${PN}-qcom-shikra-qupv3fw \
+             ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-qupv3fw \
              ${PN}-qcom-sm8150-adreno \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
@@ -776,7 +778,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
-             ${PN}-lt8713sx ${PN}-lt9611uxc ${PN}-lontium-license \
+             ${PN}-lt7911exc ${PN}-lt8713sx ${PN}-lt9611c ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-wfx-license ${PN}-wfx \
              ${PN}-whence-license \
              ${PN}-xc4000-license ${PN}-xc4000 \
@@ -785,7 +787,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-typhoon-license ${PN}-typhoon \
              ${PN}-intel-license ${PN}-ish-lnlm \
              ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \
-             ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
+             ${PN}-hp-license ${PN}-ish-lnlm-12128606 ${PN}-ish-ptl-12128606 \
              ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad ${PN}-ish-ptl-53c4ffad \
              ${PN}-ish-ptl ${PN}-ish-wcl \
              ${PN}-advansys-license ${PN}-advansys \
@@ -954,6 +956,8 @@ LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-ipq5424 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-qcc2072 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
@@ -999,6 +1003,8 @@ FILES:${PN}-ath11k-wcn6855 = "${firmwaredir}/ath11k/WCN6855"
 # -ath11k is a virtual package that depends upon all ath11k packages.
 ALLOW_EMPTY:${PN}-ath11k = "1"
 
+FILES:${PN}-ath12k-ipq5424 = "${firmwaredir}/ath12k/IPQ5424"
+FILES:${PN}-ath12k-qcc2072 = "${firmwaredir}/ath12k/QCC2072"
 FILES:${PN}-ath12k-qcn9274 = "${firmwaredir}/ath12k/QCN9274"
 FILES:${PN}-ath12k-wcn7850 = "${firmwaredir}/ath12k/WCN7850"
 # -ath12k is a virtual package that depends upon all ath12k packages.
@@ -1127,6 +1133,8 @@ RDEPENDS:${PN}-ath11k-qcn9074 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-ipq5424 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-qcc2072 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
@@ -1344,12 +1352,16 @@ RDEPENDS:${PN}-amdgpu-vega12 += "${PN}-amdgpu-license"
 RDEPENDS:${PN}-amdgpu-misc += "${PN}-amdgpu-license"
 
 # For lontium
+LICENSE:${PN}-lt7911exc = "Firmware-Lontium"
 LICENSE:${PN}-lt8713sx = "Firmware-Lontium"
+LICENSE:${PN}-lt9611c = "Firmware-Lontium"
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
 FILES:${PN}-lontium-license = "${firmwaredir}/LICENSE.Lontium"
-FILES:${PN}-lt8713sx = "${firmwaredir}/lt8713sx_fw.bin*"
-FILES:${PN}-lt9611uxc = "${firmwaredir}/lt9611uxc_fw.bin*"
+FILES:${PN}-lt7911exc = "${firmwaredir}/Lontium/lt7911exc_fw.bin*"
+FILES:${PN}-lt8713sx = "${firmwaredir}/lt8713sx_fw.bin* ${firmwaredir}/Lontium/lt8713sx_fw.bin*"
+FILES:${PN}-lt9611c = "${firmwaredir}/Lontium/lt9611c_fw.bin*"
+FILES:${PN}-lt9611uxc = "${firmwaredir}/lt9611uxc_fw.bin* ${firmwaredir}/Lontium/lt9611uxc_fw.bin*"
 
 # For Arm Mali
 FILES:${PN}-mali-csffw-license = "${firmwaredir}/LICENCE.mali_csffw"
@@ -1830,6 +1842,13 @@ FILES:${PN}-ti-tas2563 = "\
 "
 RDEPENDS:${PN}-ti-tas2563 = "${PN}-ti-tspa-license"
 
+# For ti-pcm6240 - pcm6240 firmware
+LICENSE:${PN}-ti-pcm6240 = "Firmware-ti-tspa"
+FILES:${PN}-ti-pcm6240 = "\
+    ${firmwaredir}/ti/pcm6240/pcm6240-i2c-1-2dev.bin* \
+"
+RDEPENDS:${PN}-ti-pcm6240 = "${PN}-ti-tspa-license"
+
 # For ti-tas2781 - tas2781 firmware
 LICENSE:${PN}-ti-tas2781 = "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2781 = "\
@@ -1843,7 +1862,17 @@ RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
 # For ti-tas2783 - tas2783 firmware
 LICENSE:${PN}-ti-tas2783 = "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2783 = "\
-    ${firmwaredir}/8E[8F]*-?-?.bin* \
+    ${firmwaredir}/1534-2-*.bin* \
+    ${firmwaredir}/16F4-1-*.bin* \
+    ${firmwaredir}/1714-1-*.bin* \
+    ${firmwaredir}/19[569]4-?-?-*.bin* \
+    ${firmwaredir}/1A[CD]4-?-?-*.bin* \
+    ${firmwaredir}/1B[09]4-?-?-*.bin* \
+    ${firmwaredir}/3??1-?-0x*.bin* \
+    ${firmwaredir}/8E??-?-0x*.bin* \
+    ${firmwaredir}/8E??-?-?-0x*.bin* \
+    ${firmwaredir}/8F??-?-0x*.bin* \
+    ${firmwaredir}/8F??-?-?-0x*.bin* \
     ${firmwaredir}/ti/audio/tas2783/* \
 "
 RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
@@ -2401,6 +2430,7 @@ LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "Firmware-qcom"
+LICENSE:${PN}-qcom-shikra-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8150-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
@@ -2564,6 +2594,7 @@ FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwared
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${firmwaredir}/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sdx35-foxconn-firehose = "${firmwaredir}/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
 FILES:${PN}-qcom-sdx61-foxconn-firehose = "${firmwaredir}/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
+FILES:${PN}-qcom-shikra-compute = "${firmwaredir}/qcom/shikra/cdsp*.*"
 FILES:${PN}-qcom-shikra-qupv3fw = "${firmwaredir}/qcom/shikra/qupv3fw.elf*"
 FILES:${PN}-qcom-sm8150-adreno = "${firmwaredir}/qcom/sm8150/a640*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${firmwaredir}/qcom/sm8250/a650*.*"
@@ -2725,6 +2756,7 @@ RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-shikra-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8150-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
@@ -2749,9 +2781,9 @@ RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "${PN}-linaro-licens
 RDEPENDS:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "${PN}-linaro-license"
-RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "${PN}-dell-license"
-RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio = "${PN}-dell-license ${PN}-linaro-license"
-RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "${PN}-dell-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "${PN}-dell-license ${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio = "${PN}-dell-license ${PN}-linaro-license ${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "${PN}-dell-license ${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
@@ -2835,6 +2867,12 @@ FILES:${PN}-ish-lnlm-12128606 = " \
 "
 RDEPENDS:${PN}-ish-lnlm-12128606 = "${PN}-hp-license"
 
+LICENSE:${PN}-ish-ptl-12128606 = "Firmware-HP"
+FILES:${PN}-ish-ptl-12128606 = " \
+    ${firmwaredir}/HP/ish/ish_ptl_12128606_*.bin* \
+"
+RDEPENDS:${PN}-ish-ptl-12128606 = "${PN}-hp-license"
+
 # For LENOVO ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-lenovo-license = "Firmware-lenovo"
 FILES:${PN}-lenovo-license = "${firmwaredir}/LICENCE.lenovo"
-- 
2.34.1


