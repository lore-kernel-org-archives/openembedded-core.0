Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F54C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:43 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iOX/InFT;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118402; x=1674654402;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZEB8Urtk65oxRjXaGOqJCxfm/4mopJMxaCQavX5caC4=;
  b=iOX/InFTpxCCk7R2j4lHQO1dk0nWw7s9/MrJBM8UXJk8EgaZZNtxeOnV
   Pk2xW4f2FHJxEi0EAEFdqV9fJ1Tui1xaHof4q7fEZ3q/T1lL5Kx1u+DoB
   u5nHauIyT+I5wEgEHD2CLa78WqzBhxx9JHONU8P6+llcmia+uDeaw4Wae
   Qe2GgiUw7fBJrcBz+uPgoqRq/itz8qOWKrhXfQLwtfy9sLQg2QGtW/S7o
   0sABp/J9SWfxa1d4B43Qp5aM9hAkgjw/G1cN7y/fWOJJvrAiH971SmgkK
   8GlgFsviJjGABs62TADR+YYn4SwcekWAAOypik3hSI6v+VKQBEm15g5Of
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016490"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016490"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494354"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/13] expat: upgrade 2.4.1 -> 2.4.2
Date: Tue, 25 Jan 2022 21:46:01 +0800
Message-Id: 
 <2a5e1b617678c148d96f767493cb08e9cb2fc9e7.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160928

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
  #509 #510  Link againgst libm for function "isnan"
  #513 #514  Include expat_config.h as early as possible
       #498  Autotools: Include files with release archives:
               - buildconf.sh
               - fuzz/*.c
  #507 #519  Autotools: Sync CMake templates
  #495 #524  CMake: MinGW: Fix pkg-config section "Libs" for
               - non-release build types (e.g. -DCMAKE_BUILD_TYPE=Debug)
               - multi-config CMake generators (e.g. Ninja Multi-Config)
  #502 #503  docs: Document that function XML_GetBuffer may return NULL
               when asking for a buffer of 0 (zero) bytes size
  #522 #523  docs: Fix return value docs for both
               XML_SetBillionLaughsAttackProtection* functions
  #525 #526  Version info bumped from 9:1:8 to 9:2:8;
               see https://verbump.de/ for what these numbers do

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98a87bcfa50fc46ea86a085d330f5cbc41ddaaa5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.1.bb => expat_2.4.2.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.1.bb b/meta/recipes-core/expat/expat_2.4.2.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.1.bb
rename to meta/recipes-core/expat/expat_2.4.2.bb
index 14e5aca9e6..771f14eb3e 100644
--- a/meta/recipes-core/expat/expat_2.4.1.bb
+++ b/meta/recipes-core/expat/expat_2.4.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40"
+SRC_URI[sha256sum] = "e40737134bdc08b8ea7d23a2c0a5cd11c04d5be152fe562d3253c1e4a0be6686"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.34.1


