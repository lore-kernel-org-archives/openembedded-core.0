Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94752E78D51
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43595.1770627822017911537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VCjSpB4m;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627822; x=1802163822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uRGX58cCarDqrCWAfGIIlbNcwa2q+fTJQejtyPkoJSE=;
  b=VCjSpB4maaRNFlb1vRvR7mKbMRTAyCvfKAhsN5D5F7sOlZf9hZW2dfpA
   4tvSCqMzrJOPfddYUKRBAU9nppb4Ci7c6YqwHJqmG797bdnb8DY2Ph1s/
   9BU4PES6Fo6pooVVhv3YL6QlBVY4QcGgAgkkgkNGLok2xKseE/Z3ruDml
   rSLwE4wuM6vfOzSRpFuMLhxg+xeDHsaUvgvomBXgoiimiEFn2rnIJ0cmo
   HG+EmiLsYx7NTxSkm2LfYdr9LAk9663GoEFfA/HQgSIbDrs8qtmpPDmgn
   dm1DrJUMnJPb2wDPZrHor8TwdbFXeavqiPci+IkkuH3nmbAWniOZxpopv
   A==;
X-CSE-ConnectionGUID: B19SaVUISPS40Lmw4Jbl8Q==
X-CSE-MsgGUID: ns9KGZEYRl+ZNJM6oJ1SrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449684"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449684"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 7AA7A1C000FE
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:40 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 30E501C002C0
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A6C10101A406;
	Mon,  9 Feb 2026 09:03:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/39] libxcomposite: upgrade 0.4.6 -> 0.4.7
Date: Mon,  9 Feb 2026 17:02:47 +0800
Message-ID: <20260209090317.1468-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230720

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: "All rights reserved." removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxcomposite_0.4.6.bb => libxcomposite_0.4.7.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcomposite_0.4.6.bb => libxcomposite_0.4.7.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
rename to meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
index 881f579695..79c2fa69f7 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
@@ -12,7 +12,7 @@ compositing transformations through a client."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=51f7b67ceb9dc21dd53952d0b7727b4e"
 
 DEPENDS += " xorgproto virtual/libx11 libxfixes libxext"
 PROVIDES = "xcomposite"
@@ -22,4 +22,4 @@ PE = "1"
 
 XORG_PN = "libXcomposite"
 
-SRC_URI[sha256sum] = "fe40bcf0ae1a09070eba24088a5eb9810efe57453779ec1e20a55080c6dc2c87"
+SRC_URI[sha256sum] = "8bdf310967f484503fa51714cf97bff0723d9b673e0eecbf92b3f97c060c8ccb"
-- 
2.43.0


