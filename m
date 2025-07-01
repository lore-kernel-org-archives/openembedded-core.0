Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C39C83F03
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 23:24:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.11126.1751412286759488093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 16:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SVDiGALw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751412286; x=1782948286;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v8BLTmyoULgZkAENFDtYycTQBKYk9gY3xOhFuWsSLrA=;
  b=SVDiGALwLZefc8WHNa3xshMXSKXR9yuRqKrqLkxlpjKMCrYoNOzX+7rw
   VAcLwT7Tw4XWOZpXmzqo6IxcSQYTgrUTnVbngVSGb3i6ozo36I/04XL+J
   KB8VolDQpyf02IeyeQNLVnqwTjvOfxH4+nI/YkPyw3Qovqv1+Txum1sWo
   oXIa31mbJO/nH7mJ/h97cZA4F/to10JMUlcwWFlwQNGBLbA6GnT0Ail0i
   WxZgrfkmTNsFUSZfYrHf8Q/QYMOgBhTzgC4B7JqiYkQyCkOZLRZ6peWs7
   +m2iUEm3acQKnPlnnk0vBdWg1FsFvzljWm+UGPzoYKQpk8p59jfKONMqe
   g==;
X-CSE-ConnectionGUID: An3Eu7QGTcSHkOqLKby0oA==
X-CSE-MsgGUID: CgxsLNqUQ3OdNxdOGbtFtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="183760640"
X-IronPort-AV: E=Sophos;i="6.16,280,1744038000"; 
   d="scan'208";a="183760640"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:44 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F1946144C
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:44 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 6E39F1800BC3
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:24:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C665DD4F46
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Jul 2025 08:24:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 237841A006C;
	Wed,  2 Jul 2025 07:24:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/7] gst-examples: upgrade 1.26.2 -> 1.26.3
Date: Wed,  2 Jul 2025 07:24:33 +0800
Message-ID: <20250701232440.474-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219737

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-examples_1.26.2.bb => gst-examples_1.26.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.2.bb => gst-examples_1.26.3.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
index 33c4119d1a..8835b7d97b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 json-glib glib-2.0-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.26 \
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.26;tag=${PV} \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
 
-SRCREV = "100c21e1faf68efe7f3830b6e9f856760697ab48"
+SRCREV = "87bc0c6e949e3dcc440658f78ef52aa8088cb62f"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


