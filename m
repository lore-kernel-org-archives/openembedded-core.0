Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4CBC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 19:05:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20929.1747335930368706345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 12:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7230692fef=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGBJpp011022
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:05:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca3a2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:05:29 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 15 May 2025 12:05:21 -0700
Received: from pop-os.wrs.com (172.25.44.3) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Thu, 15 May 2025 12:05:21 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] linux: add CVE_STATUS for a chrome* bug
Date: Thu, 15 May 2025 15:05:23 -0400
Message-ID: <20250515190523.1014417-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kRet1C5-fZSIf6i4m1e5tttX4RBcKZLm
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=68263af9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=cnMgyylpYaMF6cixuY8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kRet1C5-fZSIf6i4m1e5tttX4RBcKZLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4OSBTYWx0ZWRfX2tgjlZ0iRWxk 4RRc6+N7zjyrNm/MAYNg82DjKrL9Sbhnh1tLe5bna9yUJKhyED+k7ff79M5cDufPGXqPB7JgcAd JEA1pAQvOsgRI+ffOOSvM117IG3o4GqCust9wIiNbTLKPnk2RDg4YtXxNsPmz1pkTOCByNG8GUb
 9GB9d29tEFGxIdbQPfofGihnZh96qlJTQXCwc9izlMXu7+ct9vL5Lp+Pr0PdUJDnQMIHnfV12VE f4yQwvgzkbVJGZthdnbfBs37ZKaIOF0tOZRMhkumHE1I69XUp3ix2jyn/bdieFLqj/0qI61ZO2z pliwNAdySJ72C5T6tT7iAIvRlFh9WyUu2FrAAlGua15kxbtxhrY0HA/+159djzgrwAHVBYT/m81
 fUINrxNtoVvJ9/UDgdad+knVBFo6A79AkUfppC4KwNHhKUysIFlwekFVkHa0X+N1HLaUyYjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=869 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505150189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 19:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216703

From: Randy MacLeod <Randy.MacLeod@windriver.com>

This is not a linux-yocto CVE yet it shows up in the reports as:
   linux-yocto-custom CVE-2023-3079  0.0  8.8  Unpatched  https://nvd.nist.gov/vuln/detail/CVE-2023-3079

For reference, the CPE says:
  Affects cpe:2.3:o:linux:linux_kernel:-:*:*:*:*:*:*:*
So affects all Linux systems,
  Running on/with cpe:2.3:a:google:chrome:*:*:*:*:*:*:*:*

[ YOCTO #15780 ]

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index f1b7db44b6..80c76433ef 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -133,6 +133,8 @@ CVE_STATUS[CVE-2023-1076] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-2898] = "fixed-version: Fixed from version 6.5rc1"
 
+CVE_STATUS[CVE-2023-3079] = "not-applicable-config: Issue only affects chromium, which is not in linux-yocto"
+
 CVE_STATUS[CVE-2023-3772] = "fixed-version: Fixed from version 6.5rc7"
 
 CVE_STATUS[CVE-2023-3773] = "fixed-version: Fixed from version 6.5rc7"
-- 
2.34.1


