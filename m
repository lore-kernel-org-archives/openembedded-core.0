Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A20EC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:49:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10203.1702306191205146171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 06:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F7iiy9TM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07098ab644=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBK2qA024290
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 06:49:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=NnHy0
	5ZnUJDQ8xwQYgtJX8IgpwVZldRFa2dXsGvmRJw=; b=F7iiy9TMdlCj4cTmgHgLc
	XSR22RXXq2hOFPJuu7DNOL/tYzRa918zLY3BACnRPN6JpR3qgJMTCgpRAOS14a4o
	+WTwQ8MW8KScQVXwSffe6v+bLF3g7iyAnyj2+LZmPAYdqtjl46jzoNikgX3sP3z3
	DxBTMd6jn1I8bb9aFoWpn/d0OxZGZFobes5pnl5he28cdzit+cCYwGHWzGwJZ9WL
	IL9ndKqP3L2Pm5hcuR1qytbs4ggBEDIrZG8mQbBGxOza0sJCqJi738GouVgSDG5U
	0ei/g2kLVtFb8224jwdFIQLGtfcRgpltx0d0fFiqNGLRdX3+0wES1v6oKic3RI79
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj8843-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 06:49:50 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:49:54 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 06:49:54 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 0/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Date: Mon, 11 Dec 2023 06:49:49 -0800
Message-ID: <cover.1702306082.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VIHzz1Prz9YFwK2v1msxIW5pdXsaD0Vx
X-Proofpoint-GUID: VIHzz1Prz9YFwK2v1msxIW5pdXsaD0Vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=686 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 14:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192171

From: Robert Yang <liezhi.yang@windriver.com>

* V3:
  Add the lost patch 0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch

* V2:
  Fix build error with musl

* V1:
  Initial version

The following changes since commit 564339afb73fc52a66c1a08437587cad1c4d46e7:

  useradd: Fix useradd do_populate_sysroot dependency bug (2023-12-10 09:23:58 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (1):
  nfs-utils: Upgrade 2.6.3 -> 2.6.4

 ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
 ...nclude-unistd.h-to-compile-with-musl.patch | 34 ++++++++
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  8 +-
 3 files changed, 38 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (94%)

-- 
2.42.0


