Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEA1CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 06:08:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4928.1758780495361512323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 23:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qFfh/F8j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13630281d0=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P5ocfU2662771
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 23:08:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iwUkkmXObkHangM4g/el
	l9gKhD21zvYM3yzStsXu1oU=; b=qFfh/F8jCmkpACYMLuvO0Q4pyHQg3XrIxNEJ
	RELktPAR9sWVUlKf5BDpqzBKr4AXosdbzs1xdYcdWGC4r+bO+8qjFqpPATlMZUXb
	JIM6y+Qvfnd44nbnLyv/qv39DOUrgQsDK6EhL1MhevGbVeh74WF3vsc5wff5PVq4
	zs5vn/KOuRUoWpj1boXGqw22k8DpUZUzoVA0dR+zEBb7ExnfGzTgSSmnZ/mEUPhf
	QMASDS/RhhhwUPfpP3I4peeqEc0ecFjlFidkg+9dLIhGZ/7B3VIgjFU7wWSfqT9W
	iiEeQSDNzk9hfiXUQtSqZ+AVyLcVtKw15rQuzM5/gjTPX09zZQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499usfnnhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 23:08:14 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 24 Sep 2025 23:07:32 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: upgrade 9.1.1652 -> 9.1.1683
Date: Thu, 25 Sep 2025 11:37:12 +0530
Message-ID: <20250925060712.3466958-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA1NyBTYWx0ZWRfX/huzuxo66ytq
 16KbmKmcIAQNvi7rqo9ndKiUBrnk6mXos4MxFj3cWFbL56PlW9jtNiDUy4Gvtblent2FQD6seUM
 rUkIGymVQ+yqpcMRTmwy8uUifv6KGSZnWpgubUBHJDcUZu/8hgcKZS/P0A+dD6NqkqXaUQ5H1wZ
 6yFA3Psrhy3y7A3ebiB3dRGkTuK0/gfztwERqfiYnr1MN4qZ+p379gu5s8uw8uMDdFwRGCkqowi
 yWY8cb/dU0Z3+HczZBHI1NgIQqv4he/zbLRj457anCZAli1ZwUPuZipKzH1l4tiBCKby4PHeNPe
 iq/rCVZn1M9Fs970X65ZqLmzYCy510WHpSjlrkviW0N6wXjLi8QDj6sbceKlw0=
X-Authority-Analysis: v=2.4 cv=DrxW+H/+ c=1 sm=1 tr=0 ts=68d4dc4e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=CO6_6GR02mM01ndywr8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FDsfL8lohCxXFAINbqZd9TAOcfzjJDB9
X-Proofpoint-GUID: FDsfL8lohCxXFAINbqZd9TAOcfzjJDB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223999

From: Divya Chellam <divya.chellam@windriver.com>

Handles CVE-2025-9389

Changes between 9.1.1652 -> 9.1.1683
====================================
https://github.com/vim/vim/compare/v9.1.1652...v9.1.1683

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7bcd2d346c..c730f1d0cf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".1652"
-SRCREV = "3e152c76adb9542af86760786d42a0beffe5354b"
+PV .= ".1683"
+SRCREV = "b922b30cfe4c044c83bac3cc908084ed20a83598"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


