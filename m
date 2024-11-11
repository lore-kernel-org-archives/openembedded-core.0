Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88023D2E9C4
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:57:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.55217.1731315463683348535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10456d5a36=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5fs1T026412
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:57:42 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42svy0hrrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:57:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 00:57:41 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 00:57:40 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [scarthgap][PATCH] enchant2: fix do_fetch error
Date: Mon, 11 Nov 2024 17:55:19 +0800
Message-ID: <20241111095519.3832634-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Zv+/KM7G c=1 sm=1 tr=0 ts=6731c706 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sZohC7m9TrB-qi5WuvShH1eHtd4ZKB8F
X-Proofpoint-ORIG-GUID: sZohC7m9TrB-qi5WuvShH1eHtd4ZKB8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 impostorscore=0 mlxlogscore=832 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411110076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206938

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: enchant2-2.6.7-r0 do_fetch: Failed to fetch URL https://github.com/AbiWord/enchant/releases/download/v2.6.7/enchant-2.6.7.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-support/enchant/enchant2_2.6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.7.bb b/meta/recipes-support/enchant/enchant2_2.6.7.bb
index b31bdc422b..26ff4e8502 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.7.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.7.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc"
 
-GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
+GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
 S = "${WORKDIR}/enchant-${PV}"
 
-- 
2.25.1


