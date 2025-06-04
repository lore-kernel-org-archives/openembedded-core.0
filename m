Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26402C71131
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KVFb3ytp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026736; x=1780562736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mIE8EzjMCe8cC1lqnC6EwO4+2mm//df20sgW5xVFvdY=;
  b=KVFb3ytpLLiX1ip1ho3MPwfDRDjsupq4Nd/RYUXMFUl9pXcpdS12ZmMh
   cqiy0/biAG9qrIHKhNbTevKSElQJI1zgRlP/d9ePD7I3d2QVUKPOyKiAG
   7gnV205vISsvHs53HifY/adOol9Cq3+UCOL/rVvTMbEgpOHYmGrLFK4F8
   CEO3c183R7xCaZ3IZOgyqSnq4FsLYFD+GfaglOvduzui17pD/pzMRUHdA
   q6Ud2bmTDpk5uUe4DU6uOaZFx03e7U8IoVCAwjF9AnhgnwsjjTZsvpsfX
   mExdrLr7MvxBGvgamrU0adJStWYLMWzb4OIzuNngw6gMafvGq1h75zih4
   g==;
X-CSE-ConnectionGUID: QOnoRtfHSU6YzudPYcbQ9g==
X-CSE-MsgGUID: bxT3SEOJTR+qahCQawxgew==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182732"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182732"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:35 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74253E0ABD
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2801CBF3C1
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:32 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E0671A009A;
	Wed,  4 Jun 2025 16:45:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/45] gstreamer1.0-plugins-good: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:49 +0800
Message-ID: <20250604084524.864-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217856

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.26.1.bb => gstreamer1.0-plugins-good_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.1.bb => gstreamer1.0-plugins-good_1.26.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
index ea1322a5e3..467ccd9893 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fcdcb2f77620a599557b2843d1c6c55c2b660f5fc28222b542847d11d9ca982f"
+SRC_URI[sha256sum] = "d864b9aec28c3a80895468c909dd303e5f22f92d6e2b1137f80e2a1454584339"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


