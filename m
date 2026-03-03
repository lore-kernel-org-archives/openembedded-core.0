Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E301EE67A83
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12736.1772521014437790944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VSzh2i+9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235ZmGK3800683
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qTruWlM7TO+X3pySAVeQiby/anzpkB2xuQFTVJPSYJA=; b=VSzh2i+9/5Kr
	ztsyEIupDxwXp0yaYiHbGOkR8QWzf1Tj3fuKGASP2Y1irPirw9Lijv99bC2HlqJ5
	0UzGFZGSgMakrxWDX3RIru8yKAlq9Ga277e4Bu8jRfU95aUI4fxYXxNN9aeLhXH/
	P6h7tJkrjTfWpixggFXKS13oko1Q/twP2kDMY9Go234Mp70ZynrORSWu2dCfsEOv
	UTMvWn//O/3mYOC5olAGcHbNuW3feXr1KEGmD9qOlSHsJN4DqqJDgOO3/9gAYM1Q
	rqvtPIxNdCuNW7J5a/Z1CkSqiLCZYkA8Qmf1fXKS57te7JLjya9OpoVsA1xWPy5f
	2KWxZFUgHg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvkdfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:52 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 11/19] python3-pip: upgrade 26.0 -> 26.0.1
Date: Tue, 3 Mar 2026 14:56:32 +0800
Message-ID: <20260303065640.2541884-11-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Cufge7wAi10R34_RpnX_fo08Xau6Vd1u
X-Proofpoint-ORIG-GUID: Cufge7wAi10R34_RpnX_fo08Xau6Vd1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX9kDHIbU/XcwG
 xUNud5Nc8geg8ESHaLbVkBOBxYimKPBfi26N9k7HPDSJef3Q96RyVbbmRn87JmJbqDgw0mfKogR
 pGIQVvrw7toJ56kd1P8p28znEF+IwgIodljB+l2tgImvOj5/6eywJesDoGaSVTGd1gFHxO1LWzV
 INAGlogXgVBQomdRILtEGA7lWMIz5OsQrbt1RQBGhYdd+DYD/GCsYsVqZONyjVh33XQCVaw96ed
 JBrERQZpjsnF0nFdz8CTHcHgi20CcsPHOPQdp3VvTs2k32RRvIIjozzzzBkJLzqGxbFfI12wzUz
 b8u3u8ko9ZxrDLZ1vznHqrVwnlxPzy04l4dt+IP9oKFOxqqw4PuM/sbxbb0zHt5DQIa1oa0ci8g
 ebTOnWKmLShD4p3TpaQIj6sN3o7uNNVKVG2+2fVY7Q+afYQI/eR6leeFW1bDAK54uOrmthXitrC
 cF4p3QFjMncn7GGYJoA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a68635 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=dXvAoEkxAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8
 a=O0v8vBF-4hIWwwJqLwcA:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232249

ChangeLog: 26.0.1 (2026-02-04) [1]
Bug Fixes

    Fix --pre not being respected from the command line when a requirement file includes an option e.g. -extra-index-url. (#13788)

[1] https://pip.pypa.io/en/stable/news/#v26-0-1

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_26.0.bb => python3-pip_26.0.1.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.0.bb => python3-pip_26.0.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index c71b46bca4..b057852b7e 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 48fa8ab5e68b0e349d988ea45bb6a8e2f9bf8fd3 Mon Sep 17 00:00:00 2001
+From 60093e823780d9a3483844cc3faaed18dc1c351b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_26.0.bb
rename to meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 0a284a1f6b..af0084c43a 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "3ce220a0a17915972fbf1ab451baae1521c4539e778b28127efa79b974aff0fa"
+SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.34.1


