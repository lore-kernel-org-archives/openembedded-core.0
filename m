Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5CBEB7EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15008.1772620344738693807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VOwlQc2N;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620345; x=1804156345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rws9OXmbyOJSAylBqMnB2R054FXapDR3NHgwSSgjwY8=;
  b=VOwlQc2N0Vyu2RmfY2o5iyj4bb/SeB2/lQziMy3Tr6mrLIPl5QS8oiMn
   jDtx3PslPTzlZDHvUoW2JG1xTZ64sC52Ln80UfeLm39ISCgk4ktxosnIi
   sARux73uohcgshYadJHKk/isErSJlA9NC03eYM2yqG78b1PiOOHR34gVm
   L5HQ74SP+GkzcydxDlWk9xXVFfbjrepkHLA7dkiz4Lny3M/+ewispZCRR
   UwSAlwh8V/FV/zM4/kjKENKOjwk8D3oSmGI8rx6OTI+ePUctWANCqwyFc
   BRGb9tmwMocDaBPZALxrL/x6+3j1FokaTCgvJ2yh8XWaLz8hQ7dqApd6j
   g==;
X-CSE-ConnectionGUID: uC5/JvIISxWbpEKvGxoZeg==
X-CSE-MsgGUID: VQPrqIIVShyNSGyXFxNcQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="210893843"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="210893843"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 224411002B83
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CE646140125A
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2C843100718C;
	Wed,  4 Mar 2026 10:32:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:31:54 +0800
Message-ID: <20260304103203.1649-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232360

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.26.9.bb => gst-devtools_1.28.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.9.bb => gst-devtools_1.28.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
index 44c579f2a4..369451ebba 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "55c7adaf9eee7a5219d44b736c401a947ebb5d0130c78e900017a6812026b567"
+SRC_URI[sha256sum] = "184a68b2c967210c6ddacad9a8e2c7ebc5e8df9b10fd7b72b7f7580cc0a60fb1"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


