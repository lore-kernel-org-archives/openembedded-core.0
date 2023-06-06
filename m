Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00CCC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:17:08 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.2122.1686028620587863173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=nrbhAzgo;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686028621; x=1717564621;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GM7lvko5iEiErgijRmx/RAqkmlUecyWuz1l7zgxo5Oc=;
  b=nrbhAzgoqz1SQER7ymSaRfbtE/IwgFo82Avdwk2NSdDz89NlnAUNTLEn
   aaegF4KOrlkjul49LKxVh1cfooADDFxTzB77o1I+LFA79J+ggXJlMIiPR
   zhOc1s7yHz1EU5or1MwhxEW3MqLWiTv7yPCGF0Pzvat0U34eWFksgaKwo
   afikiFkDzT8mKm7QAfcKDiXZU97Cz6ndH5GgXPp25DxHodxFjoM6w9O0z
   4Gw48Dsr/+B57YZo8ffavmlkJtP9QRbMcwZlLfzsxxOrDlF1uXZQhyXZD
   UISQ2Wif7+307n/ErBI6d3FmJB7yLjmD8CheXxKwff9V6XlDPzCquASyr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420113021"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="420113021"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 22:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798683775"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="798683775"
Received: from anmitta2-mobl3.png.intel.com ([10.107.4.247])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 22:17:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] glib-networking: upgrade 2.74.0 -> 2.76.0
Date: Tue,  6 Jun 2023 13:16:48 +0800
Message-Id: <20230606051648.29103-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606051648.29103-1-anuj.mittal@intel.com>
References: <20230606051648.29103-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182409

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


