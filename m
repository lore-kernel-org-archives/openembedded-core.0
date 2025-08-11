Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE71C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 11:24:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.45554.1754911479580481658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 04:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hbcFY2LQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dIwb005398
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=roVcpgG4AiaWyiLzGD0N/S
	AEvyvmRaYfzXXzvpJoHI8=; b=hbcFY2LQmq73ZAwUtkyhWvfzZc9vL4ykFZDjtM
	uzthw8A93N2bBbAu9G53ayuo0TwDlSh6tDLKQKTtghc/L/9LvqBrh371oswZLza9
	BxtcP027pVJpl6ZKZ7eon1Y3KvsGEYQJy+HnelIFuWdxFPt959rvRke/ut25kkvu
	OOXnSrCyFO+5hE5cJWIZ6WtG9yUStBWHH+Ui6GCgXvFXl+GpJkDEjq3BRN9h4BL3
	mrx24+nTbK4Hs8d6OGelcarop6n/2nzG3fAMYRzl16pfHs1S1wInuVbwI4Ho7fwC
	tLdiiHVLjuj0WdPIL3DqodC3Ht7NRPUW+n4RQ1tdr7pDCjwQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx2dx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:24:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BBObS0017255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:24:37 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 11 Aug 2025 04:24:35 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20250708 -> 20250808
Date: Mon, 11 Aug 2025 16:54:20 +0530
Message-ID: <20250811112420.2834013-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+uMJk2mcTWUi
 zt7D3LIqaZDDnxTBJFbP9C2Tud5+IPOHYe6YXEoQTa8nxzTecjLDYtMg7vB3nAjrdzWdzzcKe+b
 dwkWr8nIVfDUUK/THerI3VFsY58Gr6Q7e1WYzJGeTOZNxDusiJx5Vx0fjqgtBUfFPso7O8LMkvx
 7sxx6M92ayGSVuIrJHDOl33KkhFjTze8znuXZdPeQhEARODu79vDudlgywlz4HJj66l/tu6SoyI
 PXpWju/ZzlO/0iGvpP1e2oCGGCcjXeolESTbizg1CjeuHNnYWggFiec0BWKHPR2rLZk3cizOaER
 7kJQhj67he4WWbGmMvqybif1oaktKxwFg2OmC8ee26CkADcCDdYyQW9ATiIZ4uy44EOr0LosOb4
 V5bfxsW2
X-Proofpoint-GUID: CtvlB3oUqsvFMDMRlUJubkZ0prIszRMM
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=6899d2f6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=vYqJRkuJn2O_YXXrUJoA:9
X-Proofpoint-ORIG-GUID: CtvlB3oUqsvFMDMRlUJubkZ0prIszRMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221733

Add package ${PN}-qcom-adreno-a612 to include RGMU firmware for QCS615
chipset. Extend QCS6490 RB3Gen2 firmware to include audio topology.

Add new LICENSE files.

License-Update: additional files

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20250708.bb => linux-firmware_20250808.bb} | 84 +++++++++++++++++--
 1 file changed, 78 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250708.bb => linux-firmware_20250808.bb} (96%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
similarity index 96%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
index fd7fa09d61..7c413e2b7c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
@@ -23,6 +23,7 @@ LICENSE = "\
     & Firmware-amphion_vpu \
     & Firmware-atheros_firmware \
     & Firmware-atmel \
+    & Firmware-bfa \
     & Firmware-bmi260 \
     & Firmware-bnx2 \
     & Firmware-bnx2x \
@@ -32,22 +33,27 @@ LICENSE = "\
     & Firmware-chelsio_firmware \
     & Firmware-cirrus \
     & Firmware-cnm \
+    & Firmware-conexant \
     & Firmware-cw1200 \
     & Firmware-cw1200-sdd \
     & Firmware-cxgb3 \
     & Firmware-cypress \
     & Firmware-dabusb \
     & Firmware-dib0700 \
+    & Firmware-drxk \
     & Firmware-e100 \
     & Firmware-emi26 \
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
+    & Firmware-go7007-s2250 \
     & Firmware-hfi1_firmware \
     & Firmware-i915 \
+    & Firmware-ib_qib \
     & Firmware-ibt_firmware \
     & Firmware-ice \
     & Firmware-ice_enhanced \
+    & Firmware-inside-secure \
     & Firmware-intel \
     & Firmware-intel_vpu \
     & Firmware-ipu3_firmware \
@@ -63,6 +69,8 @@ LICENSE = "\
     & Firmware-mali_csffw \
     & Firmware-Marvell \
     & Firmware-mediatek \
+    & Firmware-mellanox \
+    & Firmware-mga \
     & Firmware-microchip \
     & Firmware-montage \
     & Firmware-moxa \
@@ -79,25 +87,34 @@ LICENSE = "\
     & Firmware-qcom \
     & Firmware-qcom-2 \
     & Firmware-qcom-yamato \
+    & Firmware-qed \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
     & Firmware-qualcommAthos_ar3k \
     & Firmware-qualcommAthos_ath10k \
+    & Firmware-r8169 \
     & Firmware-r8a779x_usb3 \
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
     & Firmware-rockchip \
+    & Firmware-rp2 \
+    & Firmware-rsi \
+    & Firmware-rt1320 \
     & Firmware-rtlwifi_firmware \
     & Firmware-imx-sdma_firmware \
+    & Firmware-s5p-mfc \
     & Firmware-siano \
+    & Firmware-tehuti \
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
     & Firmware-ti-tspa \
     & Firmware-tigon \
+    & Firmware-tlg2300 \
     & Firmware-typhoon \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-via_vt6656 \
+    & Firmware-vxge \
     & Firmware-wfx \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
@@ -125,6 +142,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
+                    file://LICENSE.bfa;md5=ff822aa5edf56d0159acfe5a49a5be2c \
                     file://LICENSE.bmi260;md5=0008c039ec4281e382bd0cb41b66866c \
                     file://LICENCE.bnx2;md5=d156fb810e162c4b0065ec8316efcd38 \
                     file://LICENCE.bnx2x;md5=9494ec1462e461dec5322d1a1f0adf81 \
@@ -135,22 +153,27 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
                     file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
                     file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36 \
+                    file://LICENSE.conexant;md5=768b10e3fc2bbc0725174a7d9e164c26 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cw1200-sdd;md5=7e99e5e15c3668e96504a82ebd532ee4 \
                     file://LICENCE.cxgb3;md5=1cf82d9e2a4b301e20c7936e61cd0e45 \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENCE.dabusb;md5=fd785fc5f935c950a3423e4b1b996657 \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
+                    file://LICENSE.drxk;md5=87a325e2e9740837036af3f04efa0d0f \
                     file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
                     file://LICENCE.emi26;md5=2d1cd6e732b81824fe2f0fbf595b1413 \
                     file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
                     file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
                     file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
+                    file://LICENCE.go7007-s2250;md5=2273a7fed8223f6d3ef3e65f508f22eb \
                     file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
                     file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
+                    file://LICENSE.ib_qib;md5=b909c90fca84c507766601ecb6f3b9d9 \
                     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
                     file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
                     file://LICENSE.ice_enhanced;md5=f305cfc31b64f95f774f9edd9df0224d \
+                    file://LICENCE.inside-secure;md5=71f2eb7c1d10ccbd198e2459adef6afa \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENSE.intel;md5=5c22a4ab607349c89ffcbb1595e493f8 \
                     file://LICENSE.intel_vpu;md5=1e231b7287d5a5018740041c352eb58e \
@@ -166,6 +189,8 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.mali_csffw;md5=e064aaec4d21ef856e1b76a6f5dc435f \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
+                    file://LICENSE.mellanox;md5=646741eee66a7925edc538650895b80c \
+                    file://LICENSE.mga;md5=6191fc1ff8183b00515c36351ec24150 \
                     file://LICENCE.microchip;md5=db753b00305675dfbf120e3f24a47277 \
                     file://LICENSE.montage;md5=12a9f2b351f60fc9374da61c8b2f11ed \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
@@ -183,25 +208,34 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
                     file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0 \
                     file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
+                    file://LICENSE.qed;md5=939ee0945e6efa0ce21f6d8a21c6564c \
                     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
                     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
                     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
                     file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
+                    file://LICENSE.r8169;md5=a9909160e6bd81b8770711918b418ef2 \
                     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
                     file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
                     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
                     file://LICENCE.rockchip;md5=5fd70190c5ed39734baceada8ecced26 \
+                    file://LICENSE.rp2;md5=de5109226a643a1cdf706a633e993514 \
+                    file://LICENSE.rsi;md5=a560f4b285f0733de1a3986ae847675d \
+                    file://LICENSE.rt1320;md5=b44dab4314655e8f015009548dc4f962 \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
+                    file://LICENSE.s5p-mfc;md5=5bdad20069b5c0268245609045374639 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
+                    file://LICENSE.tehuti;md5=2b0ebf8cdc4a1c4a49b8ad18c7cb2492 \
                     file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ti-tspa;md5=d1a0eb27d0020752040190b9d51ad9be \
                     file://LICENCE.tigon;md5=49d104a32337f4a4c89478a86ce9ae4f \
+                    file://LICENSE.tlg2300;md5=4b23ec9ced919a0bf2f7c56dac31b2b7 \
                     file://LICENCE.typhoon;md5=43b30243a6bda91f54c8e00600c4add5 \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
+                    file://LICENSE.vxge;md5=91e196370d9927bdf7f566e47ea2c558 \
                     file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
@@ -212,7 +246,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ac8541e9e1a952358f245afd478ce317"
+WHENCE_CHKSUM  = "8417bc58fbaf0ae741a2bc8214db61f4"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -233,6 +267,7 @@ NO_GENERIC_LICENSE[Firmware-amlogic_vdec] = "LICENSE.amlogic_vdec"
 NO_GENERIC_LICENSE[Firmware-amphion_vpu] = "LICENSE.amphion_vpu"
 NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
 NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
+NO_GENERIC_LICENSE[Firmware-bfa] = "LICENSE.bfa"
 NO_GENERIC_LICENSE[Firmware-bmi260] = "LICENSE.bmi260"
 NO_GENERIC_LICENSE[Firmware-bnx2] = "LICENCE.bnx2"
 NO_GENERIC_LICENSE[Firmware-bnx2x] = "LICENCE.bnx2x"
@@ -243,22 +278,27 @@ NO_GENERIC_LICENSE[Firmware-cavium] = "LICENCE.cavium"
 NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
 NO_GENERIC_LICENSE[Firmware-cirrus] = "LICENSE.cirrus"
 NO_GENERIC_LICENSE[Firmware-cnm] = "LICENCE.cnm"
+NO_GENERIC_LICENSE[Firmware-conexant] = "LICENSE.conexant"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
 NO_GENERIC_LICENSE[Firmware-cw1200-sdd] = "LICENCE.cw1200-sdd"
 NO_GENERIC_LICENSE[Firmware-cxgb3] = "LICENCE.cxgb3"
 NO_GENERIC_LICENSE[Firmware-cypress] = "LICENCE.cypress"
 NO_GENERIC_LICENSE[Firmware-dabusb] = "LICENCE.dabusb"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
+NO_GENERIC_LICENSE[Firmware-drxk] = "LICENSE.drxk"
 NO_GENERIC_LICENSE[Firmware-e100] = "LICENCE.e100"
 NO_GENERIC_LICENSE[Firmware-emi26] = "LICENCE.emi26"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] = "LICENCE.ene_firmware"
 NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] = "LICENCE.go7007"
+NO_GENERIC_LICENSE[Firmware-go7007-s2250] = "LICENCE.go7007-s2250"
 NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
+NO_GENERIC_LICENSE[Firmware-ib_qib] = "LICENSE.ib_qib"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
 NO_GENERIC_LICENSE[Firmware-ice] = "LICENSE.ice"
 NO_GENERIC_LICENSE[Firmware-ice_enhanced] = "LICENSE.ice_enhanced"
+NO_GENERIC_LICENSE[Firmware-inside-secure] = "LICENCE.inside-secure"
 NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-intel] = "LICENSE.intel"
 NO_GENERIC_LICENSE[Firmware-intel_vpu] = "LICENSE.intel_vpu"
@@ -274,6 +314,8 @@ NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-mali_csffw] = "LICENCE.mali_csffw"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
+NO_GENERIC_LICENSE[Firmware-mellanox] = "LICENSE.mellanox"
+NO_GENERIC_LICENSE[Firmware-mga] = "LICENSE.mga"
 NO_GENERIC_LICENSE[Firmware-microchip] = "LICENCE.microchip"
 NO_GENERIC_LICENSE[Firmware-montage] = "LICENSE.montage"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
@@ -290,25 +332,34 @@ NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
 NO_GENERIC_LICENSE[Firmware-qcom-2] = "LICENSE.qcom-2"
 NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
+NO_GENERIC_LICENSE[Firmware-qed] = "LICENSE.qed"
 NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ath10k] = "LICENSE.QualcommAtheros_ath10k"
+NO_GENERIC_LICENSE[Firmware-r8169] = "LICENSE.r8169"
 NO_GENERIC_LICENSE[Firmware-r8a779x_usb3] = "LICENCE.r8a779x_usb3"
 NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
 NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-rockchip] = "LICENCE.rockchip"
+NO_GENERIC_LICENSE[Firmware-rp2] = "LICENSE.rp2"
+NO_GENERIC_LICENSE[Firmware-rsi] = "LICENSE.rsi"
+NO_GENERIC_LICENSE[Firmware-rt1320] = "LICENSE.rt1320"
 NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
+NO_GENERIC_LICENSE[Firmware-s5p-mfc] = "LICENSE.s5p-mfc"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
+NO_GENERIC_LICENSE[Firmware-tehuti] = "LICENSE.tehuti"
 NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
 NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
 NO_GENERIC_LICENSE[Firmware-ti-tspa] = "LICENCE.ti-tspa"
 NO_GENERIC_LICENSE[Firmware-tigon] = "LICENCE.tigon"
+NO_GENERIC_LICENSE[Firmware-tlg2300] = "LICENSE.tlg2300"
 NO_GENERIC_LICENSE[Firmware-typhoon] = "LICENCE.typhoon"
 NO_GENERIC_LICENSE[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
 NO_GENERIC_LICENSE[Firmware-via_vt6656] = "LICENCE.via_vt6656"
+NO_GENERIC_LICENSE[Firmware-vxge] = "LICENSE.vxge"
 NO_GENERIC_LICENSE[Firmware-wfx] = "wfx/LICENCE.wf200"
 NO_GENERIC_LICENSE[Firmware-wl1251] = "LICENCE.wl1251"
 NO_GENERIC_LICENSE[Firmware-xc4000] = "LICENCE.xc4000"
@@ -328,7 +379,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "6f3efee7f600c201f9b2d675889a4ccdb8cfe56e0d283641796ed10e64c72047"
+SRC_URI[sha256sum] = "c029551b45a15926c9d7a5df1a0b540044064f19157c57fc11d91fd0aade837f"
 
 inherit allarch
 
@@ -551,8 +602,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
-             ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
-             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g715 ${PN}-qcom-adreno-g750 \
+             ${PN}-qcom-adreno-a612 ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 \
+             ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
+             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g715 ${PN}-qcom-adreno-g750 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
@@ -1876,6 +1928,7 @@ LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a612 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a623 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
@@ -1965,6 +2018,7 @@ FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw*
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw* ${nonarch_base_libdir}/firmware/a300_*.fw*"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
+FILES:${PN}-qcom-adreno-a612 = "${nonarch_base_libdir}/firmware/qcom/a612*.*"
 FILES:${PN}-qcom-adreno-a623 = "${nonarch_base_libdir}/firmware/qcom/a623*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
@@ -1983,11 +2037,11 @@ FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
 FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/a660_zap.mbn*"
-FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn"
+FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin*"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
-FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcm6490/qupv3fw.elf*"
+FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
@@ -2048,6 +2102,7 @@ RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a612 = "${PN}-qcom-license ${PN}-qcom-adreno-a630"
 RDEPENDS:${PN}-qcom-adreno-a623 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
@@ -2166,6 +2221,7 @@ LICENSE:${PN} = "\
     & Firmware-amlogic \
     & Firmware-amlogic_vdec \
     & Firmware-atmel \
+    & Firmware-bfa \
     & Firmware-bmi260 \
     & Firmware-bnx2 \
     & Firmware-bnx2x \
@@ -2174,18 +2230,23 @@ LICENSE:${PN} = "\
     & Firmware-chelsio_firmware \
     & Firmware-cirrus \
     & Firmware-cnm \
+    & Firmware-conexant \
     & Firmware-cw1200 \
     & Firmware-cw1200-sdd \
     & Firmware-cxgb3 \
     & Firmware-dabusb \
     & Firmware-dib0700 \
+    & Firmware-drxk \
     & Firmware-e100 \
     & Firmware-emi26 \
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
+    & Firmware-go7007-s2250 \
     & Firmware-hfi1_firmware \
+    & Firmware-ib_qib \
     & Firmware-ibt_firmware \
+    & Firmware-inside-secure \
     & Firmware-intel \
     & Firmware-intel_vpu \
     & Firmware-ipu3_firmware \
@@ -2195,6 +2256,8 @@ LICENSE:${PN} = "\
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
     & Firmware-keyspan \
+    & Firmware-mellanox \
+    & Firmware-mga \
     & Firmware-montage \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
@@ -2205,20 +2268,29 @@ LICENSE:${PN} = "\
     & Firmware-phanfw \
     & Firmware-qat \
     & Firmware-qcom \
+    & Firmware-qed \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
+    & Firmware-r8169 \
     & Firmware-r8a779x_usb3 \
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
+    & Firmware-rp2 \
+    & Firmware-rsi \
+    & Firmware-rt1320 \
     & Firmware-imx-sdma_firmware \
+    & Firmware-s5p-mfc \
     & Firmware-siano \
+    & Firmware-tehuti \
     & Firmware-ti-connectivity \
     & Firmware-ti-keystone \
     & Firmware-ti-tspa \
     & Firmware-tigon \
+    & Firmware-tlg2300 \
     & Firmware-typhoon \
     & Firmware-ueagle-atm4-firmware \
+    & Firmware-vxge \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
     & Firmware-xc5000 \
-- 
2.34.1


