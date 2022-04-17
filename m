Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04E2C4167B
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.25375.1650160218229353925
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 18:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XY37BnoN;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650160219;
  x=1681696219;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=H4y09ms92d8nR+/WXa4V8cZx6sh1XdHcfpskf46raPY=;
  b=XY37BnoNXIcTKcoEyAFI1ZbeKN95IygN3K+uj/xYcPt5vK8pan/s5scE
   kNk3RjgizstJ4wHiQEaqAYMradz/2BYuJsU+GIaku9/PwX3PRqk4kh9jI
   yLmkj1mduIBYuWfGRjexa5fkSjxcwb8OxfGKd7DN3Y8v5zgs1pjrOcmJC
   3zd4OZIF4IS3Xv42zZf5Ei6FCosQHkLEgSDOSBA4+gGNq6i8CMKIIUNuy
   dXUkvSmodhflme7EaAxXFZo7p9VI0DGUUMBwPgEF1C34bxYdAdwxYXwyB
   brQRkEHYgzSG6hSSAYcyhlNpX34KKfBHDZyvO6RwJtzke0F8fFWmLhp9T
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] u-boot: Inherit pkgconfig
Date: Sun, 17 Apr 2022 03:50:12 +0200
Message-ID: <20220417015012.2617-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220417015012.2617-1-pkj@axis.com>
References: <20220417015012.2617-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164568

pkg-config is used by the Makefiles, and thus pkgconfig needs to be
inherited.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 488b923737..d366f10398 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -18,4 +18,7 @@ SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
+
+inherit pkgconfig
+
 do_configure[cleandirs] = "${B}"

