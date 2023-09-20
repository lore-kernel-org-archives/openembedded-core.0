Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AE4CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:06:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33192.1695200780141318948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rKYzTDio;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76272d0ec4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38K6BAfp012069
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 02:06:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=UVIqL
	PVPaq+7HjYfjejA97waYbYAUecMmlISn764YI8=; b=rKYzTDioNvAZIUm9yG7S3
	O8ca3V71+D3GnzVc4d4jdvp+rkdcMcpAkOi4+0qWOaBfv4UUJ6EsWw7O7b5y27Cg
	BzjIkQdQoWQNZhrV+2+YbkHvJktwCB+3dw7XI8By4XpMPr1KKda8cQlsTFhl6kc4
	FF5vxqWDCkjX0OOkiWPUWEYzYwgc2s89DOLxAQucJ7jonkwNWmbpaZQapZd+9dLA
	U0waIi+CA87LUgaPynRdS4xnJOZpcy5aQtoCyenLZeiAerfluTakzW390ytGydpi
	z9n5w2iC5gc0NgM4jz+w4KraFACNSwedXJimLVDhIvtCUwQOpgPBzMvAyxNTN2Xa
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t5bvfu2ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 02:06:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 02:06:18 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 02:06:17 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] multilib.conf: Remove the incorrect PKG_CONFIG_PATH setting
Date: Wed, 20 Sep 2023 17:06:17 +0800
Message-ID: <20230920090617.3414561-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: y6_KTqWf4-FfVJPwM9GzAvVDH4OFhBSS
X-Proofpoint-ORIG-GUID: y6_KTqWf4-FfVJPwM9GzAvVDH4OFhBSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_03,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=714 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309200070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187900

From: Mingli Yu <mingli.yu@windriver.com>

The PKG_CONFIG_PATH is set as ${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig
in multilib.conf. But there is no ${WORKDIR}/recipe-sysroot when multilib
enabled such as below:
  $ bitbake lib32-php
  There is no ${WORKDIR}/recipe-sysroot and only ${WORKDIR}/lib32-recipe-sysroot
exists which already covered in meta/conf/bitbake.conf as below:
export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"

So remove the incorrect setting in multilib.conf.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/multilib.conf | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index ef3605a73d..09546315b8 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -22,15 +22,6 @@ MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
 
 OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 
-# When multilib is enabled, allarch recipes will be installed into the MACHINE
-# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-config to
-# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
-# inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
-# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
-PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
-PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
-PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
-
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
 NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.25.1


