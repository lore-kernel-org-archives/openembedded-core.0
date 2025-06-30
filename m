Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB18C8302E
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.35173.1751274805861365376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nM6bsyLC;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274807; x=1782810807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yICwJRtqnNxrE6Sx4YnfkcVWTD7SPiV31iv/TlN6rEI=;
  b=nM6bsyLCb8DZe8Y5NTWKVj3TCL+Ntj9IGzbHsavfesKomBOaSm/Mkr1p
   +ePhDKajhkTNTUNy5Wngv7YQ+0c64Dgjk/xbsbNaHetOE3/iig0kjOEyo
   UOpEQMi0SC5Zcaqob+cgyAtkBE8O/EoyLIwF9UP1i2zefpfaENqSJwq+H
   JwbG7aA/hL5jPY06sDvQ3q9VeJbqpgT3hWFpBgeL8qtPuLYQbmI4LDVq5
   wuMUzJpstkGrO3Fl8AdPHqgjVZUCPcRwUiQE1kb6V8HgWqvjYbpvakFMc
   WzXJwcOfNM33ZYD1LzKPh/jAOJgbBXunllC4sf2uSgZh0tNt+L+X4kEuw
   Q==;
X-CSE-ConnectionGUID: jw5YiaHOTeiVuhun118tmQ==
X-CSE-MsgGUID: PWAqAv31TIiIwQsi6q9VOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="183480504"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="183480504"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:25 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 32C6A1C0213D
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:25 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id AC85814003F6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:24 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 213BAD5068
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:24 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3C821A000B;
	Mon, 30 Jun 2025 17:13:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/37] gstreamer1.0-plugins-bad: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:46 +0800
Message-ID: <20250630091315.1897-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219468

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...plugins-bad_1.26.2.bb => gstreamer1.0-plugins-bad_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.2.bb => gstreamer1.0-plugins-bad_1.26.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb
index b311286cc2..12992057e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "cb116bfc3722c2de53838899006cafdb3c7c0bc69cd769b33c992a8421a9d844"
+SRC_URI[sha256sum] = "95c48dacaf14276f4e595f4cbca94b3cfebfc22285e765e2aa56d0a7275d7561"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


