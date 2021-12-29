Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A2CC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 01:52:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.46064.1640742749195287421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jlWYTkI0;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640742749; x=1672278749;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1EmwbcKXg8099/Dsz+cRk4rmQ0CLPChGLmtfFafKBxM=;
  b=jlWYTkI04uvX5wyGDU1NtNapwdeUqfJVjOGgxP4mFvWVcEaF09IlbFDC
   AFzUJKkenUQqHtqu3al4Qe9a3iPRz+rn4Pf/l0r7sgF3JjCnhpziNUDB1
   pXw8vHt+CdJL6Ca95UKOqSEYX77vo+UJlc5jXOJ27WB5tzLWJGwy2PZYf
   t3qxzfcbNV3RiULCn1KeYrtJhhcRpkYSMosqvYm0NWXR1khqgsb4EmFgf
   VqNauvPo1yG/8vNdyKJ662QNaCz29Q2rNRp/ueMQUR6HplQNPnijL+j2k
   MZTciDrjFec2xIQr7oh4T272Mtu2HcCtlGpjUzcT3sU/EqNBp7vjbIQRu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="222117433"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600";
   d="scan'208";a="222117433"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 17:52:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600";
   d="scan'208";a="524690596"
Received: from ruizhonx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.253])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 17:52:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister] xserver-xorg: upgrade 1.20.13 -> 1.20.14
Date: Wed, 29 Dec 2021 09:52:03 +0800
Message-Id: <20211229015203.522047-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 01:52:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160047

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
index 01a54070c78..71367c247e9 100644
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


