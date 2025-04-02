Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A8FC369A2
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:34:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4955.1743590040693257858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rjLkOouh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743590041; x=1775126041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lYnBDrsR0ZiWt8NYwzwicXYmVqTUT+6R4C/nPiMA29U=;
  b=rjLkOouhJWebjdgJysRqHLiQaZd96nEZEkNnU2558ARQVfab44YYZwaw
   mK5FTgE0TkgW4Zbfps3BwWOHl28YM1ER3Fv7fqccwxgkT5eXdA9O606jh
   g7wLEFJtShk6qgj8BZoRdxg27ykc4JWWhWlJ2czG17inoRBSOYVEAtu5E
   HkzXRVaWOTSl5zr/fwyZM8JQKGzEqaPRQHsLL57QNVy0+HV8eA28rZb/n
   HqGQ2Q3KV67TfPktquWzeCeQQb+4YFCLsklEqouK5JKc/SJ8TEFgKohEz
   SWsQeJ5Mokwnu4BWo0Pue0TGoQ4w/B2NQspBn++1tf3kyFvwKVTrDzKhS
   w==;
X-CSE-ConnectionGUID: F8VKEus/TxC9JL2Ts3SxvQ==
X-CSE-MsgGUID: Tx5eeau/SfSE2OUCdU8W1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="195239173"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="195239173"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:33:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BDEBE9E99
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 221059E172
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:56 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 738161A0078;
	Wed,  2 Apr 2025 18:33:55 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5 03/10] gstreamer1.0-libav: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 18:33:40 +0800
Message-Id: <20250402103347.2133-3-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402103347.2133-1-leimaohui@fujitsu.com>
References: <20250402103347.2133-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214251

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


