Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EAEC47E49
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:26:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13475.1706174760140761571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ootp254g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1754dbe244=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P70QPh004130
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=oXOdHL2+deyR8vMV/pRzFXeAJNlfsS5BTkFGGdpiv0w=; b=
	ootp254gHJ2oMkhFIVf24LVR/owagXPnQmjRO2OqYTv3QDQbGHgIl1GLEQWu66Tq
	8NGnwq7UN+RwoB7kbfQ3phYGbBS3wiLLCZ3Zf52zkECnIbMn+eIJwSr0BuMmshZX
	mvS9+AOKJOgrseve6+dGEg+By7W2Yd1Qlqje1CVojSF/VQX2Kav3YzyJ2CV9gy2I
	gG0YxEhgDpQkJVMG2bxQW4xBC9zyIOv/Vfz10ecJmet+lcDsa14dbNSZXCY0iFjU
	OqHGoy4LpCjFLg2FIQBGi0PimP9nCJRThvBwg5GyW+0E0NsXHnRP15yVwrOfM+/L
	uC5nTT7C+uPZg5LHJH3wEg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv20bsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:25:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:26:04 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 01:26:03 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] blktool: Make the version consistent
Date: Thu, 25 Jan 2024 17:25:54 +0800
Message-ID: <20240125092554.3657475-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125092554.3657475-1-mingli.yu@windriver.com>
References: <20240125092554.3657475-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ATq7Hlsf3sPDrtMp0t_XvOidbGguFoVJ
X-Proofpoint-ORIG-GUID: ATq7Hlsf3sPDrtMp0t_XvOidbGguFoVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_04,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194312

From: Mingli Yu <mingli.yu@windriver.com>

Update the version to make package version consistent and there is
indeed the source as blktool_4.orig.tar.gz [1].
Before the patch:
  # rpm -qa | grep blktool
  blktool-4+7.1-r0.core2_64
  # blktool
  blktool version 4
  usage: blktool [options] DEVICE COMMAND [args...]
  command list:
  ATA     defect-mgmt { off | on }
  ATA     dev-keep-settings { off | on }
  any     dev-read-ahead { off | on }
  [snip]
After the patch:
  # rpm -qa | grep blktool
  blktool-4-r0.core2_64
  # blktool
  blktool version 4
  usage: blktool [options] DEVICE COMMAND [args...]
  command list:
  ATA     defect-mgmt { off | on }
  ATA     dev-keep-settings { off | on }
  any     dev-read-ahead { off | on }
  [snip]

[1] http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/blktool/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/blktool/{blktool_4-7.1.bb => blktool_4.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/blktool/{blktool_4-7.1.bb => blktool_4.bb} (100%)

diff --git a/meta/recipes-extended/blktool/blktool_4-7.1.bb b/meta/recipes-extended/blktool/blktool_4.bb
similarity index 100%
rename from meta/recipes-extended/blktool/blktool_4-7.1.bb
rename to meta/recipes-extended/blktool/blktool_4.bb
-- 
2.25.1


