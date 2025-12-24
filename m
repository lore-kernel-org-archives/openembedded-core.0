Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77ACE74ADE
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:35:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116792.1766561759227183086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YkbTDli6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4453a06c94=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6Ktem1217350
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 23:35:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QBuHxNL0GhMTmVUojEao
	D7OkX0S20rWnjUZQU1QYjOc=; b=YkbTDli63C3ZI/Wvdacni6geffm7+ZgkKMxD
	PrNG7etnOkYn6B8KqAeX6iegsPuA2fTPLZRBHCpGDtQyr4Q5ZhDmDatUiH4yGbWR
	em5mZeJKRPKMP0nmJ3PKAZffRQbFAfhHnQG1QlytUTwDdiAF3l619Mw8tY1nvdd0
	H7r/dPqZYFxCRgeWp0v2BJ+4Cs1IrpXB2oTYzlFhepryNtlwtGua1JmabCcnNsNF
	n4CaTnTtCU0T8VvQuo65eXVlXjWCwd1AFfcM43ogIyNZ5cTsLESZfJVsMtnBk6Si
	0xWD8quQtq/fZmB98+6MbKQ5LcQIQIPzGqrU+YB6FtkuGDr9ag==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hbnhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 23:35:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 23 Dec 2025 23:35:57 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 23 Dec 2025 23:35:57 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libpam: Correct HOMEPAGE and BUGTRACKER
Date: Wed, 24 Dec 2025 15:35:48 +0800
Message-ID: <20251224073548.3105481-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA2NCBTYWx0ZWRfXwVpE9UwrTBUn
 dxggE9sN7YaqV6hO9BJKgyubJycFiSz2mhPzBzvTphKNi6jsivH4UMMfBVwRImd0RtjSluPxEpy
 GHDvm9N42cJs2WoclDOIsVjdPgfgLX2f7D/TylzVq3bndUsxetRvBC7q/UfMGeZgTClhPVSjDSJ
 w4f6skusQWB5jOw7zY7Z3YWCJVLfgz9Q2qBiXRVDKKKdEYH/5ym900m4CGRGop4VFDmW/VVIi9q
 Us7JdDNUQVHBb7ID78w1TxvbeJ5POfCZusGmBeSTVYq7q1lXsGuoaa8xmgIt0v60ZjKKjAIce8S
 EPuh7ywaSWFxVrzYsAGZZs3RKqvP5Ru/fQeCHzXRTmKQHiD+Znnir4O9x5WajVzn2JQqOvNyYHw
 mBQYJuZNnHaa6bw0nAoIr/as+t9Ff5T2uuCvN7b88pss/LwPQQPqLduV+ETbZutAoCe31artegR
 vAnc5JnmtGf+bVi0BUw==
X-Proofpoint-GUID: x-RkLX3B5tJ1tEnrD5hC42Ynj-7Iq4YW
X-Proofpoint-ORIG-GUID: x-RkLX3B5tJ1tEnrD5hC42Ynj-7Iq4YW
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694b97de cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=sKxjtu__AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=z3LhDTWnhJjg8IlZqwUA:9 a=5JxpkgTMROFhYowhZp3t:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 07:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228524

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 8d9ea27028..8fb67983ee 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -1,8 +1,8 @@
 DISABLE_STATIC = ""
 SUMMARY = "Linux-PAM (Pluggable Authentication Modules)"
 DESCRIPTION = "Linux-PAM (Pluggable Authentication Modules for Linux), a flexible mechanism for authenticating users"
-HOMEPAGE = "https://fedorahosted.org/linux-pam/"
-BUGTRACKER = "https://fedorahosted.org/linux-pam/newticket"
+HOMEPAGE = "https://github.com/linux-pam/linux-pam"
+BUGTRACKER = "https://github.com/linux-pam/linux-pam/issues"
 SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
-- 
2.34.1


