Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AF4C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:31:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11840.1790087516724464001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 07:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Edi8FcTA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPLo3015300
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iePwqHc7OKx8nIK54KZ+9i
	PBV+MdGOKEOfTZ0yuBHzc=; b=Edi8FcTALgQmiaknVc/tuwaBGgKIndli390IxH
	sHrbS46HsoCVF9gO6OnX+1rF3v/p5JADmc8PJXPSggQb6eUsSNJBSIwYUw64BMK2
	4yCCA6B/t3Y3RhJvnCzF25eXYYW913w0lk9TZm3+ipLLbMthGzOJRgDdRxYfoSa7
	nd4hdgrtKbH72ZQ5BVFpqgxv42LBJg8w5bUoRBmuNOKxCLN4qu4NWZsOz1zZzWED
	UOc6JNdcIdymus5ZpdsLx80Gxe2aAY+xt95VCfb275en4dBnyV72h/pdgRsy0WW7
	jpKw6IrcFwJy1XV5HN6bAjnuq5mLXpx+u2r9tI8YygRDLF5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjystfb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:31:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 68MEVseS2330896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:31:54 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:31:52 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2] linux-firmware: upgrade 20260910 -> 20260916
Date: Tue, 22 Sep 2026 20:01:38 +0530
Message-ID: <20260922143138.1565007-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-GUID: HSCaUCaxFCM6JTgAm0IY22WAp7DF76tI
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2915b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=A7mtM95H-gnKJ28VzyQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMSBTYWx0ZWRfX4z2fGtnjNioU
 RBzZm7xpU9Uf2s2oUpDi138Hhb4GBDiDfdQH6ymGKNVCy+o6iYKgegpXlbPnoYeGpg5UgXoHaoE
 IbM8uUWE4DAlDDD6QwQK5YrldcH6M9BF2ET5bvpcnCUIzUoNExVTcZer3lFSWZegbbR3jdE7dtY
 5JwncgFUzGUsxnvfzRelzbjpWXEY31PrM2FpzIcvpwr0qI//MuiR6ZvuyKatZrkQYuTNZL06h4n
 EQFdLiw7TDYizDxqJPR/fI6Kz0fkh63ub2SrnTzpAevznM8Gr8ohYtxNMl+FwJlK3WTb0hFAe8g
 HJCvhFPjEl8LnvJi6kikSuv9QENtKrz1W7Rzv/I9rgMqMwCbW5rDP0YJJf+2030UHki3Y7hrFs+
 s6Qkoa0DfA6xdGgeec4PDzhObdQtyvuLj8tSHfo/JJ3UbJ8FJ2XYw6P1kiXLWaHtVe/6oJuor6+
 KAtI5dzEQCj8HD44fUQ==
X-Proofpoint-ORIG-GUID: HSCaUCaxFCM6JTgAm0IY22WAp7DF76tI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMSBTYWx0ZWRfX47xxguEvfDQ+
 DSdNUvJ01HXp6DmUcZytjEkvURXg5s73qPS7oH+SRm2oEz5q1aGtDPfhfWsbZqBldFQy5BsDQha
 bSOiQrxJ0outRt10dE7mLRVKVjRl5+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246417

Upgrade the firmware package to latest release. Add firmware
for RTL8261d. Add ADSP firmware for Qualcomm Maili platform.
Add SHIFT6mq modem and WLAN firmware packages, which reuse
files already available in linux-firmware through symlinks.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260910.bb => linux-firmware_20260916.bb} | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260910.bb => linux-firmware_20260916.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
index 1b9215a090..44901c229a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260910.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
@@ -277,7 +277,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "fe7960bbe2eb0922168c3434c8d125d0"
+WHENCE_CHKSUM  = "286b10e604dec1e5d49c4ac688f65a2e"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -416,7 +416,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "f3937ca282ba256242e2b6dbe523df8a80007d29ffd61f56d270190865492ea8"
+SRC_URI[sha256sum] = "f80dcb757a623deda62200c08e0e1a88c76fb6b54964f31b35fa74da1c90ccc5"
 
 inherit allarch
 
@@ -533,7 +533,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 ${PN}-rsi-91x \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
-             ${PN}-rtl8261c ${PN}-rtl8723 ${PN}-rtl8821 \
+             ${PN}-rtl8261c ${PN}-rtl8261d ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8761 \
              ${PN}-rtl8168 \
              ${PN}-rtl8822 \
@@ -699,6 +699,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-hawi-audio \
              ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-audio \
              ${PN}-qcom-kaanapali-compute ${PN}-qcom-kaanapali-soccp \
+             ${PN}-qcom-maili-audio \
              ${PN}-qcom-nord-audio ${PN}-qcom-nord-compute ${PN}-qcom-nord-qupv3fw \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
@@ -721,7 +722,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
              ${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
-             ${PN}-qcom-sdm845-shift6mq-adreno ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
+             ${PN}-qcom-sdm845-shift6mq-adreno ${PN}-qcom-sdm845-shift6mq-modem ${PN}-qcom-sdm845-shift6mq-wifi \
+             ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
              ${PN}-qcom-shikra-adreno ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-audio \
              ${PN}-qcom-shikra-modem ${PN}-qcom-shikra-qupv3fw \
@@ -1647,6 +1649,7 @@ LICENSE:${PN}-rtl8192cu = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8192ce = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8192su = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8261c = "LicenseRef-Firmware-rtlwifi-firmware"
+LICENSE:${PN}-rtl8261d = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8723 = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8761 = "LicenseRef-Firmware-rtlwifi-firmware"
 LICENSE:${PN}-rtl8821 = "LicenseRef-Firmware-rtlwifi-firmware"
@@ -1681,6 +1684,9 @@ FILES:${PN}-rtl8192su = " \
 FILES:${PN}-rtl8261c = " \
   ${firmwaredir}/rtl_nic/rtl8261c.bin* \
 "
+FILES:${PN}-rtl8261d = " \
+  ${firmwaredir}/rtl_nic/rtl8261d.bin* \
+"
 FILES:${PN}-rtl8723 = " \
   ${firmwaredir}/rtlwifi/rtl8723*.bin* \
   ${firmwaredir}/rtw88/rtw8723*.bin* \
@@ -1736,6 +1742,7 @@ RDEPENDS:${PN}-rtl8192ce += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192cu += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192su = "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8261c = "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8261d = "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8821 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8761 += "${PN}-rtl-license"
@@ -2410,6 +2417,7 @@ LICENSE:${PN}-qcom-kaanapali-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-audio = "LicenseRef-Firmware-qcom-2 AND LicenseRef-Firmware-linaro"
 LICENSE:${PN}-qcom-kaanapali-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-soccp = "LicenseRef-Firmware-qcom-2"
+LICENSE:${PN}-qcom-maili-audio = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-nord-audio = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-nord-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-nord-qupv3fw = "LicenseRef-Firmware-qcom"
@@ -2456,6 +2464,8 @@ LICENSE:${PN}-qcom-sdm845-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-shift6mq-adreno = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-shift6mq-modem = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-shift6mq-wifi = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "LicenseRef-Firmware-qcom"
@@ -2561,6 +2571,7 @@ FILES:${PN}-qcom-kaanapali-audio = " \
 "
 FILES:${PN}-qcom-kaanapali-compute = "${firmwaredir}/qcom/kaanapali/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-soccp = "${firmwaredir}/qcom/kaanapali/soccp*.*"
+FILES:${PN}-qcom-maili-audio = "${firmwaredir}/qcom/maili/adsp*.*"
 FILES:${PN}-qcom-nord-audio = "${firmwaredir}/qcom/nord/adsp*.*"
 FILES:${PN}-qcom-nord-compute = "${firmwaredir}/qcom/nord/cdsp*.*"
 FILES:${PN}-qcom-nord-qupv3fw = "${firmwaredir}/qcom/nord/qupv3fw.elf*"
@@ -2633,6 +2644,8 @@ FILES:${PN}-qcom-sdm845-compute = "${firmwaredir}/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwaredir}/qcom/sdm845/modem*.* ${firmwaredir}/qcom/sdm845/wlanmdsp.mbn* ${firmwaredir}/qcom/sdm845/notice.txt_wlanmdsp* \
                                  ${firmwaredir}/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-shift6mq-adreno = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn*"
+FILES:${PN}-qcom-sdm845-shift6mq-modem = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/mba.mbn*"
+FILES:${PN}-qcom-sdm845-shift6mq-wifi = "${firmwaredir}/qcom/sdm845/SHIFT/axolotl/wlanmdsp.mbn*"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${firmwaredir}/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sdx35-foxconn-firehose = "${firmwaredir}/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
 FILES:${PN}-qcom-sdx61-foxconn-firehose = "${firmwaredir}/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
@@ -2759,6 +2772,7 @@ RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-maili-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-nord-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-nord-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-nord-qupv3fw = "${PN}-qcom-license"
@@ -2811,6 +2825,8 @@ RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-shift6mq-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-shift6mq-modem = "${PN}-qcom-license ${PN}-qcom-sdm845-modem"
+RDEPENDS:${PN}-qcom-sdm845-shift6mq-wifi = "${PN}-qcom-license ${PN}-qcom-sdm845-modem"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
-- 
2.34.1


