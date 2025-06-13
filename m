Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAD8C61CE8
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 02:39:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.868.1749782383639464823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 19:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259751d3b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4SVrb006799
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 19:39:43 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46a2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 19:39:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Jun 2025 19:39:42 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 19:39:41 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [PATCH] python3-requests: upgrade 2.32.3 -> 2.32.4
Date: Fri, 13 Jun 2025 10:39:40 +0800
Message-ID: <20250613023940.2350251-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684b8f6f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=dl_RZrkO7hRd9hUrozAA:9 a=a1s67YnXd6TbAZZNj1wK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7jYcVWaEHo2CX2YH4CLWUWCTS6XEApU6
X-Proofpoint-ORIG-GUID: 7jYcVWaEHo2CX2YH4CLWUWCTS6XEApU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAxOSBTYWx0ZWRfX4V6NQFjqFlfR yoWQBVI/64r7zPLNn/hSZOSGKJ6vrGzmAK9X2ryp0XsBxahLzH92tZzjaSMTZ9+BYf/s9SAO/qW Lgtb9GkA1MmJv5DYtuzxzOto1D5truxxQHp7IeXseXAoiyToRqHEoC+JLO6bqbS55yrF2h7ruB9
 38RQlEGr26CvLuOAlG0t2kCE31hGOHP6WXlh6nhoUmgULFQ6fI3excfdX35tS9lkY7umZto8gKd KiqhnuFVq+Sr2BfAPaeBjnNXdJdMDbxT9HY4aPIaY4k+zUX6DORKVN9cmuRyDlcNJljdwC0pwyo F3W44egAT7XQrlEcJYYnWo7pLNxzWxSp57sVIT+PAPuHhsz4Szo1xUp+04AypRHcE+JrNzi9yyg
 gvfLSMamUFwxj2Ywbi6517eMk8hroGlufZ+rBPP7yfXXBo3bTXqrpuxsOngDqNUXDNgA6EDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218550

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://requests.readthedocs.io/en/latest/community/updates/#release-history

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.3.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.4.bb
index bc9b2289f6..49d44298f6 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-python3-requests.sh \
 "
 
-SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
+SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


