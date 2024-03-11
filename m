Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D97C54E66
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JUM27Mq2;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146416; x=1741682416;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WAzx1p5nZ0ltYOp9HcUPYUSPmYhqVeXwR9tfOqpdWJo=;
  b=JUM27Mq2tH/F0GJEtN0tRyqZwwrqT3btANxYRF1NCycYYy2+kpLtS+rQ
   Hbr9s0bGdup+C+wWzX31iEAq8v1KN5av1z+RvcLOGlNB06MwDlWmGlFY8
   LHrIMdRn72ERzeYYUAm/rZoyyKYJQnWaSegRqYJjhiohvk4QflnlIztfh
   3cWfnOCdF6jzkRUDWKt+6ksoOzq3Q7stiL0PiUuwijgNGgOJnZug2TtE5
   DXTorBW05JYctWCI1wdBLs7S2W8SrZJcsbdgh2jiypZVwdmZMbt6ox85Z
   ay3SZpU55nKKZm/GoyuD6QewP3GvXRl4D5/rF21Mmm94C2z4W6AIktuHH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656146"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15594010"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:14 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 7/7] gnutls: Upgrade 3.8.2 -> 3.8.3
Date: Mon, 11 Mar 2024 16:39:54 +0800
Message-Id: <20240311083954.418271-7-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240311083954.418271-1-chee.yang.lee@intel.com>
References: <20240311083954.418271-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196926

From: Simone Weiß <simone.p.weiss@posteo.com>

Upgrade version to adress recent CVE findings.

Changelog
=========
** libgnutls: Fix more timing side-channel inside RSA-PSK key exchange
   [GNUTLS-SA-2024-01-14, CVSS: medium] [CVE-2024-0553]

** libgnutls: Fix assertion failure when verifying a certificate chain with a
   cycle of cross signatures
   [GNUTLS-SA-2024-01-09, CVSS: medium] [CVE-2024-0567]

** libgnutls: Fix regression in handling Ed25519 keys stored in PKCS#11 token
   certtool was unable to handle Ed25519 keys generated on PKCS#11
   with pkcs11-tool (OpenSC). This is a regression introduced in 3.8.2.

(cherry-pick from Oe-Core rev 705d2972b38efc9f331e3635c07ca92f8812b365)

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../recipes-support/gnutls/{gnutls_3.8.2.bb => gnutls_3.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.2.bb => gnutls_3.8.3.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.2.bb b/meta/recipes-support/gnutls/gnutls_3.8.3.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.2.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.3.bb
index 43fb5c4c4e..27d6753be0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.2.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
+SRC_URI[sha256sum] = "f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.37.3


