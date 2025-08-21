Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964AECA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.355.1755792369008758921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZEP3ikBF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBo2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jc8KDBX8N9QjWPUxvmz3mrHbQo5Eim87+r7n9evRdFY=; b=ZEP3ikBF1AER
	8+AmZoa19pkwqRXjDkKraWrsE1g27aTvkB/yD6chD3uBXMecNlrd06S1aRi2ono8
	6ikXeobr9lqu1ngkNp5WAuQkJxLYuO7h3Ek9hSppGlzHPDR5J3CEpluBNhvqf4kl
	4OwVD2crKOmDmwgCidFSyem2DDb/b6vkMKWMiUZQmaYLl4ykQy6BSgnmq6KoRDVh
	w56t/s5EU649Di6lR4oceIs77OPtqu2pV5/eRybkUqDqaOtlSxKEYi7vDfqwFXTP
	MooRlER8jnFD9+gFM0skaWHhczT+qLC4FSSO44lKIyMHwGuDLcdLCLc9dBCjTHVC
	ipjd1E5Clw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:27 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:26 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 05/10] gstreamer1.0-plugins-good: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:13 +0530
Message-ID: <20250821160418.495625-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfX7oCZ26MsN3XP
 NZWJXNMLZGmQkTGzOugo6ADFA2RYFxic6b2oiE0qt7UzjRp0FyPa7NDpF5GHUxNEt0z+tTVJUjn
 IIFsEdL8OZVOmTVzgbD5DvrdN+6+aLwB/DG9IUhg+iTx/FsBiWOVd6G6yqcLBlCaQG6dYwULjjJ
 2wufqChk6hwRpNjnGFyi+B+CJlSGRop0Zm9F4QwKLdfbWOHYejxmJY46azSGKb9DVK2ajukz0c+
 9qsHBY0/9Df7hE3W8dnuOu2DFLMkxnrpgZNvj99Z2WdOmKzq8RU6SEsGSWPm0pshiR6IE0eE+oJ
 906iQdxnncPM+efqnhZCAJgTl/xDD6JalQyYRkFPx/6r+dMlQsnRKRk+jy1P5FJTyz+838x1ajt
 ozvpmt5rRINgPQFwmBaU7wCfUQXI+g==
X-Proofpoint-ORIG-GUID: eoY4bgqHy2IG5lWg6ExRJdy_03jqiiPC
X-Proofpoint-GUID: eoY4bgqHy2IG5lWg6ExRJdy_03jqiiPC
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743ef cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=dE_V3Ja-QzUs29Lx6Z4A:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222267

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...ins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.24.13.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.13.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.13.bb
index 9cc2d462f6..e1710d0bab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.13.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
+SRC_URI[sha256sum] = "574ac6f9fd84b32eb04e80572391d6762df6f9802a47bc0386cd6cc48c14d08b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.40.0


