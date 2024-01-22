Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86AFC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 09:57:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.70031.1705917474139264781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 01:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BkPdK5TK;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705917474; x=1737453474;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ddIfKSra5lyLaZqo7rUUM+NavIskUj9ZDK6MULPn6Bw=;
  b=BkPdK5TKfvmiSesuD2XYx1dXVT+k8sPmO3BygbHSbObCORkxkh6LFlc0
   Z1WRI9BvNzYDbjtlwyARWO38VrTRovQCOmetfidPBPGQ/PhjPAooHXn19
   2nHVC35vHg01UXAUO7EAUKlpqt36pmjCh+CTwi2KKBCSm8jCBkNUYleLf
   DyR6+gRzMaA5EUNYYif8PLf+6kzw4gN1w/1f4KdPvYue6XewIEV2FHQ3P
   4bdrR3BSVeAKwoNuAuqagxywBQNOMf8YgLIf31tFnUovgVtQWH3+vtznY
   09MdtV4Sq3BV8H9LNa7KCrBmJn2C7BvLo5c9EJYg7NxnbHyL5zPLm1oX0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400811325"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="400811325"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819624896"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="819624896"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2024 01:57:53 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 2/2] sudo: upgrade from 1.9.15p2 to 1.9.15p5
Date: Mon, 22 Jan 2024 17:29:11 +0800
Message-Id: <20240122092911.2582934-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240122092911.2582934-1-chee.yang.lee@intel.com>
References: <20240122092911.2582934-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 09:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194132

From: Chen Qi <Qi.Chen@windriver.com>

(cherry picked from OE-Core rev 4b2eccc0ee3f2906f9b04de194b9df6e24c2cdf4)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 431dfba3c2..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
+SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.37.3


