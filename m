Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B76F327D8
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20377.1776765369815592856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SCLHbo3h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765371; x=1808301371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ix3ratDJ+Jt68ij/RtzD29dOr4W0R7JjLJrOX72vjv8=;
  b=SCLHbo3h5m6TbUaud+D5EXpadoEObf5Py2/AsfzgXG7YVFcMnTS4xmhz
   p9448BxIzjjcvfYVILWaFrOY+jvHO7yM65N0eO75IOMkzWXARtPziBRRq
   anehpspp1iKBpPDNuyRf9g4+lMbC2JcupBumAJokw9Qm7emZuHGk0skOj
   iqMlU6JgdHD5aEfwnIlR1Ncs8FuU8JWVSUVbblt0xRMccu2zfT5XlqYrT
   es7fYw/ZgChpUky9VmcELXtfr9HiOCds9+DXjyxVdfRyODzrR4ACU/DNo
   QxBMx/lHhD6HYqXSYF5CQK0H9vOKv/6tFeOuJodLVEJnVoXpJ2qIZLEmv
   g==;
X-CSE-ConnectionGUID: 3eakmgFYT8yj2GJoFwvWTg==
X-CSE-MsgGUID: W7ooZbGURX+fF48YyLw7OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630037"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630037"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D869AC0054F
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 91B248D29E6
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2AB5914000E6;
	Tue, 21 Apr 2026 09:56:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/49] ccache: upgrade 4.13.2 -> 4.13.3
Date: Tue, 21 Apr 2026 17:55:13 +0800
Message-ID: <20260421095559.1856-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235611

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.2.bb b/meta/recipes-devtools/ccache/ccache_4.13.3.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.3.bb
index 9fe82f5ee0..ec440900f6 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.3.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e87efda8ae54f94b1cb0e8dbfdf26397bd7d0a9c0c4f38b18dde73f4ec9ac721"
+SRC_URI[sha256sum] = "c149d71f47f6fe08e4f2e43db4b0b091c61e8ea3daa23aa998b094bd84ecdfe8"
 
 inherit cmake github-releases
 
-- 
2.43.0


