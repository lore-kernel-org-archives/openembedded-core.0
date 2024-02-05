Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12919C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 09:01:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.58784.1707123710625305781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 01:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qP+7lF5f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2765499117=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415902nL002870
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 09:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=H8T2/TrvMBcBc6k5zHWWeJjjnJejvMkLQYgQdtBlVSM=; b=
	qP+7lF5f5RF7e9/YHuCHVI77bmUlygEvW6Saqu9tC+FCuaAF5cAK+Zw7Kec1Po04
	jhDdlHdB/bZLdqnfwaxbbTywM2ACTeS8J+QxwrzycpuQMA+6Bfi4n47a7mLL4DgT
	5aTAy/YXt/h/uMLQzNqelWIX+q7gDfzVmp9G84zptN7vGOH40YBOgXDbLFDK3iEg
	kl4THYGXI+HhlRxQ9EKPZHrf+SC6dspxlNRUwzUT7K5hKClZjqwSwPBfn00SJwKd
	9QrIFzBk+D7BuBdz9WtDBGVdRJu0d0+fsLI+QPMsRB//nrdPpfOyCsFVdDgaAYNU
	0Ad+rLAAYHo0zpf2CSUXhw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs79m68-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:01:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 01:01:48 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 01:01:48 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] gnu-config: Update to latest version
Date: Mon, 5 Feb 2024 01:01:47 -0800
Message-ID: <2aedff086dd65d7c237acb3fe463279f107f2f0a.1707123654.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707123654.git.liezhi.yang@windriver.com>
References: <cover.1707123654.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: v62minD-HOWpmkrTbBPy4rKn3fINpwv7
X-Proofpoint-GUID: v62minD-HOWpmkrTbBPy4rKn3fINpwv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=648 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194923

From: Robert Yang <liezhi.yang@windriver.com>

* Git log
948ae97 Update copyright years
471d814 config.sub: recognize nanoMIPS CPUs
ee6ea2f config.guess: recognize ironclad OS
5e2f254 config.sub: recognize ironclad OS
0e4a5b3 config.sub: recognize *-*-uefi
d21518c Recognize the VideoCore 4 processor
a9a369e config.guess: detect LLVM-libc via features.h
5b83c2f config.sub: add LLVM-libc support

The PV 20240101 is from SRCREV 948ae97ca5703224bd3eada06b7a69f40dd15a02.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 718f798a00e..f9d864b9876 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "28ea239c53a2d5d8800c472bc2452eaa16e37af2"
-PV = "20231127+git"
+SRCREV = "948ae97ca5703224bd3eada06b7a69f40dd15a02"
+PV = "20240101+git"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.43.0


