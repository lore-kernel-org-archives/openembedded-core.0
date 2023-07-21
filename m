Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E794EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 03:49:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.13.1689911363375409660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 20:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=ZY2WVCQ+;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37566240002;
	Fri, 21 Jul 2023 03:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1689911361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/0lRY0e1T7b62ntjtbVg2AJQk+LxcFqBS37+q2CDqM4=;
	b=ZY2WVCQ+mbz8Q9sf1GR1UmnZiIhECSZMqBYHju0NfQU9NUeDlzUR+KaFe/PLoazpNVNALL
	A9jl7vbXAbikNXth/M3TtwE5vLm/QWP9rSdHTdqtuQ4jXv0LvzEOu/3j0SBBVvKCZOCQaS
	Xp/FOm/NJ1AKlWngJQ68FvIo9BsLALbqN9MDKZj4XKpNXl94XTP3O9kgr1myvO37dBDOHr
	Up+AY+0OHkm0cWx+Kgo4vappfdPvAOeRdSsjhA70LwVoPwdt6htsxXmp/IVa73e0V0vQEX
	FK0YMGF1CrWApXRRbGPABCyYI4kK+/dzNVLZNZBHs2FBGzwi/OsVPIstDm37Rw==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 1/2] curl: Update from 8.1.2 to 8.2.0
Date: Thu, 20 Jul 2023 20:42:39 -0700
Message-ID: <20230721034240.729396-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: robert.joslyn@redrectangle.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 03:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184664

This is a feature and bugfix update. Full release notes available at:
https://curl.se/changes.html#8_2_0

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_8.1.2.bb => curl_8.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.1.2.bb => curl_8.2.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.1.2.bb b/meta/recipes-support/curl/curl_8.2.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.1.2.bb
rename to meta/recipes-support/curl/curl_8.2.0.bb
index d84f7d0f07..69597440f9 100644
--- a/meta/recipes-support/curl/curl_8.1.2.bb
+++ b/meta/recipes-support/curl/curl_8.2.0.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "31b1118eb8bfd43cd95d9a3f146f814ff874f6ed3999b29d94f4d1e7dbac5ef6"
+SRC_URI[sha256sum] = "2859ec79e2cd96e976a99493547359b8001af1d1e21f3a3a3b846544ef54500f"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.41.0


