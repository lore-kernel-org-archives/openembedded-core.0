Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8DF1067027
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22417.1773324605467367459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gqz3Ef/P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDEu133876;
	Thu, 12 Mar 2026 14:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BIpCgsNGs6HajCWIl5krt4q2D2wwJ8XWAqCTRNQNjM8=; b=
	Gqz3Ef/PhZRW1KAQwfdk+KtGqtIhydc2z3UnW+WEZHgD1q3503wPOzORIL8YJTbJ
	TvIRkUioHGEnExFm+tytVBQqFlVZDu0JSzIcTv3iyM3i6IIqIMKRM4OWPS9w3D1n
	7BQI4tDUxsoKBVY0/KQxyxLXvoHAAyzrIaLiV0Lm21QslZ8qiIIxKJgzYX4+RNdO
	9xQZHptjgu6mmIfJLR4A5I9THgUoCiJOQEDcnOYrysviObtDLSuX5LvunjBoxAXh
	w0LVVIYqjGp3fjnloX2qO1FSsBU8tytMB83w+7eR384NlH6hH+fSEIzrh7oueDZy
	AQdCUFi0rQcxgpiTKUCecg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:40 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:40 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 4/9] glib/python3/acl: Add pkgconfig to RDEPENDS
Date: Thu, 12 Mar 2026 07:09:34 -0700
Message-ID: <af076df542e7b42d2c3d7ab46188a98b400aac45.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lMKbR6BraC_7nALcAtwzEEOx6PfY-2RK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfXzzFBHsZ9CdZX
 IHyM/xWu3l09w551W7KfhugoWNMFPdaKjrT7nY+PCAVTfPIZBaHzK5ZU/6g/cXI4dDYveHFQJS4
 zwsA/1TJeVcaQqXbxOXwUlJuduN9HapOsd9IuEvb6z9/sfbZGxthGL1+imnDzxvW16/34MH3KGj
 qoKWTzuELfC9J0TuzsmTd97vdmUk2JjQrBzChZS8cTDIdtmCL/a0ewHpZCNaDy6uWAjzEVdWGKe
 XWXy/5t4LJ+dppAmzfanmxV3PwmhtWar5BhWClSQurG1m90UDArLOzwPoLDuBojiP1eNXIoHumn
 br6k3YIrw0ogNeu0HZk/OyJ5ggOLRuYnMNL7ISa61XeE98G8fhqlhgXsRp0XSk0lcNTz4N4eqHd
 2JlpkxoXCqVrPp3YITole5+m7H7Y5inMbWjb6VqenuyxI8BDgYjr15pyDTFKhQQd3PCMGpRNK4/
 Pfjr7MsdCM/2dgxQhvg==
X-Proofpoint-GUID: lMKbR6BraC_7nALcAtwzEEOx6PfY-2RK
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c926 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=cQkoBJ3bwYSCJnzXndgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232957

From: Robert Yang <liezhi.yang@windriver.com>

Fixed issues like::
Error:
 Problem 1: package python3-ptest-3.14.2-r0.cortexa15t2hf_neon from oe-repo requires python3-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by python3-dev-3.14.2-r0.cortexa15t2hf_neon from oe-repo
 Problem 2: package libglib-2.0-ptest-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo requires glib-2.0-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by libglib-2.0-dev-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo
(try to add '--skip-broken' to skip uninstallable packages or '--setopt=optional_metadata_types=filelists' to load additional filelists metadata)

This is because the rpm 6.0.1 can find the pkg-config files (.pc)
provides/requires correctly now, the rpm 4.20.1 couldn't find that.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc            | 2 +-
 meta/recipes-devtools/python/python3_3.14.3.bb | 2 ++
 meta/recipes-support/attr/acl_2.3.2.bb         | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d1f25ef8f2..377c6a323d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -159,7 +159,7 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-dev += "${PN}-utils"
+RDEPENDS:${PN}-dev += "${PN}-utils pkgconfig"
 
 RDEPENDS:${PN}-ptest += "\
             coreutils \
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7047cd8e8d..f3b3e4b0ba 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -495,6 +495,8 @@ RDEPENDS:${PN}-pydoc += "${PN}-io"
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
 RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 
+RDEPENDS:{PN}-dev += "pkgconfig"
+
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index a405cc2692..1a6c9136e9 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -67,4 +67,6 @@ RDEPENDS:${PN}-ptest = "acl \
                         perl-module-posix \
                        "
 
+RDEPENDS:${PN}-dev = "pkgconfig"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


