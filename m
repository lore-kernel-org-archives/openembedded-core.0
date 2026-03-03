Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80648EC0493
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14954.1772532613401149845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YsnLL4E4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532616; x=1804068616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cLwFS5cq17MpqtbapuxiwonpzCSuMzbKQQYSlZBGcPY=;
  b=YsnLL4E4603UCX9DeNnTpFweVXGJBHyEyyC1ielWRmUoH8XCMTzsDxoP
   5CbsdvUZDfRhhgjAKlAks3UqLeR3Jtpd9Gd0uySlIIgRKxDKTyGIZuAwS
   1HwSI6kYzoain74mTRbfLL/KI81hDNwtey/R7GCZsCL2QeYoYLk8U96Fk
   +kEs8NsHRIKH8o8SzOKrfhJBXXKugUr55Ip4dWpTMnN9riLtaRVuf/PYF
   Qm2n7BndP2fZZNtjLm3SW3yGefIaMKuXhxamieI+E3EP/XI5dpr2Iv284
   e1NmVL/878buAbqccrfGfPfSVHH+KrH/jOgHzLkGGpxDSFYTqdkuGwnWC
   g==;
X-CSE-ConnectionGUID: WN/L6eqsT7+9jmiOLtN58g==
X-CSE-MsgGUID: 57aCIn8pS5KDl0JHpH9uWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="220364442"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="220364442"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id D1FF61C17341
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8AB531401241
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E18AC1001CDC;
	Tue,  3 Mar 2026 10:10:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/23] sbc: upgrade 2.1 -> 2.2
Date: Tue,  3 Mar 2026 18:09:23 +0800
Message-ID: <20260303100929.1624-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232294

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue when compiling with C23 requirements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-multimedia/sbc/{sbc_2.1.bb => sbc_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/sbc/{sbc_2.1.bb => sbc_2.2.bb} (90%)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-multimedia/sbc/sbc_2.2.bb
similarity index 90%
rename from meta/recipes-multimedia/sbc/sbc_2.1.bb
rename to meta/recipes-multimedia/sbc/sbc_2.2.bb
index 8b91e7e65b..ace764d5d3 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2"
+SRC_URI[sha256sum] = "a1ada76ef35e5af9c2fbd063754dc9e37a8d989417c6eb1ecebb089b1383ae9e"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


