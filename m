Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2639EC678DF
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.11717.1749026735736243848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CZh6V2yz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026736; x=1780562736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mofJxguE3x5DYIL+cSi1RIBn50FgoMAK4CFs3gfJuR0=;
  b=CZh6V2yzaQD+MSE6qg6alVO+adKeYCXhfYjGseFS1wyiQQiDVuH73UcR
   epMMiWAfSUKL0FxNozdtUsNp2va4CnLV5xoUwnpZGf7/l+5CJlB+ZL5Az
   aTYmqe2E/lB9DZl08uoFcykQ0MHBKFAyAgl8IHT5wNb8hY5O4T/MH7034
   cJ24FpPNBJJgzgp1TBF9RpttAJKksUtD+f6Y9GnWlG6DdInGjNaPuF6Pf
   ZINEHDtcnYt4XR1CL8RoLFqhr6E+Ih7sAJ1zsokjv/gTVd/wYRK2OH/Zv
   DYvy0enpbPSfP5v1rujNNUENVFhkZ91knxtwMwfzR8zUjheS1J01HX1Jc
   w==;
X-CSE-ConnectionGUID: aAym1/rjTqCOqcaGQxyu+w==
X-CSE-MsgGUID: pnt8SdSOQmmkc01+kos6Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="200884747"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="200884747"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6230CDBBD4
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E461D7527
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:31 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 954B51A0078;
	Wed,  4 Jun 2025 16:45:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/45] gstreamer1.0-libav: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:46 +0800
Message-ID: <20250604084524.864-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217855

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.26.1.bb => gstreamer1.0-libav_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.1.bb => gstreamer1.0-libav_1.26.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
index 96cf5a6925..88cc0b530d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "350a20b45b6655b6e10265430bdfbb3c436a96e9611b79caabef8f10abe570ea"
+SRC_URI[sha256sum] = "2eceba9cae4c495bb4ea134c27f010356036f1fa1972db5f54833f5f6c9f8db0"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


