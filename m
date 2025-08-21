Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0073CA0FE4
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.331.1755792369887163315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F95MnhhO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBq2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=hVRPI6/NTQLSBlGZql7XY8Inno4tJ9sT+rQgQF/+aDk=; b=F95MnhhOjeBI
	+ybq1IF2989U3cvkxw+2mddq+TrNjxd46gAmLBA08M3k8M74Kpsbusa7XybK5/MQ
	W5DNGFKS1uWFdnnu+uHLfpASfSeW/+ufAVMqgY82p3UIX7ZuzVQq79h/I3ZLvJyg
	XUxk5cI4ussYQ2OAJo0NXHUcMyNbZNeU/hLBHal0rM7c8MYOFuz5z336GxFgjGM6
	PM2J30VetfipMx/qByR8PFw05DeAZngiUnBjKXeAck+qTAVf0yxQezNE7k222Q5X
	I0Mt3xP2qO/3anR1okp/m7U69rhvrZyeDLZjUgygFewJrnkAMOm3C9wgL+9egmgL
	fk/tcz2Qmg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:31 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:29 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 07/10] gstreamer1.0-python: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:15 +0530
Message-ID: <20250821160418.495625-7-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfXy9SfuiUe8r8e
 noAuCamc/4sqjcu/rf9wi8yHI+f0uA35koZ9NB4Z08cITgfzgrsA4UaL4Er3mYzgZyJgRCg1tqC
 BeuFKoy/3ycoyH73pVxABEMxtrVinHkQrrd7CKCb1j0w9wBw3/1ow3UVpGQdzsN6VQO/QzfSKv6
 Ejy4mHoNZlfV/rdVkFaylJ1yyNz+I5YqgVti6gN7v5DBFiSFW6I0DMJSlYAZlAdlBLGewNUdKb0
 YLdx2pW9qWUZV2Kp64wwTns6Ba9ResJcW92iefOd2BdOajci56QMuQPiUOtqsnU9gVzVseCHV/7
 NbibpoeeW/d66z/ptQXRZRuKofl7CFeeP3CWf8ElcsTVQZhgfADaVX0xpvtJavWEqp4Y7sjP+Il
 AIOH4KqKHC+H06RpHLuSVffG97gZhw==
X-Proofpoint-ORIG-GUID: PKMR3rHodgY_sz8aYo4nK9SWDcvf_4fj
X-Proofpoint-GUID: PKMR3rHodgY_sz8aYo4nK9SWDcvf_4fj
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743f0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=e8Z9injJDURh4bj6D6EA:9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222269

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...amer1.0-python_1.24.12.bb => gstreamer1.0-python_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.24.13.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.13.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.13.bb
index f62cb159c2..542b273039 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.13.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
+SRC_URI[sha256sum] = "abb9a1edc11d67a463b6cef7b74a8b10ea6c342760c012d597102a7bfb7e09da"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.40.0


