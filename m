Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7901CC3E8A8
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.7667.1649745635996027821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nfZz2NLI;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649745636; x=1681281636;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M1NsLYHEEccd5NPckRx6p2x6I4Dy5ICg3CYeQSnXur8=;
  b=nfZz2NLIHKRNtqrxAURnlXR15J1su7Nf6h7WT0Q0MGn+BWaARCmaS/il
   n1amwAkwHWbwnIElVMEpItp0ZAIAXdTL3QWJ48Y9Bip+hkABqDJQ6Y25i
   yH6z52FPCsydc4HqAFpmYLdKmNS9WycFkKLS3k1llf61tS0hbks0XyT4X
   /UMbH8SUOUpPe44HhjHaYCf63wt59jEabjY5yyoDynbejQiUayERh0Lkg
   i20iLn1MVrZ/K/lgZaFFQiLN+CJ4d7ncfrzS9GA5XJrHX6cHBv13U5Uc4
   kGAJ+cQ1g7sVV2q+iTG7Scdo73kAU2asSSd1khbMhaEW8issKfuouUX6l
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244173903"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400";
   d="scan'208";a="244173903"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 23:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400";
   d="scan'208";a="724310338"
Received: from laukarnkye-ilabpg12.png.intel.com ([10.88.229.19])
  by orsmga005.jf.intel.com with ESMTP; 11 Apr 2022 23:40:34 -0700
From: karn.jye.lau@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] icewm:include imlib2-loaders package
Date: Tue, 12 Apr 2022 02:40:15 -0400
Message-Id: <20220412064015.34597-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164252

From: KARN JYE LAU <karn.jye.lau@intel.com>

icewm 2.0.0 above have use imlib2 as default
rendering engine.Update icewm  recipe to include
the essential packages for icewm to work properly.

Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
---
 meta-oe/recipes-extended/icewm/icewm_2.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
index dac025de7..f28ab2fa0 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.0.bb
@@ -24,6 +24,7 @@ DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf imlib2	libxft libxpm li
     libxfixes"
 DEPENDS:append = " qemu-native"
 RDEPENDS:${PN} = "perl fribidi"
+RDEPENDS:append:${PN} = " imlib2 imlib2-loaders"
 
 do_compile:prepend:class-target() {
 
-- 
2.25.1


