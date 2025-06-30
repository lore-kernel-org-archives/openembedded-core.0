Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC91CC83033
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 19:48:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50230.1751312909422088684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 12:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jEb/TLJZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFv3uB008350
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 19:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UndNO7NQVEq9brPr4C8llKx+2zaldS456GRMSEbYKfg=; b=jEb/TLJZqnnwtELW
	NZ8qxKZEDgPeRhn6WRS5qvVeTZPd4NxLxJu2FEN1Z0J2eiscXhIzKXul5V64WQfN
	T3MBWkXhIv5HpGK1dPump7cCHkoVTW/bZNpEu8CdKfvikCGJS5zwFFlwIG78J3dC
	NkwVzaMz11+CAQI65a+tQb9f6aZX3yALrLYN8pgcORqh1IPvpEAeXUlEOvHChAPk
	evI/9t2To+ETLO1hEGkfNyOiGMKDqAMHT1O7PKpXCvOLOxre9wTbtyxqqCJPHv3x
	2cIE6u1fwCeYkpnA0lGCLgQSMDxMtt4oL7f/ru5m6xRmFrbbzIsd9kqVhSZHqb2j
	AWiiVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jad3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 19:48:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55UJmSdX024962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 19:48:28 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Jun 2025 12:48:26 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 3/3] linux-firmware: upgrade 20250613 -> 20250627
Date: Tue, 1 Jul 2025 01:18:03 +0530
Message-ID: <20250630194803.2279528-3-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630194803.2279528-1-vpuar@qti.qualcomm.com>
References: <20250630194803.2279528-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862ea0c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=e8JwFNiJSEvQI79_jB8A:9
X-Proofpoint-ORIG-GUID: hLwxu3fT6x9xvYQ0ow_JtRN8WGPOKw4D
X-Proofpoint-GUID: hLwxu3fT6x9xvYQ0ow_JtRN8WGPOKw4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE2MSBTYWx0ZWRfX2xFgieCizUHI
 SpBxQSLP8/WHXzRh7k0BMwS73fVfNJxz/BGSIHRSjb9i/qzSaD+JPJAuq1GsM2vLlhzLJ44NXhV
 L4STGB6tQ9qCQEljwuHmG4cqeFYV4WEZHPKmKSd1JIvB4oL8hvQwALqoI/D2TbitiT0wrlc20np
 S+m3Z9TVDsdhell3q0RDKfRVTDuUBGXEUAHC8hNHFVQlQjDLR3wWg34UwTAQv8toMT/NiLNP78m
 /RcKtyJwNhRadP6nMoUPdb1HwJMfPLR1IUGl4EGputMEcXRQHXvzYjEXe8tO6agwlIxVI1pPmhA
 gGHlOF8QZlzH54rRsx6ugBYwgxi3ndxh74Frt+NRaroWOFCHlREWnuhG+rZWDvHRv6XEo6JtoeG
 acliQty3MZ1YEBbDtzlnosx2TctGI2jxDjCsZJQnO1Jhh1elat3AK4PkcOMdzy2k8Y6QcjoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 19:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219539

Add packages ${PN}-qcom-x1p42100-adreno and ${PN}-qcom-adreno-g715 for
Snapdragon X1 Plus (X1P42100) GPU firmware.

Add new LICENSE files.

License-Update: additional files

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20250613.bb => linux-firmware_20250627.bb} | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250613.bb => linux-firmware_20250627.bb} (97%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
similarity index 97%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
index 80d1be0eca..01986ce16b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
@@ -11,6 +11,7 @@ LICENSE = "\
     & Firmware-aeonsemi \
     & Firmware-agere \
     & Firmware-airoha \
+    & Firmware-alacritech \
     & Firmware-amdgpu \
     & Firmware-amdisp \
     & Firmware-amdnpu \
@@ -23,6 +24,8 @@ LICENSE = "\
     & Firmware-atheros_firmware \
     & Firmware-atmel \
     & Firmware-bmi260 \
+    & Firmware-bnx2 \
+    & Firmware-bnx2x \
     & Firmware-broadcom_bcm43xx \
     & Firmware-ca0132 \
     & Firmware-cavium \
@@ -30,9 +33,13 @@ LICENSE = "\
     & Firmware-cirrus \
     & Firmware-cnm \
     & Firmware-cw1200 \
+    & Firmware-cw1200-sdd \
+    & Firmware-cxgb3 \
     & Firmware-cypress \
+    & Firmware-dabusb \
     & Firmware-dib0700 \
     & Firmware-e100 \
+    & Firmware-emi26 \
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
@@ -50,6 +57,7 @@ LICENSE = "\
     & Firmware-ixp4xx \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-keyspan \
     & Firmware-linaro \
     & Firmware-Lontium \
     & Firmware-mali_csffw \
@@ -86,6 +94,8 @@ LICENSE = "\
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
     & Firmware-ti-tspa \
+    & Firmware-tigon \
+    & Firmware-typhoon \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-via_vt6656 \
     & Firmware-wfx \
@@ -103,6 +113,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.aeonsemi;md5=521c00bae0077c90d6ffb9ccf66905ae \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENSE.airoha;md5=fa3dedb960e2673aea51aa509f7b537d \
+                    file://LICENCE.alacritech;md5=75dabc07cc2fb59d929baa6bd6aae48a \
                     file://LICENSE.amdgpu;md5=1433dfea38c97a2e563a248a863dcb94 \
                     file://LICENSE.amdisp;md5=f040a36bf52c9643edb7c009d6f1b141 \
                     file://LICENSE.amdnpu;md5=ea42c0f38f2d42aad08bd50c822460dc \
@@ -115,6 +126,8 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
                     file://LICENSE.bmi260;md5=0008c039ec4281e382bd0cb41b66866c \
+                    file://LICENCE.bnx2;md5=d156fb810e162c4b0065ec8316efcd38 \
+                    file://LICENCE.bnx2x;md5=9494ec1462e461dec5322d1a1f0adf81 \
                     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
                     file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
@@ -123,9 +136,13 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
                     file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
+                    file://LICENCE.cw1200-sdd;md5=7e99e5e15c3668e96504a82ebd532ee4 \
+                    file://LICENCE.cxgb3;md5=1cf82d9e2a4b301e20c7936e61cd0e45 \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
+                    file://LICENCE.dabusb;md5=fd785fc5f935c950a3423e4b1b996657 \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
                     file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
+                    file://LICENCE.emi26;md5=2d1cd6e732b81824fe2f0fbf595b1413 \
                     file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
                     file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
                     file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
@@ -143,6 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
                     file://LICENSE.ixp4xx;md5=ddc5cd6cbc6745343926fe7ecc2cdeb2 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
+                    file://LICENCE.keyspan;md5=676af26017c45772c972ce4a75d467d9 \
                     file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.mali_csffw;md5=e064aaec4d21ef856e1b76a6f5dc435f \
@@ -180,6 +198,8 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ti-tspa;md5=d1a0eb27d0020752040190b9d51ad9be \
+                    file://LICENCE.tigon;md5=49d104a32337f4a4c89478a86ce9ae4f \
+                    file://LICENCE.typhoon;md5=43b30243a6bda91f54c8e00600c4add5 \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
                     file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
@@ -192,7 +212,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "131efa2b2bab317f52b081719225dd64"
+WHENCE_CHKSUM  = "3b864f69afb6609b4558a074bb428348"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -201,6 +221,7 @@ NO_GENERIC_LICENSE[Firmware-adsp_sst] = "LICENCE.adsp_sst"
 NO_GENERIC_LICENSE[Firmware-aeonsemi] = "LICENSE.aeonsemi"
 NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
 NO_GENERIC_LICENSE[Firmware-airoha] = "LICENSE.airoha"
+NO_GENERIC_LICENSE[Firmware-alacritech] = "LICENCE.alacritech"
 NO_GENERIC_LICENSE[Firmware-amdgpu] = "LICENSE.amdgpu"
 NO_GENERIC_LICENSE[Firmware-amdisp] = "LICENSE.amdisp"
 NO_GENERIC_LICENSE[Firmware-amdnpu] = "LICENSE.amdnpu"
@@ -213,6 +234,8 @@ NO_GENERIC_LICENSE[Firmware-amphion_vpu] = "LICENSE.amphion_vpu"
 NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
 NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
 NO_GENERIC_LICENSE[Firmware-bmi260] = "LICENSE.bmi260"
+NO_GENERIC_LICENSE[Firmware-bnx2] = "LICENCE.bnx2"
+NO_GENERIC_LICENSE[Firmware-bnx2x] = "LICENCE.bnx2x"
 NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
 NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
 NO_GENERIC_LICENSE[Firmware-cadence] = "LICENCE.cadence"
@@ -221,9 +244,13 @@ NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
 NO_GENERIC_LICENSE[Firmware-cirrus] = "LICENSE.cirrus"
 NO_GENERIC_LICENSE[Firmware-cnm] = "LICENCE.cnm"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
+NO_GENERIC_LICENSE[Firmware-cw1200-sdd] = "LICENCE.cw1200-sdd"
+NO_GENERIC_LICENSE[Firmware-cxgb3] = "LICENCE.cxgb3"
 NO_GENERIC_LICENSE[Firmware-cypress] = "LICENCE.cypress"
+NO_GENERIC_LICENSE[Firmware-dabusb] = "LICENCE.dabusb"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
 NO_GENERIC_LICENSE[Firmware-e100] = "LICENCE.e100"
+NO_GENERIC_LICENSE[Firmware-emi26] = "LICENCE.emi26"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] = "LICENCE.ene_firmware"
 NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] = "LICENCE.go7007"
@@ -241,6 +268,7 @@ NO_GENERIC_LICENSE[Firmware-ivsc] = "LICENSE.ivsc"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-ixp4xx] = "LICENSE.ixp4xx"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
+NO_GENERIC_LICENSE[Firmware-keyspan] = "LICENCE.keyspan"
 NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-mali_csffw] = "LICENCE.mali_csffw"
@@ -277,6 +305,8 @@ NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
 NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
 NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
 NO_GENERIC_LICENSE[Firmware-ti-tspa] = "LICENCE.ti-tspa"
+NO_GENERIC_LICENSE[Firmware-tigon] = "LICENCE.tigon"
+NO_GENERIC_LICENSE[Firmware-typhoon] = "LICENCE.typhoon"
 NO_GENERIC_LICENSE[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
 NO_GENERIC_LICENSE[Firmware-via_vt6656] = "LICENCE.via_vt6656"
 NO_GENERIC_LICENSE[Firmware-wfx] = "wfx/LICENCE.wf200"
@@ -298,7 +328,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "d40743337ca8bf9d2587e220ab30dec6a07b52cc5cb4a4ff8d92be14391a7fde"
+SRC_URI[sha256sum] = "edefb1d2a538367abf9558802fee3cd135ebb19a4a5890c8eefb3416a92a6b89"
 
 inherit allarch
 
@@ -522,7 +552,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
-             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
+             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g715 ${PN}-qcom-adreno-g750 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
@@ -552,6 +582,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
              ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio \
              ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu \
+             ${PN}-qcom-x1p42100-adreno \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1850,6 +1881,7 @@ LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a663 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g715 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g750 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
@@ -1908,6 +1940,7 @@ LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1p42100-adreno = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-2-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom-2"
@@ -1937,6 +1970,7 @@ FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
+FILES:${PN}-qcom-adreno-g715 = "${nonarch_base_libdir}/firmware/qcom/gen71500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn* ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt*"
@@ -1996,6 +2030,7 @@ FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${nonarch_base_libdir}/fi
 FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin*"
 FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*cdsp*.*"
 FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn*"
+FILES:${PN}-qcom-x1p42100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1p42100/gen71500_zap.mbn*"
 
 RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
@@ -2016,6 +2051,7 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license ${PN}-qcom-adreno-a660"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g715 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
@@ -2079,6 +2115,7 @@ RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1p42100-adreno = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
@@ -2115,6 +2152,7 @@ LICENSE:${PN} = "\
     & Firmware-aeonsemi \
     & Firmware-agere \
     & Firmware-airoha \
+    & Firmware-alacritech \
     & Firmware-amdgpu \
     & Firmware-amdisp \
     & Firmware-amdnpu \
@@ -2125,14 +2163,20 @@ LICENSE:${PN} = "\
     & Firmware-amlogic_vdec \
     & Firmware-atmel \
     & Firmware-bmi260 \
+    & Firmware-bnx2 \
+    & Firmware-bnx2x \
     & Firmware-ca0132 \
     & Firmware-cavium \
     & Firmware-chelsio_firmware \
     & Firmware-cirrus \
     & Firmware-cnm \
     & Firmware-cw1200 \
+    & Firmware-cw1200-sdd \
+    & Firmware-cxgb3 \
+    & Firmware-dabusb \
     & Firmware-dib0700 \
     & Firmware-e100 \
+    & Firmware-emi26 \
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
@@ -2146,6 +2190,7 @@ LICENSE:${PN} = "\
     & Firmware-ixp4xx \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-keyspan \
     & Firmware-montage \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
@@ -2167,6 +2212,8 @@ LICENSE:${PN} = "\
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
     & Firmware-ti-tspa \
+    & Firmware-tigon \
+    & Firmware-typhoon \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
-- 
2.34.1


