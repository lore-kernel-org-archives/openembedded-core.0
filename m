Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128A5C7EE30
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:55:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.6257.1751109677521669062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jun 2025 04:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IG/RaLCd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SAp4Zu008696
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 11:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ysgAVikXSNt9fmQbmdJm7b
	cZhDfYmPlG0pBJzWe1qlk=; b=IG/RaLCdLS1cucYdf3RG/K4GkbAlTNvtmHBizM
	dpc/gHncebWMAcHJA7XZim1+fVRxti/64huZ5IviYeHxdnVwKtxIxAax+NG2UCb2
	M/PpbiAND4xkOG6B4m9kHGhAsN1Xy4GvNV1LgqtVp3Ze9K7HMzxVsQG9LIIP9aFL
	058kcRuRoBUGPslim8s4j8xwH+LeeJmyrIti+/hRa+BC29a1hWwoLQGD521LCz6F
	VxbknP1TFKVslK0jbWBn0yN9lOt6aY+IvCyJ5/uzCi5RHnQCP+dU6YSd+VkB3kmH
	VBotqiv5G7LPEdlBj9LOO1lmhK1yT//z0aUnJ6GWNy95r76w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m60hpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 11:21:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55SBLGbS001408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 11:21:16 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 28 Jun 2025 04:21:14 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/2] linux-firmware: upgrade 20250509 -> 20250613
Date: Sat, 28 Jun 2025 16:50:58 +0530
Message-ID: <20250628112058.404079-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDA5MyBTYWx0ZWRfX/0QUac5KP5tv
 l5ICnmMTa+AtQ/pKDquFmQeBH6OZac/BSybayDTXMl7VxyFRbYRLVL4YctcIo71VHILTtosbqee
 3E3lzWDlTKeLxOcCPdFeVBoUOeOsg0eqtUvCZJzQN1YoSUlPIttoZSJXxHfkcT3gUAqBur/6E0n
 f6/T07EeDxr69VDVaTfglS2Iblcn+L0Y5k6VlfdScfqADKzaFOckBTs4WElplS2k9dbk2RDj2KP
 HXh7W+jYnhvjibVZeU/wpr9mwXWyWpEkBe+DsGZeHC9lWWX3uaU0z3Pt9mSlHLG4n2a3MYBUmHp
 Uk5iLbomdq6ifeV+wyzi8KvMU/6x/wWKoM7H/a60+QssOujye8j7SfrcF83b9h2bN8kYOo/aFV/
 vq6Jnx+DKsYaipoCY/YHk81bpDjNPkWW9U5tKCQ9nE+MmKEhkONUUR58bzeKYaQgZPddt5kl
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=685fd02c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qtA3iuvjaZh4sjnKcnsA:9
X-Proofpoint-GUID: _5XuigBTB61Jn-Sv4FE9Pk0JDrpVq46e
X-Proofpoint-ORIG-GUID: _5XuigBTB61Jn-Sv4FE9Pk0JDrpVq46e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280093
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 18:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219451

Adding QUPv3 firmware for QCM6490 and QCS8300 platforms.

Add package ${PN}-qcom-sc8280xp-lenovo-x13s-vpu for Lenovo X13s
laptop.

License-Update: additional files

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20250509.bb => linux-firmware_20250613.bb} | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250509.bb => linux-firmware_20250613.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
index ea75271af8..e26c6221e0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
@@ -97,7 +97,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
                     file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
-                    file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
+                    file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
@@ -160,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "d85e2f182f489a235400712cbfdb017a"
+WHENCE_CHKSUM  = "131efa2b2bab317f52b081719225dd64"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -250,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e"
+SRC_URI[sha256sum] = "d40743337ca8bf9d2587e220ab30dec6a07b52cc5cb4a4ff8d92be14391a7fde"
 
 inherit allarch
 
@@ -478,11 +478,11 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
-             ${PN}-qcom-qcm6490-adreno \
-             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
+             ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
+             ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
              ${PN}-qcom-qcs615-adreno \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
-             ${PN}-qcom-qcs8300-generalpurpose \
+             ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
@@ -492,6 +492,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
@@ -1816,11 +1817,13 @@ LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-qcs8300-generalpurpose = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-qcs8300-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1830,11 +1833,12 @@ LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sa8775p-audio = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sa8775p-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sa8775p-generalpurpose = "Firmware-qcom-2"
-LICENSE:${PN}-qcom-sa8775p-qupv3fw = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sa8775p-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
@@ -1899,11 +1903,13 @@ FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]649
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
+FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcm6490/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
 FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
+FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1919,6 +1925,7 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/q
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
@@ -1980,11 +1987,13 @@ RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
+RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-qcs8300-generalpurpose = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-qcs8300-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
@@ -1996,11 +2005,12 @@ RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sa8775p-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sa8775p-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sa8775p-generalpurpose = "${PN}-qcom-2-license"
-RDEPENDS:${PN}-qcom-sa8775p-qupv3fw = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sa8775p-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
@@ -2026,6 +2036,7 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 
 LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
-- 
2.34.1


