Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B780C77B75
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 02:31:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5731.1684377084465781346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 19:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=oHZSidln;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684377084; x=1715913084;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/hh6LfjBNyA6HV4ypMpbNT0dDg/95+crKs4I+BuK+oU=;
  b=oHZSidlnsVL11oy/6oDt60KbyLUpIJFy5sZKS0hqv5+9AwgBlfGIDRww
   o0shaFZplTFy81wwML0lJ0UA0E9yR+Gsrp+4bINdJToCi/e4qqz2GmlFM
   ReQwmj4+DqECI34nnXs3xE6xhurYurTiCHLNXK4lzn3UQLmFx5E0kYja1
   rBSVUqRIEj85gH2r0lEtHyERB4AKVTGS/LOnUypcq9AeLf5EgH718rqQP
   PJEq5FmGlNfWdNoQw+mIHA8oJdJ/Q0BMNWAFLpyXzVX+7KwKbTuVV/zuC
   tsRxpywA4CuM+wbijj5LcsqrOi5f6cL1WBGr/kp9RTjyefz9I1qZe8ReL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336506803"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="336506803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732692981"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="732692981"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.171.143])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] gsettings-desktop-schemas: upgrade 43.0 -> 44.0
Date: Thu, 18 May 2023 10:31:14 +0800
Message-Id: <20230518023118.16406-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181507

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...esktop-schemas_43.0.bb => gsettings-desktop-schemas_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_43.0.bb => gsettings-desktop-schemas_44.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
index 966a67fead..8e30d5e524 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "5d5568282ab38b95759d425401f7476e56f8cbf2629885587439f43bd0b84bbe"
+SRC_URI[archive.sha256sum] = "eb2de45cad905994849e642a623adeb75d41b21b0626d40d2a07b8ea281fec0e"
-- 
2.40.1


