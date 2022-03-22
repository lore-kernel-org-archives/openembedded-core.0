Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA33C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 07:07:06 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.6859.1647932819417119235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 00:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Dldasn1i;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647932819; x=1679468819;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n2+SRAz8cyRoS3aoWSM7bC11Ms8vIkwJQVHQaofZCSg=;
  b=Dldasn1iOdGaO5kXmwrXDV/CVW0fsgds+ED+xpMysi80qPbjmtNYWUEW
   NL5Eqzi+oq3eAszn9USOZLEpLheB5ZO81jhmWrlGXzpJWov6disJoRjq2
   BotIYK38yfbMuXq8+O3sD7l5aauNbGtei5RqEIyCa9afUgvWyW6f2XuiR
   5L6cg5o8jnkxbIwHKiFSynk10qXradCsCgYnjwGS3gBGcOGG9c6PxvHjO
   9tU7/9/9ED+BiqE3Uwz8vfoQv8eLmGbAmC9XIOtUTktOZQmgKO8r8Q275
   JCxQ17UxLS/kvVZvONBqb/mWQCTLJIXGUQ007XUyBrX6SuxaGMjYHu6hh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="320943904"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400";
   d="scan'208";a="320943904"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 00:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400";
   d="scan'208";a="600767281"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2022 00:06:56 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH v2] webkitgtk: update to 2.32.4
Date: Tue, 22 Mar 2022 15:04:20 +0800
Message-Id: <20220322070420.249914-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 07:07:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163530

From: Chee Yang Lee <chee.yang.lee@intel.com>

This is a bug fix release in the stable 2.32 series.

new in the WebKitGTK 2.32.4 release:
Do not append .asc extension to downloaded text/plain files.
Fix several crashes and rendering issues.

https://webkitgtk.org/2021/09/17/webkitgtk2.32.4-released.html

Also update patch file to fix fuzz.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
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
2.25.1


