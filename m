Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411F0C36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.45882.1743403759776100941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NM1REO9M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403759; x=1774939759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lYnBDrsR0ZiWt8NYwzwicXYmVqTUT+6R4C/nPiMA29U=;
  b=NM1REO9M8ZUShMKWwMXSm2DRUBtg9K0HVqB/V0acrAdH9XypXEr9Q+NX
   7m74u/djNUiGmiNIu/2eFMAb/PN/UsZID1ST5hAW+UH+3Vb6w1f3IqJfz
   cTbuf8W77YZfBv7XNFFbuAPDLjIwuoueVMA7/qWUpQn75RVighMtKccXb
   GAMeFqUzMsvIN+2IRmKcgcymqOLTfnQ0oM//zWzqVqswZxFNtxfhDFF03
   RyOOLK0vW3NQmJwTlv4aMqCjQeTtdUd5KFOjXG5aCP3DGc87KHcM8RvSl
   1h8Yhdpm+Iu52Hg/Fuo6mZA7Hw7zbTI+RFMyETRSgFfI54NyR//gKjTlx
   g==;
X-CSE-ConnectionGUID: xaONe/YATFylEveaWjyGeQ==
X-CSE-MsgGUID: MRgt4sYSTjy9CN/YsJmOxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195261641"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195261641"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CAF7D4F5F
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10F7ED5080
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:15 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 710521A0078;
	Mon, 31 Mar 2025 14:49:14 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 03/10] gstreamer1.0-libav: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:37 +0800
Message-Id: <20250331064844.2155-3-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213940

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...treamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.26.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
index 77c10da39e..a2d35f8a93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
+SRC_URI[sha256sum] = "707a8b687ff5fddcee5b02415e2ec9b71b4ac44d0b7aec3b477364ceecbf1ecf"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


