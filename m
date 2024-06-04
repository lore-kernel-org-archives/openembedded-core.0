Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51BCC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:33:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16654.1717489998092404713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6885cf17ae=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4546g3A4009185
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jun 2024 08:33:17 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7tp5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:33:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 01:33:15 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 01:33:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] man-pages: upgrade 6.06 -> 6.8
Date: Tue, 4 Jun 2024 16:33:14 +0800
Message-ID: <20240604083314.3259745-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xFjzm2W-X5n7pChh3eG5lzFWYm7wW_T-
X-Proofpoint-ORIG-GUID: xFjzm2W-X5n7pChh3eG5lzFWYm7wW_T-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406040069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200312

From: Changqing Li <changqing.li@windriver.com>

* drop 0001-man.ml-do-not-use-dev-stdin.patch since upstream already fix
the issue, refer [1]

* drop 0001-GNUmakefile-use-env-from-PATH.patch since upstream already
fix the issue, refer [2], and drop depends on coreutils-native

[1] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/share/mk/install/man.mk?id=9524f0f63badd896ccf6da7d79511100d86c4721
[2] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/GNUmakefile?id=fee8e186e3878c6e9827233efde90bc115801aa3

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-GNUmakefile-use-env-from-PATH.patch  | 31 -----------------
 .../0001-man.ml-do-not-use-dev-stdin.patch    | 33 -------------------
 .../{man-pages_6.06.bb => man-pages_6.8.bb}   |  7 +---
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch
 delete mode 100644 meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch
 rename meta/recipes-extended/man-pages/{man-pages_6.06.bb => man-pages_6.8.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch b/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch
deleted file mode 100644
index a644d24328..0000000000
--- a/meta/recipes-extended/man-pages/man-pages/0001-GNUmakefile-use-env-from-PATH.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fbf0544138af02be4d6dd3085e7ecf98ad060bb4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 13 Mar 2024 17:30:02 +0100
-Subject: [PATCH] GNUmakefile: use env from PATH
-
-This allows using env from coreutils-native (rather than host env),
-which resolves the problem of missing -S option on distributions
-with much older coreutils such as Ubuntu 18.04.
-
-Once all autobuilder distros are newer than that, this patch
-can be dropped, together with corutils-native dependency.
-
-Upstream-Status: Inappropriate [made for obsolete host distros]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- GNUmakefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/GNUmakefile b/GNUmakefile
-index 1234194..65ba327 100644
---- a/GNUmakefile
-+++ b/GNUmakefile
-@@ -21,7 +21,7 @@
- ########################################################################
- 
- 
--SHELL := /usr/bin/env
-+SHELL := env
- .SHELLFLAGS := -S bash -Eeuo pipefail -c
- 
- 
diff --git a/meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch b/meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch
deleted file mode 100644
index ec2d0600c7..0000000000
--- a/meta/recipes-extended/man-pages/man-pages/0001-man.ml-do-not-use-dev-stdin.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f16cd8c4986b7f250e8465dfbe4bda8d366e05dd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 4 Mar 2024 14:35:16 +0100
-Subject: [PATCH] man.ml: do not use /dev/stdin
-
-This was introduced in https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=30c38a8bf8ae8f4a6e71d3b8ac4abf0a40778f1e
-(presumably to build a 'sed | install' pipeline instead of previous 'install; sed' sequence),
-but it doesn't work under pseudo where /dev/stdin is absent.
-
-Upstream-Status: Inappropriate [yocto specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- share/mk/install/man.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/share/mk/install/man.mk b/share/mk/install/man.mk
-index b9865b9..06880f0 100644
---- a/share/mk/install/man.mk
-+++ b/share/mk/install/man.mk
-@@ -60,10 +60,10 @@ $(foreach s, $(MANSECTIONS),                                                  \
- 
- $(_manpages):
- 	$(info INSTALL	$@)
--	<$< \
--	$(SED) $(foreach s, $(MANSECTIONS), \
-+	$(INSTALL_DATA) -T $< $@
-+	$(SED) -i $(foreach s, $(MANSECTIONS), \
- 		-e '/^\.so /s, man$(s)/\(.*\)\.$(s)$$, $(notdir $(man$(s)dir))/\1$(man$(s)ext)$(Z),') \
--	| $(INSTALL_DATA) -T /dev/stdin $@
-+	$@
- ifeq ($(LINK_PAGES),symlink)
- 	if $(GREP) '^\.so ' <$@ >/dev/null; then \
- 		$(GREP) '^\.so ' <$@ \
diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb b/meta/recipes-extended/man-pages/man-pages_6.8.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_6.06.bb
rename to meta/recipes-extended/man-pages/man-pages_6.8.bb
index 0f091bbd7d..1181de1f15 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.06.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.8.bb
@@ -18,17 +18,12 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
                     file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
-           file://0001-man.ml-do-not-use-dev-stdin.patch \
-           file://0001-GNUmakefile-use-env-from-PATH.patch \
            "
 
-SRC_URI[sha256sum] = "006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568"
+SRC_URI[sha256sum] = "f4d5b9756b4ee52e34ca9d895095c92312ced6292395b811e11069ab007e6f06"
 
 inherit manpages
 
-# can be dropped when ubuntu 18.04 is not in use anymore
-DEPENDS += "coreutils-native"
-
 MAN_PKG = "${PN}"
 
 PACKAGECONFIG ??= ""
-- 
2.25.1


