Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1079DC83032
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35180.1751274813445394848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FzI4YTIF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tu0uoA0VknHJo0dtfzwL8ll6mNEdI7N5VFhGlMAnKBc=;
  b=FzI4YTIF9P0Q7l3z8HkHOEkN3oUt0cLXO83BA0cPiXgPgSEY/Fc3QFNZ
   euqjlCTaU7OCa2SRKYufIxzpSsieTuA6INLW2m81QkENZZRv4yX3hlgqS
   6NijYz9Xy2TxJmPEq1elhgdXoXOIl2DYpVJoftLIQOVBlVhwC/ncYreQq
   pV3qz5PuWP4cLCr0e4fmJkoRMhmzeyHMeNOAhQNQowAy+kE2gHpRCjT+r
   8AoDICIbRo/1uux7KZRlSNFIMkHBXNkiVbopbkLHntKrKThs2RAbQD8Oy
   bHrHwblyJlBvDyNnkW4leuB1D7XXbeXI3qK2BSu9wj5LwKy7HaoC144NU
   w==;
X-CSE-ConnectionGUID: 1JM7aQLrRtSJpOQsNXyNOw==
X-CSE-MsgGUID: YlUqkvDFSfuf6Su0ApGm9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204573517"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204573517"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:33 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 182C3100034F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 8C60DC006D4
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EFFFDB4E2F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:31 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9F9181A000B;
	Mon, 30 Jun 2025 17:13:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/37] python3-pygments: upgrade 2.19.1 -> 2.19.2
Date: Mon, 30 Jun 2025 17:13:11 +0800
Message-ID: <20250630091315.1897-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219492

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Lua: Fix regression introduced in 2.19.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.19.1.bb => python3-pygments_2.19.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.19.1.bb => python3-pygments_2.19.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.1.bb b/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.19.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.19.2.bb
index de24ed3f11..a1f73b441d 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.19.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
+SRC_URI[sha256sum] = "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
 
 inherit pypi
 
-- 
2.43.0


