Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB16C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 05:47:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.2523.1664516831558383180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 22:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=A+8rUeQd;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664516835; x=1696052835;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=clH2kCMxZ4gIE/aaCSSla1qBHAABGGmkFIAln3eOSyQ=;
  b=A+8rUeQdO/ycLKEQ9oW6egrxYzdIQ2iGW9pJ6ZcJT+K18kQ1aW//R7k5
   dra+UkW2e2f592h80Hh5vd+M0JjcMSmeJzzHliJlXjGpwy3709Q5KB8gH
   eSzRrYDyGSe/Brq1u1lgaEexs6otQ21EytY+okME2eT7W0SQ7QQb8ppzC
   JQm69fjrzROhdBgF+6Kn5cvaxX8GHMklBD7xc4h2K3GHeCgP2AAT75sZq
   ug+3QeU6JV57QuC6zNDEUUBmJZjj/1xgTnviKlYC8Sp2BMoZI3H4qc1/V
   YrzpOTXeO43tn9lTjXno85x+1XnRQ3C+gvTOQcGqo5lrDMrCb8S9+VKFG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303023288"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="303023288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622654708"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="622654708"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 29 Sep 2022 22:47:14 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch 2/4] rpm: Remove
 -Wimplicit-function-declaration warnings
Date: Fri, 30 Sep 2022 13:47:01 +0800
Message-Id: <20220930054703.1799739-2-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930054703.1799739-1-jay.shen.teoh@intel.com>
References: <20220930054703.1799739-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 05:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171208

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 9f2dbfc51ef2faf1b6154856adb69ca9f764573b)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...alling-execute-package-scriptlets-wit.patch | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index 4020a31092..2a0069cafe 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -28,11 +28,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  lib/rpmscript.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index cc98c4885..f8bd3df04 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -394,8 +394,7 @@ exit:
+@@ -17,7 +17,7 @@
+ #include "rpmio/rpmio_internal.h"
+ 
+ #include "lib/rpmplugins.h"     /* rpm plugins hooks */
+-
++#include "lib/rpmchroot.h"      /* rpmChrootOut */
+ #include "debug.h"
+ 
+ struct scriptNextFileFunc_s {
+@@ -391,8 +391,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
      if (fn) {
@@ -42,7 +49,7 @@ index cc98c4885..f8bd3df04 100644
  	free(fn);
      }
      free(mline);
-@@ -428,7 +427,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
@@ -57,6 +64,3 @@ index cc98c4885..f8bd3df04 100644
  	} else {
  	    rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
  	}
--- 
-2.11.0
-
-- 
2.37.3


