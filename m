Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCD2C48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:26:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13474.1706174757890158163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q/8azFnl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1754dbe244=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6l2lh028753
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:25:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=R5uOhT32I8ukMcG4pJfn3lQI9h0Qp93cGY3vy9lVRGU=; b=
	Q/8azFnlwZCQF5Vef4gsbHDQq4vSmPABAHFkqwhxAXIXoPkGjynx99WKIYJlDeys
	rBfTc5EGpl6jgmRpPtVUoy+iz8JhhAK7jeMmFdPxRAg9+devRvx4SRSYgkGQ/zda
	hJVrQlT8mQ6xODQMRlZppsUOHtXkpYGWz7B8mBe+KmUe6f0RjkTn8DldMuxJ8WZz
	/oweQLVXr3rb5Zcze1TW4I5mokf5PXZmDMRL2us7ECHS4rY2K7awdWcYnRaf0p8o
	WZl6TXK58eAa1ZL6mmCcSL5878SlZYQiK3YZQyHb6bVGBabZSkrDm5dlh15lTBDR
	IQ80rdowneskP3eE7lcMjw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5rb7j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:25:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 01:26:03 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 01:26:02 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] icu: Make the version consistent
Date: Thu, 25 Jan 2024 17:25:53 +0800
Message-ID: <20240125092554.3657475-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125092554.3657475-1-mingli.yu@windriver.com>
References: <20240125092554.3657475-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mbg0axc-Yd1ehbppFalnni13rH4YGnnT
X-Proofpoint-GUID: mbg0axc-Yd1ehbppFalnni13rH4YGnnT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_04,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=781 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194311

From: Mingli Yu <mingli.yu@windriver.com>

Update the version in the bb name to make the version consistent.
Before the patch:
 # rpm -qa | grep icu
 icu-74+1-r0.core2_64
 # rpm -ql icu
 /usr
 /usr/bin
 /usr/bin/derb
 [snip]
 # derb --version
 derb version 1.1 (ICU version 74.1).
  Copyright (C) 2016 and later: Unicode, Inc. and others. License & terms of use: http://www.unicode.org/copyright.html

After the patch:
 # rpm -qa | grep icu
 icu-74.1-r0.core2_64
 # rpm -ql icu
 /usr
 /usr/bin
 /usr/bin/derb
 [snip]
 # derb --version
 derb version 1.1 (ICU version 74.1).
  Copyright (C) 2016 and later: Unicode, Inc. and others. License & terms of use: http://www.unicode.org/copyright.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/icu/{icu_74-1.bb => icu_74.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/icu/{icu_74-1.bb => icu_74.1.bb} (96%)

diff --git a/meta/recipes-support/icu/icu_74-1.bb b/meta/recipes-support/icu/icu_74.1.bb
similarity index 96%
rename from meta/recipes-support/icu/icu_74-1.bb
rename to meta/recipes-support/icu/icu_74.1.bb
index 88ded166b5..196b3dc579 100644
--- a/meta/recipes-support/icu/icu_74-1.bb
+++ b/meta/recipes-support/icu/icu_74.1.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
+ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
 inherit autotools pkgconfig github-releases
 
@@ -81,15 +81,15 @@ BBCLASSEXTEND = "native nativesdk"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=08dc3852df8fffa807301902ad899ff8"
 
 def icu_download_version(d):
-    pvsplit = d.getVar('PV').split('-')
+    pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
 def icu_download_folder(d):
-    pvsplit = d.getVar('PV').split('-')
+    pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "-" + pvsplit[1]
 
 def icu_install_folder(d):
-    pvsplit = d.getVar('PV').split('-')
+    pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "." + pvsplit[1]
 
 ICU_PV = "${@icu_download_version(d)}"
-- 
2.25.1


