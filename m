Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41901CD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16344.1781084985432073872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TNk/huxv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084986; x=1812620986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UtqFq6O2u2mR+YvxdeOVJdktm9vqQp6VGdBhXLwS+ug=;
  b=TNk/huxv2II9O8tdPpS/qZty86r/WevlCkAAtMqoAqlvzq4ppZJldlx6
   RLK2fY1VEmfp1W6wEb4Pwz1R8fXtUnwOvPGl+5/8Uhg9btpKJ/wwYoynd
   KtlYSfiRjQ68SHUmA/k92kiIDSLRFaVr8PLrkpD2qHkoc9SJrlQ1k/PR/
   gkEmihazcIG89W7Iz/fgoMuBdZFQy8v7GU2ps7WCWyBCvTv06O2yttePo
   ZGYmN9inULbl3tgzq3OZpRc7WODfpgSoq3DtrKBu0lR20TGPz94yGHwnQ
   HNeZhY5JZNFdDwYyztHMZ3hkeLH3XaxIO7WPYYFTRhEAoI5NiJXOVLW/h
   Q==;
X-CSE-ConnectionGUID: JXJKlmhHT96kQ4+tTonPSQ==
X-CSE-MsgGUID: V46MMOJ/SFuncj0REDsUWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243598895"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243598895"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:44 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 903DC8204CF
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:43 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3C4EB829CD2
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 598B71400277;
	Wed, 10 Jun 2026 09:49:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/16] alsa-utils: upgrade 1.2.15.2 -> 1.2.16
Date: Wed, 10 Jun 2026 17:49:17 +0800
Message-ID: <20260610094932.2264-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238327

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-utils_1.2.15.2.bb => alsa-utils_1.2.16.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.15.2.bb => alsa-utils_1.2.16.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb
index b792302c9f..40515e0d73 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.16.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 DEPENDS = "alsa-lib ncurses libsamplerate0 bash"
 
 # Only needed as the dynamic packaging was altered, remove on upgrade
-PR = "r2"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a"
+SRC_URI[sha256sum] = "092399d5e8749a1d5e188e393157521cec4b75693b60ebb79bbce728cff2232c"
 
 inherit autotools gettext pkgconfig manpages
 
-- 
2.43.0


