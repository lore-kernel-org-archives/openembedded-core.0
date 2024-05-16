Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF54C25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:51:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.10459.1715856700667342611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=c3Id9Pem;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715856704; x=1747392704;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VIys7NPwikYBryDLubnPrzsvQ8lt2I0GuiWvFLyKvHU=;
  b=c3Id9Pemt8XPl+5ktyYs323HsUSNiau0oyygHERm3QGiaKPgoMSp7zSn
   0TB9QgXKysNyjyxtMmq927z4Lyv9UhZeVY2VM2eDiz/lKe3eZxKrMw/vo
   XZB25K1gOtvh41I8RpSjztnAgx7fhVQwd58T0QBr81k0h2cYh7yQqhF0K
   fgB+G+KxZHgImI9JXNVmFC9ptYnzuSWmt0YQWB0G+4DY80KLZE2EOraMf
   yYvSuLluYuXKiDXqdRSDpqV5JMPkqmJnRxfh1NBmx2KE4u+7araLxw+mw
   z5JsixuTaaT1CzbrgK0qcbbLwOqKMKM3gOiNXjgATPjRQsKI79+UyCKj0
   g==;
X-CSE-ConnectionGUID: eoAKNN81RUey5tYk7c6Jww==
X-CSE-MsgGUID: Z1C+m8mhR664wnFA/NlJvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22561974"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22561974"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:44 -0700
X-CSE-ConnectionGUID: HFQEDn0ASR6qgr0URraHlQ==
X-CSE-MsgGUID: datdQuetTLeFasgEIhzJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31516351"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.165])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:43 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] glib-networking: upgrade 2.78.1 -> 2.80.0
Date: Thu, 16 May 2024 18:51:29 +0800
Message-ID: <20240516105129.35869-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240516105129.35869-1-anuj.mittal@intel.com>
References: <20240516105129.35869-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199457

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch  | 2 +-
 .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6c2e3c634b7..88ac15e7d7c 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
+From 1bd273b207044a77fba6a6a57a743a1768b2676b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
index 5060d9fd7a1..c8a13555486 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
+SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.45.0


