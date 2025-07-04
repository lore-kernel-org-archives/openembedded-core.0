Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F61C83F0B
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 06:26:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6717.1751610382561886204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 23:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9280fa9c81=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644e3pv002077
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jul 2025 06:26:21 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1eh8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:26:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 23:25:23 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 23:25:23 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] Upgrade git and pseudo
Date: Thu, 3 Jul 2025 23:26:18 -0700
Message-ID: <cover.1751610337.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0OCBTYWx0ZWRfXw2qx77R6M/d+ jGDa+PMb2MzE+YmWLa2VDukx0CuUOZfJuQgjRQPhsIGwKWJo/pGO0zOadBywrds+KPOiFkfPcko fDPx+ZUodn8mg/J4Q2DJCukbL0KWta9wkPU9LdmlfM1jdR+pgR6m+aRp72cQjN/DkK5LgnWV7aH
 HUvCJHbOkzHzZoiSYU7s6q0m6BbVJhl5u/OP6TFp+rUcev2G1/LDM3j7iEPYZp1lBrAjeRs3BU9 6HIS2nnmqItXL2uWyuggqqH9LjgcRg6dRG0ZBQaORSgdKBneLZDeiNGS5rj4qK0cm1bIT11vrS4 n0Z7stiVdSULNwwBgdm6hWB93tztxps4ZOBgXy1+nm806SGwZHY5Jtg5Y3QMu0kJ54vkC3ZUGbV
 kmRKiXtsAt5qBOuOLxn1AUlsOX7zkQB4vRbr+FMA/1Lg36vPf2jXB0hh2dPDatmV/uhIUV4E
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6867740d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Pro1e0earpsdpecvKqcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mkxpxyZOczQ6lL99f5byFmyPHN77RiYx
X-Proofpoint-ORIG-GUID: mkxpxyZOczQ6lL99f5byFmyPHN77RiYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=877 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219900

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 77a93e8cf1da4231341c56f64f9d4d474f9f2bb7:

  kernelsrc/perf: clean up package version while using kernel source (2025-07-03 10:40:14 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

Robert Yang (2):
  git: 2.49.0 -> 2.50.0
  pseudo: 1.9.0 -> 1.9.2

 meta/recipes-devtools/git/git/fixsort.patch      | 16 ++++++++--------
 .../git/{git_2.49.0.bb => git_2.50.0.bb}         |  2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb       |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/git/{git_2.49.0.bb => git_2.50.0.bb} (98%)

-- 
2.49.0


