Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B4AC54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 07:22:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31701.1711524159974925893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 00:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eGuU6FsK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3816ddbad4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R5kwo3008723
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=QE6ruFCa1SxLQ5pu58QS5PZBsCDeFza/wRfbGrcxndE=; b=
	eGuU6FsKqdMPUe2ccs5VeqaFrbERwwMWxQ+BJQhHf1N7ys/FCxIAhkUgtrxrxov8
	enp5RHJEBJ+bF4FVHKxL9r30OBYq8eilfpWENyIuhfFA/CcIkxS03eQq6385NZOm
	6ovXBoi2w6sewLPI1mX7gBxPYnn2Lh4cn3fZ1BL6xIgUPcPjMSJJVvzjrcgo61J3
	kBDJJBcWtTe/Id0Zywt4bA5KpfFvXRqUj8RyCuQ3Ekm6RLlKCgAqqogsfewi8tIJ
	jx2GgTb6AMd8DM9053SMqzNOInYKLYt1JDBroNGKTMsnuu43uL3cdSxb5baK8DEd
	3cpsEZi4CYisKTLYK7KQow==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1m9xmxe2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:22:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 00:22:38 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 27 Mar 2024 00:22:37 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] python3-unittest-automake-output: upgrade to 0.2
Date: Wed, 27 Mar 2024 15:22:36 +0800
Message-ID: <20240327072236.2221619-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327072236.2221619-1-mingli.yu@windriver.com>
References: <20240327072236.2221619-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yZtCTjPvCTRdWINbPDTPBsflj4ptYBHg
X-Proofpoint-ORIG-GUID: yZtCTjPvCTRdWINbPDTPBsflj4ptYBHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=967 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403270049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197549

From: Ross Burton <ross.burton@arm.com>

Specifically this fixes the issue where if a pytest test suite fails
during collection then the errors are hidden.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db0e82135ce73d0d6d55b2c2ac17a3fdec8aca99)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ke-output_0.1.bb => python3-unittest-automake-output_0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-unittest-automake-output_0.1.bb => python3-unittest-automake-output_0.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
rename to meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
index ba58c18df0..1fc6180d0e 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f6f16008d9fb7349f06609329f1ab93b"
 
 SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=https;branch=main"
-SRCREV = "06537edb18f3641c70bce25256f6ecf5f5164ead"
+SRCREV = "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


