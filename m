Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4FFC677C4
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.11717.1749026735736243848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TZ9AXdTO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026737; x=1780562737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nWqiiGuGhLNYyRJVpQrfoVvNIFSwkgojwxWfKjHZ4OM=;
  b=TZ9AXdTOBbSyhQ9GCEcOfLfuE7cAZWZIkZkf18IONXgKqxhh8c0PLpEA
   Jjo4Sa9qSF9TXq5kxnkEagoKqviie9L4DG7aYmLh6JWYdWUZ1PtPZmFpo
   yUmHYWKuLK/U8bA6+JfGl02oS2noqt9gnPWh+IAUvPZZVotoUd4uhPql8
   Rs/eUi9Me0AwStWlFKOnRCOFCQ3xl+TfGnBY/thz4lhe9IxV/yT2lpGk/
   TA0J9Q7Vwo8zVhuS/6vR7gbB/ngw5D/k6L4UGxvPuBjJSk8RIY/sQpA/l
   O/0f4VToU1MOwUm+PM8ec2KPWgve2JT95MkPbDSd6ZZv7mqw50HZtjT5i
   Q==;
X-CSE-ConnectionGUID: YIYRI7gCSu6+RZAbxP2oAw==
X-CSE-MsgGUID: NcONeedEQLaoVEetYJpgsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="200884748"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="200884748"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:34 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB5E2D6861
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77A6ECFA44
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED8BF1A009A;
	Wed,  4 Jun 2025 16:45:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/45] gstreamer1.0-plugins-bad: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:47 +0800
Message-ID: <20250604084524.864-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217858

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...plugins-bad_1.26.1.bb => gstreamer1.0-plugins-bad_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.1.bb => gstreamer1.0-plugins-bad_1.26.2.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
index a68e9306a5..e0329cd004 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9b8415b1bb3726a499578fb39907952981716643f660215fe68628fbd8629197"
+SRC_URI[sha256sum] = "cb116bfc3722c2de53838899006cafdb3c7c0bc69cd769b33c992a8421a9d844"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


