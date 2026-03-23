Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BB4F483E9
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:33:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3609.1774294388327205733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aYEWYaxW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026032319330596724c144f00020785-ztbkst@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026032319330596724c144f00020785
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 20:33:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M5N20qbAjc561lC7bXwzhLqixLRGAiq3pna10k48GMI=;
 b=aYEWYaxWg3SJ8WoO4FENKS1xDOjwxmEh2uxUy0EStIATuDJFCE3x/H3zhcr+hFpWxTnYvq
 RT/dhz5E59Em0O002/RpnTrlARGuGL4C4UXSzObDTCIkQ16fa6MXo64RhX+506/UuzIy8UXE
 S9OvzjYsk6ToB2/9HGuC6/bqoNeRtngJd7jyJSvXLaVA5xiQgGaWx+G7cOt/rPJMhaFYvF54
 FkLAbO3A191kpokY9Tf4l0LYDXe8Ju7GB3GlS+w5QLe9NZ9pAsh2Fnb7fNw61qUaYMPRujRq
 RWFTRjYwFJ68zrSk4dsHU+Q703U05HFR7Yb/8XSffETMWEqxaiD8RltA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [kirkstone][PATCH v2] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Mon, 23 Mar 2026 20:32:58 +0100
Message-Id: <20260323193258.11134-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 19:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233756

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>

Picked from scarthgap commit 07f35d022b88ab4d297d0252f9909e252b7e4cfe
Reworked from CVE_STATUS to CVE_CHECK_IGNORE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index ad0be85559b..4066bb1513b 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -22,3 +22,6 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+# fixed-version:branch 1.1 is not affected, vulnerable code is not present yet
+CVE_CHECK_IGNORE += "CVE-2024-56431"

