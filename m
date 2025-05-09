Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F18C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6512.1746762999012403191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OMzi1Fe9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746762999; x=1778298999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1pRdZGDhCaPXmJ/rtHv+69GvJ53y1V14H3GD5QwIXHQ=;
  b=OMzi1Fe9s76NaKiAytjROnDlHx3TYR9NYQynX6JibakpKSv22dRVpGJT
   ELoeCd8lDEPWtQY5r9WR0agAipc3rqjrfSkry5rZAznHML6aVSmXm7Blr
   tNPHoWermZJxBVck3756kGo+fylQWQUWCmI4YPzaEUoQsYUBLrEG0mavW
   dv9WFoOmWhfpS3k1gieVYmzMfhErX6TCuO6Lv+0LHeW5yNV6Qh6d2kRrt
   SgIdvwjwRjPg6lq12M7PzZHBCkTQnet5uQ9iD6l4N0+x7S+GO1dMrxulk
   uK1T0e0jtxa7PvuXoOFu7tXukAFqogPFbtDVtSsJgbkTYvfH2P9K2uMKI
   g==;
X-CSE-ConnectionGUID: 0bsYrzO/RcCZ0qMl+qLFQg==
X-CSE-MsgGUID: xHo8u6ELQu2SvOTAbJrUcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="177769032"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="177769032"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AA590D6EA5
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68B6BD9730
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC19C1A009A;
	Fri,  9 May 2025 11:56:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/19] gst-devtools: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:03 +0800
Message-Id: <1746762980-12783-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216165

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.26.0.bb => gst-devtools_1.26.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.0.bb => gst-devtools_1.26.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.1.bb
index dc54a7ab4b..cbad470d26 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "eff33d7dc292bb074a2788ea887b6283398ffdefafa49fb7d08efe6658a65648"
+SRC_URI[sha256sum] = "32e15cb9d2dd6a07532f92745b62f1c72c8038b1a10d34b64e91c4557f689632"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


