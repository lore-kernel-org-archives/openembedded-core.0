Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2680EC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Qz/117T+;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146415; x=1741682415;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KhXzqQkX7Zrla7ZmK6HGDWd/SUtY/gearsykNBSVhSU=;
  b=Qz/117T+or7dL959zed2pw5p7HGdWxzGYujp0WSYwUMLlWWUpafH0Dfu
   XEuDPig0IRwbcIHjM5uvpBB+C3xfR8PG8MXZkXDaZLW7Kkhx/XCS6J1Ay
   Q4aYkY2VOKzwIIxSUlTdO4MIjoAjjPAc/jJZYQs3MGTt/xSLn+2ewYwpX
   RVPY47g2uj5oTRXq2ZV08LjEzE0g+PlzSPWzcM1vYs+nlgSgxmO+qGxpy
   QNZAFklZDKD3qo871fB/SpPgsIyPizJOgslKEoTOp4kJU5oTcP6pJRFon
   7bokn9H1hCZIQFvV4hfU0E2lgHOGBWNayqDBix4Dxx5Mpev5ApBrzG3fl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656138"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15594005"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:13 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 6/7] gnutls: upgrade 3.8.1 -> 3.8.2
Date: Mon, 11 Mar 2024 16:39:53 +0800
Message-Id: <20240311083954.418271-6-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240311083954.418271-1-chee.yang.lee@intel.com>
References: <20240311083954.418271-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196925

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
** libgnutls: Fix timing side-channel inside RSA-PSK key exchange.
** libgnutls: Add API functions to perform ECDH and DH key agreement
** libgnutls: Added support for AES-GCM-SIV ciphers
** libgnutls: transparent KTLS support is extended to FreeBSD kernel
** gnutls-cli: New option --starttls-name

(cherry-pick from Oe-Core rev 3c01bb0be8ddafa0aa1ad996ec524b51fd28f512)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.2.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.1.bb b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.2.bb
index 455031dd47..43fb5c4c4e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c"
+SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.37.3


