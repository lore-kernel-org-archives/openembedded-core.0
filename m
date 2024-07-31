Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490A0C52D6D
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web11.39371.1722419602024170886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=HyIGocV0;
 spf=pass (domain: gehealthcare.com, ip: 67.231.157.48, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V9dbQ8012138
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=9qiKzezcO0NvnEVY9R73lXavEigY1vWDgS0oqjkGZVs=; b=HyI
	GocV0+2VQTAbdtfJmLMndT9RI/2c3MjQHm+Y7thI5QxkPMdEegWGwNCsHxMfyktM
	nE00Z5aGieTSPTy2VbeFCl5P6suJwF5rD/rrkTkSHiwOBTBfp1AsrKDKPh90K1yW
	QgALRcfPq/bOe+8Hl4JFOrjRx9RrNLACSr0nVjgkelig/pEFJ61i86ZomDMvSTJC
	B8r/5gCSI+ipDNvu9N3FrrTpBtZcA5Tu9mqHzEHov0LwkaXk+i2kjF9YIDNNYpXL
	7rjQlgLUbw/20jliGCdz4Aa7DSmPcxRUdafcuOtvftYbtxRdRBh4KrO5Oy9ZhzVp
	6+BOchYlMJVD1uup27Q==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Intaek Hwang <intaek.hwang@gehealthcare.com>
Subject: [PATCH 6/7] python3-psutil: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:08 +0300
Message-Id: <20240731095309.95-7-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pdR_aWXu3jGs7Kw3cEX16_n4g2ptrpX2
X-Proofpoint-GUID: pdR_aWXu3jGs7Kw3cEX16_n4g2ptrpX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_06,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=610 clxscore=1015 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202698

From: Intaek Hwang <intaek.hwang@gehealthcare.com>

Set CVE_PRODUCT of python3-psutil to match NVD entries.

Signed-off-by: Intaek Hwang <intaek.hwang@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/recipes-devtools/python/python3-psutil_6.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb b/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
index 30b4df6bd0..787bc61e89 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.0.0.bb
@@ -38,4 +38,6 @@ RDEPENDS:${PN}-tests += " \
 
 INSANE_SKIP:${PN}-tests += "dev-deps"
 
+CVE_PRODUCT = "psutil"
+
 BBCLASSEXTEND = "native"
-- 
2.39.2


