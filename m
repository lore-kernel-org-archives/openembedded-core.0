Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAB4C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:30:43 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146672.1783326640266893713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=qE0+nBU+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202607060830269335117b52000207e1-lyfdxp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202607060830269335117b52000207e1
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Jul 2026 10:30:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1/eaX1BsTL3aAxa7IeRDVSxcvcfazmG7jD45ZMIUVIU=;
 b=qE0+nBU+AGo5P1sHsgJrVE0QnNx8WXDMGKOVuACEnjyp5TgKgZUSncSpqj39wDvngUa9Rt
 hTBJnRCLXJmdWgYjCI2xEEkPy8ej58OscJWecYXU0mNlh2LyH4O42qKqhH+fTJxSqvhs/6UQ
 aBYGApwJj8QIvvnxGZvHI37Fgn27xeAZxErpHq2nCLqFYqv40XAEaHVOqQDtnA5KsLV7JEK7
 p6LuWbMuUXpBpJiShw5nW+P71wzhWQ1txb///Ymm2TfL68dl5w46X/jNiXeNvR9LstWi+Kp5
 fUTwaVI5g6q0zNo9UYbuo3vZpyY/y3hdUXZa4vN6lTr0c/4XIYkwvWUw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] flac: make documentation build deterministic
Date: Mon,  6 Jul 2026 10:30:10 +0200
Message-ID: <20260706083010.184735-2-peter.marko@siemens.com>
In-Reply-To: <20260706083010.184735-1-peter.marko@siemens.com>
References: <20260706083010.184735-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240222

From: Peter Marko <peter.marko@siemens.com>

doxygen is autodetected (e.g. from HOSTTOOLS or a transient dependency).
Add a knob to make it deterministic when the documentation is being built.
Keep it disabled by default to preserve current default behavior.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index a667ea9f62..d55e157a9d 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -34,6 +34,7 @@ PACKAGECONFIG ??= " \
     ogg \
 "
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
+PACKAGECONFIG[doxygen-docs] = "--enable-doxygen-docs,--disable-doxygen-docs,doxygen-native"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg=${STAGING_DIR_HOST},--disable-ogg,libogg"
 
 PACKAGES += "libflac libflac++"

