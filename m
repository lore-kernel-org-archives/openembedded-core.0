Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAFDC0218A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 06:00:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31352.1737352842951458264
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 22:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311543c3c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K5t1wr013826
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 22:00:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4488f719st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 22:00:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 19 Jan 2025 22:00:41 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 19 Jan 2025 22:00:41 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 0/1] wpa-supplicant: Add CVE id to CVE-2024-3596_00.patch
Date: Sun, 19 Jan 2025 22:00:40 -0800
Message-ID: <cover.1737352688.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2LMPnuS85ErErvzvxagziO8PKU102Z3B
X-Authority-Analysis: v=2.4 cv=GqG4+l1C c=1 sm=1 tr=0 ts=678de68a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=nRkYztHi4iAhUXRIAbsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2LMPnuS85ErErvzvxagziO8PKU102Z3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=744 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501200048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 06:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210020

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 92eea72a25e553c698bee9e3f551a5880bd4631c:

  systemd: enable create-log-dirs (2025-01-13 06:16:07 -0800)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/cve
  https://github.com/robertlinux/yocto/tree/rbt/cve

Robert Yang (1):
  wpa-supplicant: Add CVE id to CVE-2024-3596_00.patch

 .../wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch         | 1 +
 1 file changed, 1 insertion(+)

-- 
2.44.1


