Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D2FC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:04:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34738.1789113868829064712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 01:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y5zw9Jsh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7ktkm3513976
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QZO/bOylPZhlmv/+w0IYNL
	b87yAxwuUelzeIfdG6vxQ=; b=Y5zw9JshoNVlrwphu+/vIYwsIZXV1RdSnxMN3d
	DH/RnqhAG5R6tLQJbI/jP5oQOyONxvG6raz4TnWGvm928aOqoQZdBXL2kdAqX24T
	U+BIr8DEkK36PdNfKO4Nxq+4iWOX7k8dVDwB6mjjlezAwV2chYogp01AZF7KHql3
	PAIsJW67K/c8VnSNEMU1mtaM2cwGAOLT3Xih6WypfKUTlitCzkm7Ozuv0OnjpbS3
	HXgF9wDbHcqli1goKDfg23s23KPuf6O9+J2ILekesHceRBIH3Pv20ls4C/Q+jdjh
	XatDmqufGjW2SXVGO3w5E+d5KgJNsEgY+sU31tvmN7i0FRTw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd50kvf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:04:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 68B84RUJ2114528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:04:27 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 01:04:25 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20260810 -> 20260910
Date: Fri, 11 Sep 2026 13:33:35 +0530
Message-ID: <20260911080335.1114208-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-GUID: MMlaCSNGBtQcSyqP-vX9LaBuw9--oUOC
X-Proofpoint-ORIG-GUID: MMlaCSNGBtQcSyqP-vX9LaBuw9--oUOC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMSBTYWx0ZWRfX2ngCl2QIRD3z
 dh6qriK8+VlPdRCVaWN5WwdstYtU5ZuMRNqkx59nqDMNAL5vKxABhjJ4MGXOXUUm79u6rTg+uZN
 bG6umaizRvr6/vX4K1CmFM/Sp8EbbaU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMSBTYWx0ZWRfXxunX6NKZHj11
 W/ecw3H6s8TtrhcuX5n75pa/RqTniUWzh5Z+AJ7j0nhf70WbOAR1YH4+Gojp00WAE3YQRYyVGHP
 uOPRcOrIiRDa8C9QkYvYw5AuRz+JMFra3BCgIDMFE462Jqh1sE0cSWHeKn80EClciDQ1K3PZHFY
 10vDREMS4G0yri3lxLG84LAWKncp/2+R9VtxH8rqwq17/h1DiZtr7sQ5gsApEUMuvxgrEhH/PAa
 7da6HtvAi/g3WPzVVcUaT4VUaC0oHhz+czQdadG7nIAE5gjuKIL/fvRqBTabYoiazKTPs/jtqcP
 wZ2dnRBNVb/TLX6MUbmH9/gI584m9mTRbJFDm1Rxw2KfcvRKWuVpin+xZSbszuPJ1R2BqwBh5aS
 g1WsQWMqzzQlpRrAi+ZnPFtVgVDJRPgCoy+FWWb6qsL84Y4JEhUBvZ9w74xmeifBoQiZiWBEFKh
 X5GsHXkTtnLohyiQhwQ==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3b60b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tjeyOLk16LoTeUmleL0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245618

Upgrade the firmware package to latest release. Add firmware
for tas2573 stereo, add Bluetooth firmware for WCN7850 and WCN7750,
add CS42L45 SDCA codec firmware for Samsung laptops. Add audio,
compute and qupv3 firmware for Qualcomm Nord Platform, add compute
firmware for Qualcomm Eliza Platform. Add ADSP firmware for Radxa
Dragon Q8B and add GPU firmware for SHIFT6mq. Add 'primer' files to
cirrus CS42L45 as they are common to all SKUs.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260810.bb => linux-firmware_20260910.bb} | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260810.bb => linux-firmware_20260910.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
index 2a0d3980b7..16e23920bd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
@@ -277,7 +277,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "de47d58e10797eae2ccc753ab8d69bd7"
+WHENCE_CHKSUM  = "fe7960bbe2eb0922168c3434c8d125d0"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -416,7 +416,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "ac17c34fe73756926a961fbafadf8d8f07a3bd2dd2f4ea31a0fb5d50c714a49a"
+SRC_URI[sha256sum] = "f3937ca282ba256242e2b6dbe523df8a80007d29ffd61f56d270190865492ea8"
 
 inherit allarch
 
@@ -622,6 +622,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
              ${PN}-qca-wcn685x \
+             ${PN}-qca-wcn7750 \
              ${PN}-qca-wcn7850 \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
@@ -693,11 +694,12 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-g800 ${PN}-qcom-adreno-g801 ${PN}-qcom-adreno-g802 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
-             ${PN}-qcom-eliza-adreno \
+             ${PN}-qcom-eliza-adreno ${PN}-qcom-eliza-compute \
              ${PN}-qcom-glymur-adreno ${PN}-qcom-glymur-audio ${PN}-qcom-glymur-compute \
              ${PN}-qcom-hawi-audio \
              ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-audio \
              ${PN}-qcom-kaanapali-compute ${PN}-qcom-kaanapali-soccp \
+             ${PN}-qcom-nord-audio ${PN}-qcom-nord-compute ${PN}-qcom-nord-qupv3fw \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
@@ -717,6 +719,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
+             ${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
@@ -942,6 +945,7 @@ LICENSE:${PN}-qca-wcn3988 = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "LicenseRef-Firmware-qualcommAthos-ath10k"
 LICENSE:${PN}-qca-wcn6750 = "LicenseRef-Firmware-qualcommAthos-ath10k"
 LICENSE:${PN}-qca-wcn685x = "LicenseRef-Firmware-qualcommAthos-ath10k"
+LICENSE:${PN}-qca-wcn7750 = "LicenseRef-Firmware-qualcommAthos-ath10k"
 LICENSE:${PN}-qca-wcn7850 = "LicenseRef-Firmware-qcom"
 
 FILES:${PN}-ar3k-license = "${firmwaredir}/LICENSE.QualcommAtheros_ar3k"
@@ -1078,10 +1082,17 @@ FILES:${PN}-qca-wcn685x = " \
   ${firmwaredir}/qca/wcnhpnv21.b* \
   ${firmwaredir}/qca/wcnhpnv21g.b* \
 "
+FILES:${PN}-qca-wcn7750 = " \
+  ${firmwaredir}/qca/ornbcscal10.bin* \
+  ${firmwaredir}/qca/ornbtfw10.tlv* \
+  ${firmwaredir}/qca/ornnv10.bin* \
+"
 FILES:${PN}-qca-wcn7850 = " \
   ${firmwaredir}/qca/hmtbtfw20.tlv* \
   ${firmwaredir}/qca/hmtnv20.b10f* \
   ${firmwaredir}/qca/hmtnv20.b112* \
+  ${firmwaredir}/qca/hmtnv20.b201* \
+  ${firmwaredir}/qca/hmtnv20.b202* \
   ${firmwaredir}/qca/hmtnv20.bin* \
 "
 ALLOW_EMPTY:${PN}-qca = "1"
@@ -1124,6 +1135,7 @@ RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn685x += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn7750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
 # For ralink
 LICENSE:${PN}-ralink = "LicenseRef-Firmware-ralink-firmware"
@@ -1833,6 +1845,7 @@ FILES:${PN}-ti-tas257x = "\
     ${firmwaredir}/tas2572-2-1amp-reg.bin* \
     ${firmwaredir}/tas2572-3amp-reg.bin* \
     ${firmwaredir}/tas2572-3-1amp-reg.bin* \
+    ${firmwaredir}/tas2573-2amp-reg.bin* \
     ${firmwaredir}/ti/audio/tas257x/* \
 "
 RDEPENDS:${PN}-ti-tas257x = "${PN}-ti-tspa-license"
@@ -2120,7 +2133,9 @@ FILES:${PN}-cirrus = " \
     ${firmwaredir}/cirrus/* \
 "
 FILES:${PN}-cirrus-cs42l45 = " \
+    ${firmwaredir}/sdca/1fa/cs42l45_primer*.bin* \
     ${firmwaredir}/sdca/1fa/1028/* \
+    ${firmwaredir}/sdca/1fa/144d/* \
     ${firmwaredir}/sdca/1fa/17aa/* \
 "
 FILES:${PN}-cirrus-license = "${firmwaredir}/LICENSE.cirrus"
@@ -2384,6 +2399,7 @@ LICENSE:${PN}-qcom-apq8096-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-eliza-adreno = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-eliza-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-glymur-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-glymur-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-glymur-compute = "LicenseRef-Firmware-qcom-2"
@@ -2392,6 +2408,9 @@ LICENSE:${PN}-qcom-kaanapali-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-kaanapali-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-soccp = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-nord-audio = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-nord-compute = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-nord-qupv3fw = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "LicenseRef-Firmware-qcom"
@@ -2429,6 +2448,7 @@ LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "LicenseRef-Firmware-qcom"
@@ -2523,6 +2543,7 @@ FILES:${PN}-qcom-apq8096-adreno = "${firmwaredir}/qcom/apq8096/a530_zap.mbn* ${f
 FILES:${PN}-qcom-apq8096-audio = "${firmwaredir}/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${firmwaredir}/qcom/apq8096/mba.mbn* ${firmwaredir}/qcom/apq8096/modem*.* ${firmwaredir}/qcom/apq8096/wlanmdsp.mbn*"
 FILES:${PN}-qcom-eliza-adreno = "${firmwaredir}/qcom/eliza/gen71700_zap.mbn*"
+FILES:${PN}-qcom-eliza-compute = "${firmwaredir}/qcom/eliza/cdsp*.*"
 FILES:${PN}-qcom-glymur-adreno = "${firmwaredir}/qcom/glymur/gen80100_zap.mbn*"
 FILES:${PN}-qcom-glymur-audio = " \
     ${firmwaredir}/qcom/glymur/adsp*.* \
@@ -2537,6 +2558,9 @@ FILES:${PN}-qcom-kaanapali-audio = " \
 "
 FILES:${PN}-qcom-kaanapali-compute = "${firmwaredir}/qcom/kaanapali/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-soccp = "${firmwaredir}/qcom/kaanapali/soccp*.*"
+FILES:${PN}-qcom-nord-audio = "${firmwaredir}/qcom/nord/adsp*.*"
+FILES:${PN}-qcom-nord-compute = "${firmwaredir}/qcom/nord/cdsp*.*"
+FILES:${PN}-qcom-nord-qupv3fw = "${firmwaredir}/qcom/nord/qupv3fw.elf*"
 FILES:${PN}-qcom-qcm2290-adreno = "${firmwaredir}/qcom/qcm2290/a702_zap.mbn*"
 FILES:${PN}-qcom-qcm2290-audio = "${firmwaredir}/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${firmwaredir}/qcom/qcm2290/modem*.*"
@@ -2599,7 +2623,8 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${firmwaredir}/qcom/sc8280xp/LEN
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
-FILES:${PN}-qcom-sdm845-adreno = "${firmwaredir}/qcom/sdm845/a630*.*"
+FILES:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "${firmwaredir}/qcom/sc8280xp/radxa/dragon-q8b/qcadsp8280.mbn*"
+FILES:${PN}-qcom-sdm845-adreno = "${firmwaredir}/qcom/sdm845/a630*.* ${firmwaredir}/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn*"
 FILES:${PN}-qcom-sdm845-audio = "${firmwaredir}/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${firmwaredir}/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwaredir}/qcom/sdm845/modem*.* ${firmwaredir}/qcom/sdm845/wlanmdsp.mbn* ${firmwaredir}/qcom/sdm845/notice.txt_wlanmdsp* \
@@ -2721,6 +2746,7 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-eliza-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-eliza-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-glymur-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-glymur-compute = "${PN}-qcom-2-license"
@@ -2729,6 +2755,9 @@ RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-nord-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-nord-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-nord-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
@@ -2772,6 +2801,7 @@ RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
-- 
2.34.1


