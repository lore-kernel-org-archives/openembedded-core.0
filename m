Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0327F10854D2
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7873.1773915321955788339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oy5QmqEz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915321; x=1805451321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GG0Esdb9Eba0fnT8J2VgoQI6uWOtsf4n4uEMMP6udAU=;
  b=Oy5QmqEzf8+9l1F6UZDyFCIjboCxFVvWKA8+SE5LPWzDSZGq8FyEo0ke
   vZL7DtHHkztD8EjzVp8c1oTvODxR8XLKv7mjIYG6Wh3zUqPuYQHLz0GL3
   hOZM3P4foiR9Q1ZbZ+2ZAS+/5Rr8Mn+V+4DLnxye2PX6+jNwk7kiBBxAD
   mOKhvmS1L19uzW7CZVzWDfUjbotlKrly1qOV/V7ZeqJb+OhjNPoa7f6rc
   BPXzUMb+BScPjg+9t69Qe3FkZGSCSHsg+ry+Ow/E/p3BCUhDoTBKWmDtb
   d5wSedFeGY/rFoGkdS3qHpCiVOYT1/a7+sVuhbeqC22wZCCj+9X9E5JJc
   Q==;
X-CSE-ConnectionGUID: askff9QRTRu3wXR0YQ+BCQ==
X-CSE-MsgGUID: qZ+UHwbOSUiqxzobqX4MPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233848570"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233848570"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:58 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9F6CA1002B81
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:59 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 55907C000AA
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 57C83101E529;
	Thu, 19 Mar 2026 10:14:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/40] lzlib: upgrade 1.15 -> 1.16
Date: Thu, 19 Mar 2026 18:13:12 +0800
Message-ID: <20260319101332.2067-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233495

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lzip/{lzlib_1.15.bb => lzlib_1.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzlib_1.15.bb => lzlib_1.16.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzlib_1.15.bb b/meta/recipes-extended/lzip/lzlib_1.16.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzlib_1.15.bb
rename to meta/recipes-extended/lzip/lzlib_1.16.bb
index 087b781873..e076581e05 100644
--- a/meta/recipes-extended/lzip/lzlib_1.15.bb
+++ b/meta/recipes-extended/lzip/lzlib_1.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=04d943636aa1482e0a97d924d9f4f68f \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzlib/lzlib-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4afab907a46d5a7d14e927a1080c3f4d7e3ca5a0f9aea81747d8fed0292377ff"
+SRC_URI[sha256sum] = "203228de911780309dad6813e51541d7ea89469784f01cb661edba080ff1b038"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.43.0


