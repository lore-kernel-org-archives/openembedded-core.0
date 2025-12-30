Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBEFE95A69
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61207.1767086262759233717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l8uliGmF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086262; x=1798622262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+3w+CaEQt9UpN5g8dhg0FCsag8kiQ41MVbTSB1y6N8=;
  b=l8uliGmFkYVHWYgPOPdn5w7XsxBK5msLZf4OAMMe3Q+TIieBwZQg938A
   ccQwhDBs85spF98GQaFEFRUhaeoRQQgSncirHp04uVJ29haoncFIT0L/N
   iJEWEC7FTG6dN7pqvnfdUfTICSH9XUjcf6/XKJnGSiQ59LYLjcYdHiPi4
   zpwYqJshSHDbnkTQP0YFUqFyMmiHRNt5vv+UukBXerbRu5KvhWQRjwc8m
   H3bulbO8ZZk43P0/NogQAPm3AFzWjRhPDd817dYMX8buw6Z/LZQt1zELw
   oh++z+D68Xqf7LIC/+NWQgEIOCSBZvL4EcVySeSUndUlxs55VC6dF73s8
   w==;
X-CSE-ConnectionGUID: DS6WL5kXSE2AtutQ/hY4WA==
X-CSE-MsgGUID: I3qMb3pfTReuKewSsyHmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="212261668"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="212261668"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:41 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1B21E1C000A8
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:41 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B67A71C002C5
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 43DC51800514;
	Tue, 30 Dec 2025 09:17:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/12] iso-codes: upgrade 4.18.0 -> 4.19.0
Date: Tue, 30 Dec 2025 17:17:07 +0800
Message-ID: <20251230091714.1501-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228648

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.18.0.bb => iso-codes_4.19.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.18.0.bb => iso-codes_4.19.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
index 1ee9f5a8f5..413c7991d6 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
+SRCREV = "0f3a862394265a31d8465fc5e627d6429bbd8394"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.43.0


