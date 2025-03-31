Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B19C3601C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.45882.1743403759776100941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lIjWvqHg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403761; x=1774939761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lSc/eTb4U3JO1nxRdW3zxXQ8o6gLqZUoy0yXO4hOzpA=;
  b=lIjWvqHgPZEZpwYMX7+GA4CAnnGkckGdik6WwNRKcrH1IvYwHXHOmd2l
   ccoHL5gqjg+eLLIyPPNXBsF0YoXOS1g672wVOjKuo2GYUsdTAyIq3EUyr
   T+7q9L6zkcBAiIFlmmGPplWEp/yKROXY0l/VlUGBoPndSPJ+xuDaVsEpX
   MH5xO2/ROkHQGmWhRGvfr4xNKbdjuIRrEnpanp3fUSowAe3C5GJmRw2TT
   tSMFbb3mG61V6j6bAXUnrKOVD4kyGBm7ZYlQldD4r8VbQOWqb/PAzDuXg
   ZD23V0MxB5vtpl2Ct5zMaIH3F3c1lB0mQXPZ7yxJO/1OhQZPtBamVwu9X
   w==;
X-CSE-ConnectionGUID: LxwD+n33QO+dKDI/FBn59w==
X-CSE-MsgGUID: ocamxggaTTa6FQ/prw8QxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195261644"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195261644"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76C88D6EAF
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3560BD5080
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:18 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 95D021A009A;
	Mon, 31 Mar 2025 14:49:17 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 08/10] gstreamer1.0-plugins-ugly: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:42 +0800
Message-Id: <20250331064844.2155-8-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213943

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...gins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.12.bb => gstreamer1.0-plugins-ugly_1.26.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
index 75f528216f..f0e42ad8fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
+SRC_URI[sha256sum] = "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


