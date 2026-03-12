Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBAFED2EE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:25:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16862.1773303919632445117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PFS6+CPE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7531ba8309=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7Xgb33253345
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mFx6SX8VZ2fD6iXQXtd0
	dC2hLHwpGwi3vaznxUX+dOI=; b=PFS6+CPECWR7udeE3ieYIQGE3M1SCFtINgxL
	8WJeTinW19m5kqYDvKhxSJj0YLln9O8GYKbhmMrzLawInsI+zFO0KBC3QTjylqyI
	bSrPRb2//Z6NKWE+tsg98nTTwK8RwY2ycaKo1i72TU2fe+AIlNg01k4xwqwR+AWv
	K7Jaiy0LUUMtn2J7izul2JAJRL03Rr38kFiLZ32kxQAAFjlEzO9ZG+by3j4bkZfg
	ZRi8MqLU5ePT3CnpwPJJjwhQRVt/KijE9o99fVh5iYta9qXn3DOrnu4u1NI4B+fC
	r6pv1z6JCVb+5mYRZS7X2UtJguYLyVyDF0SQnT57ZAkc1DCkzQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78ge7x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:25:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 01:25:17 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 01:25:16 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-chardet: upgrade 5.2.0 -> 6.0.0.post1
Date: Thu, 12 Mar 2026 16:25:15 +0800
Message-ID: <20260312082515.4074831-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b2786e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=UXIAUNObAAAA:8 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8
 a=SPcUdKpIyLO8qT0v_EUA:9 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA2NiBTYWx0ZWRfX+3Bcyk+5NTfn
 +VUBLg2jPS65EK3HYOlY/y9RKpCy9MRKC4yAhe/9p+z0bDY3+cXjEVGOwEO8TqePO7zccRH/3/P
 BuSXvEVjwkW9FTLYjsJV04Ja2Hla6FWvQ7rUaUg57da2QFO4mhuvOfMzdG2VOdtFajSV4trQWDC
 dGbtQw91wLOEr+quSMokSuckIiZabkPp38RXcjjWS0NGYmVSdDt4+oDVhSWIPdK86CP6t1yOJgv
 pzq5+TH0bxVEA/8Fs0AUtireS+kErg2f3TMXdBNsV+lrGh4lZL7NSQtztRJcQmq8YTpjVXDhdOO
 8PepzYat07ISmq+tAqozsiiGAI8FmA+nEjT5zRUiSs0s1qD0LoQWzyCNnsY2zCy/cQMNcFqgegG
 4aDJZGAbUyP5S/yRmklbDLvT9vF4luNvpvB8lxQnHUrbFHrfXu7XOZA72twN4mnnyBxtYAYAFQN
 zZritabEnv3L5w9O1fg==
X-Proofpoint-ORIG-GUID: Xnu570RGi8_dH310CSNe-APJe8KeilJF
X-Proofpoint-GUID: Xnu570RGi8_dH310CSNe-APJe8KeilJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232930

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://chardet.readthedocs.io/en/latest/changelog.html

Build system changes:
- Switch from python_setuptools_build_meta to python_hatchling
- Add python3-hatch-vcs-native build dependency

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...n3-chardet_5.2.0.bb => python3-chardet_6.0.0.post1.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-chardet_5.2.0.bb => python3-chardet_6.0.0.post1.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-chardet_5.2.0.bb
rename to meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
index 9acbeeb3f2..14c3247b35 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
@@ -1,11 +1,13 @@
 SUMMARY = "Universal encoding detector for Python 2 and 3"
 HOMEPAGE = "https://pypi.org/project/chardet/"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
-SRC_URI[sha256sum] = "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
+SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
 
 PACKAGES =+ "${PN}-cli"
 FILES:${PN}-cli += " \
-- 
2.34.1


