Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A72E78D58
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43847.1770627831054739062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k+sE/0Cl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627831; x=1802163831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wnlEilgFLniECL4XGFaJbIMmLcB1a3/C1UgxQFrTXjg=;
  b=k+sE/0Cld02f/opLddjThna8jNRaJB/V82GP5Jqq4hTSJe600/80B2wT
   LyUsKhTZqHUPbUPvcRSq50QegUkOZUL1JZbmJBAPvTKgqOMxzArWWGBw1
   ysvcFYmJhGOJxw3MQWcO/xIr6mMrOU5LQK8gJyKbKwjpsYYSUJ8U1RXpw
   MfMOA6pr/9N5gbC3qi1sysu5jib49w/ESjvlfxgy5z4/W0kumCM2qOPC/
   9uTuXIoGSzUApkMKH3SxAA9ZC+voEm9jyKrwxn+N4v78B9YiuSXIeQHfF
   BbB9U4Mv4+1CBH1BdUyWN7F1Wsv+goEdgSzOFzC1jhKkhHwHHscEDoSEp
   g==;
X-CSE-ConnectionGUID: AA8cIzDiTemFxGY5QcxAxg==
X-CSE-MsgGUID: buxUw1rmTbCZBqN+UpjG5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216965246"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216965246"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:49 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 85AB01000346
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 38D73C012AF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A3D90101BB75;
	Mon,  9 Feb 2026 09:03:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/39] libxpm: upgrade 3.5.17 -> 3.5.18
Date: Mon,  9 Feb 2026 17:02:52 +0800
Message-ID: <20260209090317.1468-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230725

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxpm_3.5.17.bb => libxpm_3.5.18.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.17.bb => libxpm_3.5.18.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
index 8e15ecc0d4..94bf28232e 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
+SRC_URI[sha256sum] = "b4ed79bfc718000edee837d551c35286f0b84576db0ce07bbbebe60a4affa1e4"
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


