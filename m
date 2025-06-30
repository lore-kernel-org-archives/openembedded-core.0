Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3A9C83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 17:06:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.34828.1751272791748524136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h4+4SMmj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DCil032128
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q9+UlodREg6l4orX/px6Q4
	tQpIHsFgwmFVQQFGkjW9I=; b=h4+4SMmjLsIOB8h5i4RTmx/Rs59/WMQbgqVAVX
	uG6G/rhC937/7KC7uf3xvNh7PJFWdKIDqHInlKDoWwIvfv8ZFS58HC4P66THxalu
	tNV/wfizuESDhGWuwVXEYuv6UUjGOyGXI/aHQZr6zWN8T4/jm93WRqEYqULxcdNg
	28ve4mn6u4GsL4FVVmiD98YpBo3O5owRSg7n5jWbbey3eOD5NNuc1K/DYgnpSOz7
	Y8fqNnE96yqCXHfQ5Gx5PQHlXqB77V7MPFrFUnVGkN0bhpZ9+RgfClZ0KvVif1Ap
	w4/6w9v3wtk8iqFuMVEz8/LHRDRaK+0onebIaPAqPLeQk/2g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k44uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:39:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U8dogG019576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:39:50 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Jun 2025 01:39:48 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 1/3] linux-firmware: add missing license
Date: Mon, 30 Jun 2025 14:09:13 +0530
Message-ID: <20250630083915.4023652-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68624d57 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=e7-OVQCEwz8kyGVAez0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA3MCBTYWx0ZWRfX7z2VmXYbMGIn
 ZV6cK/EAFW++7pVDrFjWSb6qTRWPT3zE1zUsnRCNqjv05v5/KyDzYHtMTSy4I8K360a6s83tHnD
 8YTcbJPPpF3FQ3uDi7FyREVq0XFwLLOuHSzgMDH7FbEc+rmIQU31CeeoPh6jEl06lNiVuc9h0DP
 5AqszNzM/k1ihDUSQg9P+Gr0deriQQNiQgLL0/3Cs2m2XcR09EkoUEEvd77uBaaRM9k0NT8BjCZ
 b95mX75KUWM1ks+lPU6DFRnKG2mtjWcXAEV9T3C8vvVnLDOtv6mSEdAHqqRFIaiyJkwrppTAf2f
 X0o2oG0xL0qHhqwHo78repOqZB0lNS9XYXiVqOzi+M9sa35EZfaJx3vyTfIVYuJshiJlyQTr7uR
 jB6I9ojE4YQRytu2Mcmtx7a+JwRX7mSrHouCgg0WpcffP0PCDqIhdO64qRbB0Xv7/xUG045z
X-Proofpoint-ORIG-GUID: eWit7tKAGhVftm1Di6yunzrWqr64xkoV
X-Proofpoint-GUID: eWit7tKAGhVftm1Di6yunzrWqr64xkoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300070
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 17:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219531

Some license were part of the linux-firmware but were not added to the
recipe, so adding those missing license

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../linux-firmware/linux-firmware_20250509.bb | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
index ea75271af8..d3ba239e4c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
@@ -8,13 +8,21 @@ SECTION = "kernel"
 LICENSE = "\
     Firmware-Abilis \
     & Firmware-adsp_sst \
+    & Firmware-aeonsemi \
     & Firmware-agere \
+    & Firmware-airoha \
     & Firmware-amdgpu \
+    & Firmware-amdisp \
+    & Firmware-amdnpu \
+    & Firmware-amd_pmf \
+    & Firmware-amd-sev \
     & Firmware-amd-ucode \
+    & Firmware-amlogic \
     & Firmware-amlogic_vdec \
     & Firmware-amphion_vpu \
     & Firmware-atheros_firmware \
     & Firmware-atmel \
+    & Firmware-bmi260 \
     & Firmware-broadcom_bcm43xx \
     & Firmware-ca0132 \
     & Firmware-cavium \
@@ -33,8 +41,13 @@ LICENSE = "\
     & Firmware-ibt_firmware \
     & Firmware-ice \
     & Firmware-ice_enhanced \
+    & Firmware-intel \
+    & Firmware-intel_vpu \
+    & Firmware-ipu3_firmware \
     & Firmware-it913x \
+    & Firmware-ivsc \
     & Firmware-iwlwifi_firmware \
+    & Firmware-ixp4xx \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
     & Firmware-linaro \
@@ -43,6 +56,7 @@ LICENSE = "\
     & Firmware-Marvell \
     & Firmware-mediatek \
     & Firmware-microchip \
+    & Firmware-montage \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-netronome \
@@ -71,6 +85,7 @@ LICENSE = "\
     & Firmware-siano \
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
+    & Firmware-ti-tspa \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-via_vt6656 \
     & Firmware-wfx \
@@ -78,19 +93,28 @@ LICENSE = "\
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
+    & Firmware-xe \
     & WHENCE \
     & GPL-2.0-or-later \
 "
 
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
+                    file://LICENSE.aeonsemi;md5=521c00bae0077c90d6ffb9ccf66905ae \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
+                    file://LICENSE.airoha;md5=fa3dedb960e2673aea51aa509f7b537d \
                     file://LICENSE.amdgpu;md5=1433dfea38c97a2e563a248a863dcb94 \
+                    file://LICENSE.amdisp;md5=f040a36bf52c9643edb7c009d6f1b141 \
+                    file://LICENSE.amdnpu;md5=ea42c0f38f2d42aad08bd50c822460dc \
+                    file://LICENSE.amd_pmf;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
+                    file://LICENSE.amd-sev;md5=e750538791a8be0b7249c579edefb035 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
+                    file://LICENSE.amlogic;md5=80e4e3f27def8bc4b232009c3a587c07 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
+                    file://LICENSE.bmi260;md5=0008c039ec4281e382bd0cb41b66866c \
                     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
                     file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
@@ -111,8 +135,13 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
                     file://LICENSE.ice_enhanced;md5=f305cfc31b64f95f774f9edd9df0224d \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+                    file://LICENSE.intel;md5=5c22a4ab607349c89ffcbb1595e493f8 \
+                    file://LICENSE.intel_vpu;md5=1e231b7287d5a5018740041c352eb58e \
+                    file://LICENSE.ipu3_firmware;md5=38fe8238c06bf7dcfd0eedbebf452c3b \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
+                    file://LICENSE.ivsc;md5=4f1f696a12c18dd058d3cc51006c640d \
                     file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
+                    file://LICENSE.ixp4xx;md5=ddc5cd6cbc6745343926fe7ecc2cdeb2 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
                     file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
@@ -120,6 +149,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
                     file://LICENCE.microchip;md5=db753b00305675dfbf120e3f24a47277 \
+                    file://LICENSE.montage;md5=12a9f2b351f60fc9374da61c8b2f11ed \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
                     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
                     file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
@@ -149,12 +179,14 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
                     file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
+                    file://LICENCE.ti-tspa;md5=d1a0eb27d0020752040190b9d51ad9be \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
                     file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
+                    file://LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://wfx/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
                     file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
@@ -166,13 +198,21 @@ WHENCE_CHKSUM  = "d85e2f182f489a235400712cbfdb017a"
 # so that the license files will be copied from fetched source
 NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENCE.Abilis"
 NO_GENERIC_LICENSE[Firmware-adsp_sst] = "LICENCE.adsp_sst"
+NO_GENERIC_LICENSE[Firmware-aeonsemi] = "LICENSE.aeonsemi"
 NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
+NO_GENERIC_LICENSE[Firmware-airoha] = "LICENSE.airoha"
 NO_GENERIC_LICENSE[Firmware-amdgpu] = "LICENSE.amdgpu"
+NO_GENERIC_LICENSE[Firmware-amdisp] = "LICENSE.amdisp"
+NO_GENERIC_LICENSE[Firmware-amdnpu] = "LICENSE.amdnpu"
+NO_GENERIC_LICENSE[Firmware-amd_pmf] = "LICENSE.amd_pmf"
+NO_GENERIC_LICENSE[Firmware-amd-sev] = "LICENSE.amd-sev"
 NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
+NO_GENERIC_LICENSE[Firmware-amlogic] = "LICENSE.amlogic"
 NO_GENERIC_LICENSE[Firmware-amlogic_vdec] = "LICENSE.amlogic_vdec"
 NO_GENERIC_LICENSE[Firmware-amphion_vpu] = "LICENSE.amphion_vpu"
 NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
 NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
+NO_GENERIC_LICENSE[Firmware-bmi260] = "LICENSE.bmi260"
 NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
 NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
 NO_GENERIC_LICENSE[Firmware-cadence] = "LICENCE.cadence"
@@ -193,8 +233,13 @@ NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
 NO_GENERIC_LICENSE[Firmware-ice] = "LICENSE.ice"
 NO_GENERIC_LICENSE[Firmware-ice_enhanced] = "LICENSE.ice_enhanced"
 NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
+NO_GENERIC_LICENSE[Firmware-intel] = "LICENSE.intel"
+NO_GENERIC_LICENSE[Firmware-intel_vpu] = "LICENSE.intel_vpu"
+NO_GENERIC_LICENSE[Firmware-ipu3_firmware] = "LICENSE.ipu3_firmware"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
+NO_GENERIC_LICENSE[Firmware-ivsc] = "LICENSE.ivsc"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
+NO_GENERIC_LICENSE[Firmware-ixp4xx] = "LICENSE.ixp4xx"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
 NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
@@ -202,6 +247,7 @@ NO_GENERIC_LICENSE[Firmware-mali_csffw] = "LICENCE.mali_csffw"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
 NO_GENERIC_LICENSE[Firmware-microchip] = "LICENCE.microchip"
+NO_GENERIC_LICENSE[Firmware-montage] = "LICENSE.montage"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
 NO_GENERIC_LICENSE[Firmware-netronome] = "LICENCE.Netronome"
@@ -230,6 +276,7 @@ NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
 NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
 NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
+NO_GENERIC_LICENSE[Firmware-ti-tspa] = "LICENCE.ti-tspa"
 NO_GENERIC_LICENSE[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
 NO_GENERIC_LICENSE[Firmware-via_vt6656] = "LICENCE.via_vt6656"
 NO_GENERIC_LICENSE[Firmware-wfx] = "wfx/LICENCE.wf200"
@@ -237,6 +284,7 @@ NO_GENERIC_LICENSE[Firmware-wl1251] = "LICENCE.wl1251"
 NO_GENERIC_LICENSE[Firmware-xc4000] = "LICENCE.xc4000"
 NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
+NO_GENERIC_LICENSE[Firmware-xe] = "LICENSE.xe"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
@@ -2053,11 +2101,19 @@ RDEPENDS:${PN}-amlogic-vdec = "${PN}-amlogic-vdec-license"
 # Maybe split out to separate packages when needed.
 LICENSE:${PN} = "\
     Firmware-Abilis \
+    & Firmware-aeonsemi \
     & Firmware-agere \
+    & Firmware-airoha \
     & Firmware-amdgpu \
+    & Firmware-amdisp \
+    & Firmware-amdnpu \
+    & Firmware-amd_pmf \
+    & Firmware-amd-sev \
     & Firmware-amd-ucode \
+    & Firmware-amlogic \
     & Firmware-amlogic_vdec \
     & Firmware-atmel \
+    & Firmware-bmi260 \
     & Firmware-ca0132 \
     & Firmware-cavium \
     & Firmware-chelsio_firmware \
@@ -2071,9 +2127,15 @@ LICENSE:${PN} = "\
     & Firmware-go7007 \
     & Firmware-hfi1_firmware \
     & Firmware-ibt_firmware \
+    & Firmware-intel \
+    & Firmware-intel_vpu \
+    & Firmware-ipu3_firmware \
     & Firmware-it913x \
+    & Firmware-ivsc \
+    & Firmware-ixp4xx \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-montage \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-nvidia \
@@ -2093,11 +2155,13 @@ LICENSE:${PN} = "\
     & Firmware-siano \
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
+    & Firmware-ti-tspa \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
+    & Firmware-xe \
     & WHENCE \
 "
 
-- 
2.34.1


