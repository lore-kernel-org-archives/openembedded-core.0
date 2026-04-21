Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A00F89244
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20467.1776765442814363925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i3ZHw2i3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765442; x=1808301442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fb66P2lNo+Jt7iiR2mCCUfCF4fyIb3hwp61tsegjG/I=;
  b=i3ZHw2i31bKicCQluCq5oPWKpsYc5yceyUdO0MAFc+KwK9euwzAXH8+V
   RRFoFSpwUe68+KbZVCfzpckbUjFl4BDI56C/p5FNXroZz2o1jDeIyFzLS
   uoJY4I2lM6N//w4HS1rrzajhgF0pE9eB3dFG5w34f4mYFOIY5kyIG/GWn
   VYYP4gJCi2yLG/UvNc+lkZOlYWhUiQAfL4Y7MwQcdma1rpm0GgqF2KsWV
   uTLqAJ6F91dtkisSXKkltQJffuq8HJtLLxok/TbdlA9ctjgM40KgwONw0
   BHGpj+GyGeSaTN7kgeJn5WyyGDR+WxZRpYW6IhaffCeyTL+V3lpftpiUg
   w==;
X-CSE-ConnectionGUID: 2xPZtEGeTJepw5TvGat06w==
X-CSE-MsgGUID: zF0cwWrnRju32VPOsU0j4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608256"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608256"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:21 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4F7191000348
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:21 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F270FC000BA
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 77D57140025F;
	Tue, 21 Apr 2026 09:57:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 43/49] resolvconf: upgrade 1.94 -> 1.95
Date: Tue, 21 Apr 2026 17:55:53 +0800
Message-ID: <20260421095559.1856-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235651

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../resolvconf/{resolvconf_1.94.bb => resolvconf_1.95.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.94.bb => resolvconf_1.95.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
index b2c85f9593..1ef29f9c2e 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.95.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "505c258d1efb287ffdbf132531a86437d2bf0513"
+SRCREV = "64fa1448880edd272540e0347aa25f87ecd14dac"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.43.0


