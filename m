Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5021C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 02:36:04 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3253.1638412564048611961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 18:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B22a1Ol004388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 1 Dec 2021 18:36:02 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 1 Dec 2021 18:36:01 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 1 Dec 2021 18:36:00 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagegroup-core-tools-testapps: clear GOTOOLS for riscv32
Date: Thu, 2 Dec 2021 10:35:58 +0800
Message-ID: <20211202023558.18243-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 02:36:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159070

From: Kai Kang <kai.kang@windriver.com>

go-helloworld is not compatible with riscv32 and causes error:

| ERROR: Nothing RPROVIDES 'go-helloworld' (but
    meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
    RDEPENDS on or otherwise requires it)
| go-helloworld was skipped: Unsupported CPU architecture: riscv32

Clear GOTOOLS for riscv32 in recipe packagegroup-core-tools-testapps.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index e8f0811485..1fee1c925d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -23,6 +23,7 @@ KEXECTOOLS:riscv32 ?= ""
 # gccgo may do better
 GOTOOLS ?= "go-helloworld"
 GOTOOLS:powerpc ?= ""
+GOTOOLS:riscv32 ?= ""
 
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES:riscv64 = ""
-- 
2.17.1


