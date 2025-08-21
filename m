Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A0BCA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.333.1755792370851074854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FoBl17il;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBs2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=99ljUgL+qnlwXvg+GOemg2fzsq4z3tc6lv0mv9hLOvo=; b=FoBl17il2vms
	sFn/1+mfQp+fUZccUTNt9G6hxeadY/zKYZxN1Zp6HNTdlWcOprexNZ7aS7+u+XDh
	+w7Z5EsNqpBgUXVpitAFdmtBpbvbs2+HYQvfwD7jRL7tukp8f1yUsyyUuhfZ1S+g
	RXzDcxhq2Sii6jF18hzvhRh5Eq+tsoD983w2m7X562MF3lN0HFIiwiCYHhGQWiDT
	5/+KDZpTMvmnUKbQPElOm60jS02BJyauZvJWwxJok/+B3dZr6HLtgCr25FYzKyre
	SQN6Rq4mJ7zvKc5z5282LC4DlJs79Ve6zhEjOz/yijV/bzkSa+2C9Wnnm+KJE1Jt
	DSdXdEKlfg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:34 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:33 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 09/10] gstreamer1.0-vaapi: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:17 +0530
Message-ID: <20250821160418.495625-9-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfXwPLcYaIBrWaw
 AMufef+a5nnb8sO+qScUqmIRCJXRDUKO3xDiZ1H9m50ib0lYuU8TIzclTPclqbNj6MuQ+UwAneT
 v0jTJubZoidWHaXlJkI6P79EBv3+uRoCoao5H9SLv1UkULIf/kQO06tws+6PvVH0cwDdgUZ6lx0
 SgswgmwD1nCqI/r7BP6u/ReSwgWt1/RoeKgeh328VZq5ZdXdxlAvJFdBHsy01U4/0Haza4c9dsn
 RyLsFAaaZadBXUyU4gNVHR5xibjdj9QxEEIo0gSUOY/icxn6MEQ8g0MndyfKVa9EX1DflI+LyFd
 55xo+hl6uScmmjb9i4+ZHRN5Dv5V17c6YvAZ3ZPiGBWcDfPIriZhFv2Q8TJFlgqPYo4yGxY066R
 BCnaIkDL0Z7qIoCM+OXfdCa2INXt9Q==
X-Proofpoint-ORIG-GUID: jRcYLU80gKmborVKyo4oRAy61xG1Tjx3
X-Proofpoint-GUID: jRcYLU80gKmborVKyo4oRAy61xG1Tjx3
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743f1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=Ly3o9egKpYFSBKQPsmAA:9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222271

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...reamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.24.13.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.13.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.13.bb
index c634de7c6a..bb0343f765 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "39ab3d2a381c99a9e10f46182ed57c6baaeaa8be810bd2f84f162c8be299753c"
+SRC_URI[sha256sum] = "b92c008841387043aec83b08b1fa8cf41e7866a106311a7d99e274e7d24ddc47"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.40.0


