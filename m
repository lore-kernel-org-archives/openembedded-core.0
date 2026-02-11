Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A1CEB594B
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 02:02:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9536.1770775329653982382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 18:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CJfUi0SS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=650294ccda=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AN8niS3503357
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:02:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2LihHyEPHMKKt1XFKtMC
	SdoN3lJGPbD09qo8F9UUtx0=; b=CJfUi0SSTQqa4y33wV1+RtflaB2rf3J1qqY9
	2xX+UkdCcrcS5gBdh1Mt1hLdhnEKlXZxCC6wmQiAae0n4SN1Dj1ACqYVmrZnRB24
	JwO+y0MHCaVHMLOm0jFvuRtl9349kHDdmsLeeYGlcepqZgI/KIQ2qeSQsF273bK8
	hneeI6+bM69aUfeejHYNUgAIOT7HIgNdJR4eH5P20rYLqlbSV/sa+d7+Eco+2yTG
	KUR5xDJ/9i7movqxqImxOjg16H0zW1nLVGpYbILfuUll1fAxLrlbUEgiz1UHGVGv
	TZPkCHAF3OxszpRiB7gJL+QeFxZIbg21OhAU2GBy+7x9PVUi5g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj3sg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:02:09 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 18:02:08 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 18:02:07 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: Upgrade 9.1.2128 -> 9.1.2144
Date: Wed, 11 Feb 2026 10:02:06 +0800
Message-ID: <20260211020206.285067-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 52hueBHlVUuMyHIMWmwE4wxVRmkouqRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNSBTYWx0ZWRfX6Q2a97RfbxVJ
 G70YvfJ6zQ2Kn4r9kHd2sgd7Z1UJglA0j58u8F5g+BUn617xLwMUgzVNAiP4iMLtZFkK48GeVXl
 WE4QUF+d+70uZCtqh71sBKwregTtkVcrwy1in9aieEiQFSzIwbpNCVrjeTnKrnP/uC+hRvCRY6u
 g4FpP18nqbVCMygnYRDD6QlLncVU58U2UJQMBf3XR/moNpPuguVB0l/+XWkb2ZHYakwqKxoJjEW
 WvAayNH38HmWWlH0Y0fEBZLxOboScxtqi+323n6oNiEu6Wy94Pq6PV2DOApx16EiFF6TPX2dwX4
 6Um/MLDpvAemRDbI0oEE0QVWjpS5yDLRoW34p7zeh/vYULY/xq9cPEk8QIMQK+5/drQgJla2VqC
 LcKf1dzwMz7/c5WYDeSAa+yiDuFmVaiZO6rr9W130SJsIdIhg1ujOd48/pbqvwgBziIucIx34ec
 yQQniNptYZSN2EiK01w==
X-Proofpoint-GUID: 52hueBHlVUuMyHIMWmwE4wxVRmkouqRO
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698be321 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=mK0bVhQsGTFNh2w7U4IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 02:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230943

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade from 9.1.2128 to 9.1.2144 to include the fix for
CVE-2026-25749 [1] [2].

[1] https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
[2] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a9f0661f2a..d705df5d4c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".2128"
-SRCREV = "392b428d1239e963020b73682cd03f17ffb538b3"
+PV .= ".2144"
+SRCREV = "55c12373f073bacfc97d757e8f4da3daf472e4ac"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


