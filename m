Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EA3CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:21:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.741.1755793275186523925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IAmClQbU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L9NNvQ2165479
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 09:21:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=AQanL/53aM0kq+uK+KfWF6vkRXemuJkY1eWDE5Gg8Do=; b=IAmClQbUKp4/
	Osz4atUOs2qWcA0IsKjmT2FZTE7YMoVTmDJUbx02AootzofenAzwKqiqG/ebOBRS
	PCMaVxFluz4AKlPVNPk+lJrjdMGWg6nKM86ghZaf45RpQFkmwqFF5vSSrk2kfdnI
	uI5xrK5uKJ1CW4cdDGCxZK9DBj4TnsJ/5Vitr+I8yINnIDPASf3cSUTMRrzPYMtO
	/wZLNAA2pgEg//GHagXkS6xepB6SLre8/58zJmpr6f7F0ySVb+HmJVDDz2k3tEUl
	U2LL5HpGSP8No8UH1VUbxj7WN72YbB2grOLTS9k77mow3vOuA5kV4mo0x8fmH3tU
	LiFyZp74rw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydqahsh-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 09:21:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:33 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:34 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 10/10] gstreamer1.0: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:18 +0530
Message-ID: <20250821160418.495625-10-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzNSBTYWx0ZWRfX66PZMNfF14Po
 OrbGGLU0m+4/nJJiZs+MCnukiWWUbqkGV2TAT3O/TXN7i+JTZkEuK1EhtI2+Rr6MlTsoQ98655a
 5qe5sbeYBJy4FwvQS/3VaIYysk4iSQhuavXAiE4c0r6HCrthrcnLgMvl3ME2RFTFcsqSl9Awa9j
 WPpkRTnxEWJTiYznHASfEbi9l70MmZC09JndPwiVnHcG48Yak8v5VAcjp00evLktFQDQp7UqYWN
 1W4JFXvbN31PMVyOt4OqSj9VoWAGoXGJwPgs1SUvZSR46kRgwIRWwqMhJzQ/5az5QmNXkbmH1Bd
 +70l4o3oHwnwhRPwSqWk5aE99JL+JZ7GPYoJkDJiIyHyRwlUcc2q2/DT9x0S3PVqT5iIin710P4
 AYMVoRaM0y721xcdSjYGZxw3QvDZMg==
X-Proofpoint-GUID: mgKUvnr42FqbzmahrmPHxCuLmIByo65X
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a7477a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=K7s49dHOhrXEnj7qje4A:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mgKUvnr42FqbzmahrmPHxCuLmIByo65X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222274

From: Archana Polampalli <archana.polampalli@windriver.com>

Below list of CVEs are addressed in this release
CVE-2025-47183
CVE-2025-47219
CVE-2025-47806
CVE-2025-47807
CVE-2025-47808

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.24.13.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.12.bb => gstreamer1.0_1.24.13.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
index d224b80eb3..6ed00f9aa4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "b3522d1b4fe174fff3b3c7f0603493e2367bd1c43f5804df15b634bd22b1036f"
+SRC_URI[sha256sum] = "ed4678e1d0708db01a469ae5dd31c10cac73c0fb3f7c2c471b0d3cab0affc7d1"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.40.0


