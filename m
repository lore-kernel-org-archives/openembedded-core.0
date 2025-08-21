Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00AECA0FE9
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.356.1755792369399493473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LDiVYZg7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBp2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RjFO9afNVP5W2B6qkfG6oAARtzrCBzAL2VqFLoQs/xg=; b=LDiVYZg7CFzX
	yYVzRYB49LkZS5v4J6Ty56SkQjUKyGMEMDhBQc0OqvIkqNpcitlP58jrd1UzE8F5
	kzmqAmJE15bVPM3LJW6fqiojmK3a414qSZXES+g8EwKnwYb3SGlf8PgxQVJLsfcq
	gJ5GZqSMSGS6nqeD6RB+ONvwOMCY7o0x93PWTrlsTSBK+v/HvOeILVOxDWtP8j40
	HtIzDXDU7IHDWauVIlBNooc6XM0qh9T9HYETn14UQ4IvuEh5/6zxozG5vq/6Ao9k
	JPPlh+6qmeGiw+ZdFWEVgXXhQ0HYf21ciHVla0xcZ+Y3quid9Kkmc8XQ0Tlapg5d
	wiS7FDEZOQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:29 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:28 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 06/10] gstreamer1.0-plugins-ugly: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:14 +0530
Message-ID: <20250821160418.495625-6-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfX/IqlK4CzlCib
 tDN8+gJy8IhDiaNQ3z6/hUtkJ18UVVvAIgXW9759dYimo03WD1yB1qQISKPW02tI0vbgqXaMHDe
 xdXlBUlIf/zElenIbM9IAnKbtFV5vZXMiA94hwMm/DJvuBT5emRkwG6JhJfw8phAslX2SKoLlV/
 3dfOb9RVL6IEuWIuTy2m0MNDST/6pDjSpwYsEuF5oZ1C97jcvpe8+bYvMlhAsk6TFMVWeeAneLE
 Y1OpzCBPWGhvu7dnaItGH6ppONMIM7BDg8GPxt5P7/QLij/ZzRIVhMs4qwzm2yQb9rS+cFmXcEC
 fziOwvcm2JP8Zjd54IWgLjO3kQSNBbge1mbxDRf6LTuooxlpk/dTQANLJa4xAzbtj6s/ceGTKlh
 36/7Y3t7NbVi4xkASmMdQ4Y1RLj1bg==
X-Proofpoint-ORIG-GUID: qhiihL4oh-W6IwXwe9tkVBaweG7risN5
X-Proofpoint-GUID: qhiihL4oh-W6IwXwe9tkVBaweG7risN5
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743f0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=p0nysBFRkCBiDJjMvCMA:9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222268

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...ins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.24.13.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.13.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.13.bb
index 75f528216f..d45ccc8e8d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.13.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
+SRC_URI[sha256sum] = "dc08bb11dce0a43453466fb9034e4fe06709fb5af68475bcf6d288693b661a5d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.40.0


