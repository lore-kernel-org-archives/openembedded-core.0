Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72767C47084
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.3158.1650419978333112004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=P/4CFu8K;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419982; x=1681955982;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=G7ReZ5ltCbO9K3qLDK4MlX9IMDlMnW4FgRT9WPIzk5w=;
  b=P/4CFu8KihNZubV0MbkxXeM9baL6y/tSEoKH7fpMMo4lQ321mECIy4FZ
   iW9f8qYGN7VjMM2o/4EIvgnu7oyzPGisJxdeUR9LB6pD1ZCO+2vXhhw5i
   4z4cj8W90nK0TpE3nXnhv8ifJtqeybX+iTAW6wVavQZTcnDcM+CjBx3OQ
   bVHYzkJx7mz2X3ctHTvNfSvKzN0CylR+0/49OX3J2IHX//gX8GN45Pf2R
   pu07e9IjPFbhlrSnn9cmGjoK0ZP5veqbBjkgmPtIexmwHbrnTFVrkK1ye
   321cEq4vrW4VxbHzRFW/Uh1sza/kMsYXcpygehZY/k7n2d835bCOIulyK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263379416"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="263379416"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071633"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/11] libxshmfence: Correct LICENSE to HPND
Date: Wed, 20 Apr 2022 09:59:15 +0800
Message-Id: 
 <7c3f8ffdbed56eb2791745c5e6a562b5431040ca.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164649

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license in this code is listed as MIT and whilst it is compatible with and
usable as MIT, it actually looks like HPND. Clarify the license field accordingly.

(From OE-Core master rev: 922b645f443c33060a8990d32e6b7b62ea5497c3)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index 062d6a7a05..ad9f475d15 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Test recipe for recipeutils.patch_recipe()"
 
 require recipeutils-test.inc
 
-LICENSE = "Proprietary"
+LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index d153c7a603..b0b6cb6b56 100644
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


