Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB36DCEBF93
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 06:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3723.1763361431583064853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 22:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rYLsrsFl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH3xCAq1234247
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=l04khs95kCAuPyOrcNwRFCk/Op1nsYIDarfg3iAS5SQ=; b=rYLsrsFls77i
	orlmMuQIIcK4QWXvkH4EegUJsFojQz9uaTlhxow680c9PDVncgBSdtrOT3FcGitH
	81jj+hoaLqxmLvCtd8/Ry/hKNSiOmyYb2K1FPkm1olag7y5MXxmD3dof78+9WtZ0
	q2ibiaL/yXsn69zYLqg01i4XWSGub6HAjW1JiU9zjuUHBds7f6FP8OqlelpFv8M+
	OU9DK9oZW3kuQNQ5hezUOKXbfWRJ8FiEvA/LrdTHUbkONzd0IaXN5YEqFWL02ZpX
	bFAb0Cc8K0sqpwnVRW4lARBDN7Lqoby7UjsrMYowmSuWTF/FKQQj+VtpFC24R+HP
	OmzpyE5gMA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2sewm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:11 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 22:37:10 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 22:37:10 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] squashfs-tools: 4.7.2 -> 4.7.4
Date: Sun, 16 Nov 2025 22:37:07 -0800
Message-ID: <c8dfb1dfa3caed0209f5e6155f6c207772777b24.1763361341.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763361341.git.liezhi.yang@windriver.com>
References: <cover.1763361341.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NCBTYWx0ZWRfX9Qy1dOARgI/2
 ZAvTCMkCbN9ShzTIYYRq+u+ZvZgUuUZWTX1Ro+9V5b8zTFodah8WpYX4v8jQw9BS5p2Byy2o/c4
 Uyh5Mu6sLInfA2TmWXY6uFr4anjNxUkz1AwTtsyT2P1hoqgmiW9M/UbwGIPECYZPORP4DvB/Xa7
 CHy90YRhYSJw7WvNP8dHOCMlJ1qkoBIEFnKeiW3GP+QzXLzyf9dxMCkUxyxhMyOJ79wWzwRmG2k
 JXpw9HGaIvP2Gp1rj6H4JQqg05OQ6qo5NMwehZfxfzS24pnZ1K9n3b/i0msFxNR8ZPmWRKO5kdR
 h/tB1iJteb1Fb68haSW9H5VC4NP+O8wT+Yfc+H6zlnwBv2rlDTnbXa4jckjiaORcYSXk+pU7/6z
 gAATGqXc7smY06WcEvGy1nFh6ulc7g==
X-Proofpoint-ORIG-GUID: jrj1qoYOU-Rnqx33_6A2W4EB3O5roYql
X-Proofpoint-GUID: jrj1qoYOU-Rnqx33_6A2W4EB3O5roYql
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ac297 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=wWcaB1ecLTUMnD0-aRMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226485

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb} (96%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
similarity index 96%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
index 8bca98f419..eb3974bcb5 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "99d23a31b471433c51e9c145aeba2ab1536e34df"
+SRCREV = "bad1d213ab6df587d6fa0ef7286180fbf7b86167"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.49.0


