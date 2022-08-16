Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F35C2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 07:54:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.13276.1660636482788326054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 00:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Raw/wdw/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5227a7d44d=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27G6LjjE032070
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 07:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=AvNzlBncBiA+AtcXPH1WpiJm3UpKM0RpBsC2nXcbyps=;
 b=Raw/wdw/Ggl8buV9FQbGJd0gXklvwX3lYnvTY7hpJq3QA6TwSwSwXMU04gPti7tE0jIA
 0kfRHZZy2K85HevC9YOdYF62c/2zyDzpjjmBJuux6G7Daym2bcL1NXVXwxHjPfEu9DYj
 rozELVQVRkAGkFNifPvyT3wKE+/Ur3h5hGo/9OXkjSJVTjb3ACGZ5u149Zn8p7uMpSPt
 mjsWPxBrsic0Zs1tQOmXcplwmft9T48mPQN7PgmwPHbAc88/taZeUKD2AKS4MkGs/ER+
 MY32a5JxiAxjFjfCcCDM+F9Vt7leky6VGpfwmb0Jq/PjjgJD8xOG6SLP15L/jR3t4MpG GQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8jbk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 07:54:41 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 16 Aug 2022 00:54:40 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 16 Aug 2022 00:54:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] distrooverrides.bbclass: use IMAGE_CLASSES
Date: Tue, 16 Aug 2022 15:54:32 +0800
Message-ID: <20220816075432.22347-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NjkMABTHHqd_PzyDtK63grnGT9CyROpJ
X-Proofpoint-GUID: NjkMABTHHqd_PzyDtK63grnGT9CyROpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_06,2022-08-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=841 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208160030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 07:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169428

From: Kai Kang <kai.kang@windriver.com>

Update comment in distrooverrides.bbclass to use IMAGE_CLASSES rather
than globally with INHERIT.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes-recipe/distrooverrides.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/distrooverrides.bbclass b/meta/classes-recipe/distrooverrides.bbclass
index 8d9d7cda7d..b5346b465e 100644
--- a/meta/classes-recipe/distrooverrides.bbclass
+++ b/meta/classes-recipe/distrooverrides.bbclass
@@ -17,7 +17,7 @@
 #
 # The class is meant to be used in a layer.conf or distro
 # .inc file with:
-# INHERIT += "distrooverrides"
+# IMAGE_CLASSES += "distrooverrides"
 # DISTRO_FEATURES_OVERRIDES += "my-feature"
 #
 # Beware that this part of OVERRIDES changes during parsing, so usage
-- 
2.17.1


