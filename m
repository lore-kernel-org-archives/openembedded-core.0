Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3338FC52D1F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web10.39083.1722419602577382089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=Ia2s6EXw;
 spf=pass (domain: gehealthcare.com, ip: 67.231.157.48, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
	by m0048206.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V9enQv009189
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=P9ZsFSyf5iKrdbFbnJ3pEy9c19rYOUbpRWP6dyXmGgc=; b=Ia2
	s6EXwBAx70tOeVnPVbauV6CRGsjArCmnbBx7ef/hMY7SkziUugLxJ4VyErJShOH3
	faAYamV6NO+wh8s+jrAPHh+EDKOQERoOuROjeky90xpEo3tiRhlLpW8fg8SkC0Ho
	D91+5PaALXl3dyoQsFxrMFsEJKQyKeroQrktAWldqLaKUhpGkfc3eZOO96J+yNX7
	eh+7m/jaLUhJ7kpeHokcAeOW8HCID9K8ygHneDfAoxFG17MoashMMGHy2nCUrfSd
	fcDnavxZKPUrMe7EXD7GrdqF4vCxm9CSx4W7s9PHXHy1xBHVEOvdFQvPoROkSnYC
	9LIMPRN1/YudJJvLDyA==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonas Munsin <jonas.munsin@gehealthcare.com>
Subject: [PATCH 7/7] bzip2: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:09 +0300
Message-Id: <20240731095309.95-8-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qt70x7-ou1pZd3Y1Aqb3c5Tk6sHcn-Ov
X-Proofpoint-ORIG-GUID: Qt70x7-ou1pZd3Y1Aqb3c5Tk6sHcn-Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_06,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=351 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202700

From: Jonas Munsin <jonas.munsin@gehealthcare.com>

Add CVE_PRODUCT to bzip2

Signed-off-by: Jonas Munsin <jonas.munsin@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index adb6ded581..324276df70 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -66,5 +66,7 @@ FILES:libbz2 = "${libdir}/lib*${SOLIBS}"
 
 RDEPENDS:${PN}-ptest += "make bash"
 
+CVE_PRODUCT = "bzip:bzip2"
+
 PROVIDES:append:class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


