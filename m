Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE7FCFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 05:10:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9358.1764306628784521863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 21:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=i2Y7tNMK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARLXAcf2069409
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1y6PGpo7e8IYWCeJULaso5
	1YSmzYeC4rDy38hKFsrXo=; b=i2Y7tNMKOxnJtHLLtP5OlGshrEMMRP3PXq54zs
	/i+fj/r9M9glm7/ssR81W0H7R06TqP8E/8iks3CUG/976V0Vf+O+L7zkqDOt5q7M
	8iVYm9g0UXUxhk0Urvkg0EFZ8AU/qB2CAEkdeRYZ8iPD4SsibKGHrMlPUzOORDAb
	xiTn9SwJlVkfx+TuUov39xVYUFkH9AZBu1qD36VC+QT6939gNjqnrijBMmlyMaC7
	HhZ4SU0H4m/xbEgTw7Ma6xTTLaKAxxNOGpR50tWeJqzZSO+GxhkATLr6ZNx3Vmk8
	fv3qZbtvgi/7Sk62h520kCJh+47z66PZjvFVeSlzOekiU+Vg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66hqx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:10:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AS5AQG4019255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:10:26 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 27 Nov 2025 21:10:24 -0800
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] linux-firmware: upgrade 20251111 -> 20251125
Date: Fri, 28 Nov 2025 10:39:53 +0530
Message-ID: <20251128050953.3619530-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IZbFxYsibqHTTeYY2O59mbwzQhOWEtY_
X-Proofpoint-ORIG-GUID: IZbFxYsibqHTTeYY2O59mbwzQhOWEtY_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfX8YXwvTodeWAC
 V3QL871+oWbwJmfOOox+sAVETFUzyiOYzti7eoYqGCHHIu2QH2wYhR1RJKXGGphQGFZvxOK3Q+u
 lAQCZGmpPtG+wQ6regRQ92TLAPbJ3CEatQMQN8PpH5C0FWrU65pFjNqL9ZbVn/2Cj/etFi2hJB2
 MwtUZHjyqEo96ehDhPqgslyl3vM0lClUPjHZ4z9QlbVI3wSXwXI4BJS+BfRyzy4+hn4XyDsUJR1
 pX5UIjskPrPCg5XZjmZOOikjkS9BlijK5WZylfKjzPJnzAHTvwXYy7nhBjOv7QKgjiF0Ylh1gDk
 OpVSrU5Nd1SJy611cKZjLyPoNA/vwdS8NDdwtcIypTLf+cIn1QQ3wz9wkIvJ66zl1ZjYwUU21Fl
 p9H2oLEPJ1M2ssu0cJVR3b84eZZs4Q==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=69292ec3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=9X9ImwZYMava_XIyiIkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226882

Upgrade the firmware package to latest release. Add CS42L45 SDCA
codec firmware for dell laptops, and some several Qualcomm packages.
Update license for Qualcomm kaanapali packages, update order of
${PN}-qcom-sm8350-adreno alphabetically.

License-Update: new and updated firmware

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20251111.bb => linux-firmware_20251125.bb} | 55 ++++++++++++++-----
 1 file changed, 40 insertions(+), 15 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251111.bb => linux-firmware_20251125.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
index eda42cf855..ff84a3c464 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
@@ -312,7 +312,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "4a2863b38b43abbc3a09b24ece7d1196"
+WHENCE_CHKSUM  = "fc952a29d75c7b9a0c620bf1e7232d35"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -449,7 +449,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "ab57a1526595090bb4874c35335e2252288dcbea546eff491654b2313438a47d"
+SRC_URI[sha256sum] = "eb807a01c52882ac97ef5b678d4a246b209e6165ac1287d62a5f93a09ee93cd2"
 
 inherit allarch
 
@@ -603,7 +603,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
              ${PN}-bcm54591 \
-             ${PN}-cirrus-license ${PN}-cirrus \
+             ${PN}-cirrus-license ${PN}-cirrus ${PN}-cirrus-cs42l45 \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
@@ -641,6 +641,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
+             ${PN}-qca-wcn685x \
              ${PN}-qca-qca2066 \
              ${PN}-qca-wcn7850 \
              \
@@ -715,6 +716,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
              ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
              ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio \
+             ${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
              ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
              ${PN}-qcom-qrb4210-adreno \
@@ -729,12 +731,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
-             ${PN}-qcom-sdx61-foxconn-firehose \
+             ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
+             ${PN}-qcom-sm8350-adreno \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
-             ${PN}-qcom-sm8350-adreno \
+             ${PN}-qcom-sm8750-audio ${PN}-qcom-sm8750-compute \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
@@ -931,6 +934,7 @@ LICENSE:${PN}-qca-wcn3950 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn685x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
 
@@ -1018,6 +1022,11 @@ FILES:${PN}-qca-wcn6750 = " \
   ${nonarch_base_libdir}/firmware/qca/msnv11.b0a* \
   ${nonarch_base_libdir}/firmware/qca/msnv11.b09* \
 "
+FILES:${PN}-qca-wcn685x = " \
+  ${nonarch_base_libdir}/firmware/qca/wcnhpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b* \
+  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b* \
+"
 FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
@@ -1094,6 +1103,7 @@ RDEPENDS:${PN}-qca-wcn3950 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn685x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
 # For ralink
@@ -2019,15 +2029,18 @@ RDEPENDS:${PN}-bnx2x += "${PN}-whence-license"
 
 # For cirrus
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
+LICENSE:${PN}-cirrus-cs42l45 = "Firmware-cirrus"
 LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
 
 FILES:${PN}-cirrus = " \
     ${nonarch_base_libdir}/firmware/cs42l43.bin* \
     ${nonarch_base_libdir}/firmware/cirrus/* \
 "
+FILES:${PN}-cirrus-cs42l45 = "${nonarch_base_libdir}/firmware/sdca/1fa/1028/*"
 FILES:${PN}-cirrus-license = "${nonarch_base_libdir}/firmware/LICENSE.cirrus"
 
 RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
+RDEPENDS:${PN}-cirrus-cs42l45 += "${PN}-cirrus-license"
 
 # For cnm
 LICENSE:${PN}-cnm = "Firmware-cnm"
@@ -2275,9 +2288,9 @@ LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom"
-LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom"
-LICENSE:${PN}-qcom-kaanapali-soccp = "Firmware-qcom"
+LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-kaanapali-soccp = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
@@ -2292,6 +2305,7 @@ LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "Firmware-qcom & Firmware-linaro"
+LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
@@ -2317,14 +2331,17 @@ LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "Firmware-qcom"
-LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
-LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8750-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sm8750-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
@@ -2395,6 +2412,7 @@ FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
     "
+FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.*"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
@@ -2426,14 +2444,17 @@ FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/c
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp* \
                                  ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
+FILES:${PN}-qcom-sdx35-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
 FILES:${PN}-qcom-sdx61-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
+FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
-FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
+FILES:${PN}-qcom-sm8750-audio = "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.*"
+FILES:${PN}-qcom-sm8750-compute = "${nonarch_base_libdir}/firmware/qcom/sm8750/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* \
@@ -2480,9 +2501,9 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
@@ -2501,6 +2522,7 @@ RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
@@ -2528,14 +2550,17 @@ RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
-RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8750-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sm8750-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"
-- 
2.34.1


