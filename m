Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB895C5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 06:15:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.71378.1724739305493542314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 23:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=896980ac62=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R5rjZj023464
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 23:15:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1kacsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 23:15:04 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 23:15:03 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 23:15:03 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] libcap-ng: update SRC_URI
Date: Tue, 27 Aug 2024 14:15:02 +0800
Message-ID: <20240827061502.215016-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AQEYq6WeOe2ENySCR_6YihzbcROzyfE-
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cd6ee8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=DqrFqdlBviqJNiYOB_MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AQEYq6WeOe2ENySCR_6YihzbcROzyfE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=920 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408270045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 06:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203811

From: Changqing Li <changqing.li@windriver.com>

Refer [1], people.redhat.com has certificate issue, so update SRC_URI
to fix do_fetch warning

[1] https://github.com/stevegrubb/libcap-ng/issues/56

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb | 2 --
 meta/recipes-support/libcap-ng/libcap-ng.inc             | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
index 4790134ae9..ffde03963f 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
@@ -9,8 +9,6 @@ inherit lib_package autotools python3targetconfig
 # drop setuptools when version > 0.8.3 is released; it's needed only for distutils
 DEPENDS += "libcap-ng python3 swig-native python3-setuptools-native"
 
-S = "${WORKDIR}/libcap-ng-${PV}"
-
 EXTRA_OECONF += "--with-python3"
 
 do_install:append() {
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 12b4002d11..e4be030834 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,11 +7,15 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
+SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master \
            file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
            "
+SRCREV = "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
+S = "${WORKDIR}/git"
 
-SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
+do_configure:prepend() {
+    touch ${S}/NEWS
+}
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
-- 
2.25.1


