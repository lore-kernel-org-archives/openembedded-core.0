Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E1BD59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 08:43:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43983.1765788228951386656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 00:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Kt+/pQtI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4444066fb7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF69SgF3530180
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=tdc+GhAr2culd66nYJ+L
	ZpVw+lXQTL3L9PTH3pVGg6g=; b=Kt+/pQtI9jGuO8OHSxWui5k5WcgwwClRErSo
	0PH8KKEYenWWOmYMqHz4rVkABMHXtq/AggInLqFwCXo8Rgg2u7Pc7elFnMXyK3OQ
	vu+kI4FPDg/+9jqqp1eaGLDy8DkQAZ5PafWtGwcK4xjWKeZHzXhplWHU6jgMTRYj
	WIJxC3QpVg1/3eNBGSQUvL7bSKuRJqBe3kPbDIeovdX+r185fJFHf0pW+mr9/Jm5
	WfnPZMH6HdAlZKR6sqFwf1JX1E9ZlwDpct3Cp7hlw+1jaT9YSzWSX6nIL7Tfh0ot
	sTJ1o/lze2KTQ+oZfMa852khBu9QOYy/dGV6i/WjOCRUql8Jig==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0hnmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:43:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 15 Dec 2025 00:43:46 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 15 Dec 2025 00:43:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] libgpg-error: 1.56 -> 1.58
Date: Mon, 15 Dec 2025 16:43:44 +0800
Message-ID: <20251215084345.1797393-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX44mvmFcHUxdH
 P+1w4CsKjBnk7fUgjouv+dQCeupIWDIxm8bbZJHJ1D3Rrr0kC6r9yKWzrImZcxrCKufDeKGO3gn
 eMsAv2b1KllAtGrbbJrJDzNSqbTXEtL+RKzUpSd0wUHJVvhoM8DxFtXZw2xhonKFB3NQwApqWSm
 Oy73yZ4dwovGgtNExj7/N2wAkCXSX7YfRiNZYGLIm6XuZmcmpqMULfx64eIqfrGTwLRHxVUao3B
 wbkZwjFRVXmhAXfwlwyqXzEN6u+3palj+CKY5rE4idU/kW0Rl4fLg4lIjwZTLtsR0rYno7k5XH8
 TcMEe0APyka4A5am1zWxptlHWIM/ma4X6zsvkwwR2/yEB3cQY8k1on163+Gu2LHzCazg2AUvaOr
 GqoSXnJWE5QNUiwFUlL6fWa9mI1lbQ==
X-Proofpoint-GUID: _KAYABQtLv8n8m6NUrTarhGxNFTdJ9ay
X-Proofpoint-ORIG-GUID: _KAYABQtLv8n8m6NUrTarhGxNFTdJ9ay
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=693fca43 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=37Qppnzl_XxxE9mqZgUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227700

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgpg-error/{libgpg-error_1.56.bb => libgpg-error_1.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.56.bb => libgpg-error_1.58.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
index d3cc88f971..d42a9028e8 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0"
+SRC_URI[sha256sum] = "f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.34.1


