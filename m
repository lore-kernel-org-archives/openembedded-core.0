Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7B4C7EE2D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 02:31:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5731.1684377084465781346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 19:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=cmKnTTpw;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684377090; x=1715913090;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GM7lvko5iEiErgijRmx/RAqkmlUecyWuz1l7zgxo5Oc=;
  b=cmKnTTpw4aNQq96aeAh6za9UBJNKVu3k0dsWXu2rGMtRHx1wGBfGhZjp
   Yg/TL2Fwbhym67SSO9xOaVd98cAWYyHNMlEXtkePY5WxXBwBE51JjEIPM
   jnHkRNISgDD/2aM2wC0xLfJKLw+pKMoM+hsAVP6eecXz8z2VCpDooMV6I
   5tKoY0j/zv6oT3uP+MOkUfAfpyGKFqjzajIB3+Bo5iPSAJ2gc88IzEeSm
   jZXEbuSiZtWoDIO47S0ZZXxcXw5ugQHqnouBnWO7j5/ZE3nlII68c6P00
   7YqiFaFxjSmGBhr/CHqz/8btWohrSF0JkbMLRjPHUTqJjWtGpkLszZP48
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336506819"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="336506819"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732693050"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="732693050"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.171.143])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Date: Thu, 18 May 2023 10:31:18 +0800
Message-Id: <20230518023118.16406-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518023118.16406-1-anuj.mittal@intel.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181511

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{glib-networking_2.74.0.bb => glib-networking_2.76.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.74.0.bb => glib-networking_2.76.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
index fe6900b036..75c031e8cd 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "1f185aaef094123f8e25d8fa55661b3fd71020163a0174adb35a37685cda613b"
+SRC_URI[archive.sha256sum] = "149a05a179e629a538be25662aa324b499d7c4549c5151db5373e780a1bf1b9a"
 
 PACKAGECONFIG ??= "openssl environment ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.40.1


