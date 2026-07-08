Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8478C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:32:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4655.1783503093837182885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QTG6Eg6t;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild10.wrs.com, ip: 205.220.178.238, mailfrom: prvs=1649fb9606=hbarde@oak-lpgbuild10.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688Btb33613483;
	Wed, 8 Jul 2026 09:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KqIlzqqOps2p2Kdt4qNLcKYzgIXMd6xgX166M605Cpk=; b=
	QTG6Eg6tlIqgVLt64+Z/a84SM59TeGRbO6QzUxCcW5XPbqBFgHuk4Ppcuqqi50Ah
	RtIDsJ4KWX3HN6Eul1J0UCqRBx89gglcVHPw90j5T/iu2kbGIgjoWFIgniXl6VFh
	hZSgzPx2TO0P1XirlZ2LxBi80MEKdtycBOkr4mB6+auMo8apKwggQaZ3gqyyi53h
	lW5RPM0czj/drnyEpJ3Xam+aJVJcYzucZcUQJJXeX8hoQJAh+MmBBwlFiNSHx266
	Y0iqa6k75foyDjHSU0gMTDzH8fV/o5gyhWxJbkhJlLr8aMWf02XjhYA140oz/ccx
	ZzrIY7fQ6bl4GOR9hYtl8Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6qcwdyhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jul 2026 09:23:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Jul 2026 02:23:06 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Jul 2026 02:23:06 -0700
Received: by oak-lpgbuild10.wrs.com (Postfix, from userid 1762445298)
	id A641FA88D8E; Wed,  8 Jul 2026 09:23:06 +0000 (UTC)
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tgamblin@baylibre.com>, <randy.macleod@windriver.com>,
        <Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2
Date: Wed, 8 Jul 2026 09:22:52 +0000
Message-ID: <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a4e16fb cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=dWB_wDoaOQRvAvalUzMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: an_0yIQjJEsh9LhHSttDSC8IgSxc8KvA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfXzp9O1ex3UFjD
 86HV+fix3QM8WA2LBL+A0mMh5Xr3CEKI8qcmqsEVe0n5vCvcHg+UnY/R0lZWj1wdqEiBdJQjROw
 6Ub//kiF6x9nwK7Mj7Fm4lhuQSMa9E/v7lTJ02JsoTa64lxw7Y3a
X-Proofpoint-GUID: an_0yIQjJEsh9LhHSttDSC8IgSxc8KvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OSBTYWx0ZWRfXyC0NA7EKs1m1
 yuwqAiPZYDBiCl6WM9JFrEnxdeloY9RykARyM5yr2av3Kuvm/jHAZC/lTpUWR8S00xXvpalO2AJ
 UAw4xwVllfOHUe5dMbJ4CbSGYCHDjjceybQFtZafo2c4JE2tWsWXvcM7uESkgNMZmT79hzqAWeJ
 CcqnEDIh+xblHyge3sR2xQvvi+F1+26zHVsVgh90utkdNeuGaFrxiTvXRnVHXEDTvNcfpZubqbX
 Ztjr0vk3F3H8UNfQUJgu2bG+UlZIkirwGXUYabB4+vprv9NmmN++vMhVjHYI44zcNIYz0Q3/BMd
 MMVk1AfPDz1elQoJG5yEL/FPpKdXlz8rHZXrT4j+EoiQdYmeIKm9ITbA9FAvV1a+dwJEl3dNVfo
 tlnic8gRniBXlaurFBOIDEG7kjJbXYeaspymxWZblLHqfSwajvowgeDu7I7gxu3BIg5aMuJuem7
 l6iqOlvLhHezdT1tHaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080089
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240450

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 ...etuptools-scm_10.0.5.bb => python3-setuptools-scm_10.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb => python3-setuptools-scm_10.1.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
index 58eb963910..824758e3ee 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb52ae26813d4838c3"
+SRC_URI[sha256sum] = "24079818acc46e99aae0d65b8d511fafe965970d9cbd060c7b9f7275ded520fb"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.54.0


