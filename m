Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2B1C3601F
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46075.1743403761051891088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U1FaV8zD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403761; x=1774939761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4XMyhrNhjsKFxbAXo8tdVTx2eG1Nw9+isOGrmSjPaWg=;
  b=U1FaV8zDIA/rJkCJoztLV8u89XEw+JuMJ7a+BgGQsMr2ckQGO9KRAZ2N
   8Yxk1ETPByJkL6MDEnKVH+wLtVsECZoVmv4TTHOCPnc4ojJmyMOxFAZ5f
   f16QmfTtXghaNPUwSKxWvzZX9yCa0VPQSraoSdCwhDpqQYEz4hA8jHuE2
   u6Y9ju9+67O4o6mBlDxjI+BivHlyqyou5w9KKPvcGVpGjSoYBfggNDjjE
   KngdYoUS9DH3LQOlEbrfiySBfbxACAKggnZMaqHB+lunmLu6RiqUnkChW
   yUKdfiL/ZNoFjF84hd4iH7NbF60g3zDC3vG5vEHek53x2pJtTvUQFOFfR
   Q==;
X-CSE-ConnectionGUID: FIqJuOmTRQ2a4lzAISRRWA==
X-CSE-MsgGUID: eWuNuNxqT3u39I+atM0wwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="174402775"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="174402775"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:19 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11BC0DBB80
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3D54D4C00
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:16 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E5FF61A0078;
	Mon, 31 Mar 2025 14:49:15 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 05/10] gtreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:39 +0800
Message-Id: <20250331064844.2155-5-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213941

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...tsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.26.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
index b23634dcf0..fd801c2c62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a335f73687d2efe22db94348c6893c73b53a2c6bc55ee7a590028ba196ddc623"
+SRC_URI[sha256sum] = "e983c039496e3f75e39696554ce74db4120e2465de17aa1cc37160568e9b40bc"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


