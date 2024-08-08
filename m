Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC26C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 06:03:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.53385.1723097029016038181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 23:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8950edd648=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4782oDJg004079;
	Thu, 8 Aug 2024 06:03:38 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rs9yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 08 Aug 2024 06:03:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:03:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 23:03:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex@linutronix.de>
Subject: [master][PATCH] libcap-ng: update SRC_URI
Date: Thu, 8 Aug 2024 14:03:35 +0800
Message-ID: <20240808060335.60779-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bVLjBZJ6BdPTC4eKLxkhEkjjTSeUX7Oz
X-Proofpoint-ORIG-GUID: bVLjBZJ6BdPTC4eKLxkhEkjjTSeUX7Oz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_06,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 06:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203115

From: Changqing Li <changqing.li@windriver.com>

Refer [1], people.redhat.com has certificate issue, so update SRC_URI
to github tag archives to fix do_fetch warning

[1] https://github.com/stevegrubb/libcap-ng/issues/56

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/libcap-ng/libcap-ng.inc      | 6 +++---
 meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 85b51c4dc6..6549bce006 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,11 +7,11 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
+SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master \
            file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
            "
-
-SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
+SRCREV = "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
+S = "${WORKDIR}/git"
 
 inherit lib_package autotools
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
index b482368a41..26899296e3 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
@@ -4,6 +4,10 @@ EXTRA_OECONF += "--without-python3"
 
 BBCLASSEXTEND = "native nativesdk"
 
+do_configure:prepend() {
+    touch ${S}/NEWS
+}
+
 do_install:append() {
 	# Moving libcap-ng to base_libdir
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-- 
2.44.1


