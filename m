Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D78C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:01:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18851.1749049256387556537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 08:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250162873=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544EbK0018125
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 08:00:56 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtpd0-3
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
Subject: [PATCH 2/3] quilt: 0.68 -> 0.69
Date: Wed, 4 Jun 2025 08:01:00 -0700
Message-ID: <b3a683027cc5ed3d7137169124721c024d9a48aa.1749049204.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749049204.git.liezhi.yang@windriver.com>
References: <cover.1749049204.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XwLQ2Co9f9ZTNQVbf9RgQFu6rzEWtSMR
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68405fa8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=69wJf7TsAAAA:8 a=KSb9T-wMAAAA:8 a=t7CeM3EgAAAA:8 a=1QmTHMqvIDkuq5SBYM8A:9 a=4dITjGlUcKcA:10
 a=Fg1AiH1G6rFz08G2ETeA:22 a=KF4VuIdXkMyp4E_ug72i:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMyBTYWx0ZWRfX/8QYCkHXjhMo 5lGdSkGV3PspUyhtglcqc+TyY1/1KK47mz7K5zsH7Bww2xxCweIieXviScL78olI5PS4dvtjVtf 0nYVPFlWd04KBUrGzhYddVVVzBTfFfpnBpqLvICHumBW/kebL+BHDj/CCtKa2sZPpM1YNvAkwAy
 SE3zRSHoydNIIOuwOinn/9+G4OKew68m+fFhTa46xjFFiYTlrXgHxbkrucRYBwCOeSn5ea1vihp 0DslQ91xXIJujCgT8VjhKD09t7RaLXnarsdaNL7cUqxTsTuaQ1JENNsGJpru1EtHwmBm5lxW8DF eue4PiQbsTK9sIf924ATUGU7UhqqUVyxd6LuIbgUlY+oHoqDAQc/AKj9lNi7PO1v38y+VTaxi84
 XmzJpS5AWzcoL1/rklImkHyOGmm966AKTPHGF5b+PLOA0Uqv8Ruj4hbOGsvyMLJC+ksp+bdP
X-Proofpoint-ORIG-GUID: XwLQ2Co9f9ZTNQVbf9RgQFu6rzEWtSMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217954

From: Robert Yang <liezhi.yang@windriver.com>

Add 0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch to fix:
ERROR: quilt-0.69-r0 do_package_qa: QA Issue: /usr/share/quilt/spec-filters/obs contained in package quilt requires /usr/bin/sh, but no providers found in RDEPENDS:quilt? [file-rdeps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...lt-native_0.68.bb => quilt-native_0.69.bb} |  0
 meta/recipes-devtools/quilt/quilt.inc         |  3 +-
 ...b-spec-filters-obs-usr-bin-sh-bin-sh.patch | 28 +++++++++++++++++++
 .../quilt/{quilt_0.68.bb => quilt_0.69.bb}    |  0
 4 files changed, 30 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.68.bb => quilt-native_0.69.bb} (100%)
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch
 rename meta/recipes-devtools/quilt/{quilt_0.68.bb => quilt_0.69.bb} (100%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.68.bb b/meta/recipes-devtools/quilt/quilt-native_0.69.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.68.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.69.bb
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 4bae5c6c19..59d13237e2 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -11,11 +11,12 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://run-ptest \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
+        file://0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch \
 "
 
 SRC_URI:append:class-target = " file://gnu_patch_test_fix_target.patch"
 
-SRC_URI[sha256sum] = "fe8c09de03c106e85b3737c8f03ade147c956b79ed7af485a1c8a3858db38426"
+SRC_URI[sha256sum] = "555ddffde22da3c86d1caf5a9c1fb8a152ac2b84730437bd39cc08849c9f4852"
 
 inherit autotools-brokensep ptest
 
diff --git a/meta/recipes-devtools/quilt/quilt/0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch b/meta/recipes-devtools/quilt/quilt/0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch
new file mode 100644
index 0000000000..219deab0d6
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/0001-contrib-spec-filters-obs-usr-bin-sh-bin-sh.patch
@@ -0,0 +1,28 @@
+From 0e00d22182c4cce3b242dd8f4166d3df238b3a0b Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 4 Jun 2025 00:21:40 -0700
+Subject: [PATCH] contrib/spec-filters/obs: /usr/bin/sh -> /bin/sh
+
+The /bin/sh is more common than /usr/bin/sh, the later one doesn't exist on
+distributions such as Ubuntu 22.04.
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/quilt-dev/2025-06/msg00002.html]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ contrib/spec-filters/obs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/contrib/spec-filters/obs b/contrib/spec-filters/obs
+index 2f5b169..b675230 100755
+--- a/contrib/spec-filters/obs
++++ b/contrib/spec-filters/obs
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sh
++#!/bin/sh
+ # Basic spec file filter for OBS packages
+ # https://build.opensuse.org/
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/quilt/quilt_0.68.bb b/meta/recipes-devtools/quilt/quilt_0.69.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt_0.68.bb
rename to meta/recipes-devtools/quilt/quilt_0.69.bb
-- 
2.49.0


