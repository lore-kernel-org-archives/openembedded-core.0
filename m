Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B61C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:24:11 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2309.1787909045377001204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 02:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uAiUj/Oi;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787909045; x=1819445045;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7TPBt86FMvT8B0itqF36RQt5MTVFRUE8Uj+H2aKe/nk=;
  b=uAiUj/Oi3NSeSAeI0PxM8J1J/VaVDHhHcF1+NM1wAVXYkwqYrQAN8lMN
   GEb8WcKGb+GdZFn1XDt9c6VAVnbUexs63kJWpyh0eIUfE5zmd9GJOCWLT
   +6R/a9Fx90JBoH5ZQPr43gMawsK+RU+eHpkEZuE8dX7enA+JmxIqQ+Yof
   /kwKD5fhMzpv4Mg+QMdymvn3mirxX8y9r38QCE0qwB5jp78POUWXtBqq2
   qYPcPsIgyKpkwXLO613ZCK7iA5p+4W4JCzOGSyrt7cIeMgERU8xiTnBnK
   QF7/MGO9M0zxpCN9gj611f3Jy8k9RMy1XOwX/F9rmE2gsBE0366N5FqYc
   g==;
X-CSE-ConnectionGUID: f1mIB54ZTLmq5HUUnJqKzw==
X-CSE-MsgGUID: qtcAVwMUQketgND62MsE7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="230759688"
X-IronPort-AV: E=Sophos;i="6.25,248,1779116400"; 
   d="scan'208";a="230759688"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 18:24:03 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5A8C01C1C72E
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 09:24:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 11E8E1400349
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 09:24:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1342810001F4;
	Fri, 28 Aug 2026 09:24:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-spdx-python-model: : relax shacl2code version constraint
Date: Fri, 28 Aug 2026 17:23:57 +0800
Message-ID: <20260828092357.1248-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 09:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244526

From: Wang Mingyu <wangmy@fujitsu.com>

shacl2code has been upgraded to 1.2.0, but spdx-python-model 0.0.6
still requires shacl2code==1.1.0. Temporarily relax the version
constraint to allow shacl2code 1.2.0 until upstream updates their
dependency requirements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...acl2code-dependency-to-support-1.2.0.patch | 28 +++++++++++++++++++
 .../python/python3-spdx-python-model_0.0.6.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-support-1.2.0.patch

diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-support-1.2.0.patch b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-support-1.2.0.patch
new file mode 100644
index 0000000000..3da9f6766b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-support-1.2.0.patch
@@ -0,0 +1,28 @@
+From 45efed593eaed035dbcc9888d45e362cdbc6ec28 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Fri, 28 Aug 2026 05:22:57 +0000
+Subject: [PATCH] Update shacl2code dependency to support 1.2.0
+
+Upstream-Status: Inappropriate [needs proper upstream upgrade]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 94b511c..6255f25 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -49,7 +49,7 @@ issues = "https://github.com/spdx/spdx-python-model/issues"
+ requires = [
+     "hatchling >= 1.27.0",
+     "hatch-build-scripts >= 0.0.4",
+-    "shacl2code == 1.1.0",
++    "shacl2code == 1.2.0",
+ ]
+ build-backend = "hatchling.build"
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
index def12b2049..9573d13473 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
     https://spdx.org/rdf/3.0.1/spdx-context.jsonld;name=spdx1 \
     https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl;name=spdx2 \
     https://spdx.org/rdf/3.0.1/spdx-model.ttl;name=spdx3 \
+    file://0001-Update-shacl2code-dependency-to-support-1.2.0.patch \
 "
 
 SRC_URI[spdx1.sha256sum] = "c72b0928f094c83e5c127784edb1ebca2af74a104fcacc007c332b23cbc788bd"
-- 
2.43.0


