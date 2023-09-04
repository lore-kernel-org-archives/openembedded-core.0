Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC107C83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:38:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.45427.1693823896941190099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 03:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BsgOt41x;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693823897; x=1725359897;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2rIv1Kiew3ktp0emYgKg/iDwuxEcYhL23gwJoot6afw=;
  b=BsgOt41xjsR9AjGSFMYz5q7gtTodF7oViEwU7havkFhp6Pc6kferjWRs
   P4fcmJE2/azdpYOLYMZm5BsMJK4DooI8nnYd+wA9QW08E7BtBy+yLZJ5f
   x97q/wDAYgSucqpXfLPD3rpSFeMrMwgxX4/CeIIUt3LoOx7dgapLxQDz4
   vLLbmGmzOQ9hcK9qH+7idCXxtauz24LIkRssYGNi4hCCuMKvUFc2IMn6y
   B/eY7QfljpPHAquhGqovE5FSgfqzthvpUgr6n8fGAH8Kc+pHc05v7dKf8
   nCERGr2wb5PIjRKR7DfHC9cw8SgDXSmkXlv2eWBKjyrJu3Xu0mK91D71/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="366793889"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="366793889"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 03:38:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="810871265"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="810871265"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2023 03:38:01 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 2/2] python3: upgrade to 3.10.13
Date: Mon,  4 Sep 2023 18:18:23 +0800
Message-Id: <20230904101823.2075193-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230904101823.2075193-1-chee.yang.lee@intel.com>
References: <20230904101823.2075193-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 10:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187171

From: Chee Yang Lee <chee.yang.lee@intel.com>

Release date: 2023-08-24

Security
gh-108310: Fixed an issue where instances of ssl.SSLSocket were
vulnerable to a bypass of the TLS handshake and included protections
(like certificate verification) and treating sent unencrypted data as if
it were post-handshake TLS encrypted data. Security issue reported as
CVE-2023-40217 by Aapo Oksman. Patch by Gregory P. Smith.

Library
gh-107845: tarfile.data_filter() now takes the location of symlinks into
account when determining their target, so it will no longer reject some
valid tarballs with LinkOutsideDestinationError.

Tools/Demos
gh-107565: Update multissltests and GitHub CI workflows to use OpenSSL
1.1.1v, 3.0.10, and 3.1.2.

C API
gh-99612: Fix PyUnicode_DecodeUTF8Stateful() for ASCII-only data:
*consumed was not set.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../python/{python3_3.10.12.bb => python3_3.10.13.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.12.bb => python3_3.10.13.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.12.bb b/meta/recipes-devtools/python/python3_3.10.13.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.12.bb
rename to meta/recipes-devtools/python/python3_3.10.13.bb
index 74f1defc95..ba53a09ef5 100644
--- a/meta/recipes-devtools/python/python3_3.10.12.bb
+++ b/meta/recipes-devtools/python/python3_3.10.13.bb
@@ -43,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "afb74bf19130e7a47d10312c8f5e784f24e0527981eab68e20546cfb865830b8"
+SRC_URI[sha256sum] = "5c88848668640d3e152b35b4536ef1c23b2ca4bd2c957ef1ecbb053f571dd3f6"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.37.3


