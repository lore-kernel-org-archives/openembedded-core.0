Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE93CE7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 08:50:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9490.1733302247055156569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 00:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2068fa57db=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45i3wc020603
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 00:50:46 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q45ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 00:50:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Dec 2024 00:50:44 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Dec 2024 00:50:44 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] maintainers.inc: Update maintainer for pseudo and rpm
Date: Wed, 4 Dec 2024 00:50:44 -0800
Message-ID: <68ab1e8927b759eab6ced49bb16a8655b1cc811a.1733302188.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1733302188.git.liezhi.yang@windriver.com>
References: <cover.1733302188.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _I3HAmGI0_EMaidfFeDtPaS1PoQaKums
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=675017e6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=QyXUC8HyAAAA:8
 a=W1lfjoNHwFPTQBJtAVIA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: _I3HAmGI0_EMaidfFeDtPaS1PoQaKums
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_05,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=866 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 08:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208273

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4cac0647c2..7105809860 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -596,7 +596,7 @@ RECIPE_MAINTAINER:pn-powertop = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-procps = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-pseudo = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-pseudo = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-psmisc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-psplash = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
@@ -745,7 +745,7 @@ RECIPE_MAINTAINER:pn-rgb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-rpm = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-rpm = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
-- 
2.25.1


