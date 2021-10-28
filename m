Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF14C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 11:15:52 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.11578.1635419751557539346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 04:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="291219095"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800";
   d="scan'208";a="291219095"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 04:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800";
   d="scan'208";a="447932753"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2021 04:15:48 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/runtime/parselogs: modified drm error in common
 errors list
Date: Thu, 28 Oct 2021 19:15:44 +0800
Message-Id: <20211028111544.41256-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 11:15:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157593

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Changed the following line from:

  [drm] Cannot find any crtc or sizes - going 1024x768  >  [drm] Cannot find any crtc or sizes

This will expand the coverage of the failure to also cover the case when fallback size is not set.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 2b8893d842..50101b7851 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -32,7 +32,7 @@ common_errors = [
     "Failed to load module \"fbdev\"",
     "Failed to load module fbdev",
     "Failed to load module glx",
-    "[drm] Cannot find any crtc or sizes - going 1024x768",
+    "[drm] Cannot find any crtc or sizes",
     "_OSC failed (AE_NOT_FOUND); disabling ASPM",
     "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
     "NX (Execute Disable) protection cannot be enabled: non-PAE kernel!",
-- 
2.33.1


