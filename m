Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55863C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 04:49:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41822.1752727750527206799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 21:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=929370f65b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H4n2gX033043
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 21:49:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdtqg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 21:49:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 16 Jul 2025 21:49:09 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 16 Jul 2025 21:49:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] webkitgtk: fix compile failure on qemuriscv64
Date: Wed, 16 Jul 2025 21:49:10 -0700
Message-ID: <20250717044910.3240530-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: njxo2cAD5dpkOxKMPQpV-oc-0zQSWaLy
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=687880c5 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=S1P_zY0y2bD-ZS9i3HAA:9
 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: njxo2cAD5dpkOxKMPQpV-oc-0zQSWaLy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfXzfwx5SqyEoyc
 LmVkXo6PoW8CRiUlFA0eyQR5peGpjHhtN9fXr/AN1E/ybDBGP//PpsHvRFxpkEb+FyGIaOeEotB
 somliCJYFoSJ6nkV0uDnKIm+XXuJJAmLGWuKBFP9gefBfs5sk7KPOcAOGnaSSFbhrxS1OlqxOwX
 qEtpjTGpiDhsrI9vutzD7VbO6wO15nXcOw62Q2aCtmMh7FZpNW8ZC6nSpgxHsLZ8K73WiB69zWi
 D1/2Z/HgO+2gzG8PIL/NB1Ykcj9kX3digkN+07gqoeyCrHtYvU9AcfBmeaeQJktmLiitESXmQkd
 h2GLMWlNUeKneJ6eXo/sFgdhlf4aePwrokO3xVwS4HfTA6DdJ1y6naVMrzdYPuw7iwsfox0/9JX
 6scytw82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 04:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220515

$ echo 'MACHINE = "qemuriscv64"' >> conf/local.conf
$ bitbake webkitgtk
...
|TOPDIR/tmp/work/riscv64-wrs-linux/webkitgtk/2.48.1/webkitgtk-2.48.1/
Source/WebCore/platform/audio/DenormalDisabler.cpp:95:1: error: expected
',' or ';' before 'DenormalDisabler'
...

Backport a patch from upstream to fix the issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...5.129-webkitglib-2.48-Broke-non-x86-.patch | 35 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch
new file mode 100644
index 0000000000..191f1aabf0
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch
@@ -0,0 +1,35 @@
+From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 2 Apr 2025 15:01:55 -0500
+Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
+ non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=287662
+
+Unreviewed stable branch build fix.
+
+* Source/WebCore/platform/audio/DenormalDisabler.cpp:
+
+Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
+Signed-off-by: Michael Catanzaro <mcatanzaro@redhat.com>
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653d020d9]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+index 35715e663ce7..44ba08a33d5d 100644
+--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
++++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
+     }
+ }
+ #else
+-DenormalDisabler::DenormalDisabler() = default
++DenormalDisabler::DenormalDisabler() = default;
+ DenormalDisabler::~DenormalDisabler() = default;
+ #endif
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 58d0a11202..d210b3d671 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch \
            "
 SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 
-- 
2.49.0


