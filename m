Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFFEC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.26275.1750065420316804375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YsVjAqnY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065422; x=1781601422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l0Z4GRuMYC33b6qxnFIMt9lqvPGovRZgf0br9YT8VnQ=;
  b=YsVjAqnY9g2HgQs8xVgjD5bN4GcWLmdQg65Rw3GJa5MfH84Xk7L9Abbs
   Kb38/OPVP7D9z2lkFEXa46nS7gl5x5utkaKXXS3DjDQrOK6MpflvOushw
   x6wJbEEaHydw9LDnL+HognLzNtFHGnksXpGFYEfo4mq8Z8iR6IBSey6HB
   wlZp+sC6BZaEziBvQlNB4vRiA65WXJARTm43o+DWvZu6xLJAwg/HmGMHZ
   vzX4JybjuSX4yZa05b3oI4/OsuKoUGieFLPH6qRQ5nzrl6tCtmN5c7LXx
   mw40H8XWpqyDtsZ4SIFDTYn5JvGroUZMHJcrilZQbvAg9I3fih5Vwxpv9
   g==;
X-CSE-ConnectionGUID: dncagxCVTMeMmDtT2JKZbQ==
X-CSE-MsgGUID: 9DkzTRMgQhOWf9BUHlZuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202837537"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202837537"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 75F22C68FB
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BDDED5042
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9D70E1A0073;
	Mon, 16 Jun 2025 17:16:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/24] python3-typing-extensions: upgrade 4.13.2 -> 4.14.0
Date: Mon, 16 Jun 2025 17:16:40 +0800
Message-ID: <20250616091643.918-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218797

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...extensions_4.13.2.bb => python3-typing-extensions_4.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.13.2.bb => python3-typing-extensions_4.14.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
index 9c83ae6c61..1c03aacc10 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef"
+SRC_URI[sha256sum] = "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


