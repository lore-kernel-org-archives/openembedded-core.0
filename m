Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476D1C04FF8
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 16:58:45 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.52519.1712941114867724372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 09:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Xct4YEJE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2024041216583286fd02e98cb19c5c8d-lkkvzz@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024041216583286fd02e98cb19c5c8d
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Apr 2024 18:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FkekUOuGCw7bCVmALjGkKvGtEsNekIggCo0HPpAvuwk=;
 b=Xct4YEJERUw2iytZVNaTPkOZGNIBHL/4nOT9qEWJyR099+WfOmQuoDQ8ZSLkeSuG/ZsTdx
 uqBx+7djAAdFdUqihMN/9FOqjrVunyGahj4axS9LWeUDqHzPXU50SaHAYZ49a64Hi+YJ/Hyp
 lu+5vyGh5mraGPshiieyYr9THcjEc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/3] kbd: update license
Date: Fri, 12 Apr 2024 18:57:14 +0200
Message-Id: <20240412165714.8951-4-peter.marko@siemens.com>
In-Reply-To: <20240412165714.8951-1-peter.marko@siemens.com>
References: <20240412165714.8951-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 16:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198180

From: Peter Marko <peter.marko@siemens.com>

GPL-3 is used for keymaps-pine

LGPL2 is used in all C source files under src/libkfont/
which generate binaries included in main kbd package.
This is seen in their SPDX headers.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/kbd/kbd_2.6.4.bb | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_2.6.4.bb b/meta/recipes-core/kbd/kbd_2.6.4.bb
index 3bc7d1c6b4..1295bca2a0 100644
--- a/meta/recipes-core/kbd/kbd_2.6.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.4.bb
@@ -1,9 +1,19 @@
 SUMMARY = "Keytable files and keyboard utilities"
 HOMEPAGE = "http://www.kbd-project.org/"
 DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) – mainly, what they do is loading console fonts and keyboard maps."
-# everything minus console-fonts is GPL-2.0-or-later
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# consolefonts and keymaps contain also some public domain and author notice licenses
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later & GPL-3.0-or-later"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://data/keymaps/pine/en.map;beginline=2;endline=15;md5=20914a59c0546a7b77ebf959bc88ad5d \
+"
+LICENSE:${PN} = "GPL-2.0-or-later & LGPL-2.0-or-later"
+LICENSE:${PN}-consolefonts = "GPL-2.0-or-later"
+LICENSE:${PN}-consoletrans = "GPL-2.0-or-later"
+LICENSE:${PN}-keymaps-pine = "GPL-3.0-or-later"
+LICENSE:${PN}-keymaps = "GPL-2.0-or-later"
+LICENSE:${PN}-unimaps = "GPL-2.0-or-later"
 
 inherit autotools gettext pkgconfig
 
-- 
2.30.2


