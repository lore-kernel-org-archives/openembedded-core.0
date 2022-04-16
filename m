Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C5EC636CF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.17615.1650106231257969090
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23GAoNx8022993
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 16 Apr 2022 03:50:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23GAoMf8010032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 16 Apr 2022 03:50:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 16 Apr 2022 03:50:22 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 16 Apr 2022 03:50:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 1/1] libxshmfence: Correct LICENSE to HPND
Date: Sat, 16 Apr 2022 03:50:22 -0700
Message-ID: 
 <3264d0197a98bb8f09c5986601efb47c59c48615.1650106095.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650106095.git.liezhi.yang@windriver.com>
References: <cover.1650106095.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164539

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license in this code is listed as MIT and whilst it is compatible with and
usable as MIT, it actually looks like HPND. Clarify the license field accordingly.

(From OE-Core master rev: 922b645f443c33060a8990d32e6b7b62ea5497c3)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 0cd0494da8f..fd113b5ec5e 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Test recipe for recipeutils.patch_recipe()"
 
 require recipeutils-test.inc
 
-LICENSE = "Proprietary"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index d153c7a603e..b0b6cb6b567 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -6,7 +6,7 @@ using file descriptor passing."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 DEPENDS += "virtual/libx11"
-- 
2.35.1


