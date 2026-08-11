Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AB4C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:29:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49763.1786436959191161627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 01:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D4lIqUUg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6ZZRW3308181
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kG1+Kj2YcD8hlR7jYMN4jU
	PhF65QAk6bi7k4ypDqVPo=; b=D4lIqUUgIefOgD1dlAgDIcwhMcl3/PcXLfS+Bi
	xZERn2KpbFMyp+L8Clq6bN8G2ac1anNjV0KBcGg+LcFDmt7/tGlC//DhJehmCHjT
	fzt3vEYbJ4L5CY1bIBt+f9NwmCEGCaV7LXj2n3lcxpYQ6QS1ZM9QWMkJTBRtSY+9
	310UjIGKc9RXUs7vdtAZ0Eq1XslyY6z8AfDswu8iAJLA0iEYUAKYDyrgso13Ak1h
	/eaCc4JJsN9kHHef/ERYwsHXAoz6EhwVbcnCUqyQ2t2RnC5/z2UYHP61KHPiTHjg
	xZrvTX2ZzXU81RWMkuepKqwvugzUnQ8LF89DTrcF6MEe2CbA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfu3dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:29:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 67B8TGha027636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:29:16 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 11 Aug 2026 01:29:14 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20260622 -> 20260810
Date: Tue, 11 Aug 2026 13:58:57 +0530
Message-ID: <20260811082857.2631294-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: gaIsHP10tVI8BLu_dYsojw50L5fX8_Wp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA2OSBTYWx0ZWRfXxJJnLnN/AyHo
 llEv8PdcLdY21jQSclx6CFn8Zs6aSijL0N7XPqupQb88cjPIlbw+ot+XZgF2yfqLv1/YEXS0j77
 eFTdTGTgXSx5t4eGkg6mcJ2yHiuN93o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA2OSBTYWx0ZWRfX8PN8OCEauSX8
 WqfiMl97NjwyuqS42Encjlo9Y1ArasYdFoLdP52GHlhl9qFF92sdKN6hCSqg61sHqXa3PuH47dv
 jcBzwG8jyDvEh3GpwUucNJ1/a3YMJGc0bour5/eSFW82zSSuEiGo50IKAgKUtRcNyK4TxHT2rJ/
 W9yYjyZfIbQpAcNHtQjDZmlVuXoUoJvW5wAdjS85tVX32FXoCbXReYEINBwXgBXVvXyyP3I6sRT
 sXaKoCYmqWjn6K0/yk4Gg7M5EXHz2xCH+2vhUocWEjqua65ovUMT1SRY5oec8geg8mtSxVUi613
 s5Y9M7HUnG2Wj+QOl3faEySMe2TmUfr0z9kA++ASJq+RD/HMjsS6q9xqDVfYf+bWBH43dhROpfI
 Y2cOjGUmj8hxEuMJTpOC4vzi4Ge4K7PkK03ULwyeP/8IZUYWe0TDJoPeWnud0T1v3POi7W/DOWG
 YEKkTFFXJ/4ERSJ95EA==
X-Proofpoint-GUID: gaIsHP10tVI8BLu_dYsojw50L5fX8_Wp
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7add5d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=mcZphG0SpgHcQD3UQ1wA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243172

Upgrade the firmware package to latest release. Add Bluetooth firmware
for WCN685x and add firmware for tas2783A projects. Add firmware files
for the mm8108 chipset. Add ADSP topologies for several Qualcomm boards.
Add ADSP firmware for Qualcomm hawi and GPU firmware for Qualcomm Eliza
boards. Add README.md which documents the versions of the AMD SEV firmware.
Remove REMOVE_UNLICENSED entries for ueagle-atm as it is dropped upstream.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260622.bb => linux-firmware_20260810.bb} | 47 +++++++++++++++----
 1 file changed, 39 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260622.bb => linux-firmware_20260810.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
index 6ccfa16259..5e0d008f1b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
@@ -13,9 +13,6 @@ REMOVE_UNLICENSED += "f2255usb.bin"
 # For ti_usb_3410_5052 - Multi-Tech USB cell modems
 REMOVE_UNLICENSED += "mts_cdma.fw mts_gsm.fw mts_edge.fw"
 
-# For ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
-REMOVE_UNLICENSED += "ueagle-atm/930-fpga.bin ueagle-atm/CMVeiWO.bin ueagle-atm/CMVepFR10.bin ueagle-atm/DSP9p.bin ueagle-atm/eagleIII.fw ueagle-atm/adi930.fw ueagle-atm/CMVep.bin ueagle-atm/CMVepFR.bin ueagle-atm/DSPei.bin ueagle-atm/CMV9i.bin ueagle-atm/CMVepES03.bin ueagle-atm/CMVepIT.bin ueagle-atm/DSPep.bin ueagle-atm/CMV9p.bin ueagle-atm/CMVepES.bin ueagle-atm/CMVepWO.bin ueagle-atm/eagleI.fw ueagle-atm/CMVei.bin ueagle-atm/CMVepFR04.bin ueagle-atm/DSP9i.bin ueagle-atm/eagleII.fw"
-
 # For snd-wavefront - ISA WaveFront sound card
 REMOVE_UNLICENSED += "yamaha/yss225_registers.bin"
 
@@ -92,6 +89,7 @@ LICENSE = "\
     AND LicenseRef-Firmware-mga \
     AND LicenseRef-Firmware-microchip \
     AND LicenseRef-Firmware-montage \
+    AND LicenseRef-Firmware-morsemicro \
     AND LicenseRef-Firmware-moxa \
     AND LicenseRef-Firmware-myri10ge-firmware \
     AND LicenseRef-Firmware-netronome \
@@ -223,6 +221,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     file://LICENSES/LICENSE.mga;md5=6191fc1ff8183b00515c36351ec24150 \
                     file://LICENSES/LICENCE.microchip;md5=db753b00305675dfbf120e3f24a47277 \
                     file://LICENSES/LICENSE.montage;md5=12a9f2b351f60fc9374da61c8b2f11ed \
+                    file://LICENSES/LICENCE.morsemicro;md5=ecb9056f2447ae40173dd1b9be950a70 \
                     file://LICENSES/LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
                     file://LICENSES/LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
                     file://LICENSES/LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
@@ -278,7 +277,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "991f6e7ad5cc20508ae8923edc342c8e"
+WHENCE_CHKSUM  = "de47d58e10797eae2ccc753ab8d69bd7"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -353,6 +352,7 @@ NO_GENERIC_LICENSE[Firmware-mellanox] = "LICENSES/LICENSE.mellanox"
 NO_GENERIC_LICENSE[Firmware-mga] = "LICENSES/LICENSE.mga"
 NO_GENERIC_LICENSE[Firmware-microchip] = "LICENSES/LICENCE.microchip"
 NO_GENERIC_LICENSE[Firmware-montage] = "LICENSES/LICENSE.montage"
+NO_GENERIC_LICENSE[Firmware-morsemicro] = "LICENSES/LICENCE.morsemicro"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENSES/LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge-firmware] = "LICENSES/LICENCE.myri10ge_firmware"
 NO_GENERIC_LICENSE[Firmware-netronome] = "LICENSES/LICENCE.Netronome"
@@ -416,7 +416,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2b9d8a358e76eb766588609135e53fa548b902c551daae33ee32f26f25e60dbb"
+SRC_URI[sha256sum] = "ac17c34fe73756926a961fbafadf8d8f07a3bd2dd2f4ea31a0fb5d50c714a49a"
 
 inherit allarch
 
@@ -656,6 +656,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-linaro-license \
              ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-arch1010 ${PN}-mali-csffw-arch1012 ${PN}-mali-csffw-arch118 ${PN}-mali-csffw-arch128 ${PN}-mali-csffw-arch138 ${PN}-mali-csffw-license \
              ${PN}-mellanox \
+             ${PN}-mm8108 \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
              ${PN}-nvidia-gpu \
@@ -687,11 +688,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-a612 ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a640 \
              ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
              ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-a730 ${PN}-qcom-adreno-a740 \
-             ${PN}-qcom-adreno-g705 ${PN}-qcom-adreno-g709 ${PN}-qcom-adreno-g715 \
+             ${PN}-qcom-adreno-g705 ${PN}-qcom-adreno-g709 ${PN}-qcom-adreno-g715  ${PN}-qcom-adreno-g717 \
              ${PN}-qcom-adreno-g800 ${PN}-qcom-adreno-g801 ${PN}-qcom-adreno-g802 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-eliza-adreno \
              ${PN}-qcom-glymur-adreno ${PN}-qcom-glymur-audio ${PN}-qcom-glymur-compute \
+             ${PN}-qcom-hawi-audio \
              ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-audio \
              ${PN}-qcom-kaanapali-compute ${PN}-qcom-kaanapali-soccp \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
@@ -1068,7 +1071,9 @@ FILES:${PN}-qca-wcn6750 = " \
   ${firmwaredir}/qca/msnv11.b09* \
 "
 FILES:${PN}-qca-wcn685x = " \
+  ${firmwaredir}/qca/wcnhpbtfw10.tlv* \
   ${firmwaredir}/qca/wcnhpbtfw21.tlv* \
+  ${firmwaredir}/qca/wcnhpnv10.b* \
   ${firmwaredir}/qca/wcnhpnv21.b* \
   ${firmwaredir}/qca/wcnhpnv21g.b* \
 "
@@ -1852,16 +1857,21 @@ RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
 LICENSE:${PN}-ti-tas2783 = "LicenseRef-Firmware-ti-tspa"
 FILES:${PN}-ti-tas2783 = "\
     ${firmwaredir}/1534-2-*.bin* \
+    ${firmwaredir}/15E2-?-0x*.bin* \
     ${firmwaredir}/16F4-1-*.bin* \
     ${firmwaredir}/1714-1-*.bin* \
     ${firmwaredir}/19[569]4-?-?-*.bin* \
     ${firmwaredir}/1A[CD]4-?-?-*.bin* \
     ${firmwaredir}/1B[09]4-?-?-*.bin* \
+    ${firmwaredir}/1C64-?-?-0x*.bin* \
     ${firmwaredir}/3??1-?-0x*.bin* \
     ${firmwaredir}/8E??-?-0x*.bin* \
     ${firmwaredir}/8E??-?-?-0x*.bin* \
     ${firmwaredir}/8F??-?-0x*.bin* \
     ${firmwaredir}/8F??-?-?-0x*.bin* \
+    ${firmwaredir}/900[1-9]-?-0x*.bin* \
+    ${firmwaredir}/90[12][0-9]-?-0x*.bin* \
+    ${firmwaredir}/90[12][0-9]-?-?-0x*.bin* \
     ${firmwaredir}/ti/audio/tas2783/* \
 "
 RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
@@ -2360,6 +2370,7 @@ LICENSE:${PN}-qcom-adreno-a740 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g705 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g709 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g715 = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g717 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g800 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g801 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g802 = "LicenseRef-Firmware-qcom"
@@ -2368,9 +2379,11 @@ LICENSE:${PN}-qcom-apq8016-wifi = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-eliza-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-glymur-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-glymur-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-glymur-compute = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-hawi-audio = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-kaanapali-compute = "LicenseRef-Firmware-qcom-2"
@@ -2496,6 +2509,7 @@ FILES:${PN}-qcom-adreno-a740 = "${firmwaredir}/qcom/a740_sqe*.* ${firmwaredir}/q
 FILES:${PN}-qcom-adreno-g705 = "${firmwaredir}/qcom/gen70500_*.*"
 FILES:${PN}-qcom-adreno-g709 = "${firmwaredir}/qcom/gen70900_*.* ${firmwaredir}/qcom/gmu_gen70900.*"
 FILES:${PN}-qcom-adreno-g715 = "${firmwaredir}/qcom/gen71500_*.*"
+FILES:${PN}-qcom-adreno-g717 = "${firmwaredir}/qcom/gen71700_*.*"
 FILES:${PN}-qcom-adreno-g800 = "${firmwaredir}/qcom/gen80000_*.*"
 FILES:${PN}-qcom-adreno-g801 = "${firmwaredir}/qcom/gen80100_*.*"
 FILES:${PN}-qcom-adreno-g802 = "${firmwaredir}/qcom/gen80200_*.*"
@@ -2504,12 +2518,14 @@ FILES:${PN}-qcom-apq8016-wifi = "${firmwaredir}/qcom/apq8016/wcnss.mbn* ${firmwa
 FILES:${PN}-qcom-apq8096-adreno = "${firmwaredir}/qcom/apq8096/a530_zap.mbn* ${firmwaredir}/qcom/a530_zap.mdt*"
 FILES:${PN}-qcom-apq8096-audio = "${firmwaredir}/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${firmwaredir}/qcom/apq8096/mba.mbn* ${firmwaredir}/qcom/apq8096/modem*.* ${firmwaredir}/qcom/apq8096/wlanmdsp.mbn*"
+FILES:${PN}-qcom-eliza-adreno = "${firmwaredir}/qcom/eliza/gen71700_zap.mbn*"
 FILES:${PN}-qcom-glymur-adreno = "${firmwaredir}/qcom/glymur/gen80100_zap.mbn*"
 FILES:${PN}-qcom-glymur-audio = " \
     ${firmwaredir}/qcom/glymur/adsp*.* \
     ${firmwaredir}/qcom/glymur/GLYMUR-CRD-tplg.bin* \
 "
 FILES:${PN}-qcom-glymur-compute = "${firmwaredir}/qcom/glymur/cdsp*.*"
+FILES:${PN}-qcom-hawi-audio = "${firmwaredir}/qcom/hawi/adsp*.*"
 FILES:${PN}-qcom-kaanapali-adreno = "${firmwaredir}/qcom/kaanapali/gen80200_zap.mbn*"
 FILES:${PN}-qcom-kaanapali-audio = " \
     ${firmwaredir}/qcom/kaanapali/adsp*.* \
@@ -2526,6 +2542,7 @@ FILES:${PN}-qcom-qcm6490-audio = " \
     ${firmwaredir}/qcom/qc[ms]6490/adsp*.* \
     ${firmwaredir}/qcom/qc[ms]6490/battmgr.jsn \
     ${firmwaredir}/qcom/qcm6490/QCM6490-IDP-tplg.bin* \
+    ${firmwaredir}/qcom/qcs6490/QCS6490-RB3Gen2-Industrial-Mezz-tplg.bin* \
     ${firmwaredir}/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin* \
 "
 FILES:${PN}-qcom-qcm6490-compute = "${firmwaredir}/qcom/qc[ms]6490/cdsp*.*"
@@ -2602,7 +2619,10 @@ FILES:${PN}-qcom-sm8450-audio-tplg = "${firmwaredir}/qcom/sm8450/*tplg.bin*"
 FILES:${PN}-qcom-sm8550-adreno = "${firmwaredir}/qcom/sm8550/a740_zap.mbn*"
 FILES:${PN}-qcom-sm8550-audio-tplg = "${firmwaredir}/qcom/sm8550/*tplg.bin*"
 FILES:${PN}-qcom-sm8650-adreno = "${firmwaredir}/qcom/sm8650/gen70900_zap.mbn*"
-FILES:${PN}-qcom-sm8650-audio-tplg = "${firmwaredir}/qcom/sm8650/*tplg.bin*"
+FILES:${PN}-qcom-sm8650-audio-tplg = " \
+    ${firmwaredir}/qcom/sm8650/*tplg.bin* \
+    ${firmwaredir}/qcom/sm8650/ayaneo/ps2/SM8650-APS2-tplg.bin* \
+"
 FILES:${PN}-qcom-sm8750-adreno = "${firmwaredir}/qcom/sm8750/gen80000_zap.mbn*"
 FILES:${PN}-qcom-sm8750-audio = "${firmwaredir}/qcom/sm8750/adsp*.* ${firmwaredir}/qcom/sm8750/*tplg.bin*"
 FILES:${PN}-qcom-sm8750-compute = "${firmwaredir}/qcom/sm8750/cdsp*.*"
@@ -2613,6 +2633,7 @@ FILES:${PN}-qcom-x1e80100-audio = " \
     ${firmwaredir}/qcom/x1e80100/X1E001DE-DEVKIT-tplg.bin* \
     ${firmwaredir}/qcom/x1e80100/X1E80100-CRD-tplg.bin* \
     ${firmwaredir}/qcom/x1e80100/X1E80100-EVK-tplg.bin* \
+    ${firmwaredir}/qcom/x1e80100/X1P42100-Microsoft-Surface-Pro-12in-tplg.bin* \
     ${firmwaredir}/qcom/x1e80100/X1E80100-Romulus-tplg.bin* \
     ${firmwaredir}/qcom/x1e80100/X1E80100-TUXEDO-Elite-14-tplg.bin* \
 "
@@ -2686,6 +2707,7 @@ RDEPENDS:${PN}-qcom-adreno-a740 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g705 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g709 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g715 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g717 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g800 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g801 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g802 = "${PN}-qcom-license"
@@ -2694,9 +2716,11 @@ RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-eliza-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-glymur-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-glymur-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-hawi-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
@@ -2805,6 +2829,9 @@ FILES:${PN}-liquidio = "${firmwaredir}/liquidio"
 LICENSE:${PN}-mellanox = "LicenseRef-Firmware-WHENCE"
 FILES:${PN}-mellanox = "${firmwaredir}/mellanox"
 
+LICENSE:${PN}-mm8108 = "LicenseRef-Firmware-morsemicro"
+FILES:${PN}-mm8108 = "${firmwaredir}/morsemicro/mm81x/v56/*"
+
 LICENSE:${PN}-prestera = "LicenseRef-Firmware-Marvell"
 FILES:${PN}-prestera = "${firmwaredir}/mrvl/prestera"
 RDEPENDS:${PN}-prestera = "${PN}-marvell-license"
@@ -2949,7 +2976,10 @@ LICENSE:${PN}-amd-sev-license = "LicenseRef-Firmware-amd-sev"
 FILES:${PN}-amd-sev-license = "${firmwaredir}/LICENSE.amd-sev"
 
 LICENSE:${PN}-ccp = "LicenseRef-Firmware-amd-sev"
-FILES:${PN}-ccp = "${firmwaredir}/amd/amd_sev*"
+FILES:${PN}-ccp = " \
+    ${firmwaredir}/amd/amd_sev* \
+    ${firmwaredir}/amd/README* \
+"
 RDEPENDS:${PN}-ccp = "${PN}-amd-sev-license"
 
 # For amdxdna - AMD Inference processor
@@ -3592,6 +3622,7 @@ LICENSE:${PN} = "\
     AND LicenseRef-Firmware-mellanox \
     AND LicenseRef-Firmware-mga \
     AND LicenseRef-Firmware-montage \
+    AND LicenseRef-Firmware-morsemicro \
     AND LicenseRef-Firmware-moxa \
     AND LicenseRef-Firmware-myri10ge-firmware \
     AND LicenseRef-Firmware-nvidia \
-- 
2.34.1


