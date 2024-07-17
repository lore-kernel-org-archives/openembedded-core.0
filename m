Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A42AC3DA59
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 02:27:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6587.1721183270668919831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 19:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7928b84b4b=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H1lPSC020915
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 19:27:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwefgb1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 19:27:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 19:27:46 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 19:27:45 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd: fix VERSION_TAG related build error
Date: Wed, 17 Jul 2024 10:27:43 +0800
Message-ID: <20240717022743.843850-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VM1dggsSEO1tpPI6d3rTXsxdvHaDPFlb
X-Proofpoint-GUID: VM1dggsSEO1tpPI6d3rTXsxdvHaDPFlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_04,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=878 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407170018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202134

From: Kai Kang <kai.kang@windriver.com>

The patch 0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch for
systemd-boot is also required by systemd to resolve VERSION_TAG related build
error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd_256.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_256.bb b/meta/recipes-core/systemd/systemd_256.bb
index 9bd59ef39f..cf0608f84d 100644
--- a/meta/recipes-core/systemd/systemd_256.bb
+++ b/meta/recipes-core/systemd/systemd_256.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch \
+           file://0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


