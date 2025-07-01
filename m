Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B80C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:38:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.260.1751384307738266921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9277eaff6f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Bo0ph030873
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:38:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1b88y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:38:26 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 08:38:23 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 3/3] webkitgtk: upgrade 2.48.1 -> 2.48.2
Date: Tue, 1 Jul 2025 21:07:57 +0530
Message-ID: <20250701153757.2798866-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250701153757.2798866-1-yogita.urade@windriver.com>
References: <20250701153757.2798866-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNCBTYWx0ZWRfX2JuBT03G0qN7 cmaalE2WcimCXtEfekGIzR9iskB0SD463aHDH56gjNwSIGWQNUHSffbWf3dzetN6nBlxjKfjNEk G0MlLJMcPzC/RqXyzQbXtblNhTBwe9gdlZzRG55+agNYp7arStLpltwOVJuvodrri7XAhUahIqm
 m8d6+h7bYYAJPRkigOWc9e615+VFnQqdW0K6HRnacsI2RxnRsXMyvkEua7q9YxCOeKd0wYyHJN3 5gXCloZMsLRuX6nPLKyoZTr8gLxdX8clken7iTQLRjGsexn91OXx1f7p6lmrSLhr9+3oJa+jnZH VrwczvHdoBFB5dspOSKtfLet+tl6Dk3t6vbAQXqO3qrLt1Ihfhm6iuIMlHfaiNWPfy9N8Ugwajl
 NAqLmeaq3GvPIoUb4iQvfvkMFwzDSF7AnNdJHA9/08PyICNqSTUX4WeA+D8LEExAgwlBqhHx
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=686400f2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=TtWqVQ85w8xvhG5bnAYA:9 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: zZtxeuyT_-pd-6EzPKCRHRucC2NkMV1e
X-Proofpoint-ORIG-GUID: zZtxeuyT_-pd-6EzPKCRHRucC2NkMV1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=750 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219587

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-24223, CVE-2025-31204, CVE-2025-31205,
CVE-2025-31206, CVE-2025-31215 and CVE-2025-31257.

Changelog:
=========
- Enable CSS Overscroll Behavior by default.
- Change threaded rendering implementation to use Skia API
instead of WebCore display list that is not thread safe.
- Fix rendering when device scale factor change comes before
the web view geometry update.
- Fix network process crash on exit.
- Fix the build with ENABLE_RESOURCE_USAGE=OFF.
- Fix several crashes and rendering issues.

Drop fix-ftbfs-non-arm-non-x86.patch which is part of upgrade.

(From OE-Core rev: f33b79a07117d4327949aa1661221a3b9bc0f7e3)

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkitgtk/fix-ftbfs-non-arm-non-x86.patch | 31 -------------------
 ...ebkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
deleted file mode 100644
index 2381acb1b0..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Wed, 2 Apr 2025 15:01:55 -0500
-Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
- non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=287662
-
-Unreviewed stable branch build fix.
-
-* Source/WebCore/platform/audio/DenormalDisabler.cpp:
-
-Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653d020d9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-index 35715e663ce7e..44ba08a33d5d9 100644
---- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
-+++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
-     }
- }
- #else
--DenormalDisabler::DenormalDisabler() = default
-+DenormalDisabler::DenormalDisabler() = default;
- DenormalDisabler::~DenormalDisabler() = default;
- #endif
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
index a58b44440e..75a39558db 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
@@ -18,9 +18,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-ftbfs-non-arm-non-x86.patch \
            "
-SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
+SRC_URI[sha256sum] = "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.40.0


