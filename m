Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF3ACAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 06:35:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7512.1758177354839770630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 23:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IqeMPeR/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3G36Q027077
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 06:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0tXv8s9DB2ZX0wHzfikl1W
	haw8fQrl/h+WvgCrD95UU=; b=IqeMPeR/ZK8p5gfi3Y4I0Ox63wpdOyImGMuFet
	V7F360jTspZiMJ9doqtTT3hHAEpnXLgFr1/wAPS+6fbaY4agRmQX63/u9tV+PYNf
	GE9PDwpKmHTm1lf5bt8BF8SfzgeD0ZqEu+9JNjRaHXzpdUwr7CwkVxVUcUMwEQVG
	DVJG/UNDCdw4J08PFiPG5yYZKUm4AAs1QBHtHwIWzZquvkxPrLo5izwSQXOCjYok
	0SZsQA12qKur0MQ96MNoY3L5E0Isn0YQvcIO+JMq+uyxuNj81K8cOZp9qMOU9ERv
	F8887I1rbtKil696SEZ2QBy6TZatsjfOjyUc2mLnaAERg4Bg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt58et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 06:35:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58I6ZrBq015385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 06:35:53 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 23:35:52 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20250808 -> 20250917
Date: Thu, 18 Sep 2025 12:05:21 +0530
Message-ID: <20250918063521.1301502-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OmwX3zwhIKvjEk7VC-XeXwLUgc-2EdYc
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cba84a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=a7BezUXMSFE1PFqyZ34A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+nWZsasRzRyU
 EnJfIQ8+JWlXgK+iAYmoE2cwz747nWgOm7ehG/MxsVAQPbb5PHhQgojFqJOg5a1TLLjgQrY+d5O
 aRykVHs1xC60YyBS/aQVF4JTAxac175qu+Z17SszRhjeRomrCB647rUk0THoZflgQkO0x3t9AHl
 U6wnRe4wqYQbvJ0+TYVTcZ3Qg9OPxRq1jnORUsTm6rhBoV1d0G7mY2RpMxY0JKASuphPXSrIhrM
 doD7X2CSMM4OT4GgwWCccQ6piBHc5Ui/n6E5ddWpEZauxaKjRe4L0Om0M1NGXzsJ4936mbVLqgT
 puW8nM+wYxxdPH5zc7ncdIC5VnWQfeCd/YvqEXyWXu7q2VI/cKUCRH0dff2zf0a82K+0W3gjo9S
 DSlL6dgN
X-Proofpoint-ORIG-GUID: OmwX3zwhIKvjEk7VC-XeXwLUgc-2EdYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 06:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223627

Add packages ${PN}-qcom-qcs615-{audio, compute} to include DSP firmware
for qcs615 platform, ${PN}-qcom-x1e80100-compute to include CDSP firmware
for x1e80100 platform.

Extend Qualcomm QCS8300 RIDE and SA8775P platform to include audio topology.

License-Update: additional files

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20250808.bb => linux-firmware_20250917.bb} | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250808.bb => linux-firmware_20250917.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 7c413e2b7c..9bc46042d5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -246,7 +246,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "8417bc58fbaf0ae741a2bc8214db61f4"
+WHENCE_CHKSUM  = "714332457b96406b3ccff321b60680b1"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -379,7 +379,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c029551b45a15926c9d7a5df1a0b540044064f19157c57fc11d91fd0aade837f"
+SRC_URI[sha256sum] = "120575b756915a11e736f599316a756b6a29a76d6135ad86208868b21c58fb75"
 
 inherit allarch
 
@@ -610,7 +610,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
-             ${PN}-qcom-qcs615-adreno \
+             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
              ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
              ${PN}-qcom-qrb4210-adreno \
@@ -630,7 +630,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
-             ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
+             ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
              ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio \
@@ -1953,6 +1953,8 @@ LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
@@ -1987,6 +1989,7 @@ LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"
@@ -2043,8 +2046,10 @@ FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
+FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.*"
+FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
-FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
+FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
 FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
 FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
@@ -2054,7 +2059,7 @@ FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
 FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
 FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
-FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.*"
+FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin*"
 FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
 FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
 FILES:${PN}-qcom-sa8775p-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/sa8775p/qupv3fw.elf*"
@@ -2079,6 +2084,7 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
+FILES:${PN}-qcom-x1e80100-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
@@ -2131,6 +2137,8 @@ RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
@@ -2167,6 +2175,7 @@ RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-license"
-- 
2.34.1


