Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3476CCFA1D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3010.1762386490704416137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tG2TS8L1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386491; x=1793922491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SH4xFd74KlXs127kZHP4w1eB5p5dG92+x1VD5keW64w=;
  b=tG2TS8L1/vuWSgF25hFtgMmzBYbLsYMCEmLC9ccHRwiboC0XPdEghTNl
   0pJy4J7Rj+ZGxiM1g+FebCQTyv/sCQBNxj1N6kqa8I6s0jZ9rfaP6cEJB
   81n5+rUzCnyCDxGUNE+KczpD7gs51UDzus93yk7+Vf5eVJjtmiAlM6UNs
   l86u8M2DxTYt5k5Q1cRflL23vZMZKnBdDI0gMvTYXKxh4cpuQxWEI+dcm
   cK438Z98czyMBhCK7PzI3qaslsFZlGOgz3vxNzhKBWfFNYIUAeSg8R/Sz
   FfxJehRAysWeROhE1EEQL98csBF3ycLcN4Sbp7JbcTQzPPPJzumbx4aTm
   g==;
X-CSE-ConnectionGUID: 98QkXnEKQkmHY5/0JJkkaQ==
X-CSE-MsgGUID: 4mSqOiHeT/m5nHI7aboapA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218263289"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218263289"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2F4801C00091
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id DAFCE18019AA
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 600F714002EB;
	Wed,  5 Nov 2025 23:48:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/29] libedit: upgrade 20250104-3.1 -> 20251016-3.1
Date: Thu,  6 Nov 2025 07:47:11 +0800
Message-ID: <20251105234712.446-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225958

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20250104-3.1.bb => libedit_20251016-3.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20250104-3.1.bb => libedit_20251016-3.1.bb} (87%)

diff --git a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
similarity index 87%
rename from meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
index cad24d8d65..39dbf432b6 100644
--- a/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb
@@ -13,13 +13,12 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac"
+SRC_URI[sha256sum] = "21362b00653bbfc1c71f71a7578da66b5b5203559d43134d2dd7719e313ce041"
 
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
 CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


