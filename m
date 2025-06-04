Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA671C5B559
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:01:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18850.1749049255986460412
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 08:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250162873=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544EbJx018125
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 08:00:55 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtpd0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:00:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 08:00:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 08:00:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] strace: 6.12 -> 6.15
Date: Wed, 4 Jun 2025 08:00:59 -0700
Message-ID: <63b3a2479f9568a25a7ed46c2eacdd1ea67647ea.1749049204.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749049204.git.liezhi.yang@windriver.com>
References: <cover.1749049204.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dT8FrS0X0zFfGJUgUwNfhm42eds7oyiu
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68405fa7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=_pA1qYqWAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=gY22dEAn5uKhEIoPOFIA:9 a=TbLkyeXSistb_kka44-k:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMyBTYWx0ZWRfX1O17zwDFCVHR NNWl+Pca7FPe5fATuMOuSjbCKSIfd7q68fcJodEvxw/aY966Hvh6OhXKLxdLAFNbGNjUaxnjH86 2G9HdwTjUHSQcuh4qcZme1a1GRup35GfjdXlz+swTWAUqia4wGtdvzUaHq56HjE7XlUwRNV5krP
 U8XEhlw/WwDiuMkUIBKW2jT2JzTRkP24ZFlcZWHKF4Y77u+r+DJHCIDLqr5Gbbu+f/cwJArULGB FyRYZZlC5H37Z7r2380UT5ebReTmjcuxRtgZfc6huvbAapjXsE7zF5pF/xvlu2waoTGW4ZO7GeO N6qKhInWfaOthZae0YbrL+wKAqLFfp+53e+ycrsfEcxRij4r9tGl10SVjpqeeudtojhbXQ51COq
 iezt2Al9TsdC3jy/nw0VBcbFEGtdcEi9xXbQFvgpHz18ATcsSt8AJpQINWPltzhyUdb/w+S9
X-Proofpoint-ORIG-GUID: dT8FrS0X0zFfGJUgUwNfhm42eds7oyiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=855
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217953

From: Robert Yang <liezhi.yang@windriver.com>

* Rebased Makefile-ptest.patch for 6.15
* License-Update: Update copyright year from 2024 to 2025

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/strace/strace/Makefile-ptest.patch   | 7 ++++---
 .../strace/{strace_6.12.bb => strace_6.15.bb}              | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.12.bb => strace_6.15.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index a78c86f6a1..9520aa8842 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -12,8 +12,9 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  tests/Makefile.am | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
 
+
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e1254c3..149570d 100644
+index b29471f..b8b66f0 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -21,10 +22,10 @@ index e1254c3..149570d 100644
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
 +TEST_SUITE_LOG = test-suite.log
- AM_CFLAGS = $(WARN_CFLAGS)
+ AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -903,3 +904,22 @@ BUILT_SOURCES = ksysent.h
+@@ -932,3 +933,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace_6.12.bb b/meta/recipes-devtools/strace/strace_6.15.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.12.bb
rename to meta/recipes-devtools/strace/strace_6.15.bb
index c16e5dc478..d8ac2a53d0 100644
--- a/meta/recipes-devtools/strace/strace_6.12.bb
+++ b/meta/recipes-devtools/strace/strace_6.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2433d82e1432a76dc3eadd9002bfe304"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1efaf30bb0084b4a17a6f55f9cbcd25b"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "c47da93be45b6055f4dc741d7f20efaf50ca10160a5b100c109b294fd9c0bdfe"
+SRC_URI[sha256sum] = "8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51"
 
 
 inherit autotools github-releases ptest
-- 
2.49.0


