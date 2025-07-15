Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EE7C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2952.1752566913106891371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=klGuryZU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566913; x=1784102913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ck9STvyhIF0Eg05SrOzsQTvwslKDK+89/3VDyq7Rnxc=;
  b=klGuryZU/pplVmK74W5eHTcSOR7FyRtCbgBGXJnXOz3EjZaUDoedQdB9
   tTE/kRFBdzyJ6E9EomVl7hMseXHIJ6szYNEA/8gbV6JP7asLRbVUeL7fu
   fQO/RIW43sFF77g9ffAE85SYTGYaGa/uD4HtkMiVrPOLK84FtNjlUaH4h
   MQh8pokpMlPMIplKnCunSUbhLeiOoOZOFPkXokUoUmvanLl6thaA3EPZH
   kZ8A+DFxrFd/dCeK21uPirnOWOJXMFZc9niGxe6gQse9I8Tp22jRXkPeY
   lm1egYxN7pmEETd+cSj5fq5JLaKRtxCb2Nei5VrRFX3p9GKr7tsJfhcTV
   g==;
X-CSE-ConnectionGUID: 134gbhtJQhOGLcWuQj3BSw==
X-CSE-MsgGUID: S0dXPYJdT6qvh4ThjjsVTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="206405810"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="206405810"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:31 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5BCAE1C0213D
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B4EE38D65CB
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B2D91A0090;
	Tue, 15 Jul 2025 16:08:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/19] libwebp: upgrade 1.5.0 -> 1.6.0
Date: Tue, 15 Jul 2025 16:08:09 +0800
Message-ID: <20250715080819.622-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220280

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webp/{libwebp_1.5.0.bb => libwebp_1.6.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.5.0.bb => libwebp_1.6.0.bb} (96%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.5.0.bb b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
similarity index 96%
rename from meta/recipes-multimedia/webp/libwebp_1.5.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.6.0.bb
index 39fe947eea..0ba90c406a 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c"
+SRC_URI[sha256sum] = "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.43.0


