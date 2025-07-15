Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C64C83F3B
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2953.1752566915421831855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e+zem51n;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566915; x=1784102915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W1iGfkmIOcu+nVBFI7+Ilix3sjdeF6eVXEQ20Iv9Kc8=;
  b=e+zem51nWqv3Vre5pIXl24S3uFarP6ANcFBneCXRhyV8RDc+xEOxZFOx
   RqTAfDLY2zCFHMvDPNlDJJGAsNB9RWPdhxjKJMwmh+ZYdue17eglNCzYT
   QEPCtTFfS0oZw4Rqvv5SMdZrNur9HOnTBPipcQAmiv+mp0xX875vKNLPu
   tJAt3NfEFHvitmOpoROZgOBpkb/q4ekj/kFd1D8z1UZAmLQKgsZqb6JmM
   yIpSIo8iPlFiZwOlES/IirdAc9eZVyXQ0khrGhRXcquykKSyrmjVYGEsO
   c29WR6eVgENxwoJ2HvvMcASQTXux/21rfgQRYHEn+Avnlen7n/geff9Mm
   Q==;
X-CSE-ConnectionGUID: iXZvXqIrRc6GbLL5p/GfSw==
X-CSE-MsgGUID: 1IfNtYNyQ12rfveT5ho5lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="194841296"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="194841296"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:34 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F1D791547
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 490B51C00181
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF3941A009A;
	Tue, 15 Jul 2025 16:08:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/19] python3-hypothesis: upgrade 6.135.16 -> 6.135.29
Date: Tue, 15 Jul 2025 16:08:14 +0800
Message-ID: <20250715080819.622-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220284

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-hypothesis_6.135.16.bb => python3-hypothesis_6.135.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.135.16.bb => python3-hypothesis_6.135.29.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb b/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
index c0241b63e4..0795e8a507 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.135.16.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6131ea0b698e69bad62aae915988b8d00a6ac974351d0830db74c5fffc68c418"
+SRC_URI[sha256sum] = "871acb38ff61346a420267f81f4ba05ad9a85d08965211edf9b29bc0c1ad9d7b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


