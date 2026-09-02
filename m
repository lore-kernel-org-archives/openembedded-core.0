Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBCBC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 07:12:22 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6724.1788333139019316102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 00:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s1ORFEJh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788333139; x=1819869139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cXE3Fqj66pOjWBoGprZ4hvJvvt88nngfo1POzuHIv4c=;
  b=s1ORFEJhXAFL7EBEVa+JNlSi8H3RPBwXiKf4L78SwgrQLj2jo3bL0xnJ
   ZqQz2bRmW1LVVEQ+xKkOCDAyzjKFmr2mK1QkYv4vRD1c02scu74XMoPJj
   nqYzPedbh1YXSJZrN0pdUZzAOtRl0Gc2YbYNTSZSjkwT1yCyQhAbV+BTK
   BG1arVZ12lrxU5F3X/Xt+s8vZuEKJKYwCp4mvFLI/KNFv3LeoTbcfwfH9
   1FdXxhJBp9dJkfZMtn57fbcK+aTq4bpZctNbsY7xur+LEzx8ffsJ6N84s
   Q2zAcyZbbbxI+2Oq5GIt+9aiw2myaVIGBzVIqpathxwvpNC4sd5Oy/r1q
   w==;
X-CSE-ConnectionGUID: bPrAaggoTWSdR8ipN/LvSg==
X-CSE-MsgGUID: 6d0gJ+sfT3ukZcp1s9vGMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="239740001"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="239740001"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:12:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 77C0FC0040E
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 07:12:11 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2A844C00228
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 07:12:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2B547100A6D0;
	Wed,  2 Sep 2026 07:12:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-spdx-python-model: : relax shacl2code version constraint
Date: Wed,  2 Sep 2026 15:12:05 +0800
Message-ID: <20260902071205.1269-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 07:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244896

From: Wang Mingyu <wangmy@fujitsu.com>

shacl2code has been upgraded to newer versions (1.2.0+), but
spdx-python-model 0.0.6 still pins shacl2code==1.1.0. Relax the
constraint to >=1.1.0 to allow compatible newer versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-dependency-to-allow-versions-1.1.0.patch | 28 +++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.6.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-allow-versions-1.1.0.patch

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-allow-versions-1.1.0.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-allow-versions-1.1.0.patch
new file mode 100644
index 0000000000..711ba6fb4f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-allow-versions-1.1.0.patch
@@ -0,0 +1,28 @@
+From 28c886568aaf8328fba9c47d5b5c613acad1d808 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 2 Sep 2026 06:47:35 +0000
+Subject: [PATCH] Update shacl2code dependency to allow versions >= 1.1.0.
+
+Upstream-Status: Submitted [https://github.com/spdx/spdx-python-model/pull/57/changes/813c189567695a61b9bde86a1f3773005109a5af]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 94b511c..119c2bf 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -49,7 +49,7 @@ issues = "https://github.com/spdx/spdx-python-model/issues"
+ requires = [
+     "hatchling >= 1.27.0",
+     "hatch-build-scripts >= 0.0.4",
+-    "shacl2code == 1.1.0",
++    "shacl2code >= 1.1.0",
+ ]
+ build-backend = "hatchling.build"
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
index def12b2049..8fbd76b16d 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
     https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
     https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
     https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+    file://0001-Update-shacl2code-dependency-to-allow-versions-1.1.0.patch \
 "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
-- 
2.43.0


