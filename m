Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DB4F89237
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20415.1776765445884475531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hRtmJjTd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765446; x=1808301446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xYbEzQ0qlvJGZlnkTQgFZGAr7zext+/VwE9smztyzCA=;
  b=hRtmJjTdQmBavm/3wjfcR6TBjx7N+eoOEkn0hmVZFRvDk7tliwGZQg++
   l4yxpO30+00fDyfEdUe4yZ8QtAYgUVbPlTDBTvbUasZcwsVeHcfSMatAR
   Nq8SKLcshDlA7e38tOHZz/oboNLpKBVPl0w3B4o9+yckUf5KSMLwqGNjA
   UvhSVPs5Uvze+qe74Nyp6xW5Yzkzlqi+FH+xqDTrdZANIk1hKpDAP7EOU
   X3dFTbsnAH+ZELHgXWhQq0TBbjKxOcaB4Xs39+8kp4XSSB3JdVUWixDZZ
   UrVSIYixEW7vJMiBunKGgO99b4yfbHD07z11aTFg0bSXl6NOd2MpNk1yr
   w==;
X-CSE-ConnectionGUID: G8epLZ1pQmG01k3gsBePnQ==
X-CSE-MsgGUID: +8WhYXiTRu+SaplHmLDh9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237135670"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237135670"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:24 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6AE4B820717
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2547E1800080
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B51AB140027F;
	Tue, 21 Apr 2026 09:57:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 45/49] stress-ng: upgrade 0.20.01 -> 0.21.00
Date: Tue, 21 Apr 2026 17:55:55 +0800
Message-ID: <20260421095559.1856-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235653

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.20.01.bb => stress-ng_0.21.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.20.01.bb => stress-ng_0.21.00.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.20.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.21.00.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.20.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.21.00.bb
index 2db9796cab..2bfb9f32c7 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.20.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.21.00.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "00559dcb1bae3ef12295a1420683094a7d1389e0"
+SRCREV = "19d2eea10269bac3d721701728b7bf79950b7f1a"
 
 DEPENDS = "coreutils-native libbsd"
 
-- 
2.43.0


