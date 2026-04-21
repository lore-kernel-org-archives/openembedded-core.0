Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598E9F89239
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20408.1776765421870945355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XvMAcOMI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765420; x=1808301420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xqj0cg3EZmyAXK7CZiPBFaQsq0U8EdFr2mrujeRFYbU=;
  b=XvMAcOMIoJf/Fnvu0XgZItxvwutEugt7UBc/cmP4SU9pFpH2KUtWf2tK
   S43Rm/MuBBjiFTPQVyA6kqlKVG5n2rdJtvlAopy0xbDCKNttf1S4HlKHo
   XfBcI65FaqACMazqTHwMtimDGncm21ZoML69cvK+6M+tGDpRyClzV5bx7
   U84c+m/bqSBM/Yo40b+ifvKjXPu79Mt8j2AB6ElxQJxSecHYPYG0AyeYO
   /hOgLvtHbtPRVatE4JGkhQoA8lECZngJSmXkZuPmL1AxhJXkk1kKH8eN8
   zRHWGx8OLK987bbxJWYxW6t2KP4izlgsavNGoQpuDBz4BfdBGFTMLe0EH
   Q==;
X-CSE-ConnectionGUID: ob3LK78tRC6FOWnuwAo0tA==
X-CSE-MsgGUID: BuKEgobLSHKDm2laA/NO5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="238404879"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="238404879"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:59 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4CD051C1C703
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:00 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 04B92140035D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8F66B14002C5;
	Tue, 21 Apr 2026 09:56:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/49] python3-pdm: upgrade 2.26.6 -> 2.26.7
Date: Tue, 21 Apr 2026 17:55:40 +0800
Message-ID: <20260421095559.1856-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235638

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.6.bb => python3-pdm_2.26.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.6.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.7.bb
index 72f6415dbc..5e6cdcb4cf 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.6.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "771f95b9a484f9eb34dcf8d851be6ff95333e4f3c46189f9004cfd5cc2e925f9"
+SRC_URI[sha256sum] = "0a96a6fb4d60dfeacc1f68bf77efda39503833f6c01866cc8700ea403f0183b7"
 
 inherit pypi python_pdm
 
-- 
2.43.0


