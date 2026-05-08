Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2865FCD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:45:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15477.1778251505763564687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a7X0WZbl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9588382931=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648B4eeZ470902
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 14:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=eFOSc4GP0xuIBrSXDsAvzlqHpWMGhKWzEUVUzmgTKv8=; b=a7X0WZbluyqu
	bN/wSIpcgxrWHAyQ+EnisnVzp9oVsvSS8oiKLtNcBpoNRKcMRq2dGdypVNwPWfCe
	YT+UKV2BVmF864AtKiDZw/IXS9B1njbJv5uyaWGmU5PUUnaFl6pPABNzCVy9p+bR
	IFwPW7RUvjqaQl63qhAdwHUa6zjosLN/hH4/1PXP1DLH3i08YfFlT0Dx+EXeh7Jl
	XsCLYqzkP2KGj2bhwhTPN05SbQgnU6srQA4E4Rf67wgyLow6zR/f/0mKcl7fSmTA
	zxssi/JZXaxT8GckoTtHyZmlEK0gR4ZVHXdG+cJIKJVS04iy+vuDaKE30sNPdb8M
	iSTTa6tsqA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1cbvrc3v-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:45:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 8 May 2026 07:45:02 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 8 May 2026 07:45:02 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] nfs-utils: 2.8.7 -> 2.9.1
Date: Fri, 8 May 2026 07:45:00 -0700
Message-ID: <408e124b2d1340435c9c408879aa3ae8b966eef9.1778251103.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1778251103.git.liezhi.yang@windriver.com>
References: <cover.1778251103.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ciAOXeOAMgOuQw2v0a3mqfS7FD7QV3gj
X-Proofpoint-GUID: ciAOXeOAMgOuQw2v0a3mqfS7FD7QV3gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MCBTYWx0ZWRfXzvslcXd9w0vo
 M7r+X2cYAWe7Oa1z7qAtaI2T5jGm+Evh3n4k98oSZ81nZ5GhlkPjESQ5Yn9rFtXge80aV1waOeH
 uPRk0sUR7kbTjOJT5xqdYCqCn3a8LNB39iyjWMXyryqa3GFfaSoE1t+kjaAzpSOAjptVILDYew5
 BgoVcJ38m38hsHnCM+6HiiO9emQ4U97WId5/33PCw9Jbb+fihzZdn3hAKgGl7fehY8tVUHrZeQ5
 ZM8wfglAWEkCIxSKMCNuVA15dsnVYI4XaHLFRVSb+ZyWQmI5x7wEMn/C8MjGIMOdR2Pypb0ae/L
 P05COdMQOQQctWI7TBk9r8doJ7E8aCQ2dU9KLKNSlQv0dMcMhIywnLsg4FCRNw5c7G8p/D2qSlP
 skdDO7VA+uPTvK6h3lRYbEvonXOscYlM6iEwzoVuXTHEtDPn+B0oTQEakQ+oraVD2uQV/QOou09
 dBPX+aLkgRVDC/r8gMw==
X-Authority-Analysis: v=2.4 cv=U9iiy+ru c=1 sm=1 tr=0 ts=69fdf6f0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=GqB59jVI8Mvp-EO1NFwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236721

From: Robert Yang <liezhi.yang@windriver.com>

* Add libnl to DEPENDS to fix:
  configure: error: Package requirements (libnl-3.0 >= 3.1) were not met:

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 7693a88682..39a747d344 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2"
+DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2 libnl"
 RDEPENDS:${PN} = "netbase ${PN}-client"
 RRECOMMENDS:${PN} = "kernel-module-nfsd"
 
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae"
+SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.49.0


