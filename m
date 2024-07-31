Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2051DC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web11.39374.1722419603509745442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=L5YW8BQb;
 spf=pass (domain: gehealthcare.com, ip: 67.231.157.48, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
	by m0048204.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V9qVl5027861
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=pbHNhxnuLnVkr21YGjTUgNyKwwnJWYGSmoADiIBB+yg=; b=L5Y
	W8BQb8CMuetVgmGETN076ba2MhKbyls8DqsVXCX1KKyzmch9O/kZbNglSUPbIiR+
	ULD7XdfsPZzQlYybITnZmaQ1vPvV/i8J8jkyGD13UpZgkVjbq2IvW2D9mkSnApjS
	IXDLvQbendFaNUv1JZ/HWlWWZzNDtVjM96PpEgsqrHNpnh+q0LXdYU1T3X1VfuoG
	l5Mo/+wtidMyusMs4Az6QN3QMMye8lBOfOSq4x5esu9qkbqOAkoc68BjLh9dxY9M
	RsRMOnP9xu+AFYJvo+zm6bF7YLL+0dYGAzrpdYzEZ2eN8owfnH8E7UqwKS+AZghG
	O6JqGbQjlwqMxuTIHww==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Intaek Hwang <intaek.hwang@gehealthcare.com>
Subject: [PATCH 4/7] gstreamer1.0-plugins-bad: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:06 +0300
Message-Id: <20240731095309.95-5-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oCWtO6jgGDzDjvO8O2Fx8YPZQQGZhe4G
X-Proofpoint-ORIG-GUID: oCWtO6jgGDzDjvO8O2Fx8YPZQQGZhe4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_06,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=579 suspectscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202702

From: Intaek Hwang <intaek.hwang@gehealthcare.com>

Set CVE_PRODUCT of gstreamer1.0-plugins-bad to match NVD entries.

Signed-off-by: Intaek Hwang <intaek.hwang@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
index 6766a8c19a..75efbad49c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
@@ -159,6 +159,8 @@ export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
+CVE_PRODUCT = "gst-plugins-bad"
+
 FILES:${PN}-freeverb += "${datadir}/gstreamer-1.0/presets/GstFreeverb.prs"
 FILES:${PN}-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
 FILES:${PN}-transcode += "${datadir}/gstreamer-1.0/encoding-profiles"
-- 
2.39.2


