Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E66C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ni17RM58;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026737; x=1780562737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zh/04X6acWy5/AUGUGPDGVxo4hrnoLyMdYMQmTy6xLo=;
  b=ni17RM58bzdeDu+/D2suJaijxhoSq79STqOflFS0aAsLhcjeNd2+6OBo
   w4PYvZAQGKd3+3odadDCUC8KwOjny5udSa4hLyOF5mrs8k1vHvCVeB2yK
   002rLPFqFHHjgRljqGkUip8d4paYEy3wx/5RjOS2v6/rrtd6UMmPM+TnB
   Qts+cnMSzVph1V+9MRh7+Pa8avFIkFSinpgACfLuPfsUCY/QXe/skGZsr
   x3mL8GKxqm4mvIBClGwU5Uyo16fYloohhr9jrR1MuGeF5lfRZbyqH5jV2
   l/u/702BJQjseAMjz5I57Rvs+8/MuCjAQTQLOSg3GbJ42MX3MFRvpvMyf
   Q==;
X-CSE-ConnectionGUID: pz17mHIhRUmwLULipbxfrQ==
X-CSE-MsgGUID: H9/h9dgdRxWzvYBRExurMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182736"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182736"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D8514D6EDD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 91465CFA44
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:33 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2555B1A009A;
	Wed,  4 Jun 2025 16:45:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/45] gstreamer1.0: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:53 +0800
Message-ID: <20250604084524.864-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217862

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.26.1.bb => gstreamer1.0_1.26.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.1.bb => gstreamer1.0_1.26.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
index e4579d7342..d288236abc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "30a4c4a5e48345583eb596aa265d0f53c0feb93011d93a6aaa70dd6e3c519dc4"
+SRC_URI[sha256sum] = "f75334a3dff497c240844304a60015145792ecc3b6b213ac19841ccbd6fdf0ad"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


