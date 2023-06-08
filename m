Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78664C7EE37
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 06:30:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3029.1686205852609933085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 23:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55238b5716=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3586UqGI015830
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jun 2023 23:30:52 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av79dk3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 23:30:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 23:30:51 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 23:30:50 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 2/2] curl: Update from 8.1.0 to 8.1.1
Date: Thu, 8 Jun 2023 14:30:48 +0800
Message-ID: <20230608063048.3826472-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608063048.3826472-1-mingli.yu@eng.windriver.com>
References: <20230608063048.3826472-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rNGYr5Af9Ulr92tAmRZjTY7XhtD3JMyy
X-Proofpoint-GUID: rNGYr5Af9Ulr92tAmRZjTY7XhtD3JMyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_03,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306080053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 06:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182496

From: Robert Joslyn <robert.joslyn@redrectangle.org>

This is a bugfix only release. Release notes:
https://curl.se/changes.html#8_1_1

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/curl/{curl_8.1.0.bb => curl_8.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.1.0.bb => curl_8.1.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.1.0.bb b/meta/recipes-support/curl/curl_8.1.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.1.0.bb
rename to meta/recipes-support/curl/curl_8.1.1.bb
index 0efd0de5c2..89ab61fc59 100644
--- a/meta/recipes-support/curl/curl_8.1.0.bb
+++ b/meta/recipes-support/curl/curl_8.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "6bd80ad4f07187015911216ee7185b90d285ac5162aed1bded144f9f93232a3c"
+SRC_URI[sha256sum] = "08a948e061929645597c1ef7194e07b308b22084ff03fa7400b465e6c05149e5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.25.1


