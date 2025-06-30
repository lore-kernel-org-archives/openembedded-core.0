Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8C1C8303B
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35170.1751274803700367122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cb1JzfE0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274811; x=1782810811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nu+cn6lBJRCpLEvIg/bBOsIqKqNQMAQ3ZbuhM3c8V10=;
  b=cb1JzfE0X5we4GVdDOi7aan4Qs7n4fWyVfOC27CE8EpDUlSdWXD3CQu5
   0vFpNH9pDzl48NH5vdTmQLgjeC2kFLUIO5Hac7tt5Hnq9qiqJJXTLApGb
   qJ03fnsHVqmdRch7vUB+NkDdQfXOdBwK4xel+hM84hnpgZ35G7Lv6tpPn
   IuZUXqA5poocJp0pngGs5pXCBLTVSc27QsAqqaDbjnPyETe50lKpjO4ln
   6+f+VSNtnYMNxuV16eb3a0JnI4mFLiYctS+yhrgrZraLn28fQwQqcVhMj
   aXGuLfxBdqwGccwUPZqOzGqP7jr5dU1INB5HvARHZr7ofO0DWvAYLS3f8
   g==;
X-CSE-ConnectionGUID: JUdsc0r3TBWWk6V5OqE8Dg==
X-CSE-MsgGUID: G9+7inTbRlqv3bYGAdESPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="205056019"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="205056019"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:31 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 11E2718B3
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 84B891C002BA
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F15E1D88DA
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:28 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C6371A0073;
	Mon, 30 Jun 2025 17:13:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/37] nghttp2: upgrade 1.65.0 -> 1.66.0
Date: Mon, 30 Jun 2025 17:13:02 +0800
Message-ID: <20250630091315.1897-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219482

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.65.0.bb => nghttp2_1.66.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.65.0.bb => nghttp2_1.66.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.65.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
index 008935f165..2886681827 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f1b9df5f02e9942b31247e3d415483553bc4ac501c87aa39340b6d19c92a9331"
+SRC_URI[sha256sum] = "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442d430df97c6f9e631"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


