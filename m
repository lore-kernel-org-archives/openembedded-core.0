Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7003C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3866.1743584885634148820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=olLNTRdJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584885; x=1775120885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lYnBDrsR0ZiWt8NYwzwicXYmVqTUT+6R4C/nPiMA29U=;
  b=olLNTRdJKiGkqTnIGpZGizWnN3qKLu4pBmSw/FZfe2yYbXrv3AOxLHUF
   QD3knownmqwzADMxeQNdlmC9TVZ58ttyY0zqNXz/T41ldS+Hox6+j+sO6
   5xQBCqfB05P2yaIglUfgUGfsD/m5MgKz6dq/TJWNr3mhrt6HqP7z5I+1j
   GwFpMIkD4iA7107cVeH2c18FfRAzOSAva0wLikYNcfy0tMRNYwnlgxaFQ
   OjmjIu6+4eP4Vtq7KyhEHPp+8ELTahDV3rVxybc0QVrv8J93L1xTgkxQP
   G5H3BeCmdC5CMxppR+IdPrxsxrtEVuJ3EeGoG+lfMBklv6Nd9hpKRVrpr
   g==;
X-CSE-ConnectionGUID: vvg6HRoyRA2ZWKV0UqKNJQ==
X-CSE-MsgGUID: YULsMCTvS8uMAmcsUwKPfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="174099869"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="174099869"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 46C20E445A
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A645EA188
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:01 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 592FF1A009A;
	Wed,  2 Apr 2025 17:08:00 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 03/10] gstreamer1.0-libav: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:42 +0800
Message-Id: <20250402090749.2119-4-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214236

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


