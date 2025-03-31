Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ACBC369A1
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46073.1743403758694083498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=acIa+lIr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403761; x=1774939761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7OXCIPOwGsF9wwCG0u84EI+VOv4Du0srCReFXRssG10=;
  b=acIa+lIrxA5xGNXKIrBw+9X+BNtE7wLVxohtsCW7rY2lwfRl1+GHZP7O
   bpAWKHILENOu1VThGBl3mbpR441Tcj0O2Zu7qv+EjdM5TCS8AaYroeo9P
   ihAVceBMxIVGTU2rxyGME5A/BiRJ8wxe0Akn/Mgl+Mo2fjjDih8TFyNYp
   LBSfFtK7gKTMEBGQOEpmU67P7QFFGcXu5ahbqn3oZOoQyAX7wGHRR8iyA
   8gTUPvXqvKA++WP5jrOtbzkvsP7hZ+4tLPzRmECCQbJxBvB4726N0x6bR
   aaktonkT80GpXsMxAPepgLBi2kudnnV5Yz3KRxIbYHs7OsOHBtB+X04uU
   w==;
X-CSE-ConnectionGUID: yjW1Wp/MS0Sh60YuWmxqMg==
X-CSE-MsgGUID: XRup6HSnRX6hI6CO08IJsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194967490"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194967490"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F2C4AE8525
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B4DD5CFA5C
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:17 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B00F1A0078;
	Mon, 31 Mar 2025 14:49:17 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 07/10] gstreamer1.0-plugins-good: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:41 +0800
Message-Id: <20250331064844.2155-7-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213942

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...gins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.26.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
index 9cc2d462f6..a2c6426c34 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
+SRC_URI[sha256sum] = "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


