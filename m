Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B78C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:17:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4613.1652775411846717860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24H8GaDo031027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 17 May 2022 01:16:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 17 May 2022 01:16:35 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH 2/7] python3-pytest-benchmark: move from meta-python
Date: Tue, 17 May 2022 16:16:28 +0800
Message-ID: <20220517081633.2992360-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517081633.2992360-1-mingli.yu@windriver.com>
References: <20220516104506.3d383183@melee>
 <20220517081633.2992360-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165715

From: Mingli Yu <mingli.yu@windriver.com>

A pytest fixture for benchmarking code. It will group the tests
into rounds that are calibrated to the chosen timer.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-pytest-benchmark_3.4.1.bb      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb

diff --git a/meta/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb b/meta/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
new file mode 100644
index 0000000000..bde9935ffe
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A ``pytest`` fixture for benchmarking code. It will group the tests into rounds that are calibrated to the chosen timer."
+HOMEPAGE = "https://github.com/ionelmc/pytest-benchmark"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
+
+SRC_URI[sha256sum] = "40e263f912de5a81d891619032983557d62a3d85843f9a9f30b98baea0cd7b47"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-core python3-py-cpuinfo python3-pytest python3-aspectlib"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


