Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AB8C55196
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:02:39 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4229.1785794553884270537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EqTs4jh5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260803220231276bb685b50002078e-qhuuj0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260803220231276bb685b50002078e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JxgYSuZUmd6RtgTAnR7vZIuDrLQaAnNSirCasNfEb+s=;
 b=EqTs4jh5VThvyHPc9G0Y7y6qreEjzKF71s0R+brQ46EA2aH9K4ROQ3ocPckBz7QOGzxbnv
 s7Blm8WqMPQ9GrKvthagIRSzJAEOQ9i5+IYzzCUyyjiHxoCr9/xLJUawbcdDi7ZDgxZoFJ9v
 BGvG/rxtu6YqXsCBA+pjfGj9xLHvSVeQcpGTZAxS5FMv8/ZTVmYsqymzpQ0SvmXV2N54JGQS
 C05uG4nqT9Jlu/TqjpfFoZbTfcFUUy2kC0dNaF5d+8Vv4dHeuXPFj6OujCshXlr/bpL2GP+x
 dWqtopp3SUfr5IdKnBstDb/QdoF7e2FcBM0p5cilYwxR7q5/8XfPWBGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 02/15] xserver-xorg: upgrade 21.1.23 -> 21.1.24
Date: Tue,  4 Aug 2026 00:01:42 +0200
Message-ID: <20260803220157.1520377-2-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242658

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: a0bcc350b93bee2217cb723ccd6baba6fa252e0d)

Release notes:
* https://lists.x.org/archives/xorg-announce/2026-July/003716.html
* https://lists.x.org/archives/xorg-announce/2026-July/003718.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 4a5bf4ba43..14831b1a9b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
+From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
index d3c00e087e..8d7f9ae14d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
+SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

