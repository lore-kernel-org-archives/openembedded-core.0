Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1170CC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5668.1639013411655338325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504077"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504077"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298295"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 26/33] README.OE-Core.md: update URLs
Date: Thu,  9 Dec 2021 09:29:25 +0800
Message-Id: 
 <414e4bcbd50b8d514c2d4f6341e429006b583fef.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159426

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Update URLs to what they actually redirect to.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec2131070cae6c3933e5b08986e8245fcd9deb99)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 README.OE-Core.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 521916cd4f..2f2127fb03 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -6,24 +6,24 @@ of OpenEmbedded. It is distro-less (can build a functional image with
 DISTRO = "nodistro") and contains only emulated machine support.
 
 For information about OpenEmbedded, see the OpenEmbedded website:
-    http://www.openembedded.org/
+    https://www.openembedded.org/
 
 The Yocto Project has extensive documentation about OE including a reference manual
 which can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org/
 
 
 Contributing
 ------------
 
 Please refer to
-http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
+https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
 for guidelines on how to submit patches.
 
 Mailing list:
 
-    http://lists.openembedded.org/mailman/listinfo/openembedded-core
+    https://lists.openembedded.org/g/openembedded-core
 
 Source code:
 
-    http://git.openembedded.org/openembedded-core/
+    https://git.openembedded.org/openembedded-core/
-- 
2.33.1


