Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B91F531CF
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:14:28 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3506.1776114857475609410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XuxapOiN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202604132114141a208dc467000207cc-rmtouw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202604132114141a208dc467000207cc
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:14:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Eg7PVeXpI5wZHI0RgXsqD6OWKK3YXOEQD1zRz/m3FB4=;
 b=XuxapOiNklQKT/nZHHzs+gsSG1ytosO27qf2KbOywXi/9eC/6K0rrcdWfL5+HxLNIU1Gyn
 WAOtIizJR0h0sB0Y68Wt4LuI/jBY+mHsPd9VlrulK2Wl0j/ecE0DZGlZcra01doqtaXokJGe
 K66uEJHoIedr+jabfdE/veHZXwxUaRZjNVvFQ9wIig19Dqxth+2JR5ShiH7WC12TsP12Bw+V
 A+Xymm2Asfi5hb6oIv+AV/qZpXhsNa5eJzD+yfg9Fz46RFL6fOlw4FZA7Zs1O87Q90imnPHd
 Ji6SwJoc8PVAHDPL7nE+DFXNH6Hi5NczWFMOlqaZHoxlHOAiI5po8Ohw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] xwayland: set status for CVE-2024-21886
Date: Mon, 13 Apr 2026 23:13:15 +0200
Message-ID: <20260413211315.564180-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235122

From: Peter Marko <peter.marko@siemens.com>

Reference [1]:
Introduced in: xorg-server-1.13.0 (2012)
Fixed in: xorg-server-21.1.11 and xwayland-23.2.4

[1] https://lists.x.org/archives/xorg/2024-January/061525.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xwayland/xwayland_24.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
index df1bb7e31b..c4e2d7cfdb 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
@@ -48,3 +48,5 @@ do_install:append() {
 FILES:${PN} += "${libdir}/xorg/protocol.txt"
 
 RDEPENDS:${PN} += "xkbcomp ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "x11-volatiles", d)}"
+
+CVE_STATUS[CVE-2024-21886] = "fixed-version: fixed since xwayland-23.2.4"

