Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C54BC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:16:51 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.4727.1652775407330088588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24H8GZKs031026
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24H8GZS2011456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:35 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 17 May 2022 01:16:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 01:16:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 17 May 2022 01:16:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 1/7] python3-cryptography: add python3-pytest-benchmark
 rdepends
Date: Tue, 17 May 2022 16:16:27 +0800
Message-ID: <20220517081633.2992360-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516104506.3d383183@melee>
References: <20220516104506.3d383183@melee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:16:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165712

From: Mingli Yu <mingli.yu@windriver.com>

The new version introduced below change, so add python3-pytest-benchmark
to rdepends to fix the gap.
496703c8 Refs #7079 -- added basic scaffholding for benchmarks (#7087)

Fixes:
  # ./run-ptest
  Free memory: 31.283 GB
  ERROR: usage: pytest [options] [file_or_dir] [file_or_dir] [...]
  pytest: error: unrecognized arguments: --benchmark-disable
  inifile: /usr/lib/python3-cryptography/ptest/pyproject.toml
  rootdir: /usr/lib/python3-cryptography/ptest

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3-cryptography_37.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
index 1271954a08..78faea5e22 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
@@ -92,6 +92,7 @@ RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pretend \
     ${PYTHON_PN}-psutil \
     ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-benchmark \
     ${PYTHON_PN}-pytest-subtests \
     ${PYTHON_PN}-pytz \
     ${PYTHON_PN}-tomli \
-- 
2.25.1


