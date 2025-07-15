Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB88FC83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 05:16:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.713.1752556613731639953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 22:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kKFB6F/C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F3kTu6004484
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 05:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J+Rof9D+f2KlO/+Dpz7nL2
	GswBuumeUFlMoGN0flB+I=; b=kKFB6F/CsIqDDJGyvITkB81T0pQrPic3TNcgyi
	Fpo0VaDDZYqjIiovwLGfaFczhrl8d2fMrRscSq8Wb0ozIGyfKJdia8R3Qq5g9Sa9
	HtmlFwPnWDXvlfuCYlqibcXvAG7iWqFe4kQAVMzyC45RhBO09ltr3MMIiwP2wPPI
	dFMikIKX9sVy4WLl5wvQcueYcrO5C2w/cEtRsv6WxT5J9fOsL5PXNdxNJuL8AFrg
	shCXMrscjbGkM0AnL1u8+V14FqDzMl5z7iUD7hbs6cqzqXy+g3HcJ/0ylPdy72lR
	G2UJC4Bj3/wiJZw+QxA5VPmeWAQkH+i4X/ppGef4qERWEhRg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca0652-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 05:16:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F5Gppb024748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 05:16:51 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 14 Jul 2025 22:16:49 -0700
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20250627 -> 20250708
Date: Tue, 15 Jul 2025 10:46:35 +0530
Message-ID: <20250715051635.1277668-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NiBTYWx0ZWRfX4NVEHp6tTY3h
 8IsWBjsQizdaGPSztGThApQgj0qXuJwOyvWlFSAteZcBMlHD+fiLrIUkLSsdLhPR5Yt5weiISwm
 AEpEuFdqYVpTvDACYevMH9C3Zo9cd7E9itF4cvOCVk9MLRSf9UPT3BJ+9jwcy/v53uCHLWHWmv3
 ZJjleZ43P8WgpgA2pkwBkIVKkMPmLMRK7APW0bauZ2JyMv4f6WndH7Bni2UAOeiRvB1471ROyTe
 +zdIhVCZfcU8oGPX8JcEa5FUj5raaJz2BA3lzMw18ewIz2pq+CpCeEYxDFKh3Mu/wNYk8PzzcQe
 LtdJYfYeovLorlQk7peOu96J2lKIey9cPwDYhGJTJ9Vq7icPFvDBHaDMusmuSY34oignXoEc3EB
 54QFhDGwPqHws9S0FI1KkLakeRq5Re7llHhoq5aENoX6ZieKk4M36R4rCIChx+vjd2cgD74W
X-Proofpoint-GUID: by2AJN5lPrz-SklCBtrSx9e7MARVEqt9
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6875e444 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=rp2wF-6IHRqh8VDX1iQA:9
X-Proofpoint-ORIG-GUID: by2AJN5lPrz-SklCBtrSx9e7MARVEqt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 05:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220264

Add package ${PN}-qcom-sdx61-foxconn-firehose for sdx61 Foxconn vendor
firmware

License-Update: additional files

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ux-firmware_20250627.bb => linux-firmware_20250708.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250627.bb => linux-firmware_20250708.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
index 4bdb36ea67..fd7fa09d61 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250627.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250708.bb
@@ -212,7 +212,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "3b864f69afb6609b4558a074bb428348"
+WHENCE_CHKSUM  = "ac8541e9e1a952358f245afd478ce317"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -328,7 +328,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "edefb1d2a538367abf9558802fee3cd135ebb19a4a5890c8eefb3416a92a6b89"
+SRC_URI[sha256sum] = "6f3efee7f600c201f9b2d675889a4ccdb8cfe56e0d283641796ed10e64c72047"
 
 inherit allarch
 
@@ -573,6 +573,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
+             ${PN}-qcom-sdx61-foxconn-firehose \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8550-audio-tplg \
@@ -1924,6 +1925,7 @@ LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
@@ -2014,6 +2016,7 @@ FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/c
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp* \
                                  ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
+FILES:${PN}-qcom-sdx61-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
@@ -2100,6 +2103,7 @@ RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
-- 
2.34.1


