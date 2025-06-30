Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD33C83031
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.35173.1751274805861365376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hpk9+ztf;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274806; x=1782810806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vg4lK+lx3EN53jMjr2Elx/od7RH3qvtSVBbKYXi8aeg=;
  b=Hpk9+ztfkkBQ1MMk6ch9925aE5UBN0q1ygLQbGA/Xe6HyVi4pO2yjgfE
   UJUYQs2O2XsBZm0uxp3OLWaxz4/WIFgmPiYBezo4j10BIT91Dc7VXDUi0
   aRtSDlDpowJOIeC5VRr5e1KXygKsn5QO68kkmeukQBNlE47W8aulr2+7l
   gmmXk98PAXkkWL0JoSDlRr+vWHW5TPPwxtIpc0sJC68hu6asfcfTce1lb
   NOBoY3JJPkGwau+jcgFiU+Ju7gU4MaD035aGFTKAKXt9eqY30nmL3fJym
   KXzHStLjQMsMlEmzSQl4ri8uLQDmnEIXSErR61N9cTGKYxPSRewK61UBA
   Q==;
X-CSE-ConnectionGUID: Yf/xOi1FQwKCwc0ISqQwTQ==
X-CSE-MsgGUID: f4FRjwi/SyyBWuC+tRuJnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="183480500"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="183480500"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4117A1C00096
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:24 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id B4A131800327
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 24050B4E2E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:23 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96FAE1A0073;
	Mon, 30 Jun 2025 17:13:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/37] gst-devtools: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:43 +0800
Message-ID: <20250630091315.1897-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219464

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.26.2.bb => gst-devtools_1.26.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.2.bb => gst-devtools_1.26.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.3.bb
index f898db80e7..f107af110b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "400ff79fe371367deb8ad1adf8b4643d6e558a433bf83136c2dd496fe8210f37"
+SRC_URI[sha256sum] = "4fde19c3c144834f8cb05c2ca3f14b3a50d395bad203d17f98a6e70c1672f2ba"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


