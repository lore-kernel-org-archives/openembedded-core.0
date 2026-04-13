Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A58F531CA
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 19:27:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.968.1776108467627650314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 12:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y7tWIFIU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DINxaA2186578
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 19:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NZ+Mvje7WHITBiDr7gp4/C
	38EfG9+/AI644F4APJPxE=; b=Y7tWIFIU32xb24OyboaO0dJE6CjsvnRUk/MTSy
	QVz/tFTwf3q7BapciobYRZbjajDNrwU41vwzrjPSP0Nb+3Rnp1RTKz8pGNmhZoLt
	j90+0AbKUpkVxj/tct+Lt6ZQVaxieb4jlo1+yvmZJSCM6sX4/tL0i6e3qYI85wCz
	9bNlasZrDHF5/7bffBXohSnWyaG8zOQW5wrIPKVdMOgV87a+woJbltHurSPFvlT6
	CirS8NAMbnEwuFokyjFh/TqoUx938T5vyEkffMNcckghOzQHkFse698NHL3zLlVY
	vAzHCitniPpjavb2SE74I7q8mK26pK+5Ig6ijrBAjc5lhXcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hhj9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 19:27:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 63DJRkAO000349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 19:27:46 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Apr 2026 12:27:44 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20260309 -> 20260410
Date: Tue, 14 Apr 2026 00:57:30 +0530
Message-ID: <20260413192730.3533490-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: wZ3wPlNWV3XcjakbG7-ANiEoeoGW3khV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE5MSBTYWx0ZWRfXy0heuwD/+1vM
 FJik7oK5ZjlslFRcDzPcUfKYUeo4iVgOpTlSi/8tYbz/m+zzF+qVFi2/LPJjxQT8qdliaRFyOno
 pKwns0qVt86SVJ46PYSwF64qDL2SuEK7YfzFOUuY5j+fDsoHSwEaAP/8GzN+yQlE520I5k8cuwX
 v5We4N0VV8T25RjZaR0SrUfRo1rTSvB2AKFzSwNDfOiS81wT4lcn0se7866DsvAvYrrxvapPTfC
 ovb73BsFozxnAcDmNxWtVRp5J7PlRVEDiwhb0+dr9PQfjKng2o7ocroS0YvSBWy8L5ufH5KJgBT
 C/IfsZc3g5wnfPbQqoZ8bK3TQWVZkc3DJL1+BcGGHxZNV6g9PZrBU3JLc2igGrQr5ozfz4RGRU4
 laMKPZ64FzgGKvpkxEu9mN7VRw1R+dn6gFPK8xiQNy8Uv/nixo9A4PvRa9woUfxqjhXRIYfNUSo
 0OO0sYLcwwzZx4uNjnw==
X-Proofpoint-GUID: wZ3wPlNWV3XcjakbG7-ANiEoeoGW3khV
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dd43b3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tslR33AQg_xhmBUqG40A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 19:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235119

Upgrade the firmware package to latest release. Add qupv3fw
firmware for qcs615 and shikra, add adreno, audio and compute
package for DELL XPS13 9345, add audioreach firmware for Glymur
and arduno monza, add ISH firmware for Intel Wildcat Lake platform,
add lenovo ish firmware for X9-15 2025, X1 Carbon (Gen 14) and
X1 2-in-1 (Gen 11).

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260309.bb => linux-firmware_20260410.bb} | 59 ++++++++++++++++---
 1 file changed, 50 insertions(+), 9 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260309.bb => linux-firmware_20260410.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
index 42681a879f..54c2c45261 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
@@ -314,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "772c8667ff568e7de3a7794fd420f2f7"
+WHENCE_CHKSUM  = "1468492365c9cec2e7ebf71c79d2e8f5"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -452,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c"
+SRC_URI[sha256sum] = "b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178"
 
 inherit allarch
 
@@ -720,8 +720,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
-             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
+             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute ${PN}-qcom-qcs615-qupv3fw \
              ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio ${PN}-qcom-qcs6490-radxa-dragon-q6a-compute \
+             ${PN}-qcom-shikra-qupv3fw \
              ${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
              ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
@@ -751,7 +752,10 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg \
              ${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg \
              ${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg \
+             ${PN}-qcom-x1e80100-dell-xps13-9345-adreno \
+             ${PN}-qcom-x1e80100-dell-xps13-9345-audio \
              ${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg \
+             ${PN}-qcom-x1e80100-dell-xps13-9345-compute \
              ${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
@@ -773,8 +777,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-intel-license ${PN}-ish-lnlm \
              ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \
              ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
-             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad \
-             ${PN}-ish-ptl \
+             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad  ${PN}-ish-ptl-53c4ffad \
+             ${PN}-ish-ptl ${PN}-ish-wcl \
              ${PN}-advansys-license ${PN}-advansys \
              ${PN}-aeonsemi-license ${PN}-as21xxx \
              ${PN}-agere-license ${PN}-orinoco \
@@ -2330,7 +2334,7 @@ LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-glymur-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-glymur-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-glymur-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-glymur-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom-2 & Firmware-linaro"
@@ -2349,8 +2353,10 @@ LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs615-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-shikra-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
@@ -2402,7 +2408,10 @@ LICENSE:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "Firmware-dell"
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio = "Firmware-dell"
 LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "Firmware-dell"
 LICENSE:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
@@ -2458,7 +2467,10 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
 FILES:${PN}-qcom-glymur-adreno = "${nonarch_base_libdir}/firmware/qcom/glymur/gen80100_zap.mbn*"
-FILES:${PN}-qcom-glymur-audio = "${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.*"
+FILES:${PN}-qcom-glymur-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/glymur/GLYMUR-CRD-tplg.bin* \
+"
 FILES:${PN}-qcom-glymur-compute = "${nonarch_base_libdir}/firmware/qcom/glymur/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
 FILES:${PN}-qcom-kaanapali-audio = " \
@@ -2485,6 +2497,7 @@ FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs615/TALOS-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
+FILES:${PN}-qcom-qcs615-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs615/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
@@ -2493,13 +2506,18 @@ FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
 FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = " \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp*.* \
 "
+FILES:${PN}-qcom-shikra-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/shikra/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.* \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
 "
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
-FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
+FILES:${PN}-qcom-qcs8300-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs8300/arduino-monza-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin* \
+"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
 FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
 FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
@@ -2577,10 +2595,16 @@ FILES:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/latitude-7455/X1E80100-Dell-Latitude-7455-tplg.bin* \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Latitude-7455-tplg.bin* \
 "
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/battmgr.jsn* \
+"
 FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/X1E80100-Dell-XPS-13-9345-tplg.bin* \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-XPS-13-9345-tplg.bin* \
 "
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*cdsp*.*"
 FILES:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
@@ -2631,7 +2655,7 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-glymur-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-glymur-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
@@ -2654,8 +2678,10 @@ RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-shikra-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
@@ -2709,7 +2735,10 @@ RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "${PN}-linaro-licens
 RDEPENDS:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "${PN}-dell-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio = "${PN}-dell-license"
 RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "${PN}-dell-license"
 RDEPENDS:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
@@ -2801,14 +2830,26 @@ LICENSE:${PN}-ish-lnlm-53c4ffad = "Firmware-lenovo"
 FILES:${PN}-ish-lnlm-53c4ffad = "\
     ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
     ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5.8.4.7720.bin* \
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_x9-15_2025_5.8.0.7720.bin* \
     ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-53c4ffad = "${PN}-lenovo-license"
 
+LICENSE:${PN}-ish-ptl-53c4ffad = "Firmware-lenovo"
+FILES:${PN}-ish-ptl-53c4ffad = "\
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_53c4ffad_*.bin* \
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin* \
+"
+RDEPENDS:${PN}-ish-ptl-53c4ffad = "${PN}-lenovo-license"
+
 LICENSE:${PN}-ish-ptl = "Firmware-intel"
 FILES:${PN}-ish-ptl = "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
 RDEPENDS:${PN}-ish-ptl = "${PN}-intel-license"
 
+LICENSE:${PN}-ish-wcl = "Firmware-intel"
+FILES:${PN}-ish-wcl = "${nonarch_base_libdir}/firmware/intel/ish/ish_wcl.bin*"
+RDEPENDS:${PN}-ish-wcl = "${PN}-intel-license"
+
 # For advansys - AdvanSys SCSI
 LICENSE:${PN}-advansys-license = "Firmware-advansys"
 FILES:${PN}-advansys-license = "${nonarch_base_libdir}/firmware/LICENCE.advansys"
-- 
2.34.1


