Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59B810AB83B
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 01:05:58 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62691.1774573548113933937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 18:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qnAC4fmb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774573547; x=1806109547;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sradvQysALqUXM4+lxwXnFgkO3VKrSdHR0LyLq42A1Y=;
  b=qnAC4fmbc/lN3rxJ3Ww3DqmCqyjVBx4kwk/BkyM+ApL4ptq1RHr6gpRP
   ZGQjJjn8FauyiruwLKUPR6/1w1oT7QsIVx/pe5RLQL8peX1vTs0w5+A3C
   1i9/D82Q8RMLzmq1jVaJ6LSXkoR5jcN1HJCLNNnR9cfwi+Wy63N115YmH
   txd5zVMWvA01CJ0AjO5tx6qRQLxgirr59Gt20BW5+WGlCBguyM/fSagi1
   JdyiE6CP89xlg6w9RLRqr/MgEzigKjt874b8uU3pDZV5FBCmz1TFQaC9j
   my0LmDPJyTAATQw2zW0+V41n/M+kYcy9eoLQDaacInR7xmmU7Xayq7uix
   w==;
X-CSE-ConnectionGUID: qADeP2eoQqWg0Zl5S8FXXw==
X-CSE-MsgGUID: +8DVq8RdTAWprgsHBLeHEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="234772856"
X-IronPort-AV: E=Sophos;i="6.23,143,1770562800"; 
   d="scan'208";a="234772856"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:05:45 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 26ADE8204D2
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:05:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D2E5F8D29DF
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:05:45 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id BE70A100806F
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:05:43 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] webkitgtk: upgrade 2.50.4 -> 2.50.6
Date: Fri, 27 Mar 2026 09:05:40 +0800
Message-ID: <20260327010540.7640-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234054

================
WebKitGTK 2.50.6
================

What's new in WebKitGTK 2.50.6?

  - Fix sample code included in the documentation of the
    webkit_user_content_manager_register_script_message_handler()
    function.
  - Fix MP4 muxing when using GStreamer 1.28.
  - Fix WebAudio not resuming correctly after using window.alert()
  - Fix WebAudio producing incorrect output in some cases due to
    incorrect sample buffer management.
  - Fix several crashes and rendering issues.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../webkit/{webkitgtk_2.50.4.bb => webkitgtk_2.50.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.50.4.bb => webkitgtk_2.50.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
index 2cc3977694..941cbe9304 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            "
-SRC_URI[sha256sum] = "d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4"
+SRC_URI[sha256sum] = "2b281abf8894ffc6172152e5660b75eeeedbe1cc43d6783d09dc79f7c865bb42"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


