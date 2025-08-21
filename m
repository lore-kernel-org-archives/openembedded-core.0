Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCA7CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:20:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.775.1755793233535835674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LjEUL9ij;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57LCKMgc2458597
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=T19FaYfglRJ113fj2ijr
	zgsAk7hPqVK6fcTr1gOPcgs=; b=LjEUL9ijxELquA0VvQ/3/9BHHGsVllGW4XHR
	YSnauoRMVN4LQ8LihXcmRCEG1UEQhIYtWjo7L9wis6uPb/vyNE2rEKVS0qWXzAkD
	OaDhE32H53RKzsqeuZei992aRaHSDuJ9quHSPp5EAf+0zhi+sWEFOt/selU47ZRC
	v1DMWB4m1mylSzgQty57aIN8uqbVqCo2a2MdGb5Mp+4H6cmLYpp95Kif5KrMSZnL
	RrKcQIznxgQtYPtKcykCOwMh5eWqx504J/q0oT27ahktfH72C7yMnqa0bAnSlBYr
	Z7xHM6+FWj5Sfbf6Ap/KQzZN9SmLuQdADAjRuilkmfhWzQBuAA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq2ft8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:20:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:21 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:20 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 01/10] gst-devtools: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:09 +0530
Message-ID: <20250821160418.495625-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5n3Cgn721z7I2aGWWt6AWXAgON222YVX
X-Proofpoint-GUID: 5n3Cgn721z7I2aGWWt6AWXAgON222YVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzNSBTYWx0ZWRfX/ndsTvd0Gb5C
 SU1g/dNGm56PHYIJqkDLWU4Ics22YVT/+5U/y7ANXWKvjYRmrzEzx9yrNmrDSLFN2NlINcN8K8F
 1QZTjMyEvQcabJzEnDBNIjWAIjbgHiU82IEZCsYo/iafQze9ozx+BBPqxHQ7CJQmkTsrM340KNE
 CQtygCsi+jxy4w1ab2+9dAyzn7v/jXYmFwMsp6vu+1Y5pMrfIzPNPt+5L8jrUOvo39kraZ8KXk6
 TQMUfIhP/LQf3Km/6H3c2khK5gS6YvhEM/o/wrXzcGj9Td2JeokGEfFMcJdxcBPeGEERngZCKW2
 LRrdzP2T+RdkoYEHOVNVO5bMFNcr6pxECT4TkZKI8Z7tv7iD8KJzcQe8VakMahq18QzOQOEf5da
 J6TeF9dGLZNc3PYlYeE7ALzRxlpl2Q==
X-Authority-Analysis: v=2.4 cv=SPoblOvH c=1 sm=1 tr=0 ts=68a74750 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=svFZRFrhDkApA1QmqRYA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222272

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{gst-devtools_1.24.12.bb => gst-devtools_1.24.13.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.24.13.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.13.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.13.bb
index 157cdc6bbb..09d112cf1d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.13.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4ef3dd12e5827068d6db7ad01876d1216a80717116c24a0d5b3b57fd7e3c3478"
+SRC_URI[sha256sum] = "2485b30dfb94b65e2e4befb0b9367fbecbfcf2102b24fa9138df4403497e7b73"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.40.0


