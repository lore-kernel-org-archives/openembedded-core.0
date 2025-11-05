Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E616CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2997.1762386472228041755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c9G2OtFv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386472; x=1793922472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cFH5rCIMvcCius+EIbcvIGvC07qPz6xH77nts4dzouM=;
  b=c9G2OtFvA22YWnywPsVBa4gEWZcyZ/54Qzv8jdjFRkLfV043WdDYfFfb
   q/Im2uEN96aaOLwfVjkKDNcx4CxI6YOWxQG84qMSJa6vDzCE1o3VWvHpo
   CS+3RGvv2GEN/f+GbVXjJwtOBsXvRwtQHSCFKGcNNz1c34E6499+yKHMG
   hNLCZhzcFR0DtaF+Vz9fW8aCfjKer02/ytHksM71DGvx6rhBenGb1KZJN
   6oCN3Pf2KezWpYpxVcsTsSIJ5P3SU+l+SUHsiM4QxYBINRWc8XAZ6gn+m
   D/C76SlnEDIrEhGLzC/DkIvC/IC9AdEFTd0RavWBPomLFjTBfK52tsLjy
   A==;
X-CSE-ConnectionGUID: rGDMGw08Q+2wQ7TT9QHQjw==
X-CSE-MsgGUID: JZP+Lss3QeydJ54v5pJCrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="217613187"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="217613187"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:51 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B46A142A332
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 673A518019AF
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id DD2AE14005BD;
	Wed,  5 Nov 2025 23:47:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/29] gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:01 +0800
Message-ID: <20251105234712.446-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225948

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
index f12d81cda9..4dfd0a207c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f0c0e26cbedaa57732cb6a578e8cc13a1164bf18d737d55c333061c52f0c48d7"
+SRC_URI[sha256sum] = "969e3cbf05dfab92cf37e94840fbe398517d7ba3275331d1c216a2e30a7208d0"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


