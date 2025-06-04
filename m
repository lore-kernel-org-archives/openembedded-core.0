Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32835C71132
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hjZ1KCXU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026735; x=1780562735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cOjaC7ViM2tkpeWihG1Kp6GG8M5zLhcrOfHRjyILk+s=;
  b=hjZ1KCXUILHKdx/ti4jGZ8SSYlSaRQPN/IrQERYpWKY0FICR/YV+OUOr
   M/ABQG+tcU+ps4wic6eBEX29k2wejne3tr3ulv4wLDisfWtuNuo/aGKQQ
   AcvmsAv6jiKIOuk7ILMY7bFZL3PhWyx4VErwkYH+w37sMLmA+hUlhkjW+
   1HK6J8EtUFRUicEBANdntjLo1/9fq2QZxJDVYIT1dXVyR5OQVutdqBMiv
   Ac452cZmTQSnQ5MSzdmlPstI4GFQQD1J7uuMh4P3gR62hRUdMS8Z6yOXY
   uB7KF4QwRNTfxHo+iUEUekMjEH47++W6x6xZjovMd2uqtMwfJ3nnE3s/u
   A==;
X-CSE-ConnectionGUID: P9Njr8yISvuLXvHfxBf+8A==
X-CSE-MsgGUID: 2fMmKwTJStOW87MzJB7jPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182731"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182731"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 03037C13CA
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA5D2D4C15
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:30 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B3DA1A009A;
	Wed,  4 Jun 2025 16:45:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/45] gst-examples: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:45 +0800
Message-ID: <20250604084524.864-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217853

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-examples_1.26.1.bb => gst-examples_1.26.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.1.bb => gst-examples_1.26.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
index 59c7a4ade1..bc043f81c7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "7174e955ec066fb8d1fb683cc82713e0615826b6"
+SRCREV = "100c21e1faf68efe7f3830b6e9f856760697ab48"
 
 S = "${WORKDIR}/git/subprojects/gst-examples"
 
-- 
2.43.0


