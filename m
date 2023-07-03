Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE83EB64DD
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 03:30:39 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19946.1688355033507838924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 20:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=SSXKREtI;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688355033; x=1719891033;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8RtjDaGM+KuIf13a/UVE/BJ3yjF78qFfg4EAs/z4fyI=;
  b=SSXKREtIuKmJEuvbnG+ykLLZWWG12gABbOhl/vTYLZncNe7vbLgKQlcS
   EFKaVlUKTAFp4TOYwvMlBxrJ9YeDq+1Zlnmi3tdGSlkIvJJqFPcyTVVCB
   t/7m+bwpgwnvSkN20RBFZQBVXlKkh5R5tGkErqxlImCjttKb5sCyz5w65
   63VVH4W29F9z2BtcWO3EHjEHbP2JriWx4hFuYmRt8Wwh9l2zbQqmyNl+w
   anI86+seMFodMhE0dQ1RvLD4xLJb1MANO/q6tjszd0CyR9y4f46GuiiEB
   xvsFe5jd4jXz8FOjxnvc67+AwXjjf+uT3nacfv7JC2szrwY+5zEUtG4ro
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426461608"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="426461608"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048908144"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1048908144"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.68])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] vte: upgrade 0.72.1 -> 0.72.2
Date: Mon,  3 Jul 2023 11:30:22 +0800
Message-ID: <20230703033025.30865-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183788

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vte/{vte_0.72.1.bb => vte_0.72.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.72.1.bb => vte_0.72.2.bb} (94%)

diff --git a/meta/recipes-support/vte/vte_0.72.1.bb b/meta/recipes-support/vte/vte_0.72.2.bb
similarity index 94%
rename from meta/recipes-support/vte/vte_0.72.1.bb
rename to meta/recipes-support/vte/vte_0.72.2.bb
index b9ff3183c8..4249b75ac0 100644
--- a/meta/recipes-support/vte/vte_0.72.1.bb
+++ b/meta/recipes-support/vte/vte_0.72.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "0554f9f88d56ce2d78398fcc7f69bc00e53bbbc5f694e0ae1dcaf5286f89d7e4"
+SRC_URI[archive.sha256sum] = "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.41.0


