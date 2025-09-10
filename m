Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105E0CAC58F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13164.1757495866593364597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DuQ0yD34;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495866; x=1789031866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iNP7g/hMU4m89ywox8VkplTlR0Ia1drwdIY4BUq360M=;
  b=DuQ0yD346S0oqqSZEnbMHB5XXwdyA7n3N+F8b5FLPD8Ti8MaB+tZhhzU
   2SRO54shUkdokFXplIVe/bZ4cdBRv+i4wUSKz3HhztsnW47oDmmXpuBpo
   n83ynOJWr1fpczrvYntRTHW/eMu+FhI8KegFwxu7qvvVopv7QAHENI8+D
   F5RX7X8wK6u5fWrvr48IdrtYlmDlhDJIt19G6JAgLUaME3cESjz2HMdCM
   wNQthQvyJJKBcH/+xiagzq4mOqCegGp9+gbaYL9f8Dhy+Z6jhqoynWZRu
   oxpHeqVEAXra2KV2fVtUtq3LE10LziZwQnIX0VcxwtM+lkupjoB4DFdFR
   g==;
X-CSE-ConnectionGUID: zhh29U51TUiJ5bWX3ZubaQ==
X-CSE-MsgGUID: 0JyhFlzlSPOeZFWZ7KUyRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191302780"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191302780"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:44 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0421582070F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id ACB94C008A6
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 0303F100B796
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9DF31A007E;
	Wed, 10 Sep 2025 17:17:39 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/40] python3-hypothesis: upgrade 6.135.29 -> 6.138.15
Date: Wed, 10 Sep 2025 17:16:34 +0800
Message-ID: <20250910091646.998-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223180

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-hypothesis_6.135.29.bb => python3-hypothesis_6.138.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.135.29.bb => python3-hypothesis_6.138.15.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb b/meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
index 0795e8a507..508f125e43 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "871acb38ff61346a420267f81f4ba05ad9a85d08965211edf9b29bc0c1ad9d7b"
+SRC_URI[sha256sum] = "6b0e1aa182eacde87110995a3543530d69ef411f642162a656efcd46c2823ad1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


