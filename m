Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC38CD343F
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 18:12:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4305.1762971156483754624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 10:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HDAnsDD4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACDsMGX1314325
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dC7K4+VCQ1Bfp5a/0Vg7lc
	Q+p0InuafDy6uADVfA4F4=; b=HDAnsDD4GxTYIWo0Jfe5SMg7KWN8Il020uKOL3
	vxuaZ76OgTMRwhQgURFlZyVUy/JPBwQVWQ12EnUH8Ciy9wbG65oI9sgLNGpcuiUH
	bMNWncZABZv8Rk1iqPdLw4BCg0LSZ02TEVFR4PtaQPqI7p/FhBZG2Wfedb3Ttd3v
	HVRzqmzeAdM6urVxPLhSkipS2Db2FJendJO+I5puoRTPP1VdqJnR9ZF8Gj7Ew0+9
	KVl0QxMOsLiOAijOvidmAaj8sySfiHRIlOzw1BhftflOYTzGwh+uTxwLRdqdq1+i
	7/zsmNIVnmKu4By5x8OhPU+BQGysRbH1ZTgpXZRgMhpYzEcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuhg0vj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:12:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5ACICZYg024159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:12:35 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 12 Nov 2025 10:12:33 -0800
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20251021 -> 20251111
Date: Wed, 12 Nov 2025 23:42:18 +0530
Message-ID: <20251112181218.3301302-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NbnrFmD4 c=1 sm=1 tr=0 ts=6914ce14 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zkBh2uLDL4nQX7HhrgUA:9
X-Proofpoint-GUID: 7vT0OLn6QC0sMLKqlU4psBzJZXkXQon-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0NyBTYWx0ZWRfXx+XQr66e2CvH
 j3FI4D9jVDoDHbcyCRBbmkyPpNlqyTjMs21wA1SeWS7N/QOhBJqpItgLbhwaVl1z7Sod/85SnAb
 koNdfIWaRdm+/qqE9/GdYJ7w1zlTDBPk3JTmzs6ery1Knm0UIAr1Cu+aJvjXcftqI1mYX960ArI
 QqRD4x03S2qf5cuZlfz6U+0lk0HT3zARkvo+AMm16g0MhWtAl6qzHnnnZLtZlu4ptsKp9v4A+bR
 NoEu1zkpz34kt/8X35FuditlzFF6MfBjxTee4V6llwaw7+3TxtNckwQNk0DJ8i0Onu0MjuQUTMH
 s/RLrrzq8OAi2/sr4+VaJtndQfIWXXrD//hgTet7Gb5nSPOWUwz5PxLz7zQjR3+qHlK9CgF6oVr
 nxNvNqkc2k2wPwBa6li4/vO2yiWy5w==
X-Proofpoint-ORIG-GUID: 7vT0OLn6QC0sMLKqlU4psBzJZXkXQon-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226215

Upgrade the firmware package to latest release. Add new
Qualcomm firmware packages, rename HP package, and update
FILES path for packages ${PN}-ti-{tas2563, tas2781}.

License-Update: new and updated firmware

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20251021.bb => linux-firmware_20251111.bb} | 28 +++++++++++--------
 1 file changed, 17 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251021.bb => linux-firmware_20251111.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
index 66d3be90e7..eda42cf855 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
@@ -312,7 +312,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "aa7f40acde3418d9125fbb933ba2d9f9"
+WHENCE_CHKSUM  = "4a2863b38b43abbc3a09b24ece7d1196"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -449,7 +449,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "fa6130988ecd7968602938c77dd6f8d2dace4e03ba0da4c0e9624dfed657e6cf"
+SRC_URI[sha256sum] = "ab57a1526595090bb4874c35335e2252288dcbea546eff491654b2313438a47d"
 
 inherit allarch
 
@@ -709,7 +709,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-g802 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
-             ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-compute \
+             ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-audio ${PN}-qcom-kaanapali-compute ${PN}-qcom-kaanapali-soccp \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
@@ -753,7 +753,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-typhoon-license ${PN}-typhoon \
              ${PN}-intel-license ${PN}-ish-lnlm \
              ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 \
-             ${PN}-hp-license ${PN}-ish-lnlm-dba6b120-152c3222 \
+             ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
              ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad-2a17559f \
              ${PN}-ish-ptl \
              ${PN}-advansys-license ${PN}-advansys \
@@ -1770,7 +1770,7 @@ LICENSE:${PN}-ti-tas2563 = "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2563 = "\
     ${nonarch_base_libdir}/firmware/INT8866RCA2.bin* \
     ${nonarch_base_libdir}/firmware/TAS2XXX3870.bin* \
-    ${nonarch_base_libdir}/firmware/ti/tas2563/* \
+    ${nonarch_base_libdir}/firmware/ti/audio/tas2563/* \
 "
 RDEPENDS:${PN}-ti-tas2563 = "${PN}-ti-tspa-license"
 
@@ -1780,7 +1780,7 @@ FILES:${PN}-ti-tas2781 = "\
     ${nonarch_base_libdir}/firmware/TAS2XXX*.bin* \
     ${nonarch_base_libdir}/firmware/TIAS2781*.bin* \
     ${nonarch_base_libdir}/firmware/TXNW2781*.bin* \
-    ${nonarch_base_libdir}/firmware/ti/tas2781/* \
+    ${nonarch_base_libdir}/firmware/ti/audio/tas2781/* \
 "
 RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
 
@@ -2275,7 +2275,9 @@ LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-kaanapali-soccp = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
@@ -2373,7 +2375,9 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
 FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
+FILES:${PN}-qcom-kaanapali-audio = "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.*"
 FILES:${PN}-qcom-kaanapali-compute = "${nonarch_base_libdir}/firmware/qcom/kaanapali/cdsp*.*"
+FILES:${PN}-qcom-kaanapali-soccp = "${nonarch_base_libdir}/firmware/qcom/kaanapali/soccp*.*"
 FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn*"
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
@@ -2476,7 +2480,9 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
@@ -2600,12 +2606,12 @@ RDEPENDS:${PN}-ish-lnlm-39ceeaf8 = "${PN}-dell-license"
 LICENSE:${PN}-hp-license = "Firmware-HP"
 FILES:${PN}-hp-license = "${nonarch_base_libdir}/firmware/LICENSE.HP"
 
-LICENSE:${PN}-ish-lnlm-dba6b120-152c3222 = "Firmware-HP"
-FILES:${PN}-ish-lnlm-dba6b120-152c3222 = " \
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_dba6b120_152c3222.bin* \
-    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_dba6b120_152c3222.bin* \
+LICENSE:${PN}-ish-lnlm-12128606 = "Firmware-HP"
+FILES:${PN}-ish-lnlm-12128606 = " \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_12128606.bin* \
+    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_12128606.bin* \
 "
-RDEPENDS:${PN}-ish-lnlm-dba6b120-152c3222 = "${PN}-hp-license"
+RDEPENDS:${PN}-ish-lnlm-12128606 = "${PN}-hp-license"
 
 # For LENOVO ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-lenovo-license = "Firmware-lenovo"
-- 
2.34.1


