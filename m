Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683ACD6ACCF
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37728.1766048760261225756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mO9U8Nwr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048762; x=1797584762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rEyeJqxXFBqXWLewEC7GP4pTgvOHWAfol4Zk2nWBKW0=;
  b=mO9U8Nwrfhm/utrJqO7lOQ1hlccRAh9df8RBwqZW550HejrqLjmR30q+
   iNcF3SBDI/9lK16L1bZ+5NaYaJCTmOvMFIhCrW/UKV3LTCms9qwu5FVCh
   WV58qiXd3PHdgfrRU9ba5//prlvFCwmrDSczOlOeIkYjt3AnmGyTKIPL8
   OUSitRdJmqbL7+ilzJRfm5y9KarkMVMWqQWLpLluA+HYiQBLB8HFzgoWj
   FcLivPFv8U/3+ABrq19nSaryBEukHJ1wx8HNx3CHx/zWe92k/jsp33Mu9
   fIu/tLxmWMSRBZ3J3xYeMbyhDwkbnNFwjArfIdO+zCBvEVW7bhNUwNq5+
   A==;
X-CSE-ConnectionGUID: VAsIybGIS4OxBzeSN4Ygsg==
X-CSE-MsgGUID: 9+tuOwRdRX2euYebDsqn0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="227016971"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="227016971"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:06:02 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 02C391000374
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:02 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A8EAD1C100A2
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 3F54F402632;
	Thu, 18 Dec 2025 09:05:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/11] gstreamer1.0-plugins-base: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:41 +0800
Message-ID: <20251218090547.828-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228097

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.26.7.bb => gstreamer1.0-plugins-base_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.7.bb => gstreamer1.0-plugins-base_1.26.9.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
index 4dfd0a207c..74b6f2308d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "969e3cbf05dfab92cf37e94840fbe398517d7ba3275331d1c216a2e30a7208d0"
+SRC_URI[sha256sum] = "11db4ec9ae5be2194ff8ccf2b5fecdc069252fe4416921b083a921ef71dd000a"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


