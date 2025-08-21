Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CF4CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.329.1755792368039056227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cHpXxvm+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBm2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=R10PUr7lkVXwNJoYFejakK8crT4l6W3anXHSki35hmI=; b=cHpXxvm+PN1+
	OZQ69YjWVD30znzLD+2xbAVaMC0kfEfUe+Yd/NgUgPcURlsbriwQLtp2YShWgrI4
	+sQZCbGEQS0XH1k6TmuO6ZXeAp6dm/p2sWO7cZ3IIY/Ggdqyps0AbiA05GU5mu94
	+3XnOHTxFxSyk1O3IYEeYNgAryQnBw0dQfWHmgNcuMpY3eQWGFFh1hqW3KokHybN
	jCpV0qxR2llUK2RnseIFeWtM9DuBRfKVqzvsAT+Yh4RmGcFy6I8CqcZcAMARMWaF
	1NQ4j2bN/ARgYboFt53GmPlVbY+Erfv9URXLDkMAd5pfMaQcPd4U+U2vweztUAtj
	AgNE9sEJ7A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:24 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:23 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 03/10] gstreamer1.0-plugins-bad: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:11 +0530
Message-ID: <20250821160418.495625-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfX1sVqfXKv2MDo
 45Y++ZlZ+qY08vgqJfGc3XX/BFf7u0c5Hws7Xo38F7MvEOQVoZ/FMARtGxxRECPefpFwRk1Smrm
 qp7N7uJWGFj/SI3nuUxDsQj0Lw+/A6qNAP3yxaGJZ5L/OqcUI8Q4cpwmRv7IIr/iM1qXB9d3MFU
 lcp/AKOddQMMmTpj8YPdBaxODZFDhOpmxxeKW2/YVZKcscomBDbB/X3hZQhjq0JrCvBE1GT0LKH
 tpl34QRlnfBWzPw83bPYDvZh4n/G88jLD3Yr5ZMRevRPgAcZ+j4blQ7DHJeXTzbcU+/tYZ44jOW
 OrQVRfYOhC14iDvm1URySrgZKoCSaU970pPmWu/ldu97eAJ+m8rnteN5wrMRzaZDCFywOtWpzs7
 sh9kvd5xMHKfHrRuhAQMXoYkp7paBQ==
X-Proofpoint-ORIG-GUID: pKuq77nSnP92pirBIt6IkqlrtikkuyXX
X-Proofpoint-GUID: pKuq77nSnP92pirBIt6IkqlrtikkuyXX
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743ef cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=nP5x8ozCtJLkHQuW7X0A:9
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222265

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...ugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.24.13.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.13.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.13.bb
index 91d9150359..b66141ca0d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.13.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
+SRC_URI[sha256sum] = "3cbe7d7cec5db958781f7ab66caa5afd67b133c223fde71f0403277731f0cc4d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.40.0


