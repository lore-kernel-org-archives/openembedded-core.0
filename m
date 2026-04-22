Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7831FF9B60D
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:36:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79498.1776854194449829045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IgQcIJgT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776854194; x=1808390194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MqesmoSoXZIpig388eIufhu7l2/Tu8fgCdve1Edgz14=;
  b=IgQcIJgT/au/N2vInf2noGW+1J+TTq8mvM0r3qV8mTANYGNHJ5ECSRpb
   Opad+5SfdHzU/oEGuMU/8cUcknTIbQRlNZ1jsvxaLsgfwNaXIlr/9XKbf
   pkPl1H4w9SUuawjFDDu5HfINYmOvpYI+2XrrSeKGphycxqBpPCvOJrf/1
   /gix3BIBDJECmdp3Xfv8gLaxzvB2QB6dWKaGhehY19AutFdsCyu6pvdlT
   +IH9iT1xAI+gxhx0Wfx/gLski53m/nguoQ7A+w6ZJMpDWH7dniGG8/hei
   7pzCIH7m/RHs3GbmLiiOJHS2XrVkca3Q6vL6wU8GIxrvqaDmgZMBo2lnE
   w==;
X-CSE-ConnectionGUID: kE1s+b6FRY+7hkRMl7m+eg==
X-CSE-MsgGUID: XiLPJ5JcQuy5sLnV2weYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="216823923"
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="216823923"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:36:33 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BBE56C0181C
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:32 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 708268D29E3
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E6902101732E;
	Wed, 22 Apr 2026 10:36:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography(-vectors): upgrade 46.0.5 -> 46.0.7
Date: Wed, 22 Apr 2026 18:36:24 +0800
Message-ID: <20260422103626.817-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 10:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235710

From: Wang Mingyu <wangmy@fujitsu.com>

Add 0001-bump-uv_build-to-0.11.0.patch to bump uv_build version

0001-bump-uv_build-to-0.10.0-14271.patch
0001-pyproject.toml-bump-uv_build-version-requirement.patch
removed since they're not needed in 46.0.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-vectors.bb    |  6 ++---
 .../0001-bump-uv_build-to-0.10.0-14271.patch  | 27 -------------------
 .../0001-bump-uv_build-to-0.11.0.patch        | 26 ++++++++++++++++++
 ...ml-bump-uv_build-version-requirement.patch | 22 ---------------
 .../python/python3-cryptography.bb            |  2 +-
 6 files changed, 30 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4e4434bd66..0515cf7705 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.5"
+PV = "46.0.7"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 800bf1b0e0..0d2b638527 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,10 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
-            file://0001-bump-uv_build-to-0.10.0-14271.patch \
-"
-SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
+SRC_URI += "file://0001-bump-uv_build-to-0.11.0.patch"
+SRC_URI[sha256sum] = "08f3d13846fdd86d4c1138a88c695cee203b3dd3825c784d64a3b06d000cdda1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
deleted file mode 100644
index 9fa4d1cd47..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1f6626557e4766ffa40874984f1e29197ed66eb8 Mon Sep 17 00:00:00 2001
-From: Ridai Govinda Pombo <beholderseye@vivaldi.net>
-Date: Tue, 3 Mar 2026 10:38:12 +0800
-Subject: [PATCH] bump uv_build to 0.10.0 (#14271)
-
-Co-authored-by: Ridai Govinda Pombo <beholders.eye@disroot.org>
-
-Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/14cfa5757461d5c228600fc0104ac0ef08ea15d9]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index f01d2c1..f7af712 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["uv_build>=0.7.19,<0.10.0"]
-+requires = ["uv_build>=0.7.19,<0.11.0"]
- build-backend = "uv_build"
- 
- [project]
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch
new file mode 100644
index 0000000000..05f225de2f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.11.0.patch
@@ -0,0 +1,26 @@
+From b1e8722ccf79ef02ae929df2e7fd7547e8615e68 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 22 Apr 2026 10:09:16 +0000
+Subject: [PATCH] bump uv_build to 0.11.0
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/pull/14545]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index eac1a07..6bc8d46 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["uv_build>=0.7.19,<0.9.0"]
++requires = ["uv_build>=0.7.19,<0.12.0"]
+ build-backend = "uv_build"
+ 
+ [project]
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
deleted file mode 100644
index 6faaf1051d..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 6d4c14a2781fb02903fd4d59f638cf72ee370b8d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 18 Dec 2025 20:20:13 +0100
-Subject: [PATCH] pyproject.toml: bump uv_build version requirement
-
-Upstream-Status: Backport [partial https://github.com/pyca/cryptography/pull/13617]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 2ed12a3..f01d2c1 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["uv_build>=0.7.19,<0.9.0"]
-+requires = ["uv_build>=0.7.19,<0.10.0"]
- build-backend = "uv_build"
- 
- [project]
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index fc5cb50b02..a2a2d3ac0c 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
+SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.43.0


