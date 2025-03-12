Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A64FC28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:42:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.33000.1741772524872019936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 02:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=pTTz2P30;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMI550008682;
	Wed, 12 Mar 2025 09:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JkDLApMIlVwcM5usdmmcaV
	YXAmEYsr+M79g9Od4c6yM=; b=pTTz2P30hPnV6e+LXC96Yl5TYshl1DkGBROyy9
	r/RRqOSZJ6kjv9qpsZ/plaDMNGw1K23cKTo/MgTVojnlz1Jw69jy+q9pcIdk9uAf
	ooVR9FhIGpD6lxQuPwPNpT1adda22wjbGvkdKD1hFX2rzDlsvwSs7ZByxuLDlRK8
	gsCWZHSkqhbm1zLLR//QhJsZsoybB+yWPL7pZdAb6wVtfSRv9Ny8TVWWjsJwEfMH
	qFRwBCtl8NtiHbpeQn+svsGL6ApayaG1FxLCy4XMBDPhTnuf7iRmu2L9OhK+WKhz
	Mfxnwv5kH9T9RM3XAbqeIrgBfEv/6AXPrB685+9hNeH5OPzA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qhw08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:42:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C9g2xj004974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:42:02 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 02:42:01 -0700
From: Vivek Puar <quic_vpuar@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <quic_vpuar@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH] linux-firmware: upgrade 20250211 -> 20250311
Date: Wed, 12 Mar 2025 15:11:44 +0530
Message-ID: <20250312094144.1595893-1-quic_vpuar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NLCzlXi5UnXnLSE_FytRLNrWVjCrmC_A
X-Authority-Analysis: v=2.4 cv=G5ccE8k5 c=1 sm=1 tr=0 ts=67d156eb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=vvM7_qn4kvGFgj1IoXEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NLCzlXi5UnXnLSE_FytRLNrWVjCrmC_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 09:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212641

Add gpu firmwares for qcs8300 chipset to
${PN}-qcom-adreno-a623 and
${PN}-qcom-qcs8300-adreno packages

Add bluetooth firmwares for QCA2066
to ${PN}-qca-qca2066 package.

Add firmware files for Adreno A225
to ${PN}-qcom-adreno-a2xx package

License-Update: additional files

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...20250211.bb => linux-firmware_20250311.bb} | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250211.bb => linux-firmware_20250311.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index aec36a7a7f..8b80b87993 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -160,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
+WHENCE_CHKSUM  = "886924eb733c4efcec21dff980795771"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -250,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
+SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
 
 inherit allarch
 
@@ -472,14 +472,14 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
-             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
-             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
+             ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
-             ${PN}-qcom-qcs615-adreno \
+             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs8300-adreno \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
@@ -717,6 +717,8 @@ FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.302 \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.309 \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.309 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.30a \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.30a \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0 \
@@ -739,6 +741,9 @@ FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8 \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111 \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin \
 "
 FILES:${PN}-qca-wcn7850 = " \
   ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv \
@@ -1783,6 +1788,7 @@ LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a623 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
@@ -1804,6 +1810,7 @@ LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1851,10 +1858,11 @@ FILES:${PN}-qcom-vpu = " \
     ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
     ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
 "
-FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw* ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw*"
+FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw* ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw* ${nonarch_base_libdir}/firmware/qcom/a2*_*.fw*"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw* ${nonarch_base_libdir}/firmware/a300_*.fw*"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
+FILES:${PN}-qcom-adreno-a623 = "${nonarch_base_libdir}/firmware/qcom/a623*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
@@ -1876,6 +1884,7 @@ FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
+FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1921,6 +1930,7 @@ RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a623 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
@@ -1946,6 +1956,7 @@ RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.34.1


