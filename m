Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B5FE7719D
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10575.1734945082569905880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CX/JB6no;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945082; x=1766481082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O2WYisK1LSQD1wtLIqGPqcuuipAQ/i/AmZjsHSZmJIw=;
  b=CX/JB6noT4kwSnrNBmyWBGOe7zYcooDB9M2cwrASmDzMbo1Hicrq0MPk
   WVGKQLUtG/NftLBnQBwd+w01jUJ653kEwXiiVwqMfyZRTJ+UBd1P7gz9f
   Ju3VKg1WDH+GUToG7ZN3N4QvoQw5ztjNSxSX5ekUYs4scyhYoW+NslmKt
   t2UqTrrluwi7EYmATd99s1DA9WBswDDA8dvXt/iDKyR5jSArUxWRhD8uu
   3guji4K7tniOqfq8jdUHX1T6H+M+MDgP5LuyiY7NWIDV8D3jbjhw1mx/K
   g612C+71Xh/LKSuFLXZhqyvPNhTmOWgGWzjtNliu3cVT+whWZIWaYZ0fe
   A==;
X-CSE-ConnectionGUID: UjDuMCDNRSSZIY9doNoNng==
X-CSE-MsgGUID: g3IWpLpXScexjJKclE6yFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="163591229"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="163591229"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:20 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E32F4C2262
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADD4DD73BE
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18418200930C0
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B0B131A0073;
	Mon, 23 Dec 2024 17:11:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/22] libwebp: upgrade 1.4.0 -> 1.5.0
Date: Mon, 23 Dec 2024 17:10:46 +0800
Message-Id: <1734945065-4373-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-1.050000-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mreSM3ylUTgbMYdZqQlzVQvAtV
	mu0+6oNRw8pXHWDeKXmSSooI/bVp9lv0t9llDdf+Yu9YuaJ9+CrFmmMdIwjrDujMOEZ5AL0SmJ8
	Aa/r/kPbpzAgmN4oaTA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMv3tsAIKqAQals1+C1BQP6Rze/DZgIzfL+px23gbuS554SkIdSwphgabKItl61J/yUGDD
	kbg1gJk32mPO5tnascnRE+fI6etkucLnjMjiCOHvo2pFidOaWdmGms2OL/tjeLuq+RrjaVnotXG
	iYuPCgrc+009/Ls2XbqTVnLuqKOdJNO1D58spoj40BlhLHSpvEu/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209020

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
  API changes:
  - 'cross_color_transform_bits' added to WebPAuxStats
  * minor lossless encoder speed and compression improvements
  * lossless encoding does not use floats anymore
  * additional Arm optimizations for lossy & lossless + general code generation
    improvements
  * improvements to WASM performance
  * improvements and corrections in webp-container-spec.txt and
    webp-lossless-bitstream-spec.txt
  * further security related hardening and increased fuzzing coverage w/fuzztest
  * miscellaneous warning, bug & build fixes
  Tool updates:
    * gif2webp: add -sharp_yuv & -near_lossless
    * img2webp: add -exact & -noexact
    * exit codes normalized; running an example program with no
      arguments will output its help and exit with an error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webp/{libwebp_1.4.0.bb => libwebp_1.5.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.4.0.bb => libwebp_1.5.0.bb} (96%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.4.0.bb b/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
similarity index 96%
rename from meta/recipes-multimedia/webp/libwebp_1.4.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.5.0.bb
index d922970479..1ca564f678 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.4.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "61f873ec69e3be1b99535634340d5bde750b2e4447caa1db9f61be3fd49ab1e5"
+SRC_URI[sha256sum] = "7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.43.0


