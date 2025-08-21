Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD81FCA0FEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.357.1755792370381364922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jd5H272a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBr2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lZMKrp0g51MlrFQUOsKijdw3yQio6EVa7bu86+PHvz8=; b=jd5H272aR2xd
	To86pKhfTd/28yEDTy3vlZu/6Lcuu/yAI52+k5qieI5mW8ZrEANMC0p+NeztWHqt
	/1rdHpppHg9JWAy7c8/PIA+u1KdDe4duxEII6ulRcwE/EYBUgt1Roje1mSoCLQYT
	/L5aRD66MOgG7fWPYs5gOt7DizSm98n9kJGF4hONBAAvPZF0hJbNozWxe36FRvQ1
	Gdif6rK86KS0o3lPoDc5muJQJOxFBeH5rkgovR/+vPTCMFJX4LiVXu/bq0TClHyo
	lXMH3rUu4+y/RoFxUeJR2hjhzB1vhDTiSt/YbM4lKZrungtSm5z23pZzpd+78Jmv
	wlMlgnCguw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:32 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:31 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 08/10] gstreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:16 +0530
Message-ID: <20250821160418.495625-8-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfX8eMs/NJYCiN4
 vS7VTLHe6kmCAr71e2PFoOyJxaOkcaBHXcevj8/9OXzFSnAmu1y9ID7e9FWsL+l59DYsJqKT9yO
 iRm5DENKb0YPaBcqOvO/Cla4ajmTmGo7kap1B9LnkD+agOrNiw3NMfULWsXYZ7lc63EA3tUAu0/
 u8gTeC1PDgLqiYmdNMZDXhySh9UQfsgMJtuogJmi/J60D9KVCmMa8Dq/ggvxPOkEQs2IjZV4l3G
 Umyr3Jb1pLW+h/VHdLp6DvNZFeVGJaT1G2OLWiSmB4dND3anYps00dHPO0wdeIsXIdqQ4ruk9q+
 uYvsDHLZSnH0od5a5PxDIOdClgcf5AIqPy7o3toPRwnm5kyHFK9rGVlmH6tU5A4U8rlJQMwGFD7
 dRS0jRpObyDBo4dHTfVWt2E0+ahQMw==
X-Proofpoint-ORIG-GUID: eLJLRqOdw94y4MPD2MV8ACau2KxlQjZM
X-Proofpoint-GUID: eLJLRqOdw94y4MPD2MV8ACau2KxlQjZM
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743f1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=zM-lvVby7-G9p4uypksA:9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222270

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...sp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.24.13.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.13.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.13.bb
index b23634dcf0..3a67c05705 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.13.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a335f73687d2efe22db94348c6893c73b53a2c6bc55ee7a590028ba196ddc623"
+SRC_URI[sha256sum] = "e8dd102a3d1026414f0048daed91078e7958012b56efea7e45fe2b3448b42d6f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.40.0


