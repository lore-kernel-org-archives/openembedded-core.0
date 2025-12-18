Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68406D6ACD2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37728.1766048760261225756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZBu7LufT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048760; x=1797584760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+s0MGh1TvO0bolYs+wYTOxGJk72JJTEtabehumO5lk=;
  b=ZBu7LufTmYkiZSlTfPlBohyx0G3xS4dI2SsovQaM/pyQQxWJJo9zvB8r
   qwsP2Ic9uGKKGe78RsVO/nllY6LkO3PIuntesPJrMWK7XWRvGIOK8h3B+
   +s+LS/l0LmomWzdwKSLvhxUY7EEHzQ+w1FDHOqcpskxUdnD1XgNXmwSbB
   K07f2UBEK9FLVbHCslcD4C3FxIcnRIjRs0BvhKY5Xz4o56gsKcOeY0hvn
   8LwnebSkVXxaSUSFE9zcjbVtnATj2D1Yyfd+0FcoubM7HxzSzc672o0LI
   sNh/EV5EWA2EUalnUxE+UakyiWd4boG5DNlh+3CCcxU6IWVqbQxQ54NGJ
   g==;
X-CSE-ConnectionGUID: 5JN253Q9QwOsYlGgNvbOUQ==
X-CSE-MsgGUID: ufYc/wy4RnagX5T1KIRM5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="227016962"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="227016962"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:05:58 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BAAB41C17352
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:05:58 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 74B77C06D65
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:05:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 0BE4040266F;
	Thu, 18 Dec 2025 09:05:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/11] gstreamer1.0-libav: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:39 +0800
Message-ID: <20251218090547.828-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228096

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.26.7.bb => gstreamer1.0-libav_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.7.bb => gstreamer1.0-libav_1.26.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
index aa6c431daa..a652dbba33 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
+SRC_URI[sha256sum] = "08a8e944fc61ef26df515784a089c8ac41765304a5d55b98199835b28a98dbdf"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


