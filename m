Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64C1F327DD
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20385.1776765379308246882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ofth+U0z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765380; x=1808301380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sSXYxgEGlf8qA0sSbDHZ5A5xqotWLLskAGmztvivIxA=;
  b=ofth+U0zrVqbq2OnzY3QWCjwIwJorm/E5jx1+/N47UglBelZeSz/S/JL
   fuXyMe8yzPEYyjXEDR7MfEct5giZ1rflU9kaETmmFe3elCkO3y8nFoHjt
   8z/Ru+bdAFCehC8RX2UsyyLUBbvTyO1k8QcT3eYbsiR2lBAeElStVHPiv
   NAfDx0qZTD08+QG7zMhTyE3ti7orH4FxuE/mldaNRKxb5PCLyoyp1fBpO
   H/sQd+CvwrOWXYYk+1dXo02Pbo8BWMpsyAly/0+FnIqn2Pbl7oiIxaMyW
   njVknsflciq8ZzAX92toHYFKGYKPOeihg83oAT3uD+SkllpYqAWIHDKNG
   g==;
X-CSE-ConnectionGUID: dl6BQhteQdmfNdk+Zo9WsA==
X-CSE-MsgGUID: m1AlhndtT+WMg50sgKwYZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630042"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630042"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:18 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BAD72100281E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:17 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7410D1800080
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0E7D3140027F;
	Tue, 21 Apr 2026 09:56:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/49] epiphany: upgrade 49.7 -> 50.3
Date: Tue, 21 Apr 2026 17:55:17 +0800
Message-ID: <20260421095559.1856-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235615

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../epiphany/{epiphany_49.7.bb => epiphany_50.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_49.7.bb => epiphany_50.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_49.7.bb b/meta/recipes-gnome/epiphany/epiphany_50.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_49.7.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.3.bb
index e782855c95..d5cacc848a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_49.7.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.3.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3c590c6fe6d9269412a042aa479c91c3229163e2da85a94a5d24644b2ab9e3b4"
+SRC_URI[archive.sha256sum] = "032d6a41e2a079cd41b05ca7abfb3870adf0353d1566194bed8790953a894640"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
-- 
2.43.0


