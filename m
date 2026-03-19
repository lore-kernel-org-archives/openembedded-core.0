Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AB1108E1ED
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:26:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8842.1773919571965920380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OnjuBEo4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773919572; x=1805455572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p20CxNO0a8dPrEtBI5IydBColnTadAoqg1ODcPznzXA=;
  b=OnjuBEo4Wfk9chpHT6sB2PeF+F94JpHuJk7zDC/eHTutIRNIE4AplA6V
   XL0jk/Vzhs1cfSPjXI+Dee6N4WRTgqmJqSAke6+I7Du0G6TgS+WKLSKD8
   fubNgN6bHhu+KAPwAX8725dWmYsHD6x+HgT7Cjcz4PiSv6Ia8+6sM7ftd
   J63vim7gujUqj61w0v6Ds2afEFOgLDYHelTrLV+qH93yzXaI3Nd06CMvt
   ejiYYyBmyUe+4J+MUWFV+dk9BuSFas4FEGZUFZNrU15u0U5mc4MKIMmnx
   hf/jsI0D/wBO0Qe5IdmySpqaJizUV1gB8gtXBbipCcVXMz98yIJquP47J
   g==;
X-CSE-ConnectionGUID: 2tpD05DzRAWGFdRhewox9A==
X-CSE-MsgGUID: sAFiGFfZT4uGqory6ESuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212702248"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212702248"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 68F2B820C0F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:06 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1B42F18002F1
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1D6ED101E523;
	Thu, 19 Mar 2026 10:14:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/40] dpkg: upgrade 1.23.5 -> 1.23.7
Date: Thu, 19 Mar 2026 18:12:57 +0800
Message-ID: <20260319101332.2067-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233516

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.23.5.bb => dpkg_1.23.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.23.5.bb => dpkg_1.23.7.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb b/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.23.5.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
index 1d8dd66efa..8e838b2d05 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.23.5.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
@@ -19,4 +19,4 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main;
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "89f266325cc8b5b7fd1ee417b78d498ee189565b"
+SRCREV = "ef4d59f5925661818484ac666014ee3e665aadcf"
-- 
2.43.0


