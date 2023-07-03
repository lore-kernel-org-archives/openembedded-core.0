Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A16AEB64D9
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 03:30:39 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19946.1688355033507838924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 20:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=HRpNtzLp;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688355038; x=1719891038;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3NzaWnlj5tvgo7f493PLSjog8/HkgzdDtx51RpgzBSs=;
  b=HRpNtzLpYFF3iDDu1G/um00K67mJL9XCb3QbnkWB94wMVQZLw5s805Ih
   r9jN1/o9KBRLZPrJPlAztw1/V873fp2zjV2mIM8pLuOoJ78B0SH24eSTy
   XtmCI137T+igGJEAZDvTL/jcn6O5QgXZlzGaaaemaSZZDbqKmJy7sCzXx
   sWiFwVgDxVtVujKHFND5NHFreAb7lT/T1lJo7RH0+9UA8ALzjlKTGfFo1
   e2drYwiBwkpYAxqj4Dw/gMOEz/fZqTuSed9LrPFH8ZwvDn5dfaRmo/GaM
   lbsy9BgT/zF2EvEcQmp+LumJ5N1rdO5+06nNsJF5v3AAC5yauSZ8yNV2G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426461621"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="426461621"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048908174"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1048908174"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.68])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] glib-networking: upgrade 2.76.0 -> 2.76.1
Date: Mon,  3 Jul 2023 11:30:24 +0800
Message-ID: <20230703033025.30865-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703033025.30865-1-anuj.mittal@intel.com>
References: <20230703033025.30865-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183790

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{glib-networking_2.76.0.bb => glib-networking_2.76.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.76.0.bb => glib-networking_2.76.1.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
index 75c031e8cd..8e7290cdbb 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "149a05a179e629a538be25662aa324b499d7c4549c5151db5373e780a1bf1b9a"
+SRC_URI[archive.sha256sum] = "5c698a9994dde51efdfb1026a56698a221d6250e89dc50ebcddda7b81480a42b"
 
 PACKAGECONFIG ??= "openssl environment ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.41.0


