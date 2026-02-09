Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071CCE78D5D
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43623.1770627847417331896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hh800YEh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627847; x=1802163847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OG6hIvfCyYjkNJaxG9k27czQPUePKB+gDg8lfHBG9n8=;
  b=Hh800YEhnUIbyrazKQi1325IcZfnkOutaUfv35mk/y9p5pm/3/qRDErV
   sd12fBC6hxe3vjWOLQdIykCluXxavCzsXdgG0BBwWSJR3gDG7USFlFt8Q
   LlTCeSLcXYp5X7WTAFLzNmgo/qPrJnlRgzFjFydYkIx6gLQxQDxdFRO6x
   zxBUjpTFm3xmpNvnwRHKFnua17DHxWs8MS1wc0O2Dz364cJgiqnBhQdLo
   QMwZ+Fa9Tc729T+iDyVqyFS8sDxKWo8l6O/qsFjGHy6nKWseb3b2X1FqA
   fWowhBqSU3d2FnNWHdNnr8KIRjSr9SuQekWsyvD7ioIjLJ8agGp/a8muW
   w==;
X-CSE-ConnectionGUID: tlfF6+OoRlmkoUbN4w+YpQ==
X-CSE-MsgGUID: Bx4g0WVDTlCIvKksHgFlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449789"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449789"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:06 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id EDEFF25F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8DC3A18000D9
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E23CC101A410;
	Mon,  9 Feb 2026 09:04:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/39] python3-numpy: upgrade 2.3.5 -> 2.4.2
Date: Mon,  9 Feb 2026 17:03:01 +0800
Message-ID: <20260209090317.1468-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230734

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.5.bb => python3-numpy_2.4.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb b/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.3.5.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.2.bb
index 55b8091ff8..a3b71ad540 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "784db1dcdab56bf0517743e746dfb0f885fc68d948aba86eeec2cba234bdf1c0"
+SRC_URI[sha256sum] = "659a6107e31a83c4e33f763942275fd278b21d095094044eb35569e86a21ddae"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


