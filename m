Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18463C678DA
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11714.1749026734027549999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jb7/jYKL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026737; x=1780562737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CBOTPVfavNUc9FsyMwh8KU97FhGrtdWeWdqtgHOC9D4=;
  b=Jb7/jYKL9a4T+WM2tg7x16UAUjYSSLlv64XqtWn2X1zEHO4xT6TP6QfT
   G/6aFkQoUhJEQBDoPQH2fbuqhHg9m1rqqfj+kwiahERpvB126Yi15JlWT
   k5ugtDyKC6E+b/DzX3XCWsbuyNCjQxEHBrHlcsa9Sx5MP5xJcwQ3QQWqS
   z1hCLb8U6OiEwrTGlF1zqCVVsNdQbgrGx0N7LQKvj2UG7h17hQyAORA6z
   v9YW6Cu72Mzms0UvVsCV3N0hjMWuidFgQJeig/6ylC4+his63FF/pB3CU
   ylXPFqApDizkxhrGkjnx8hpC64GBHzT/A2GEaMpN4SGou444zaJsNRwBP
   g==;
X-CSE-ConnectionGUID: 3+vMDuT9SgyiFBA/PoKldw==
X-CSE-MsgGUID: guf2kKCXTbqaxn35zInK8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201724463"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201724463"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:36 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB393D5051
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 839DED50A9
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:32 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 066281A0078;
	Wed,  4 Jun 2025 16:45:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/45] gstreamer1.0-plugins-ugly: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:50 +0800
Message-ID: <20250604084524.864-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217857

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.26.1.bb => gstreamer1.0-plugins-ugly_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.1.bb => gstreamer1.0-plugins-ugly_1.26.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
index 0d35abf2c6..106fea361c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "34d9bcec8e88b008839d8de33fb043ae75eb04e466df74066fd66ee487a8ec4f"
+SRC_URI[sha256sum] = "ec2d7556c6b8c2694f9b918ab9c4c6c998fb908c6b6a6ad57441702dad14ce73"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


