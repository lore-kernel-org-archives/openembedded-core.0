Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0CEC3601E
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:34:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.4959.1743590043073775147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W+7AnYgb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743590044; x=1775126044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7OXCIPOwGsF9wwCG0u84EI+VOv4Du0srCReFXRssG10=;
  b=W+7AnYgbtYl649TtIiA4ruYLmCY5olXrc6kJ+io3s4bzqkzq+GKkIwv2
   U1qvh5v4wYqHzZqFpmAF2yOTRZSCN03Dy1UNX9BaZ1ZFeP35P8HI8DCu+
   liQIXEN9w3vxlOpULFuP+eC6LmxZ5W8T3dSGcWlS+SGJBu/nOhqzNOHXz
   So0RM6IdLGVsv1c96UmXQfEXTEmNe9zuBI4rKrMw4zORcoeqYLysa1eK3
   4KK+B9zG3S6ZspAyiMlRrjm81NtSPIMI8VWSzjX23FhHKzwfulPS4/xiM
   YcBpcL88FBYwFYHx85BP462JJWST+iaAtWJtPA2WzQL/dJpaxBoKopC2Y
   A==;
X-CSE-ConnectionGUID: hcaeOi+VSSCoUsSkwSabrw==
X-CSE-MsgGUID: RwaBJb3sRZml+j+9PrQGtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="174673648"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="174673648"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:34:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F3C911179
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53580D093D
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:58 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A185E1A00A1;
	Wed,  2 Apr 2025 18:33:57 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5 07/10] gstreamer1.0-plugins-good: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 18:33:44 +0800
Message-Id: <20250402103347.2133-7-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402103347.2133-1-leimaohui@fujitsu.com>
References: <20250402103347.2133-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214257

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


