Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AA5C433FE
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:20:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.5708.1640910004988207369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZJ8eBv4h;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640910005; x=1672446005;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aFkrhJI9sXvz1Pj8ZF9883QlhVH59Hmw/aoflDTmfV8=;
  b=ZJ8eBv4hNJWnNduvA2kqmR2NboxzPrmTNuBekgoH0iAwAVZS5D3RA51a
   qZgO5blhfXWPLl97JnwWeGtC4QyoyhXvbX1erEMNBvncq4xIFHesF6VcP
   jKDPqmjKHboYTQVtC96FLTH5+7l5nOj56GpxjoWpO8Jv0ny7B3Q31JxYN
   WGw4Iu+LaKistCpy+OlfqKae3BFFeAtf/5y2kwAjNYY+J/v93ELj3wH3T
   0FbGIAhuG7OZaPOFiN67FDNnww4JFric2kLRfIEfhJqS2lBQiGzWAf7he
   gZh4K2DUzsKAtyFLmOloezILe7fMbTIes25v1VRYWbe5nFVv0KZ2bdZFz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573136"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573136"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502360"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/11] xserver-xorg: upgrade 1.20.13 -> 1.20.14
Date: Fri, 31 Dec 2021 08:19:24 +0800
Message-Id: 
 <4e732ef0d3c90952f14804f5fc41ea16304810af.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160079

Changelog:

Mario Kleiner (2):
      Fix RandR leasing for more than 1 simultaneously active lease.
      modesetting: Allow Present flips with mismatched stride on atomic drivers.

Povilas Kanapickas (4):
      record: Fix out of bounds access in SwapCreateRegister()
      xfixes: Fix out of bounds access in *ProcXFixesCreatePointerBarrier()
      Xext: Fix out of bounds access in SProcScreenSaverSuspend()
      render: Fix out of bounds access in SProcRenderCompositeGlyphs()

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{xserver-xorg_1.20.13.bb => xserver-xorg_1.20.14.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_1.20.14.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index 01a54070c7..71367c247e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300"
+SRC_URI[sha256sum] = "5cc5b70b9be89443e2594b93656c60bd5e82cd7f01deb4ce4faf81dcf546a16b"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.33.1


