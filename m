Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54A6EC0490
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:47 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14966.1772532585867227376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TtMQ4ufv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532586; x=1804068586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iKgX+zAc/6nnUnsGgyAbi64ssX550yDOJUSObKObVnM=;
  b=TtMQ4ufvYWnJgL+94ciJaU38sdKLCwNb4UD/b5WjxihjlSAHC/5Ue0Vb
   oi+f1JLMpXnG3UU1zd7jADp6YLbnIUNunBUDltH5phnskNHoz7KJmuHXJ
   TUvssfYnst3pOgxcRu8txuhQlPNCMdUUyG5kOh1w5Eb+VuRnxbH+Cv/tx
   hFbXSRFLv0ClrdKGraDPJKpq6J3lm+xYKjhkm1buXpqWxn4PqavYKJauU
   EI6QifGnyVdCfiLKfH1VE0BLiWVYKIQnA3d+uH603vuHOAWWCPbGkbWZO
   NgkuyZqU04kCS3xBch2Apr4LFU3AZIGjhqPoMDu8Yy8pdQ4fpAU0GvsVT
   g==;
X-CSE-ConnectionGUID: kJP7bN9JRcC6LoAl6UfYOA==
X-CSE-MsgGUID: 61GtY/oCRbqIn2e5xfaJDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="235961464"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="235961464"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6D7051C00099
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:44 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 220DD1004142
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6086B1001CE4;
	Tue,  3 Mar 2026 10:09:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/23] diffoscope: upgrade 311 -> 313
Date: Tue,  3 Mar 2026 18:09:07 +0800
Message-ID: <20260303100929.1624-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232278

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_311.bb => diffoscope_313.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_311.bb => diffoscope_313.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_311.bb b/meta/recipes-support/diffoscope/diffoscope_313.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_311.bb
rename to meta/recipes-support/diffoscope/diffoscope_313.bb
index e947bc0219..b5d07e9a47 100644
--- a/meta/recipes-support/diffoscope/diffoscope_311.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_313.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9316493c0ba14d6f7537dd4e4ade7d4cd5cfef86b63fe687f0e7073861c5ba8b"
+SRC_URI[sha256sum] = "f2f3ca5f1a933e21155c3c96ef1b5c50233dd24f080c05d3fc1d4283e652f7fd"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.43.0


