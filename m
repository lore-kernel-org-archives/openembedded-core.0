Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3AAC83036
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.35182.1751274813640470435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HOz0SutD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZyoZimOn/Rnojy7PycPOaOc5f3uAyyjkVamkq84yHVc=;
  b=HOz0SutDD07CNi0Y2rjeW4xO9uaHzDOYVVDlKcY9F61UjStN0MH+SnvK
   G7GbAzuFn1WU2q/i6iUCyRa2FVWVQ5tbnDV6wW1/+CW9nfWEKPTwVgO3z
   yrnOC1izNbHqL+qQODJyRguprk34eSPC2zF/fz4CLVrNcq5dk3M6Q3wx2
   8uwcsSuHIFxCpoQahMY9MiKj8OFvQgHXj1SN/NxBthkeSDml5J1h5Nsoy
   6nM8xcuVM5VBrLkWBtXS3gNu2ECFFM88q1KKq+q9IVz06bobz2fsXb/u8
   Cmrm7CfMXIItEVYfQt8F/fmdRY0x3RlVGg7mPT5VnyAPqFP/lNRQ16bC4
   w==;
X-CSE-ConnectionGUID: 4kkf0XE/Rl+ZqlhaFdMEIQ==
X-CSE-MsgGUID: kvz4zoL5TBu4MCF0wYyF6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204535137"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204535137"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:32 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 118B0188E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:32 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 8450D1C002AF
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F10F1F811B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:29 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A283E1A000B;
	Mon, 30 Jun 2025 17:13:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/37] python3-hypothesis: upgrade 6.135.9 -> 6.135.16
Date: Mon, 30 Jun 2025 17:13:05 +0800
Message-ID: <20250630091315.1897-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219489

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-hypothesis_6.135.9.bb => python3-hypothesis_6.135.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.135.9.bb => python3-hypothesis_6.135.16.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
index efc5229fbc..c0241b63e4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a80a256268b8af3d34d62be30f6bf4a7d099b2b762621cc5f3f1de65e7b98543"
+SRC_URI[sha256sum] = "6131ea0b698e69bad62aae915988b8d00a6ac974351d0830db74c5fffc68c418"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


