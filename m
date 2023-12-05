Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68735C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 06:44:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.94758.1701758652581914583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 22:44:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HsP49ZIk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0703deebc2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B56LceG027775
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Dec 2023 06:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=eRaH+
	JgICucVSEO3f+23UpTvg2VEX0m2FMPVjUSALWI=; b=HsP49ZIkPv1tv5fhHb2eW
	UylUhp32+S26x9C52/OtDyMtHK1Pvv8/PoX7mWg9dHzZaPx43E6cetHsoSkqBeVr
	ezPBjwRW7jZqw897UEYIbLNqCLTS/8iG02Pz6PiGngQTJcV/GruhUu0BUbtOU/w9
	kvQkaBHQ92SEZ5veqwCTpcB3SMOKa7tRE8oudLRKDM+leCRiNAy/zwppMoPLql31
	ojUFJbCD7Gm7o+a1VwXj8DMic74qVhdvsNS/dcruTpEz02bXWRiay3AxP7ytBMaf
	3EV2msJuLWGGNa2t3neYwnW1krVm9YlyN0ZdzX2wmJJP3WJK+KrJdubmv6OyRZOa
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3usss487cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:44:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 22:44:13 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 22:44:13 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] meta: Upgrade gettext and nfs-utils
Date: Mon, 4 Dec 2023 22:44:08 -0800
Message-ID: <cover.1701758555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: R9xQEnIYkQn1XnJOqsi2wCZwDgtk8EQ2
X-Proofpoint-GUID: R9xQEnIYkQn1XnJOqsi2wCZwDgtk8EQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=548
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191799

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit d2c4e8cb85c6a5ca37c7990f879c3b650df5770b:

  vte: Separate out gtk4 pieces of vte into individual packages (2023-12-04 12:45:20 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (2):
  gettext: Upgrade 0.22.3 -> 0.22.4
  nfs-utils: Upgrade 2.6.3 -> 2.6.4

 ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  3 +-
 ....3.bb => gettext-minimal-native_0.22.4.bb} |  0
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../{gettext_0.22.3.bb => gettext_0.22.4.bb}  |  0
 5 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (97%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.3.bb => gettext-minimal-native_0.22.4.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.22.3.bb => gettext_0.22.4.bb} (100%)

-- 
2.42.0


