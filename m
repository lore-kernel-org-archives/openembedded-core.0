Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BF4C52D1F
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46935.1722215428043659149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E5Lgj0eZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215428; x=1753751428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fXpqVbN4kEHCtrl8M9CU/XQ5X5zCJ6ekPwN7rIGZvOw=;
  b=E5Lgj0eZg7qIflvTAu/0pWWyBp/zGLNxAIczeS5uYK5lO9HXATD/Wk6B
   WjEnlmLzqA412X+7SNtaWDHX1AvxPKD3QhWiP4eRIRcOhffc5VFVN1A5R
   r8/yxhYzcOOZtYNAH6Sni7UToz5fjpIs/EaOYXHwPY+aIwr82SZJcP77r
   a9ygzyKjC2a7xTXxm+aLz1hcGBr5pCuObcRofJyQbT1m/lcY+Rq5qve9E
   bnQyoopZnHSmNidPNbA4O+FEW/IsRpsNfzXn/IUcXqOS4TGlUWSfDxBKj
   mni/EvaUDJcHAii5ZMdhsR5cldqXcHoIS3ki4sip7npqzcusto/0MbNlt
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168988754"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168988754"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4ABAEC68EF
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EDFECFB96
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09F3F401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B29DD1A0002;
	Mon, 29 Jul 2024 09:10:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/33] orc: upgrade 0.4.38 -> 0.4.39
Date: Mon, 29 Jul 2024 09:09:46 +0800
Message-Id: <1722215408-27541-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0Z71Wx2uUbPLd9LQinZ4QefCP/VFuTOXUT6C2
	1l3Lq9xrkwjHXXC/4I8ZW5ai5WKlynGsxMCrkWs93Pj8QePXwxxgak31eG9936D073C8Ozg4aRG
	cOrv2vyMMA7eA/OtP20Tw385FrrKzSjuDPQkT74MUw6D4n2Pm1/r/b+dmSKFo6AH9/PcRd1xUpP
	R4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202585

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.38.bb => orc_0.4.39.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.38.bb b/meta/recipes-devtools/orc/orc_0.4.39.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.38.bb
rename to meta/recipes-devtools/orc/orc_0.4.39.bb
index 5d2296694a..320abf536a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.38.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.39.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e10b044fbc9228668d"
+SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


