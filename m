Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FA9CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:10:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11615.1757995847106399568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b7/ps2Ip;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13540941b7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3Fxuw1248862
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 21:10:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5/qlR56PBecp4uNtRLXA
	Ux2OfNjsEx9w3PaqjCo9tmU=; b=b7/ps2Ip795tyj6BFBWK6iZ768jeFIPYdkjt
	aB9kQogiBg+ByVxoRvTuszzsJFvvBG+B/Rhb57q04vdbHTjsCjEqZizKRhXbLhyE
	1N3wkIyLdNSu7R1B8k4QIezZPL+pLCFuQIl4/Iij2BDzI09khLfBmndQZ2YLo8Wk
	gpwK8dWQCL7i7qYkSZA26LcuKItChecVhdWA4rZ6z6Av9Fc6/u8IDcBeHFElIkOC
	3wtA4jDjev/IGNoUh6WatU/CmgjwAsqeF4Igq++PG/dTndwhO4+gsAXeQV5zMmgH
	349ORGryjPkZATSYqMVmdqtpVjxSp9dxO+4BsmRUxOVaTNjZ/A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hjjj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 21:10:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:10:46 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:10:46 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] Upgrade nfs-utils and ccache
Date: Mon, 15 Sep 2025 21:10:55 -0700
Message-ID: <cover.1757995760.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c8e346 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=4fpeO0_5hxSvyLDsPnkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX/6hP8ugIJs0O
 U7UwuiyjnjAKaH2orBSKEIipZd2hoxj4m1utqHGbN6w0yv/KwWcpqMdMhjFzUA5qis0TWkZrjCY
 0vYHJRmhjv14kqR4OGf4Q9mHlkf8pLoTro+CSanLQ0Zbyx2EDexj19dcG9yYeFKKgc6vULD9Msb
 lfP+9t/mTXgZDC1zHZqRnfqUfRY/uGtAR6Cow/smHLjYh2KA43Jv5HIiifd4QkxuiC/0fm9XNnH
 Snvn/TVeDUfjHuyDpoN1jzNiJCUytKadD6B74S8d1rwJvhtqVqWCv9dKMTai1+ej62jSujYW2+K
 NYMCWkbBJ7TkhAIaId3B41cA1ITHMR3mvNxL2CLSVokwW2Xar8WRTuiI+EhMfA=
X-Proofpoint-GUID: Gy1FFJfOpbCU4TuwHU4AxxqaZ0NFOL_k
X-Proofpoint-ORIG-GUID: Gy1FFJfOpbCU4TuwHU4AxxqaZ0NFOL_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223524

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit ba3bd832e810bfb96bfa6fcd52710de185dbee22:

  overlayfs: Disable renaming of network interfaces (2025-09-15 17:52:52 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

Robert Yang (2):
  nfs-utils: 2.8.3 -> 2.8.4
  ccache: 4.11.3 -> 4.12

 .../0002-Fix-build-with-glibc-2.42.patch      | 57 -------------------
 ...{nfs-utils_2.8.3.bb => nfs-utils_2.8.4.bb} |  3 +-
 .../{ccache_4.11.3.bb => ccache_4.12.bb}      |  4 +-
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Fix-build-with-glibc-2.42.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.3.bb => nfs-utils_2.8.4.bb} (97%)
 rename meta/recipes-devtools/ccache/{ccache_4.11.3.bb => ccache_4.12.bb} (88%)

-- 
2.49.0


