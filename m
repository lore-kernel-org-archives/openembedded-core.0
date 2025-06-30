Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1787CC83034
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.35179.1751274812522132575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=biy24X9V;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P3NuDIflyS9JMGAETL1u0URybxY/gcICaN0f8Fo6UV0=;
  b=biy24X9Vp9BF+BhgwVh6Bw1jkRkTb68n8Mjkk8lkbSb6AGaa5mH29kfk
   X8nnKlUcXG2domNQCS42HSQXquRQrXBf2aOVpktv6VgGRc6UzNMn9GKj/
   n3WRCl5BXsNFEY0i6t3Ng2K6WHaCDXJGlA4ymlsAi22aRxsMo5S9f2uDH
   y5b+pfmHEUyFbLeR5vES9ikppq0BqW0bwAije6LtxOpkWhVVZilFgjDVH
   WICLbczpmZ+e2jdsQU3/viGJbpSlOQ6InQfA+FNbkv+9YKqsrHkvlvX1O
   zI5jEY+0dMKKVaD//xGjrlO0R1erABY4m/CI2i3D7z4WzGbQgTaSN/wJD
   Q==;
X-CSE-ConnectionGUID: yaOQz0jOSo2BPd3dQwO53w==
X-CSE-MsgGUID: zpCMfzDzRN+UqkCv+XMGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="183439944"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="183439944"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:33 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0D4E4C023D0
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 831638D65E9
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C89E6CFA25
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:30 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 480B81A000B;
	Mon, 30 Jun 2025 17:13:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/37] python3-lxml: upgrade 5.4.0 -> 6.0.0
Date: Mon, 30 Jun 2025 17:13:07 +0800
Message-ID: <20250630091315.1897-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219491

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_5.4.0.bb => python3-lxml_6.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.4.0.bb => python3-lxml_6.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.4.0.bb b/meta/recipes-devtools/python/python3-lxml_6.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.4.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.0.bb
index 126fbe99b4..56f5664c9b 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.4.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "d12832e1dbea4be280b22fd0ea7c9b87f0d8fc51ba06e92dc62d52f804f78ebd"
+SRC_URI[sha256sum] = "032e65120339d44cdc3efc326c9f660f5f7205f3a535c1fdbf898b29ea01fb72"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.43.0


