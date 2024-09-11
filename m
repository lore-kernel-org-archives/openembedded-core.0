Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13886EE4985
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 09:39:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.18049.1726047582255254394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 02:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=L+xM8H9l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3kDor021310;
	Wed, 11 Sep 2024 09:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MIUcIOM5G7T5IgZQD4AkRx
	oSFT3mcCLK8IpE/d5OAl0=; b=L+xM8H9lu8VvPs3fDFppzl79Oe7+xQYkgkjBiE
	lz1UQDx2F7rslNr5Vjbl1crwuYFSSDiZQ8C87l6TIIZvBkJVI72NnqtqdyYAWN9K
	ajtG5t9bC3mBESBuF4ti0XOl0kCQi2cLIDh/fpp+W5/fG8PQgWvq4GMAfAuaYgUD
	CzRpfcCWMM9d0cMW1eosdnYpexDuHC/PT9UQ96IDYZWC/F6SeYIV0XZ25qvN3M1p
	E2JcfVyTAK7teR7NDDs9OtBZb1pshOMSUujtBPnNQF0hztelDjG19PiBm+F9ZnFa
	m0HXw5LrhWISc+3u8rpJ6PpWxe7WjNI+SkUmubNfJ1bAiPig==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybps2xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 09:39:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B9de7X009694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 09:39:40 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 02:39:38 -0700
From: Vivek Puar <quic_vpuar@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <quic_vpuar@quicinc.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [PATCH] linux-firmware: upgrade 20240811 -> 20240909
Date: Wed, 11 Sep 2024 15:09:23 +0530
Message-ID: <20240911093923.2087482-1-quic_vpuar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rmVJWMUztUXq3j0MRjB28b3oS45C4ell
X-Proofpoint-GUID: rmVJWMUztUXq3j0MRjB28b3oS45C4ell
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409110073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 09:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204374

License-Update: additional firmwares

The commit [1] adds the venus.mdt symlink in WHENCE file
as a patch, we can remove the patch now as linux-firmware
20240909 already contains this fix as part of WHENCE file.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/commit/91f955b730451855c14c332f1db9844b2d7b0cf2

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-compatibility-with-kernels-before-6.patch | 35 -------------------
 ...20240811.bb => linux-firmware_20240909.bb} |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240811.bb => linux-firmware_20240909.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch
deleted file mode 100644
index b1cb5d1f0b..0000000000
--- a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4728fcc52fdf311048f41766aa27cdf5a4a9e7ad Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Date: Wed, 28 Aug 2024 09:01:14 +0300
-Subject: [PATCH] qcom: vpu: restore compatibility with kernels before 6.6
-
-Linux kernels before 6.6 used qcom/vpu-1.0/venus.mdt as a firmware
-filename for Qualcomm SM8250 devices. Commit 36db650dae03 ("qcom: update
-path for video firmware for vpu-1/2/3.0") moved the VPU firmware, added
-the venus.mbn compatibility symlink, but at the same time it dropped
-the venus.mdt symlink. Bring the historical name back to restore
-compatibility with kernels older than 6.6.
-
-Fixes: 36db650dae03 ("qcom: update path for video firmware for vpu-1/2/3.0")
-Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
-Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/20240828060831.34519-1-dmitry.baryshkov@linaro.org]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
----
- WHENCE | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/WHENCE b/WHENCE
-index 06c3c6fff673..4d9cd340a9dd 100644
---- a/WHENCE
-+++ b/WHENCE
-@@ -5974,6 +5974,7 @@ Version: VIDEO.VE.6.0-00049-PROD-1
- 
- File: qcom/vpu/vpu20_p4.mbn
- Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
-+Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
- 
- Version: VIDEO.VPU.1.0-00087-PROD-1
- 
--- 
-2.45.2
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
index b620a6e249..2aab6204da 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "5d402bd7c43dd2c2835b81bf872aa127"
+WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -240,7 +240,6 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-qcom-vpu-restore-compatibility-with-kernels-before-6.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -248,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "58f1a14b800e3d1967986197d83c81f1ad14b7898a557133c58df0c02c538082"
+SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
 
 inherit allarch
 
-- 
2.34.1


