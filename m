Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A589C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:40 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=Lfy9hEm1;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369059; x=1670905059;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UK+Vg9Mvy4Z5V5M/vB49TbX1+56hCy3E+qqHt0hNshc=;
  b=Lfy9hEm17lqY1uV3jk0471mXHCMR5L/182ULz+gRRjBWecaBtcxSuGyO
   IzMPyqJxmwsV/hxpGn+7q/hAurdBzF9CvdBAJXF2zjVoioxnYPhmlIxZG
   p6t4InP3tF1ZLCAgcsfRpSvwMaV8GkqdhjRJ/Vh11kW6FMYlGZsvinUbt
   nV69uxtT9cKoOsxYYecQYYvpVQgJRHn247MebiaPx10LC1O4CepmsnJmX
   o97s1HmQnUcW+kSre6zW9AJo6ub1Sv1FwQxQMijmpxxQO34twSj4vX/01
   nhhj8tmbDLpnBaFAaC78zJdtzhxSxVwp72ePQkREI+4G3bGuLeTtbCvwS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602223"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602223"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589277"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/20] README.OE-Core.md: update URLs
Date: Mon, 13 Dec 2021 12:17:06 +0800
Message-Id: 
 <6f10148ab4654484f9897f498f2bde140b9ef7c8.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159597

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Update URLs to what they actually redirect to.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec2131070cae6c3933e5b08986e8245fcd9deb99)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 README.OE-Core | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/README.OE-Core b/README.OE-Core
index 521916cd4f..2f2127fb03 100644
--- a/README.OE-Core
+++ b/README.OE-Core
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


