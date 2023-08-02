Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E23BEB64DD
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 01:29:05 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.5179.1690939735194545439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 18:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=VWlf6TeE;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B0940002;
	Wed,  2 Aug 2023 01:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1690939733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U8RiIz8fDHSkdRRQzYyQtH0lRZ/2zcA83lLuT2vzOKc=;
	b=VWlf6TeEd6yscm9RTth9gU/8cskn98BKSG1LrtcnZA3y6LDTs0Ca0Hv/jmprmVnfdfVo5y
	ILt6Vazqit1xTuooNhik6dVDIkLg/fiA1i0OH4T3YYh/WY5BMzZvXmbaK1Q3qFmKCKpDqt
	DNMMCo3GGheaC2eW/0eWa8tTBopXKX4BD3J1+ABlxF0Eu7O4BlHhXBIVtAqurPl5uBVoqO
	4KzjwLeHKzQCi/+McgRcUhxPyJbftaDLxCoJaTsLWfdhJuhyuQLKZ8q7ei6rM8f/7GqiDP
	8HhUbArRcgtyO5GIUdoZhlxrSSx/CkaTNM0gqgut9YTSXpBI4UgfFwRKOdr3Rw==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update 8.2.0 to 8.2.1
Date: Tue,  1 Aug 2023 18:28:29 -0700
Message-ID: <20230802012829.134843-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: robert.joslyn@redrectangle.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 01:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185369

This is a minor bugfix release:
https://curl.se/changes.html#8_2_1

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_8.2.0.bb => curl_8.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.2.0.bb => curl_8.2.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.2.0.bb b/meta/recipes-support/curl/curl_8.2.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.2.0.bb
rename to meta/recipes-support/curl/curl_8.2.1.bb
index 9c16d3d515..068486a352 100644
--- a/meta/recipes-support/curl/curl_8.2.0.bb
+++ b/meta/recipes-support/curl/curl_8.2.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "2859ec79e2cd96e976a99493547359b8001af1d1e21f3a3a3b846544ef54500f"
+SRC_URI[sha256sum] = "dd322f6bd0a20e6cebdfd388f69e98c3d183bed792cf4713c8a7ef498cba4894"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.41.0


