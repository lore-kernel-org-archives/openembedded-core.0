Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE9C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:28:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2122.1676363328085438315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aQQOb+Ue;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E7ghdJ024613
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:28:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ZXA+G4Hkd0jNnURlMITi17HDhyzgbfJEvFrIzeMOkOo=;
 b=aQQOb+UebFn7nEpwR8E2VKPYU+nFaHR1ql9S93YilBrPlusC+rmH/u89drGeCoftvhMT
 DILdslWYWGiX0gOHRQZspsxyPjA9DN3GqXp2yas/f7gwZ8LWXVUFnh6AyStyjMd4ck2I
 oakhZkvqP6LQWLBOEW3auPTAVRRzLOMBxOfGf/zjbev9bmcpoakknhIW9zxEDBw89CTq
 DHFeBmeLla+a5GOBMzsIaS9wJW04rSBJXz6LcMn2+1COtkwDQxtZfNchRHLZjiGK9M2O
 R+71+rsqkE9rEEW6zyzeBRDuGXErna0g/S0IjEUWzZA2TYeoJl88AuMKpVT+h3LrvGVm PQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3npbdrt4mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:28:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Feb 2023 00:28:47 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Feb 2023 00:28:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it is not defined
Date: Tue, 14 Feb 2023 00:28:46 -0800
Message-ID: <cover.1676363203.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _4hxYcGAbz-0CCY0Ldn6NI9CwG2HlaPp
X-Proofpoint-GUID: _4hxYcGAbz-0CCY0Ldn6NI9CwG2HlaPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_05,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=947
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177126

The following changes since commit 0049f6757f6f956fb4cc77b3df6a672c20b53cf4:

  oeqa qemurunner.py: try to avoid reading one character at a time (2023-02-10 09:25:41 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib rbt/feed
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/feed

Robert Yang (1):
  rootfs.py: Set PACKAGE_FEED_ARCHS when it is not defined

 meta/lib/oe/rootfs.py | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

-- 
2.39.0


