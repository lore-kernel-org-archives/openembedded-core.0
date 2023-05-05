Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCC7C7EE21
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 03:12:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.18932.1683256368354401335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 20:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=m1FxGHir;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683256368; x=1714792368;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=joC9XY0FRrkxTZYYzTNgkQUC+/OZVZzl8huc2n0A7g4=;
  b=m1FxGHir/mP1Kv/r/qfNejKiAVOAqS6hdlNvV5hhz+mbY8v8mFjPIDQ+
   HF9JtLz+ChL/LMdYl+Za5wkqxh7lCs0a9ugGpHJxqRtTiGYZH1YxXO/ln
   vQG2vVSjCKG3s8cEPFG5GeU672iWuDbAS1YgYfc8HP0bLzAtGLpMU8tre
   0JIZwXvY5jHwxaWIqaP1OYCHUoLlTB+r0oIMbA/7TywTdPB8ao1GX9nmk
   9Y08lkXKJtkSalcrXuzYxU6fcRiDoXU6GBvk/4tytRfcBJdSoKP+aks5j
   oRpI4JxgjgwZaGJREcbJsnmESuiF/W5faJuuouNOpq5LMIevVmFX9PBjQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347939025"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="347939025"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 20:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786857885"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="786857885"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.170.248])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 20:12:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] vte: upgrade 0.72.0 -> 0.72.1
Date: Fri,  5 May 2023 11:12:31 +0800
Message-Id: <20230505031231.48080-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505031231.48080-1-anuj.mittal@intel.com>
References: <20230505031231.48080-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180895

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vte/{vte_0.72.0.bb => vte_0.72.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.72.0.bb => vte_0.72.1.bb} (94%)

diff --git a/meta/recipes-support/vte/vte_0.72.0.bb b/meta/recipes-support/vte/vte_0.72.1.bb
similarity index 94%
rename from meta/recipes-support/vte/vte_0.72.0.bb
rename to meta/recipes-support/vte/vte_0.72.1.bb
index 5eaff991598..b9ff3183c84 100644
--- a/meta/recipes-support/vte/vte_0.72.0.bb
+++ b/meta/recipes-support/vte/vte_0.72.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "40fe914d6c70db34176c922725b6c6ea15d5f3cb2a9b44c57e200a5f950a6736"
+SRC_URI[archive.sha256sum] = "0554f9f88d56ce2d78398fcc7f69bc00e53bbbc5f694e0ae1dcaf5286f89d7e4"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.40.1


