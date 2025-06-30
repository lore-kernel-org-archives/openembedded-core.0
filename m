Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1E5C83F04
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.35288.1751274805183499294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NcsOP2p5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274808; x=1782810808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P+ynSk35GH1w3CuUSQkJ0M5RY0+foxaYbOpygbcq19I=;
  b=NcsOP2p55TVtC4zBbmnXo+nhlVEnGXVhb/SSEz05syYhBzOc9Sxr05Sr
   AXFm1ghbCnhy29FFi2YbGxNoYljUHKJ+ZDqbKvRsmPtOLdjtVxWFPIhHS
   E/reMnq2hW6w7bfMBnhieHtXL+bo4icOd3qULw3QVEoqmim5G9XpOinvQ
   XRsLmFy7SpCCyAM29E/DMA6h/6JPKJVmrfSPi6KUEKIRl2LPpyIeE6aqI
   1bUtD5BQWxQr6iAJI5dUdiF8SS6FS6xgtXNGVkYwuOuh1BxMc7bwBCDY0
   crn9gR80pU5YCbRtQixUyrHOlbTnyBzu79y/fLGU9DIG4Y+BNK9cOrD1a
   w==;
X-CSE-ConnectionGUID: zWgE1MlRQWKXlDZXsNhz5g==
X-CSE-MsgGUID: NnfTqMr9SyCjwcQ3kFphgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="207712150"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="207712150"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C16F642A317
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 3F79518009D6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A2587F8115
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:26 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1DCCC1A000B;
	Mon, 30 Jun 2025 17:13:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/37] libmodulemd: upgrade 2.15.1 -> 2.15.2
Date: Mon, 30 Jun 2025 17:12:54 +0800
Message-ID: <20250630091315.1897-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219472

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes:
-----------
module_index test now passes if RPM library is built without bzip2 or xz
compression support and libmodulemd is configured to support decompression
using the RPM library.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmodulemd_2.15.1.bb => libmodulemd_2.15.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.1.bb => libmodulemd_2.15.2.bb} (93%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
similarity index 93%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
index 6504414387..0636f8c15b 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.1.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-SRCREV = "e7f179eeeb6eee1403f090fc43a3c80bb08b5bfd"
+SRCREV = "b8b11b4dafaa2c4d73883152bfa7e5bd81cd7395"
 
 inherit meson gobject-introspection pkgconfig manpages
 
-- 
2.43.0


