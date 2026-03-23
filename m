Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B741FD58CC5
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:00:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9408.1774234848655556990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TBR+A/Bj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7542962ecc=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N2xnke2804428;
	Mon, 23 Mar 2026 03:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iDXpDFJmx7JcSGGm23To
	4XFpwm3Dlgy21QUKrGIS9fk=; b=TBR+A/BjIChscetuLhbzyrh1dm/2EgjW3Lq/
	0WwOUjNkuAvm0XE9PDcZA7NX1HfecnPDqGYjKaw4A/Nf8FQIwJLHMrqbIkLAkoJK
	FhzUnMxenyXo9DczlqyM+xNuzLYx1c1352NrpJNo/NYwP9N4G+DgVIok0Qr/3xeq
	jfbEfWQaaTcj5zlpy4Sm3K8wpLZ8iluDvSNyIxFcDOnSZhm5PzI1BFP1LyOG+AAP
	cYKzXMbZRLsX/85FHLD/NDG+YvX1omZbhn4e0XgTdzsWbDOV1UOwZBAZjWRAogYg
	tNFH7L2Jk2cwrngn8e+9SOOkS5V/j6+Ca2nrRSiJe2XFmcnj1g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj81e8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Mar 2026 03:00:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 22 Mar 2026 20:00:43 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 22 Mar 2026 20:00:42 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <Ross.Burton@arm.com>
Subject: [PATCH v2] python3-chardet: upgrade 5.2.0 -> 6.0.0.post1
Date: Mon, 23 Mar 2026 11:00:41 +0800
Message-ID: <20260323030041.2503514-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OcvbaM-SHiK75qON60it_Hmtuo2ziOL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyMCBTYWx0ZWRfX/sEA2Ak5tevw
 1YS6criYcwXUC4T68jrKrGr89LZebWu6iPOHUFKRBfaMVmrTKFDUVyFkZcH4PslAJ3XBG0gq1Zb
 Ub2MJRBruTfbbyIMAo39XTl1rU0jRC5MSxNgxfIuKERqJgeq7bqpxTf+Cv/BepbGufLqf2MNDo8
 +oSHYO9MzgXk2rVfeYfoCSNCFhNlxPC0phe2iN52rDyKfBiZcOV1+2G8sScgabHb3sFWJ50yCoM
 HRmnMdanZBX1dQFzj98JyIwnBNeEgzsZ2mqqx52ovEepOs8godICBCYnSxgWWc6hUqHjYKrZuUz
 9X3Syu1twjEUlE56RiPRjtvy3O/mblHCxsga+xT7uznOMLJBaIecjqwA4meAw2pyz+jGzQajMUW
 Xb4PFM3wUbSwkwvTXEV4TpfWK6JCOI6IptqjPsGCUL68+NG5K5s6UHmlGFMj0iHAfE2XKCAoatK
 rtPlVbx8ftlUhEXL2xA==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c0acdc cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=UXIAUNObAAAA:8 a=NEAV23lmAAAA:8 a=CckQENj0AAAA:8
 a=t7CeM3EgAAAA:8 a=PH2k4VzRa8OZAYZx9HEA:9 a=a1s67YnXd6TbAZZNj1wK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OcvbaM-SHiK75qON60it_Hmtuo2ziOL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 03:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233689

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://chardet.readthedocs.io/en/latest/changelog.html

Build system changes:
- Switch from python_setuptools_build_meta to python_hatchling
- Add python3-hatch-vcs-native build dependency

License-Update: FSF address replaced with web URLs. No license term changes. [1]

[1] https://github.com/chardet/chardet/commit/502e6db2117064e57c566caa5bb14e8c19f63513

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


