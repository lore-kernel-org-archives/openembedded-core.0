Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7CEEEF316
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 07:43:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39410.1772696575064916443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 23:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OZqjKsDv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7524204bd7=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6256fBGl2426412
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 07:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rYoCCzd0ykCMpOJ7qTzq
	QjvZcpEQcag0FVfPmN+9Ets=; b=OZqjKsDvx+f84Irpajr5Q2E4fDCEi/lM3lGo
	FQFPFninbdUZ/6ASRsw1w4RDNjdgHLuErg8KI/85o3WSv5E0Uz4ewywN+Fdk0PhF
	M34FG2DKOdWoiOikpeAjrhCIJ0LYnPvecKwd0tL8G9AtbqkmGnRCXtUjR9aqrNYA
	zpiB29cXwKeWfqH69DW7WZuduym8YNtoriLvJam3zwDazOymj4Uei2LcqclHLFW+
	WP392DCBk8H1GDL4KQoiZeHelMhEiGjFy7+hHIENuc6u8IAEUi51BTgNJ3+LeQnj
	PT8U4+PkRh/pEb/AxRYw2eMTlQS5zBOtXPlnGs/w24Id+WwUZw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4p3e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 07:42:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 4 Mar 2026 23:42:52 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 4 Mar 2026 23:42:51 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-chardet: upgrade 5.2.0 -> 7.0.1
Date: Thu, 5 Mar 2026 15:42:50 +0800
Message-ID: <20260305074250.377829-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a933fd cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8
 a=qK3T_GUgTCdHiDGtj-oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QxgbxcnwwQI0YnF5LsedftHrnzcY2RTI
X-Proofpoint-ORIG-GUID: QxgbxcnwwQI0YnF5LsedftHrnzcY2RTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2MCBTYWx0ZWRfX1fKgKpq4FICj
 21B7XLyfyVViXCSPE0y4zVaXxNzea2u4trCk/d5S6ugpWi6MH6g4OLZ/gupIsStUf2Dn0pXcTSz
 0NI1oCnIBfZm+dgZI0K/DURMRJttCxBnpw9r74Kw9vvY85GXOGQOoKDkBiX4bI+q6SU0d+GzGY+
 6OJW7NYr/EIAFxvARZ1SYQTViZwWHuuNwsERqq7H8gMsNrWddQlIRcyCLzi+a2hOjk3G6DSeUra
 C29dKSz3rjvDKEleBY/t9vh/43bypL9fDKNeqPWO2EBQvGIUPiV4v+2RbSebe7qCSzAdQBa5Pi8
 TvtvCLZn4rGfeTvjqN7oSJDynfJd1s95LaVpsSpAtkpINCRpZq6nvjNnWNdtwtWRImQO1E6U8sL
 3yX6gVsl0Voi5PfuRiTE7CDbgXFKtIkpqZvF5dmJjFxeqWKVpYsUbZ9MIzMhy5gUeEH3PnJ70RM
 zzGQzvuoKY1uZHc0InA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 07:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232450

From: Jiaying Song <jiaying.song.cn@windriver.com>

Major version upgrade with significant improvements:
- License changed from LGPL-2.1-only to MIT
- Ground-up rewrite with 12-stage detection pipeline
- 43x faster with mypyc (30x pure Python)
- 98.1% accuracy (+9.9pp improvement)
- Added language detection support (95.1% accuracy, 49 languages)
- Expanded to 99 encodings coverage

Build system changes:
- Switch from python_setuptools_build_meta to python_hatchling
- Add python3-hatch-vcs-native build dependency

https://github.com/chardet/chardet/compare/5.2.0...7.0.1

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...thon3-chardet_5.2.0.bb => python3-chardet_7.0.1.bb} | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-chardet_5.2.0.bb => python3-chardet_7.0.1.bb} (57%)

diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta/recipes-devtools/python/python3-chardet_7.0.1.bb
similarity index 57%
rename from meta/recipes-devtools/python/python3-chardet_5.2.0.bb
rename to meta/recipes-devtools/python/python3-chardet_7.0.1.bb
index 9acbeeb3f2..1bca7e2f3a 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_7.0.1.bb
@@ -1,11 +1,13 @@
 SUMMARY = "Universal encoding detector for Python 2 and 3"
 HOMEPAGE = "https://pypi.org/project/chardet/"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ceb043323c2ee90204004ecea245f1d"
 
-SRC_URI[sha256sum] = "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
+SRC_URI[sha256sum] = "6fce895c12c5495bb598e59ae3cd89306969b4464ec7b6dd609b9c86e3397fe3"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
 
 PACKAGES =+ "${PN}-cli"
 FILES:${PN}-cli += " \
-- 
2.34.1


