Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7795C36012
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 06:37:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.16179.1742971018509995808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 23:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nEAD8v5N;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742971019; x=1774507019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=deJ6SqK/cnFipsVKg41CJhPHENxmr9bZ5rTGIKUQfxg=;
  b=nEAD8v5NXnalhaP+qQcNShYETRhP4HtIRxSVVnSlNBabCqKhZf7fj1lQ
   ykUqcaBl7DCXALJmDyY6yDQpzwmPjpNEgDqbeOE2Kaifyfe7itCPUg9OA
   qZYoxQfhD5QcKHxdCeJLyF3+dYp4sjJ5p7ZmSpZDXBqJJCcYYrqeI0hRs
   gfl+Q7VmRjrL8NBtdnelDcHXgSrsOuid4CM44ppa2NDIFBS9tQ4flL1EX
   fCu/UUMR4g90tZo5o5IW0Uc5dDQfomGN6Ru5+8kdEd1Lq+hMeaH2B666z
   RZXDwPKnvAud1oiM2TNZg1t/ItaCA7EVy+xpbfEwOi3jdlA4sm8E05o0F
   Q==;
X-CSE-ConnectionGUID: lR3nmiOPQX+rOpc2ZvVR1w==
X-CSE-MsgGUID: kSjBb2Y0TZeuhkf2s144GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="173792518"
X-IronPort-AV: E=Sophos;i="6.14,277,1736780400"; 
   d="scan'208";a="173792518"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:36:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B66715FFE
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F2926D16E0
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:52 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E8071A00BF;
	Wed, 26 Mar 2025 14:36:52 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leihaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 5/7] gtreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 14:36:45 +0800
Message-Id: <20250326063647.1941-5-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326063647.1941-1-leimaohui@fujitsu.com>
References: <20250326063647.1941-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 06:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213635

From: Lei Maohui <leihaohui@fujitsu.com>

Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
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


