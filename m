Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480E9C52D70
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.149.52])
 by mx.groups.io with SMTP id smtpd.web11.39373.1722419603216374996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=eshH6Vqu;
 spf=pass (domain: gehealthcare.com, ip: 67.231.149.52, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V7nge5024583
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=Vj66yAuojYWdta0g5P7c9HFbLqNRtYhX+kt/QFulSms=; b=esh
	H6Vqu96TIN+1C/QJaQd8Xc+iBMilbdBSjUdZ1M0TRlnWcOHwdjgPuf3zvBEirStc
	U9ju3ihcMInbXY0wGNypY0SbZe7ltY/1dFC/6KMGegN3eVEfszVvqxueLSu8mbOJ
	V3DqOTCV5yS7Twb1RTwazsUeiW6YTqinXXrFrEJtrgV4GCHznWiSBW6jmBMlaoE4
	OYzFhhqPl5keALInHDCPLzHrCevjPR5DqKysn+BZueT689FYE8FvjL4E2ge0AVjh
	tLN2ld1VikFs/+np4JEpk08XT3As8O0SVaFJ3JQAHXfaQM1+MpCldUd3jhiyDjxQ
	/KUl60HWEkhOtNG7Mnw==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Intaek Hwang <intaek.hwang@gehealthcare.com>
Subject: [PATCH 5/7] python3-lxml: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:07 +0300
Message-Id: <20240731095309.95-6-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HFmcWTFXQYYLV5zpjpVarvBAW7vYfkxn
X-Proofpoint-ORIG-GUID: HFmcWTFXQYYLV5zpjpVarvBAW7vYfkxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_07,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=590
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202701

From: Intaek Hwang <intaek.hwang@gehealthcare.com>

Set CVE_PRODUCT of python3-lxml to match NVD entries.

Signed-off-by: Intaek Hwang <intaek.hwang@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/recipes-devtools/python/python3-lxml_5.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.2.2.bb b/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
index e5a22e7090..b114c18763 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
@@ -39,4 +39,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "libxml2 libxslt python3-compression"
 
+CVE_PRODUCT = "lxml"
+
 CLEANBROKEN = "1"
-- 
2.39.2


