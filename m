Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3640C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:12:58 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.9181.1635325977810863206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="229974021"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800";
   d="scan'208";a="229974021"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800";
   d="scan'208";a="572845052"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Oct 2021 02:12:55 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/parselogs: whitelist drm failure in common
 errors list
Date: Wed, 27 Oct 2021 17:12:52 +0800
Message-Id: <20211027091252.5781-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157507

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Add the following line to common_errors list.

  [drm] Cannot find any crtc or sizes

This message is not harmful, it extended the coverage for drm error message.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 2b8893d842..96da0b4f5c 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -32,6 +32,7 @@ common_errors = [
     "Failed to load module \"fbdev\"",
     "Failed to load module fbdev",
     "Failed to load module glx",
+    "[drm] Cannot find any crtc or sizes",
     "[drm] Cannot find any crtc or sizes - going 1024x768",
     "_OSC failed (AE_NOT_FOUND); disabling ASPM",
     "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
-- 
2.33.1


