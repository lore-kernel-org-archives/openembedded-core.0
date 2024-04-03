Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB3DCD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 06:51:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5307.1712127103020114922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 23:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QEL1THdo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48239ad55b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4336SU3P022584
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Apr 2024 23:51:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=oFPew
	J3DnBTWyx4XZ2MROLmpAM+8xeNpn7aXOtSKIrg=; b=QEL1THdo3wVc3Rf03nvrQ
	rXp3MacDRD0tggbZZiA1QK34LCqNnpqbwWeVJ1gLMAfBN3LoXFRnjI94emoLb5Aj
	smZAL+wTPYZp2Ted4u/KGG/5AnZABeLhXCfeVGQEhItEcHDfl+5llPiZFDiylS+J
	JETUjjtr/wncST+PoppAk8PfE06VQqwO8oncbPSq/F+pczGi7Xascse9ayvfTDpj
	ucOi/a2WJK7OJjRT/sovJnKMzgFW4ZRZBUmjwC6reAqL0nvJlVCttRHA/zGGmR4j
	2tEvU8vm96vRD0D9fgptOf2MuTBWJqif0qmxxA14/n+VHOKnacUHwms0tpM7HfbM
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6j8fuqjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 23:51:42 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 2 Apr 2024 23:51:40 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] ovmf: update edk2-stable202308 -> edk2-stable202402
Date: Wed, 3 Apr 2024 06:51:24 +0000
Message-ID: <20240403065124.612832-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: aVvbPtsCf23Xi-m_fx8ZSv8lNkp-Mtc1
X-Proofpoint-GUID: aVvbPtsCf23Xi-m_fx8ZSv8lNkp-Mtc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_06,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=673
 spamscore=0 suspectscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 06:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197904

From: Soumya Sambu <soumya.sambu@windriver.com>

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b6..9463ec148b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0004-reproducible.patch \
            "
 
-PV = "edk2-stable202308"
-SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+PV = "edk2-stable202402"
+SRCREV = "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.40.0


