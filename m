Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313F9CA0EF9
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.5631.1755574542730048094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Py7fWXSi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574545; x=1787110545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GBtL5twwqVeHf+iJtOqaq+L8PYJkpAqjFSi3U34CD/8=;
  b=Py7fWXSi/wC2kRh4dSasRuUEy5Hjfz1rKY4EM0Gf01kuEo+D/Mu60MNl
   NLTolxHG4mN0xEd8w0ZToeweHEqsoz5dnwX85tfYrbkAWoEr2sbBHBh56
   +xcFc/kGJIFLoeEqKBkR6TDr3rYrR0xJaLP5243LRqeuBqN3jVpSlj7WY
   XPSYf0Z6Rx5cfpGNgLDZRQ1iocNfmyFhKADY7sMWQLdJupOXrW/n/cKNN
   Zibyryokp67Kjc3nIsU0BaKuH+n2C4W2nBFcYeCpBeO2Ldt2dsBFEret4
   /V2iMMc2nysuGPnM14n2msNai2zR2/7KWRqQ9/G0++4THMzMTTYFhSyau
   Q==;
X-CSE-ConnectionGUID: 7b3VdymfTb6LELGwIrB/lw==
X-CSE-MsgGUID: Secn0zdFQ4GnMM5SEkzPGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="209708784"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="209708784"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CBB77100034B
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:43 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 81ED0C021F2
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:43 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 59CF714001E2
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:41 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C72251A000B;
	Tue, 19 Aug 2025 11:35:37 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 08/11] gstreamer1.0-plugins-good: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:29 +0800
Message-ID: <20250819033433.390-8-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222069

Changelog:
==========
- v4l2: fix memory leak for dynamic resolution change
- videorate, imagefreeze: add support for JPEG XS

Release note:
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ugins-good_1.26.3.bb => gstreamer1.0-plugins-good_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.3.bb => gstreamer1.0-plugins-good_1.26.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
index 601a7961c7..4adbc982b7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fe4ec9670edfe6bb1e5f27169ae145b5ac2dd218ac98bd8251c8fba41ad33c53"
+SRC_URI[sha256sum] = "eb0862e93404b073e98ec50350ece7e6685ea2936cab8118c2b8e938e2cbea8b"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


