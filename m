Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F37C3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 03:57:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.14535.1742961462206399290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 20:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FuxV2OS5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742961462; x=1774497462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lYnBDrsR0ZiWt8NYwzwicXYmVqTUT+6R4C/nPiMA29U=;
  b=FuxV2OS56t5BTn3A0sglSuzwPiMQRycXnusEzmZWz2Mnh3vwc+OdyPXY
   ZJtLJeMfDcYzlfzsXvJO2yXqg4JGjGpSy5DAHGQVjhyRX0isPNIj4yEXv
   YT9yoNkS+zaUgpf+rq3Nz2DrRE9eONR6/KO0a5NQMq3qOguJpHRmWnUr8
   rIYX+8uyaIwsGD52ugAGmn9vHIlQC+jzDARChK/5T7Eju/jj1A6nW0rZe
   fcmaxj6uoUIsTmr6MxQ8dywNYgGae777tit/lGq+S6qbKSPR+wZ0aQD5O
   qfBu0FfvhVj3H71N9pyPBTpKRIu9pzUQfr0WhIqTs7OJVqftihAGnITek
   Q==;
X-CSE-ConnectionGUID: 74xQ0mFLTSi2TQHvVJXAZw==
X-CSE-MsgGUID: 9RKg7yz1TFCp3I2E5nW80A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="194623843"
X-IronPort-AV: E=Sophos;i="6.14,276,1736780400"; 
   d="scan'208";a="194623843"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:57:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C4B3B14329
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F134103F8
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:37 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF2C51A0078;
	Wed, 26 Mar 2025 11:57:36 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 3/7] gstreamer1.0-libav: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 11:56:35 +0800
Message-Id: <20250326035639.1919-3-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326035639.1919-1-leimaohui@fujitsu.com>
References: <20250326035639.1919-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 03:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213627

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


