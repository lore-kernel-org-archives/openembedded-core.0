Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA80CA0FEF
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.31263.1756093889854122496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WAV5wfTY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093889; x=1787629889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PpOFHh1uArBHmrAqLgUjqjePO1r5UJ6KDwvqzdKBTA0=;
  b=WAV5wfTY3bhYyPrTTB9dziky6elTiCWlvLptrAQbrQqX0TvRVdjDRXRv
   kbj1zhvPZyzUlEmIPneWB6NbUQZrn+Upu3ihHfbYrYKLO8af3aEOFHjxq
   q2ZDW+PfHTA9+kEbwChm3bM+7Cl4uVAY1Kou6jW8pl2tNe17Ms5JFD+g8
   o/lyu01aPBsMGFQWOgr98VLILJA6mHqKhsJ7M09W1Q0zqp0d25AraL5XH
   PO6aLqJOh7N1iuX6kyq2/ZXSnU1PVI/rXdCX5v7iJ0I0CPj5lj7ZNKiSi
   h3MJa24g8Itz4O8FBUITZYKYTerDjqm/jlh1z9nHzKUxjUM+DpU/4N0Oa
   Q==;
X-CSE-ConnectionGUID: geCK8uhXS12zDBHT6QSDYQ==
X-CSE-MsgGUID: 5iQ3fUkITQ2iBAAjCdm38Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="198422092"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="198422092"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:27 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D32C51C00084
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:27 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8E1831C002D1
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 77F5E829F32
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:25 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6AFD81A007E;
	Mon, 25 Aug 2025 11:51:22 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 02/10] libinput: upgrade 1.28.1 -> 1.29.0
Date: Mon, 25 Aug 2025 11:51:01 +0800
Message-ID: <20250825035109.797-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222397

Changelog:
===========
- High-resolution scroll wheels have better heuristics to avoid inadvertent
  scrolls. This should also help with not-so-high-resolution scroll wheels which
  can skip those heuristics now, resulting in better responsiveness.
- Virtual devices (e.g. uinput) are now detected in libinput and some internal
  heuristics are disabled for those (e.g. tablet smoothing)
- Tablet tools with an fixed eraser button (almost all these days) can now
  configure that eraser button to be a regular button instead.
- Jumping cursors on Asus "ASUE..." touchpads have lost their excitement and
  are no longer jumping.
- libinput now uses a plugin pipeline internally. This prepares the way for
  public plugins, planned for libinput 1.30.
- mtdev is now an optional dependency
- libinput debug-tablet-pad is a new tool for interactive tablet pad debugging
- a lot of internal code modernization, making the code nicer to work on and
  test cases easier to write

Release notes:
https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.29.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../wayland/{libinput_1.28.1.bb => libinput_1.29.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.28.1.bb => libinput_1.29.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.28.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.0.bb
index 521a7f9a09..f38532a0c2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
+SRCREV = "936cee224267a7d21c87c06203cd866c1572df20"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.43.0


