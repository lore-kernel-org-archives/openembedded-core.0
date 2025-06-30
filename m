Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B25C83035
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:06:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.34697.1751272798228148830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eTbFWj/k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DBPt028440
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RGkyaltfy29rqOSRF6z5sUU8TdEdmXBzKNqfE/ejkM=; b=eTbFWj/kKj/1eDq1
	STsqSVssUqcsBB6A5u79Tf1VBKjrXXq313zed3mx35DYIng8IwceyuyZnLQbzcvI
	UU0uUAWMgIURnj4/Dajw+ajDx/Q1eEYfo1Rz43IeJy80kjnRuqso6Avrnuip5p+1
	5lNWeTx4getciWtUActYMCxMLEyhulAXtur351BNahMnTGdXRSMbzhRqSA6yq8KM
	3qruH9VkuOC+Z9OZPyFrfz7hUbIDHKRNwD0oEAFqC1SvxubIoXyZGCSOaTy73r8r
	cb6/j7vfI3EHbCS+ABArqH0f73KxyAAp7NHxB13NLmqRCRxvyy7uQPYybx/QiO//
	r2+D0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvm0p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:39:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U8duSO011078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:39:56 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Jun 2025 01:39:54 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 2/3] linux-firmware: upgrade 20250509 -> 20250613
Date: Mon, 30 Jun 2025 14:09:14 +0530
Message-ID: <20250630083915.4023652-2-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630083915.4023652-1-vpuar@qti.qualcomm.com>
References: <20250630083915.4023652-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GpF00Se4qRgQmR6Wmmx4R0vdw_1KxSl2
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68624d5d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=kjsC_edz3OLAKbXsposA:9
X-Proofpoint-ORIG-GUID: GpF00Se4qRgQmR6Wmmx4R0vdw_1KxSl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA3MCBTYWx0ZWRfX4G8G85mNU3jW
 84JOlOsNE6uPtVcVTmcHEFs/HUquT5wFptcGnU8rt3NsGGLFEgxE6SBOvQn6RPfVTdEnorfarzq
 t9bdlKJUnycrG4rWGIVi+UOOAK6079+CVd4duiu/4fL0CuQhmyxN+Z8B4PkfgVMaCgpHJ6RhM80
 PkUeY65WHpw7SKLPCUuzXD1zGpFSV43lWxILq5ShtIZ3qxykCnAWUdYXbdQqj4EAulBPkFS/Hle
 meVdBclud6NWPjuCqg6++Bohoomab5AF2WF9r6d8xLOe7frIf7HOk4Vml2hl3c/jSix0pdRkXgH
 G3BZuADfDNuKUxVxOZlvHbnDWYFiBfyTalUtZIilq9a/PZxhwmFo8Ti/+k9F39qdtCKv5E56MHe
 tbOQry1VHdAniSXlIgepbtmLLMFGdHCEf1Nxx4llN4F+RtNEoNlL5QLReR7rBLSYYauFINJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300070
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 17:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219532

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
index d3ba239e4c..80d1be0eca 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
@@ -121,7 +121,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
                     file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
-                    file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
+                    file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
@@ -192,7 +192,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "d85e2f182f489a235400712cbfdb017a"
+WHENCE_CHKSUM  = "131efa2b2bab317f52b081719225dd64"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -298,7 +298,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e"
+SRC_URI[sha256sum] = "d40743337ca8bf9d2587e220ab30dec6a07b52cc5cb4a4ff8d92be14391a7fde"
 
 inherit allarch
 
@@ -526,11 +526,11 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
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
@@ -540,6 +540,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
@@ -1864,11 +1865,13 @@ LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
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
@@ -1878,11 +1881,12 @@ LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
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
@@ -1947,11 +1951,13 @@ FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]649
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
@@ -1967,6 +1973,7 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/q
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
@@ -2028,11 +2035,13 @@ RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
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
@@ -2044,11 +2053,12 @@ RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
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
@@ -2074,6 +2084,7 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 
 LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
-- 
2.34.1


