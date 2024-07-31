Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D07FC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web10.39080.1722419601517681219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=f3MbyKxr;
 spf=pass (domain: gehealthcare.com, ip: 67.231.157.48, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V9dbQ7012138
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=tBdwAiYAjHhNCVGwCxWKkoWIczvND5lBPyvKTPFlc3I=; b=f3M
	byKxrHT0rx4mqsO+diFP2dnChqZvZCN9BSQ6deyLZh/QKP0psSlgUoa3ZhBwK2XH
	VGmbAiqzml7C7CkEnARwqW3B/4gGb3957oEfj+ztrn+6JxqBAtfRo6ljjnYuJ+Ys
	6txLrZ6WfFYSddb2ZKFo5d3TnFS6jMZ/0kSPTEBEjfHmreNtbXwA892NomoYhOza
	yHep0pH/Kjb4Xid80lwFQj7s/gDQ3avDw59h8Ump0PuH1yieDf6MHuqpB4IK8i3c
	0lTlZu9rxL/cCsnzhxsKwnri1s15lTqOn6F1yeS0y092ebdcXFISG0aH0aB01cCr
	mZ3myNHzJghQZpKg+xQ==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Intaek Hwang <intaek.hwang@gehealthcare.com>
Subject: [PATCH 1/7] alsa-plugins: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:03 +0300
Message-Id: <20240731095309.95-2-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: shah7RJEx_WfWDpB9y_oa38Fnii_B5_W
X-Proofpoint-GUID: shah7RJEx_WfWDpB9y_oa38Fnii_B5_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_06,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=550 clxscore=1015 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202695

From: Intaek Hwang <intaek.hwang@gehealthcare.com>

Set CVE_PRODUCT of alsa-plugins to match NVD entries.

Signed-off-by: Intaek Hwang <intaek.hwang@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
index 819cdf8e7b..7db0c4d677 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb
@@ -5,6 +5,7 @@ They are used while configuring ALSA in the .asoundrc file."
 HOMEPAGE = "http://alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "multimedia"
+CVE_PRODUCT = "alsa"
 
 # The primary license of alsa-plugins is LGPL-2.1-only.
 #
-- 
2.39.2


