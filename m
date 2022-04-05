Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3370C38A05
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=M9rCIaWB;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169739; x=1680705739;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KmOgJT4L79Pexyt0PRhz/e3kbRs9tK+CrTFdi955FH0=;
  b=M9rCIaWBIfr6hDwT1Z6zNs1jy+cOp3qsXAITr34sYBrRgcDyVSgwFoLa
   Jh2HRZlRpXvRFoDLQ0uNxnB2XpDgOwpQfjRFTrhiFSp+XwxNX9SHp8FVf
   o6pKNUMpDjDNEqaNhPcxW7aVRTaBCjb18ulKVzESQU8XGMk2/eZyq/q7b
   jXWU41AMQaYuxs3uTTeooLIq+6DFlvZf8tGYu/qjp31OxC0TFbDWTX/Ls
   Gc5td/ETV+eH9mNRjr3dDAo4Lh9ljm2vNYArdvN51t0mXpYSZAwQaU68P
   Tbi3gfahTbpQ2tHjf3qHuBHfrkvaauyv+FwjZJTlzJyYUP6mT8HwNV2Ty
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348990"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348990"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953685"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 22/22] webkitgtk: update to 2.32.4
Date: Tue,  5 Apr 2022 22:41:41 +0800
Message-Id: 
 <1f10048f5b8db6c8cf57d5ff5437ba31b8135ea9.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164040

From: Chee Yang Lee <chee.yang.lee@intel.com>

This is a bug fix release in the stable 2.32 series.

new in the WebKitGTK 2.32.4 release:
Do not append .asc extension to downloaded text/plain files.
Fix several crashes and rendering issues.

https://webkitgtk.org/2021/09/17/webkitgtk2.32.4-released.html

Also update patch file to fix fuzz.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch     | 2 +-
 .../webkit/{webkitgtk_2.32.3.bb => webkitgtk_2.32.4.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.3.bb => webkitgtk_2.32.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index 6d7d7067e4..5fc7be8d61 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -24,7 +24,7 @@ index f316f49..de81ce0 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
 @@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
- SET_PROJECT_VERSION(2 32 3)
+ SET_PROJECT_VERSION(2 32 4)
  
  set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.4.bb
index bab1c17902..3e0ecb4611 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc"
+SRC_URI[sha256sum] = "00ce2d3f798d7bc5e9039d9059f0c3c974d51de38c8b716f00e94452a177d3fd"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.35.1


