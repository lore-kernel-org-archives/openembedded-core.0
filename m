Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3806C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 07:55:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27892.1701158109390695497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 23:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YtNoDs6E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9696e6ba9e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS5ujiY024661
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=X6q5i
	Y20lCSi833HgKqcMoV3H+0YP+HGu3LgzxKxMMA=; b=YtNoDs6EJCO6vOA4BtTHe
	oxpPkUF997dY/jwyrEk/QKlX0ylq/q5DRYGU6W6X1JWeIXQnMtpIkqRL1OrbXC9l
	2znjIuRJapkYQ6mqu2NSMPk2j5a3vcBTNveOUS/JWEp2PYXi8sC91Zz06gzS8Oez
	k5ieU/hJWvx7XxNSmkPQx7+Wk4PhPF1HkuW+mMn8vgUWjnzCNJRKcO4+JcBxUMg8
	tfFrNOlU9Hv2tuE0/D18AD+yNRP8FfzpJ5sNNs39eWOwsAl176NCL2JEn7mu7rBX
	C0NfvHq92RRRGg53HYzzGSe41NVTZ5ysbc9WBf0UZCPmw/d+ucGB4o4zAsvIRIDN
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk7w6jdg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:08 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 23:55:14 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 23:55:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] Upgrade gnu-config and gettext
Date: Mon, 27 Nov 2023 23:55:05 -0800
Message-ID: <cover.1701157879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BxbCXOmFFAbU_l5G6EXdiHSgLzKXsmgs
X-Proofpoint-ORIG-GUID: BxbCXOmFFAbU_l5G6EXdiHSgLzKXsmgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=856
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191337

The following changes since commit 212affe748e2f628ecf11f26485b07dd303fe6e3:

  Revert "binutils: Fix CVE-2022-47007" (2023-11-23 14:58:06 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (2):
  gnu-config: Update to latest revision
  gettext: Upgrade 0.22 -> 0.22.3

 ...inimal-native_0.22.bb => gettext-minimal-native_0.22.3.bb} | 0
 meta/recipes-core/gettext/gettext-sources.inc                 | 2 +-
 .../gettext/{gettext_0.22.bb => gettext_0.22.3.bb}            | 0
 meta/recipes-devtools/gnu-config/gnu-config_git.bb            | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.bb => gettext-minimal-native_0.22.3.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} (100%)

-- 
2.42.0


