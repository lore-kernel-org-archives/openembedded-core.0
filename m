Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F81ECA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 09:02:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2134.1693558931748071571
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 02:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WdVHnE1V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7608b16c9a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3818hfmN023684
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Sep 2023 09:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=SeBNG
	Cnpk85g/vPo0eGiQ2dYWexQZUw6HRVFTPR27iM=; b=WdVHnE1VHUO/zJPN8nQds
	13flt3V9WTUF5NYygVJXT15J+VEcNNoVofsW86zo/OnyV4jwuvlz7eRJF6fj7mi5
	JroMkHujZUhda7K3dMYk55kztlKNeUGSFv6SZQGerMBjYIbCWkYl0DmssicT2j8u
	s2bU1v4if/puglWVjXBSTEQqGbnppyOXN1RdAQJkrAqpJvCHof+qOh76nUhu5xpE
	+40NZ6BumffKSkIf5CZTgN8Nh8fTGvCyvB2aZUHLzaqnHJkY6owxmlwzrlREKGWp
	ReApFcvlsY+fxwF600fX/rg4bTLliWzDAga9rHaB6bKOL1AuJpXzUc8xGLRSkS2t
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c65r0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 09:02:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 02:02:09 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 02:02:08 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sqlite3: set CVE_STATUS for CVE-2023-36191
Date: Fri, 1 Sep 2023 17:02:08 +0800
Message-ID: <20230901090208.3242013-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 05eg0ULKojVuSKwGEkMuH5QSt1Jktz5M
X-Proofpoint-GUID: 05eg0ULKojVuSKwGEkMuH5QSt1Jktz5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309010084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186995

From: Changqing Li <changqing.li@windriver.com>

The error is a bug. It has been fixed upstream. But it is not a
vulnerability. You may safely ignore the CVE.

Refer:
[1] https://www.sqlite.org/forum/forumpost/19f55ef73b

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/sqlite/sqlite3_3.42.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
index 8783f620f4..b37644580c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6"
 
+CVE_STATUS[CVE-2023-36191] = "The error is a bug. It has been fixed upstream. But it is not a vulnerability"
+
-- 
2.25.1


