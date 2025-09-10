Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B501CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.13217.1757495822248821987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mix4+Y5J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495823; x=1789031823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NqKpJgscUI2avQM0QTU4KNBpiVVaAZkr72RndMbUlMs=;
  b=mix4+Y5Ji5yidtc38vQsACDEXQEgY/rJnzlOom7wtiGd99VKdxN8YpWX
   8JQ25sdbU29hdHpMdS8GrL4niG7TnsB30cUqUo/QdNEZCuVU+JIxbAOEA
   WC8yLMtl4hpnadzZ6eDpevCL2T9dmLJpmxhiOh6hJrbyjJFWdZvka0KDl
   cSqbJiqS2AIQYRcoCHoViQROhxmO8UK+MhFT2QT+S6BEwrm3FyNFOmC2k
   I/7PaH+bGhROdGr8/XaLslRxSyut6t8vRKXVCMb3gPdy9huPqAmHXAJ2A
   y4BslojFWVNwFioW3Vrl7lZvITbgT7rKJRyWQN64o0cI9FYx3wvSsft89
   A==;
X-CSE-ConnectionGUID: z+uKicj4QQSqEyxAUC4a+Q==
X-CSE-MsgGUID: PNutCVUIRNWsBWRJytoKlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212437413"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212437413"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:02 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9110D1C00191
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 495F1C00344
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id BBD8F200A620
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C43E81A0071;
	Wed, 10 Sep 2025 17:16:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/40] barebox-tools: upgrade 2025.07.0 -> 2025.08.0
Date: Wed, 10 Sep 2025 17:16:09 +0800
Message-ID: <20250910091646.998-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223153

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index a9a6a91db9..864c6010c9 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.07.0"
+PV = "2025.08.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "92add334bd0f5847deb2c23da54c78b40e8bae4f93c545e62be28e2f0afe137b"
+SRC_URI[sha256sum] = "b32f141ee708e87cb0cc01d626adafc07bd6eb52d62ca969287d7d27462eab32"
-- 
2.43.0


