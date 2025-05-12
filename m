Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F70C54757
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.45978.1747040643762745132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AA5NICXV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040644; x=1778576644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TBrselKtCP2DMlA5Phdipg65mqeJ9SPahMsUzlM0LLM=;
  b=AA5NICXVJTgL7SawwrzJM9uo5nBeOxXrJW1AEaiSpyoYNJMxhWs3X2Ye
   Fzw83fb6nMFXO0M+EXkxoqNp7hcnj/7duoSYfPD+q8jSFFtlNtCOH7t9G
   dtNoL0lT3zgX/j06101X9N5X/lN7QGTzQLRq4pAKc2mBefz6WobB/PnbC
   27fzYgY6pK8UEFpYgQLLrz0Kjk22YuXu/nEG3wn7oi6NXHsliZ+wHxr8r
   ZV5GM2eUu2C67FWM44rQalpJQKGZTmvp3pem2tiKDQkLgKn2qODtTKa7N
   xDkYTP7X6yo2BWiWotzCTsRtjB8sgPTmW1qT2hUeHQyUveWc0njobCnON
   g==;
X-CSE-ConnectionGUID: s7YTATIXSKGMFeSTRM+iYQ==
X-CSE-MsgGUID: LLDmue98QHS6xpTLMml1hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125954"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125954"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BA39EC2264
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CD6DD4C01
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 147451A009A;
	Mon, 12 May 2025 17:03:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/56] libxft: upgrade 2.3.8 -> 2.3.9
Date: Mon, 12 May 2025 17:03:13 +0800
Message-Id: <1747040619-7566-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216330

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- manpage formatting-fixes
- meson: Add option to build with meson
- Require xproto >= 7.0.22 for _X_UNUSED
- Remove support for building with pre-C89 versions of C
- Remove support for building with pre-X11R7 versions of X
- fix potential buffer overrun in _XftGlyphDefault
- issue 21: remove redundant/out-of-place prototype for XftNameUnparse
- build-fix for older versions of freetype2: FT_HAS_SVG was added late in 2021
- issue 19: Problem loading "SourceCodePro-Regular" font in Fedora

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxft_2.3.8.bb => libxft_2.3.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.8.bb => libxft_2.3.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
index 2699c1dfd7..0b7c736451 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb
@@ -20,7 +20,7 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49"
+SRC_URI[sha256sum] = "60a25b78945ed6932635b3bb1899a517d31df7456e69867ffba27f89ff3976f5"
 
 XORG_PN = "libXft"
 
-- 
2.43.0


