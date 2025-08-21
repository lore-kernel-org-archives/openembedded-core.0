Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E66CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:21:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.791.1755793270466321215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oqnAMi0w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57LAhbTu2297330
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 09:21:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=N9zpwew/2Bh7IeIwKnX4Ff4usxERC3gThMJEKgpe3P0=; b=oqnAMi0wwDPw
	ON5DUp33nW6efA66rZ0Hq1KqCO4pViJcnMtOu5wOzZPhcPoRNIe6aCQGxPvO0fT/
	HhsHBgA7UabfJBmZ1fhwYRGVRCkyTZgjFnC1e/JUO9ldOBXIig1/DECjMWZd3oga
	ypk39t1bJtMFJN/5vn/TXXUxX4rmR46y6yer661p+Jdv9KJziBhLIn0YOfyLjOvR
	rIVVlzwVM9S9nLJmBPw0bvkAVPCMDIinUUq0QucYRWa1+F3TpE00ndSgQZxaN2WT
	FYUCsa3oiYrtyDoJkIHvtiXnoII8pvjx6ffTzpDq3zkeh/Oo2YHbpJuQFUwJ3GCD
	mLauh0EabA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydqahsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 09:21:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:23 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:21 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 02/10] gstreamer1.0-libav: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:10 +0530
Message-ID: <20250821160418.495625-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzNSBTYWx0ZWRfX3QYjbhoGrutu
 IRgq08yHnuCoAeeQHxtWQmr/ifIU5XVuI0D7cdu/ubvF2i3zZKbiYY37FjupPv3QgQ05ZooaIhd
 oRdejcj9w+AqhPt4/aRpxj1TWSP4M2bDTO6dM3dCdPL+UDzssE6S7iy/T2TIluUjI621d5pNtdm
 AiHRBJliNDeNfXlOjQ5ElSPfHQxmi/G9llrClLdhDW2sNmnNxhPP+uF735p+5JPMFo364i3weYU
 teEX/t1ZMQxcqK7MY2y85OtEdDcUD+xJWSoqfvKORO9vFkuxQX0VBPKgYZX1giVCmW/WbCEZ4wm
 u1P3mRpB37WWQ5gg6cNS+Y3bTjtxu425lk/6zjSfVCRarsK1TiDNML2c24Xy5P+nvzDjdcKn3Tp
 4JuAUl4uE6iL3jE7N4W3ounBZqYZqg==
X-Proofpoint-GUID: 2gU5PawYKQNPVfHXHSd-LZRXSb7D1WEj
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a74775 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=K7puBoEg9Q0mi3Kf138A:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2gU5PawYKQNPVfHXHSd-LZRXSb7D1WEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222273

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...reamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.24.13.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.13.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.13.bb
index 77c10da39e..3260e1556c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
+SRC_URI[sha256sum] = "150e2b70588fa32a1294f42665756f2175417ce4b5988e2c2081b683719aa6c1"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.40.0


