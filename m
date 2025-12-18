Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB82D6ACD5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37608.1766048763242181641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r0SkVBLV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048765; x=1797584765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUmDWEzuadkt2cvDxRi61p2Vms1dbMKpNhgoXCHyNSY=;
  b=r0SkVBLVXG24gh68ykMueHgz+qC6nq3d7FeBMEQLDy6aKbdWnMWL/nYM
   67V8rK+Z3qIl3XYEyXspgVgb1/O5Bmn1WkaLLo0ptCrLKnhTyJIRbgxc1
   6taW+HOpa16d9rMOGT4H2uAl/iPq4sgoszG/qYp10TkMIurYS7w5YCtRx
   yTxkqjUGo4RrrnDFUM3erhRAlYHnSliavAIk4GpuhWLV7R9mkJMo7uODt
   5pm0+IMtMb8C2xJ0Swd8EeUEHgrjP2xjDuopJxINGXM6eV9Vq3tFoZ/s8
   +AmXqxcpJoiNgJDO+Jwk5V3+BASJ6hVvejGNe5O9cqDpLOPPnYaxauEb4
   g==;
X-CSE-ConnectionGUID: EwMOgZdhS5qZ0ezIQXn+5Q==
X-CSE-MsgGUID: SDiNa8UOSOOpRf3mHrNZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="211041947"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="211041947"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:06:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 375FA1C000F7
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:05 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DC82A1C0CAF9
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 67735402672;
	Thu, 18 Dec 2025 09:06:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/11] gstreamer1.0-plugins-ugly: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:43 +0800
Message-ID: <20251218090547.828-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228100

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.26.7.bb => gstreamer1.0-plugins-ugly_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.7.bb => gstreamer1.0-plugins-ugly_1.26.9.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
index fa34912a06..e04bfcc81b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "11f2e4f34bb2e841dc60edc95581572bc47be0c11e577d12bed98bb1f80a661b"
+SRC_URI[sha256sum] = "184e4c6e765bc463ed806b2263cb9b2aaa3a65415df0a3c22fd520d5d1bacb4d"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


