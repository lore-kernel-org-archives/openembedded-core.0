Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC3BD0C83D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55859.1768299949750758744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C4vUntKo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299950; x=1799835950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RDDqQ0z9CD5rcXLcCVv1E/ALdwvx5WUCxLvDpiu5iEU=;
  b=C4vUntKobWf1iu/w8qKLDjpdwczAxNYrwNJ1vNcDFJgWfEPvRUMOfceP
   hNF8O2OqKNLfcKAJqMAyJKNdN3JL51ZdRWwWDVvdRdPxkXk349mJK4J4s
   7CBzDf/+j9gahOLcEBWyA5YucQbqltc81HvfwSvMihW93gFvv8kQxez/Z
   //taDjU9ZoxcwC/C6Kx7nFYldtXclqOSpojes1EmenvezMXV03akCdEAX
   wHtHlLgyUlDnfdQZTRIri8o060MwX/8de4FqBWZIlVPE5V6zHHvX8RxWu
   3BUAcbC89fZWm1fMyjpnUwqcb91rIREWuwtTgug1Hewqa0H6MAv5SXg1a
   g==;
X-CSE-ConnectionGUID: 5DsLuNCwTJqkAiAxIfrPzg==
X-CSE-MsgGUID: TQaHpf4BR628oYnhXsvISw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="229630045"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="229630045"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 49805C01835
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F33FD1801FCF
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2333D826FFD;
	Tue, 13 Jan 2026 10:25:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/18] python3-websockets: upgrade 15.0.1 -> 16.0
Date: Tue, 13 Jan 2026 18:25:05 +0800
Message-ID: <20260113102509.728-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229254

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-websockets_15.0.1.bb => python3-websockets_16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_15.0.1.bb => python3-websockets_16.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_15.0.1.bb b/meta/recipes-devtools/python/python3-websockets_16.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_15.0.1.bb
rename to meta/recipes-devtools/python/python3-websockets_16.0.bb
index 2e1b0f0919..0cad5569c0 100644
--- a/meta/recipes-devtools/python/python3-websockets_15.0.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_16.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee"
+SRC_URI[sha256sum] = "5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


