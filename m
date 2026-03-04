Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D18EDEC0F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 04:54:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11607.1772600060054107239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 20:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jmF1qFxa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244BLrj3916912;
	Wed, 4 Mar 2026 04:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0dGE494noeMwTQhQqOg9mE8fd6cjcQRbZj0gBXhnz2s=; b=
	jmF1qFxa4Sfagp1ZZwPfycqx5pVheveTmXw4iohRvzuS6cpHVMZtoxq+KmSJ7cTo
	msEMGG7pZuSQ9aLZ0lQLsLD7od6ue8K7yPsNvp7D1nMoy6LO9y7VaKblBuUVfKV9
	4tVjybAOvYzSncygoVNQcbo/8Ql/Y9RwWAr98gOFpZG18tCcTolvf/h6ZteVK8kk
	InAW6xUAr43T6tFX9qqIbFECUWKK2LpcIKH8DUjvGPMkCNJNyv5vjqBS5+zNjKie
	20IpqW4gDMcoLbh2BeAgXrnscYmwjvqMpllmBazrHiyvQ0FJ+1ZThqRS6JhKrYhw
	lXujllWV19XJkSWsGMGyPw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mmgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Mar 2026 04:54:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Mar 2026 20:54:16 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Mar 2026 20:54:15 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 2/4] meson: remove python3-pkg-resources from runtime depends
Date: Wed, 4 Mar 2026 12:54:11 +0800
Message-ID: <20260304045413.3265198-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304045413.3265198-1-hongxu.jia@windriver.com>
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a7baf9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=dXvAoEkxAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=XdN4ElEM0hwNoWXxVNQA:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AKlRhPXr_pgDrqtNZxm3qEppfJ7av5Ii
X-Proofpoint-ORIG-GUID: AKlRhPXr_pgDrqtNZxm3qEppfJ7av5Ii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzOSBTYWx0ZWRfX9bFeRA8KW9qh
 Ux7YPsBA4/8r6B2r8x/hxUPZJs6f3IZhdqGQPUO3nDyMBVEUSrrDWstbNTpNHeffrJET/xLrJY5
 UyNJ9Zy1koht/4Xo8hzEG1R7CXsFGyJygVzXHWdv58UBCpFN7W9hoKHhjnsJMKqezFQNqZLShby
 pEbrQzouaH9dHNQkQrvqEJ2BwBW4bFzmFLqLMK4oJKsucUTDyKYoUl8TfFXlRW/izeJlEnxFDO5
 Ik0a8HuIsRaDNdnF5AFJUP5Pl4YxfhuFCNwn7NX3MxFlDvNQCXs9tWscqN+gLEfiKBd8W3pY2ze
 rzzE/QSxRCbMTQ5J18Vz+hwu7qmTgk/V8gN3L0fNAuGDAILAEM7Pehhkb4eHGSMt1ffB+oxOUeq
 //ysGSCakB6HUwMDn6ST7xkBnsciXLbXu3oktCFZZGtX88KcLJv2qFUmPCIfZ4Uy1w50k+Azati
 p7zcfQLwZK5EMXJAoHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 04:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232344

Due to setuptools removes and deprecates pkg_resources in 82.0.0 [1]
meson removes setuptools and uses mesondata instead [2], remove
python3-pkg-resources from runtime depends

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
[2] https://github.com/mesonbuild/meson/commit/05ddd6543d4c4fc33b4c64f26291e73f49733f71

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/meson/meson_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_1.10.1.bb b/meta/recipes-devtools/meson/meson_1.10.1.bb
index 2e94e55749..53c3769e73 100644
--- a/meta/recipes-devtools/meson/meson_1.10.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.10.1.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
 
-RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
+RDEPENDS:${PN} = "ninja python3-modules"
 
 FILES:${PN} += "${datadir}/polkit-1"
 
-- 
2.34.1


