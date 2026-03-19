Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DD2108E1D8
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:20:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7945.1773915633403164665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rYFMw8bb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915634; x=1805451634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u1qlgBArt3/ZkFAaRryl3To5UADKfj2G2FGUgdpAfZQ=;
  b=rYFMw8bbZNnaGe/CKyJo8jtcHWQOZlrJNhmFznAtft/ehHDfmWzFfGoi
   PNLZFOLwVqUmOhWIATnXMQtzU9pUcgBKLS5F5UsqSFy5Ir4GbQgT4W2uj
   17YmY+aB6gc/l4VTG9lU5i9pR5PXoeHBvM2zg1XnctrnYTFFooJR8muX0
   uUTbsxxhlavJXzwQEZ3CJjCsLo43RnF4Q0J1LcL9mmvrugq+ksawIMv7S
   Q2Ez/Ph3YHp3ibOoroLwMqOdHBxdtbgU3A5grJkFIzX9htgr7pBAqmKCi
   +hHUNZgZegvrOT52PEBywM31I/nGLnuCO2ChKoOh4Me5dOJkafs9xShTg
   Q==;
X-CSE-ConnectionGUID: iYZFj3s1RNiqLVeznLVuJA==
X-CSE-MsgGUID: EVQesSFgSLCuRLPwNsJahw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233833389"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233833389"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 22767820C0F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:32 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CA25018002D5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D2537101E523;
	Thu, 19 Mar 2026 10:15:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/40] seatd: upgrade 0.9.2 -> 0.9.3
Date: Thu, 19 Mar 2026 18:13:27 +0800
Message-ID: <20260319101332.2067-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233506

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/seatd/{seatd_0.9.2.bb => seatd_0.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.9.2.bb => seatd_0.9.3.bb} (97%)

diff --git a/meta/recipes-core/seatd/seatd_0.9.2.bb b/meta/recipes-core/seatd/seatd_0.9.3.bb
similarity index 97%
rename from meta/recipes-core/seatd/seatd_0.9.2.bb
rename to meta/recipes-core/seatd/seatd_0.9.3.bb
index 9e1b50c087..d0802eee60 100644
--- a/meta/recipes-core/seatd/seatd_0.9.2.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a3c56c324c3a84474cc1615d94ccd6a6255d0c10"
+SRCREV = "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 
-- 
2.43.0


