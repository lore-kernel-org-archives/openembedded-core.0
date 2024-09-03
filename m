Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3083CCD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.18358.1725352396754184972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HZ9FYMTC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352396; x=1756888396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Im8nu6jYU1NIL7yGkMipM+ViD/aqU3w8EbLFJQXAS/g=;
  b=HZ9FYMTCcwgNIsXeEzY/vh4Ny9zgbDCKth5lEGbbWHLEqLPGqwqgDFOv
   8Jf+8qazgMpESmL/neMUbPSJRLKiRQ9h7zcTMcMFDSoiJtQq/M4dkU+P+
   4VLYpKGSTHoWN1m2h1jBZVPwCMrPeh1gG6bH6UHGm8cak9Un7GXttfTtU
   tAnfKsAFHCd/I1b93cdIrOmybB3IiweGZcFsU3bAgf8PB6TSR9TLPLVNr
   VI/3gNYNMFth0P0CdA4wewRfvKAYCDzUVOLfVaHr7BeaG8DdPAik+AgMc
   wx/CfBk36R9eSG+RYAxhOfOMgpChZCoen1IZbj/X4YTs2CzcIrZyqfk2e
   g==;
X-CSE-ConnectionGUID: yWvbHrlJQzGfwZE0WvR0gA==
X-CSE-MsgGUID: g1M8KObdR4Ks02oYDf0k8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="151429529"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="151429529"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24083C68E1
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69091CFBC3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E314120076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 855901A000C;
	Tue,  3 Sep 2024 16:33:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/22] libdrm: upgrade 2.4.122 -> 2.4.123
Date: Tue,  3 Sep 2024 16:32:44 +0800
Message-Id: <1725352379-20334-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10-1.174100-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGFxxDx5qbkR9FEUknJ/kEl45N6P0pQOPlfc8OJc7+0VJjoc
	zmuoPCq1QElyCSvAzX8Asr+xZjyPLPRYbigynCr7SozyW9TmoSMdCaGhrEiSeGdagXoMbSpg/Fv
	TgTjx9vdmVUYhvF+UR4EdVIwbBh1YdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204135

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.122.bb => libdrm_2.4.123.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.122.bb => libdrm_2.4.123.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.122.bb b/meta/recipes-graphics/drm/libdrm_2.4.123.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.122.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.123.bb
index e295f64178..b75d7b6103 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.122.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.123.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae111940dfb6292f251"
+SRC_URI[sha256sum] = "a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e"
 
 inherit meson pkgconfig manpages
 
-- 
2.34.1


