Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF98DC88E66
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:21:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18713.1789388475817705528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OkZXp+MO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6LO3291510
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lx8UG6GqKlRrClXezyq4Yo
	/r4v+xWG+6l55rOJ9Gch0=; b=OkZXp+MOPVnUad5aUWkYVc04tRkVajMKfD7GCd
	/HI4O7e0jTAUbQ2VKbrFEmttLLb3ausPCLhTBiu1RtJpPioz397RMbXGf7wA6r3j
	84wM02GKbWpl+2ujcYIN7F+LxWEvo8O11eiHW3lndoe6sgWxGP57pnc3YR/Vvr5k
	qCQyH+y+ZskjiChyobG6z/F/ushYeqf6lEoCi4bRFQZuUaPj6K2++9+w10zM5Qbd
	WvfnoqEuBoNQdSu6EefJbrhZPrWTdfeNM5hc42o8lZGWv4qRSXEASoS+Yfw8yYNj
	lXjrNhXPE1vfGnkF+EkYURGWfykEfCm+eiNEq4Ys0B62CobQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8jbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:21:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 68ECLEjO1379686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:21:14 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 05:21:12 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] linux-firmware: upgrade 20260810 -> 20260910
Date: Mon, 14 Sep 2026 17:50:58 +0530
Message-ID: <20260914122058.3128961-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7e6ba cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=jpfudPgQk0bfl78LqagA:9
X-Proofpoint-GUID: 51WsCi26jnbO54-8E7xFtzzooT3gCfxy
X-Proofpoint-ORIG-GUID: 51WsCi26jnbO54-8E7xFtzzooT3gCfxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfXxu1ohaN20IPE
 loAJsvy7hU9ohGNmmKiqMbD9KXwY3ouCtMuIH7B9Ofwww64OJ9GQGV8IG/veQt8PfJDkw5keosg
 vCixrjndl3m3FiacuJgQoKCP46pGEYJ2JQf7NgwZ8ElUn33H6lXgNBYv7NY/yka5g4zDc22xKlE
 kGVeqB3GMR9xxrUe0oTJNwFSzzOMz5FwyEZDPJb499W45K08hXwfDHtvUeBHGUJy18mhTSsvMRn
 aZxeZP5ALbExscoQyZUCLFo/O2rWmd9vso8KPBvQEAiGncaKLVO9dyxd1UWmDrMTiqweaz9T67o
 kmEqxzWe7Z1ocAOki3gspclXZOtCefSWcEKIru80hQSO6QI4j/x0RW3YlLiUPbv/4HwYHx0094s
 FPpoWuL6SJdVxvzY3jLd/oj4QjfyvoxYbrDwNibqFUmxQ+U4l6s//UFC9BKsJrJ28BruhVWgNvR
 b/UpV6Xr+/e3VzuAfvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX3XcWOFsclf7O
 X1qnWUSKkwf8Idi22GJVJl3wYL7XWdHjDP5R+DfkdtmVXZ6tdlDqZmhSUCQnVZNBfFzghXLJj/i
 S+0tbgQfh4mwPq6zJgFl49YiMz9fdhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245778

Upgrade the firmware package to latest release. Add firmware
for tas2573 stereo, add Bluetooth firmware for WCN7850, add CS42L45
SDCA codec firmware for Samsung laptops. Add audio, compute and qupv3
firmware for Qualcomm Nord Platform, add compute firmware for Qualcomm
Eliza Platform. Add ADSP firmware for Radxa Dragon Q8B and add GPU
firmware for SHIFT6mq. Add 'primer' files to cirrus CS42L45 as they
are common to all SKUs.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260810.bb => linux-firmware_20260910.bb} | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260810.bb => linux-firmware_20260910.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
index 2a0d3980b7..3fc59a12a6 100644
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
 
@@ -693,11 +693,12 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
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
@@ -717,8 +718,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
+             ${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
-             ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
+             ${PN}-qcom-sdm845-shift6mq-adreno ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
              ${PN}-qcom-shikra-adreno ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-audio \
              ${PN}-qcom-shikra-modem ${PN}-qcom-shikra-qupv3fw \
@@ -1039,8 +1041,11 @@ FILES:${PN}-qca-qca6698 = " \
   ${firmwaredir}/qca/QCA6698/hpnv21.bin* \
 "
 FILES:${PN}-qca-qcc2072 = " \
+  ${firmwaredir}/qca/ornbcscal10.bin* \
   ${firmwaredir}/qca/ornbcscal11.bin* \
+  ${firmwaredir}/qca/ornbtfw10.tlv* \
   ${firmwaredir}/qca/ornbtfw11.tlv* \
+  ${firmwaredir}/qca/ornnv10.bin* \
   ${firmwaredir}/qca/ornnv11.bin* \
 "
 FILES:${PN}-qca-wcn3950 = " \
@@ -1082,6 +1087,8 @@ FILES:${PN}-qca-wcn7850 = " \
   ${firmwaredir}/qca/hmtbtfw20.tlv* \
   ${firmwaredir}/qca/hmtnv20.b10f* \
   ${firmwaredir}/qca/hmtnv20.b112* \
+  ${firmwaredir}/qca/hmtnv20.b201* \
+  ${firmwaredir}/qca/hmtnv20.b202* \
   ${firmwaredir}/qca/hmtnv20.bin* \
 "
 ALLOW_EMPTY:${PN}-qca = "1"
@@ -1833,6 +1840,7 @@ FILES:${PN}-ti-tas257x = "\
     ${firmwaredir}/tas2572-2-1amp-reg.bin* \
     ${firmwaredir}/tas2572-3amp-reg.bin* \
     ${firmwaredir}/tas2572-3-1amp-reg.bin* \
+    ${firmwaredir}/tas2573-2amp-reg.bin* \
     ${firmwaredir}/ti/audio/tas257x/* \
 "
 RDEPENDS:${PN}-ti-tas257x = "${PN}-ti-tspa-license"
@@ -2120,7 +2128,9 @@ FILES:${PN}-cirrus = " \
     ${firmwaredir}/cirrus/* \
 "
 FILES:${PN}-cirrus-cs42l45 = " \
+    ${firmwaredir}/sdca/1fa/cs42l45_primer*.bin* \
     ${firmwaredir}/sdca/1fa/1028/* \
+    ${firmwaredir}/sdca/1fa/144d/* \
     ${firmwaredir}/sdca/1fa/17aa/* \
 "
 FILES:${PN}-cirrus-license = "${firmwaredir}/LICENSE.cirrus"
@@ -2384,6 +2394,7 @@ LICENSE:${PN}-qcom-apq8096-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-eliza-adreno = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-eliza-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-glymur-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-glymur-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-glymur-compute = "LicenseRef-Firmware-qcom-2"
@@ -2392,6 +2403,9 @@ LICENSE:${PN}-qcom-kaanapali-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-kaanapali-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-soccp = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-nord-audio = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-nord-compute = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-nord-qupv3fw = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "LicenseRef-Firmware-qcom"
@@ -2429,10 +2443,12 @@ LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-audio = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-shift6mq-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "LicenseRef-Firmware-qcom"
@@ -2523,6 +2539,7 @@ FILES:${PN}-qcom-apq8096-adreno = "${firmwaredir}/qcom/apq8096/a530_zap.mbn* ${f
 FILES:${PN}-qcom-apq8096-audio = "${firmwaredir}/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${firmwaredir}/qcom/apq8096/mba.mbn* ${firmwaredir}/qcom/apq8096/modem*.* ${firmwaredir}/qcom/apq8096/wlanmdsp.mbn*"
 FILES:${PN}-qcom-eliza-adreno = "${firmwaredir}/qcom/eliza/gen71700_zap.mbn*"
+FILES:${PN}-qcom-eliza-compute = "${firmwaredir}/qcom/eliza/cdsp*.*"
 FILES:${PN}-qcom-glymur-adreno = "${firmwaredir}/qcom/glymur/gen80100_zap.mbn*"
 FILES:${PN}-qcom-glymur-audio = " \
     ${firmwaredir}/qcom/glymur/adsp*.* \
@@ -2537,6 +2554,9 @@ FILES:${PN}-qcom-kaanapali-audio = " \
 "
 FILES:${PN}-qcom-kaanapali-compute = "${firmwaredir}/qcom/kaanapali/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-soccp = "${firmwaredir}/qcom/kaanapali/soccp*.*"
+FILES:${PN}-qcom-nord-audio = "${firmwaredir}/qcom/nord/adsp*.*"
+FILES:${PN}-qcom-nord-compute = "${firmwaredir}/qcom/nord/cdsp*.*"
+FILES:${PN}-qcom-nord-qupv3fw = "${firmwaredir}/qcom/nord/qupv3fw.elf*"
 FILES:${PN}-qcom-qcm2290-adreno = "${firmwaredir}/qcom/qcm2290/a702_zap.mbn*"
 FILES:${PN}-qcom-qcm2290-audio = "${firmwaredir}/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${firmwaredir}/qcom/qcm2290/modem*.*"
@@ -2599,11 +2619,13 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${firmwaredir}/qcom/sc8280xp/LEN
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
+FILES:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "${firmwaredir}/qcom/sc8280xp/radxa/dragon-q8b/qcadsp8280.mbn*"
 FILES:${PN}-qcom-sdm845-adreno = "${firmwaredir}/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${firmwaredir}/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${firmwaredir}/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwaredir}/qcom/sdm845/modem*.* ${firmwaredir}/qcom/sdm845/wlanmdsp.mbn* ${firmwaredir}/qcom/sdm845/notice.txt_wlanmdsp* \
                                  ${firmwaredir}/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
+FILES:${PN}-qcom-sdm845-shift6mq-adreno = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn*"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${firmwaredir}/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sdx35-foxconn-firehose = "${firmwaredir}/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
 FILES:${PN}-qcom-sdx61-foxconn-firehose = "${firmwaredir}/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
@@ -2721,6 +2743,7 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-eliza-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-eliza-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-glymur-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-glymur-compute = "${PN}-qcom-2-license"
@@ -2729,6 +2752,9 @@ RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-nord-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-nord-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-nord-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
@@ -2772,10 +2798,12 @@ RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-shift6mq-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
-- 
2.34.1


