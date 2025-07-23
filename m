Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEF1C87FC5
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:07:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.3850.1753232820694123865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eTIEmNOP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232821; x=1784768821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zgL8L50iqemmbALN68soknit0sl+NvH1OTOJtrrcIV4=;
  b=eTIEmNOP/4PusB2Zgrj7V3n0rUSNEvGNeerMcfV/fEOe1f7xJfKxRDdw
   2ROazbxovRz31OVGrH3YVvmV2AP37/iCQxlBXjYjyDNSbnwFDV/irtwCk
   MxLQOtYnxSvGOHmF8g5iCrh+EGymr7CMA4nVvOSY+rM2rP47i1phOj/+H
   6jzVZ5yOoCgHH/W2qbUI4n+aSQN4zXjaOSFJ31rIzk+k+iXrkEGzLUSck
   80C69vWI+3uiB+VeQm98kXrnFzsC4jhlcv2gxYI9UZ7Ch9d1Ee1Ep+kQy
   S/Ah7ggkZchJiXguvUVYyK1D4Oby8o+GuUqziJNKszttiJXvbWIW3Ucxs
   Q==;
X-CSE-ConnectionGUID: el/g7PbtSpawJjYg+20y1w==
X-CSE-MsgGUID: iUlDOC9KT5i0jjQIAMY5gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="210344978"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="210344978"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:06:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3CEAB1C00085
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A3ED910001F5
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:58 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7A921A006C;
	Wed, 23 Jul 2025 09:06:55 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 08/12] python3-maturin: upgrade 1.9.0 -> 1.9.1
Date: Wed, 23 Jul 2025 09:06:10 +0800
Message-ID: <20250723010614.926-8-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220767

Changelog:
==========
- Fix absolute license file path from Cargo.toml

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-maturin_1.9.0.bb => python3-maturin_1.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.0.bb => python3-maturin_1.9.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.0.bb b/meta/recipes-devtools/python/python3-maturin_1.9.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.1.bb
index e4147b9321..ce38e93136 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "ccb9cb87f8df88d1bab8f49efe3fc77f0abb0639ea4b4ebf4f35549200d16b9e"
+SRC_URI[sha256sum] = "97b52fb19d20c1fdc70e4efdc05d79853a4c9c0051030c93a793cd5181dc4ccd"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


