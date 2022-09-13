Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1C4C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 15:58:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6604.1663084708249094310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZBVw8gU6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=625567b1a6=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28DDG5So021373
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:58:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=NBhX2z8q7RUXGZHsOiDwWiLXkijpyUVGvJrMjBWPKJ0=;
 b=ZBVw8gU6uPeyISnveu/jQoi+TOgRjgyna415qrH4SJRMyxgYyZo3UwhoRpRwIc1fT7lm
 yeTDMn6pLxGI1MOfJd2hqV23R9Fe3ghz7bfyDtsn+0yZo8T/jss/VZKlASG4hgqNnFDV
 o1676wdgo5onW+KLbu87g3zkDxVGRwtSaeneRFh1aUfHeeOTFA7TqbTrBbgqvB6aZ6dZ
 sJKKar6AdQQS4n93gHhnL9J+ruV053ycQn8LMMqbRaxZN/wgxt5DJpMDAQXjzw1+kytT
 4tKqvTMUwSwzfAHhU1Pz2mMJTYHcu/1hBMA3uJqeAWX3M8qUUNoAF/DDkxofmpjzbstV cA==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jgnv6b7py-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:58:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 13 Sep 2022 08:58:22 -0700
Received: from localhost.localdomain (128.224.73.106) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 13 Sep 2022 08:58:22 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] lighttpd: upgrade 1.4.65 -> 1.4.66
Date: Tue, 13 Sep 2022 11:58:18 -0400
Message-ID: <20220913155818.17235-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913155818.17235-1-sakib.sajal@windriver.com>
References: <20220913155818.17235-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2-nioBpT4FMB62aAopmYPZ87gHg4S9bp
X-Proofpoint-ORIG-GUID: 2-nioBpT4FMB62aAopmYPZ87gHg4S9bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=915 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 15:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170601

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3163134b0f58c58aaabe4e957c30109e63b2d60f)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../lighttpd/{lighttpd_1.4.65.bb => lighttpd_1.4.66.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.65.bb => lighttpd_1.4.66.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
index 10aa27f072..801162867c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "bf0fa68a629fbc404023a912b377e70049331d6797bcbb4b3e8df4c3b42328be"
+SRC_URI[sha256sum] = "47ac6e60271aa0196e65472d02d019556dc7c6d09df3b65df2c1ab6866348e3b"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.25.1


