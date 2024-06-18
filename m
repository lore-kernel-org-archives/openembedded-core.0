Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1BEC41513
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 03:30:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.77972.1718681421839903040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 20:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6899ef744a=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I30rZu018274
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 20:30:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682jarj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 20:30:21 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 20:30:20 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 20:30:20 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][master][PATCH 0/2] apt: Take back two old patches
Date: Tue, 18 Jun 2024 11:30:17 +0800
Message-ID: <20240618033019.1181198-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: L7Q_NZfIdPaWAkNKKvmrnONw8QIZb39x
X-Proofpoint-GUID: L7Q_NZfIdPaWAkNKKvmrnONw8QIZb39x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=803
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 03:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200853

From: Changqing Li <changqing.li@windriver.com>

The two old patches are dropped in commit:
https://git.openembedded.org/openembedded-core/commit/?id=f058272de9cba188d96940c8c921cf31727fe4d1

But we still have those issues, so take them back

Changqing Li (2):
  apt-native: don't let dpkg overwrite files by default
  apt: runtime error: filename too long (tmpdir length)

 ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch

-- 
2.25.1


